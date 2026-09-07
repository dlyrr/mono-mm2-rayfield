# -*- coding: utf-8 -*-
"""Rename mangled locals in the stylua-formatted module tree."""
import io, os, re, sys
BS = chr(92)
ROOT = sys.argv[1]
KEYWORDS = set('''and break do else elseif end false for function if in local nil not or repeat return then true
until while self type typeof export continue'''.split())
# ------------------------------------------------------------------ lexing
def lex_spans(s):
    spans, i, n, start = [], 0, len(s), 0
    def flush(j):
        if j > start: spans.append(('code', start, j))
    while i < n:
        c = s[i]
        if s[i:i+2] == '--':
            flush(i); j = i + 2
            m = re.match(r'\[(=*)\[', s[j:])
            if m:
                close = ']' + m.group(1) + ']'; k = s.find(close, j); j = n if k < 0 else k + len(close)
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
            close = ']' + m.group(1) + ']'; k = s.find(close, i + m.end())
            j = n if k < 0 else k + len(close)
            spans.append(('str', i, j)); i = start = j
        else:
            i += 1
    flush(n)
    return spans
def code_mask(s):
    mask = bytearray(len(s))
    for kind, a, b in lex_spans(s):
        if kind == 'code':
            for k in range(a, b): mask[k] = 1
    return mask
IDENT = re.compile(r'[A-Za-z_]\w*')
WHITESPACE = ' \t\r\n'
def rename(src, mapping, lo=0, hi=None):
    if not mapping: return src
    hi = len(src) if hi is None else hi
    mask, out, i = code_mask(src), [], 0

    # brace depth, and the index of the previous *code* character
    # (whitespace and comments skipped) for each position
    brace, depth = bytearray(len(src)), 0
    prev_code = [-1] * len(src)
    last = -1
    for idx, ch in enumerate(src):
        prev_code[idx] = last
        if mask[idx]:
            if ch == "{": depth += 1
            elif ch == "}": depth = max(0, depth - 1)
            if ch not in WHITESPACE: last = idx
        brace[idx] = min(depth, 255)

    for m in IDENT.finditer(src):
        if m.start() < lo or m.start() >= hi: continue
        if not mask[m.start()]: continue

        j = prev_code[m.start()]
        if j >= 0 and src[j] in ".:" and not (j > 0 and src[j - 1] == "."): continue  # field access

        k = m.end()
        while k < len(src) and src[k] in " \t": k += 1

        # A table KEY is `name =` whose preceding code character is `{` or `,`.
        # stylua puts a comma after every entry, so that always holds. An
        # assignment STATEMENT inside a function nested in a constructor --
        # `callback = function(v) selected = v end` -- follows `)` or `end`
        # instead, and must still be renamed. Getting this wrong silently
        # redirects the assignment to a global while its declaration is renamed.
        if (brace[m.start()] > 0 and k < len(src) and src[k] == "="
                and src[k:k + 2] != "==" and j >= 0 and src[j] in "{,"):
            continue

        new = mapping.get(m.group(0))
        if new is None: continue
        out.append(src[i:m.start()]); out.append(new); i = m.end()
    out.append(src[i:])
    return "".join(out)

def used(src, name):
    mask = code_mask(src)
    return any(mask[m.start()] for m in IDENT.finditer(src) if m.group(0) == name)
# ------------------------------------------------------------------ RHS splitting
OPEN, CLOSE = '([{', ')]}'
def split_assignment(src, eq_idx, base_indent):
    """Return list of top-level RHS expression strings starting after `=`."""
    mask, i, n, depth = code_mask(src), eq_idx + 1, len(src), 0
    items, cur = [], []
    while i < n:
        c = src[i]
        if not mask[i]:
            for kind, a, b in lex_spans(src):
                if a <= i < b: cur.append(src[a:b]); i = b; break
            else: i += 1
            continue
        if c in OPEN: depth += 1
        elif c in CLOSE:
            if depth == 0: break
            depth -= 1
        elif c == ',' and depth == 0:
            items.append(''.join(cur).strip()); cur = []; i += 1; continue
        elif c == '\n' and depth == 0:
            m = re.match(r'[ \t]*', src[i+1:])
            if len(m.group(0)) <= base_indent: break
        cur.append(c); i += 1
    if ''.join(cur).strip(): items.append(''.join(cur).strip())
    return items
PATH_SEG = re.compile(r'([A-Za-z_]\w*)\s*$')
def name_from_expr(expr):
    m = re.match(r'^require\s*\((.*)\)$', expr.strip(), re.S)
    inner = m.group(1) if m else expr
    inner = inner.strip().rstrip(')')
    m = PATH_SEG.search(inner)
    if not m: return None
    seg = m.group(1)
    if seg in KEYWORDS or len(seg) < 3: return None
    return seg
# ------------------------------------------------------------------ per-file
def camel(basename):
    return basename[0].lower() + basename[1:] if basename else basename
def process(path):
    src = io.open(path, encoding='utf-8').read()
    base = os.path.splitext(os.path.basename(path))[0]
    mp = {}
    # 1. class table:  local X = {}  /  X.__index = X  /  X.__type = "Name"
    m = re.search(r'local (\w{1,3}) = \{\}\n\1\.__index = \1\n\1\.__type = "(\w+)"', src)
    if m: mp[m.group(1)] = m.group(2)
    else:
        # window/hapticengine style: local X = {} ... X.__index = X ... return X
        m = re.search(r'^local (\w{1,3}) = \{\}$', src, re.M)
        if m and re.search(r'^return %s$' % re.escape(m.group(1)), src, re.M):
            mp[m.group(1)] = camel(base) if base[0].islower() else base
    # 2. locals bound to require()/module paths
    for lm in re.finditer(r'^([ \t]*)local ([A-Za-z_][\w, ]*?)\s*=', src, re.M):
        names = [x.strip() for x in lm.group(2).split(',')]
        if not all(re.match(r'^\w{1,3}$', x) for x in names): continue
        eq = src.index('=', lm.end() - 1)
        items = split_assignment(src, eq, len(lm.group(1)))
        if len(items) != len(names): continue
        for nm, expr in zip(names, items):
            if 'require(' not in expr and not re.match(r'^script[\w.]*$', expr.strip()): continue
            new = name_from_expr(expr)
            if new and new not in mp.values(): mp.setdefault(nm, new)
    src = rename(src, mp)
    # 3. first param of `function Class.method(p, ...)` -> self
    cls = mp.get(m.group(1)) if m else None
    lines = src.split('\n')
    out, i = [], 0
    while i < len(lines):
        fm = re.match(r'^(\s*)function ([A-Za-z_]\w*)[.:](\w+)\((\w{1,3})([,)])', lines[i])
        if fm and fm.group(3) != 'new':
            indent, p = fm.group(1), fm.group(4)
            j = i + 1
            while j < len(lines) and lines[j] != indent + 'end': j += 1
            block = '\n'.join(lines[i:j + 1])
            if re.search(r'\b%s\s*[.:]' % re.escape(p), block):
                block = rename(block, {p: 'self'})
                out.extend(block.split('\n')); i = j + 1; continue
        out.append(lines[i]); i += 1
    src = '\n'.join(out)
    # A rename is file-wide, so a surviving occurrence means one was skipped.
    for old, new in mp.items():
        m2 = code_mask(src)
        for mm in IDENT.finditer(src):
            if mm.group(0) != old or not m2[mm.start()]:
                continue
            pj = mm.start() - 1
            while pj >= 0 and src[pj] in " \t":
                pj -= 1
            if pj >= 0 and src[pj] in ".:":
                continue                      # an unrelated field of the same name
            raise SystemExit("BUG in %s: %r -> %r but an occurrence survived at offset %d"
                             % (path, old, new, mm.start()))

    for _new in set(mp.values()):
        if not re.search(r'\blocal\b[^\n=]*\b%s\b' % re.escape(_new), src):
            raise SystemExit('BUG in %s: renamed to %r but never declared' % (path, _new))
    io.open(path, 'w', encoding='utf-8').write(src)
    return mp
total = 0
for dirpath, _, files in os.walk(ROOT):
    for f in sorted(files):
        if f.endswith('.luau'):
            mp = process(os.path.join(dirpath, f))
            total += len(mp)
            print('%-46s %s' % (os.path.relpath(os.path.join(dirpath, f), ROOT).replace(BS, '/'),
                                ', '.join('%s->%s' % kv for kv in sorted(mp.items()))))
print('\n%d locals renamed' % total)