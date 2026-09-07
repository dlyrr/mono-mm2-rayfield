# -*- coding: utf-8 -*-
"""Split a darklua-bundled Rayfield Gen2 file back into its source tree."""
import io, os, re, sys, json

BS = chr(92)
SRC = sys.argv[1]
OUT = sys.argv[2]
text = io.open(SRC, encoding='utf-8').read()

# ---------------------------------------------------------------- lexer
# Produce a list of (kind, start, end). kind: 'code' | 'str' | 'cmt'
def lex_spans(s):
    spans, i, n, start = [], 0, len(s), 0
    def flush(j):
        if j > start: spans.append(('code', start, j))
    while i < n:
        c = s[i]
        if c == '-' and s[i:i+2] == '--':
            flush(i); j = i + 2
            m = re.match(r'\[(=*)\[', s[j:])
            if m:
                close = ']' + m.group(1) + ']'
                k = s.find(close, j); j = n if k < 0 else k + len(close)
            else:
                k = s.find('\n', j); j = n if k < 0 else k
            spans.append(('cmt', i, j)); i = start = j
        elif c in '"\'':
            flush(i); j = i + 1
            while j < n:
                if s[j] == BS: j += 2; continue
                if s[j] == c: j += 1; break
                j += 1
            spans.append(('str', i, j)); i = start = j
        elif c == '[' and re.match(r'\[(=*)\[', s[i:]):
            m = re.match(r'\[(=*)\[', s[i:]); flush(i)
            close = ']' + m.group(1) + ']'
            k = s.find(close, i + m.end())
            j = n if k < 0 else k + len(close)
            spans.append(('str', i, j)); i = start = j
        else:
            i += 1
    flush(n)
    return spans

def code_mask(s):
    """bytearray: 1 where char is real code (not string/comment)."""
    mask = bytearray(len(s))
    for kind, a, b in lex_spans(s):
        if kind == 'code':
            for k in range(a, b): mask[k] = 1
    return mask

# ---------------------------------------------------------------- manifest
# Node = {id, classIdx, {name,...}, {children}}  -- parse the Lua table literal.
def parse_manifest(s, pos):
    """Minimal Lua-table-literal parser starting at '{'."""
    def skip(i):
        while i < len(s) and s[i] in ' \t\r\n': i += 1
        return i
    def value(i):
        i = skip(i)
        if s[i] == '{':
            items, i = [], i + 1
            while True:
                i = skip(i)
                if s[i] == '}': return items, i + 1
                v, i = value(i)
                items.append(v)
                i = skip(i)
                if s[i] == ',': i += 1
        if s[i] in '"\'':
            q, j = s[i], i + 1
            buf = []
            while s[j] != q:
                if s[j] == BS: buf.append(s[j+1]); j += 2; continue
                buf.append(s[j]); j += 1
            return ''.join(buf), j + 1
        m = re.match(r'-?\d+(\.\d+)?', s[i:])
        return int(float(m.group(0))), i + m.end()
    return value(pos)

CLASS = {1: 'Folder', 2: 'ModuleScript', 3: 'Script', 4: 'LocalScript', 5: 'StringValue'}

paths = {}
def walk(node, prefix):
    nid, cls, props, kids = node[0], node[1], node[2], (node[3] if len(node) > 3 else [])
    name = props[0] if props else CLASS[cls]
    p = prefix + [name]
    if cls != 1:
        paths[nid] = '/'.join(p + ['init']) if kids else '/'.join(p)
    for k in kids: walk(k, p)
walk_root = None

# the manifest is the 2nd top-level arg: `},{{1,2,{'Rayfield'},...}}},'0.4.1',`
mstart = text.index("},{{1,2,{'Rayfield'}")
tree, _ = parse_manifest(text, mstart + 2)
for node in tree: walk(node, [])

# ---------------------------------------------------------------- split modules
mask = code_mask(text)
starts = []  # (id, index_of_'function')
for m in re.finditer(r'\[\s*(\d+)\s*\]\s*=\s*function\s*\(\s*\)\s*local\s', text, re.S):
    if mask[m.start()]:
        starts.append((int(m.group(1)), m.start()))
# module 1 is the implicit first array entry
m1 = re.search(r'=\{function\(\)\s*local\s+\w+,\w+,\w+\s*=\s*a\(1\)', text, re.S)
starts.insert(0, (1, m1.start() + 2))
starts.sort(key=lambda t: t[1])

HDR = re.compile('^\\s*(?:\\[\\s*\\d+\\s*\\]\\s*=)?\\s*function\\s*\\(\\s*\\)\\s*local\\s*(\\w+)\\s*,\\s*(\\w+)\\s*,\\s*(\\w+)\\s*=\\s*a\\s*\\(\\s*\\d+\\s*\\)\\s*local\\s*(\\w+)\\s*return\\s*\\(\\s*function\\s*\\(\\s*\\.\\.\\.\\s*\\)', re.S)
TAIL = re.compile(r'end\s*\)\s*\(\s*\)\s*end\s*,?\s*$', re.S)

modules = {}
for idx, (mid, a) in enumerate(starts):
    b = starts[idx + 1][1] if idx + 1 < len(starts) else text.index('},{{1,2,', a)
    chunk = text[a:b].rstrip().rstrip(',')
    h = HDR.match(chunk)
    assert h, (mid, chunk[:120])
    body = TAIL.sub('', chunk[h.end():])
    modules[mid] = (h.group(1), h.group(2), h.group(3), body)

# ---------------------------------------------------------------- renaming
IDENT = re.compile(r'[A-Za-z_]\w*')

def rename(src, mapping):
    if not mapping: return src
    out, mask = [], code_mask(src)
    i = 0
    for m in IDENT.finditer(src):
        if not mask[m.start()]: continue
        # skip `.field` / `:method` accesses
        j = m.start() - 1
        while j >= 0 and src[j] in ' \t': j -= 1
        if j >= 0 and src[j] in '.:' and not (j > 0 and src[j-1] == '.'): continue
        new = mapping.get(m.group(0))
        if new is None: continue
        out.append(src[i:m.start()]); out.append(new); i = m.end()
    out.append(src[i:])
    return ''.join(out)

def build_map(body, env, script, req):
    mp = {env: '_bundle', script: 'script', req: 'require'}
    # locals assigned from require(<path>) -> last path segment
    for m in re.finditer(r'local ([\w,]+)=((?:%s\([\w.\[\]\']+\),?)+)' % re.escape(req), body):
        names = m.group(1).split(',')
        calls = re.findall(re.escape(req) + r'\(([\w.\[\]\']+)\)', m.group(2))
        if len(names) != len(calls): continue
        for nm, path in zip(names, calls):
            seg = path.split('.')[-1]
            if re.match(r'^[A-Za-z_]\w*$', seg) and len(nm) <= 2:
                mp.setdefault(nm, seg)
    # class table:  local X={} X.__index=X X.__type='Name'
    m = re.search(r"local (\w+)=\{\}\1\.__index=\1 \1\.__type='(\w+)'", body)
    if m: mp[m.group(1)] = m.group(2)
    # single-return utility table: local X={} ... return X
    if not m:
        m = re.search(r'^local (\w+),?.*?\{\}', body)
    return mp

for mid, (env, script, req, body) in sorted(modules.items()):
    src = rename(body, {env: '_bundleEnv', script: 'script', req: 'require'})
    path = paths.get(mid, 'unknown/module_%d' % mid)
    dest = os.path.join(OUT, path + '.luau')
    os.makedirs(os.path.dirname(dest), exist_ok=True)
    hdr = '-- %s  (bundle module #%d)\n-- deobfuscated from Rayfield Gen2 v1.2.0\n\n' % (path, mid)
    io.open(dest, 'w', encoding='utf-8').write(hdr + src.strip() + '\n')
    print('%3d  %s' % (mid, path))

print('\n%d modules written' % len(modules))
