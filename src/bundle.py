# -*- coding: utf-8 -*-
"""Re-bundle the deobfuscated Rayfield tree into one readable, loadable .luau file."""
import io, os, re, sys

SRC, DEST = sys.argv[1], sys.argv[2]

# ---- collect modules, ordered: utility -> themes -> components -> root ----
mods = []
for dp, _, fs in os.walk(SRC):
    for f in sorted(fs):
        if f.endswith('.luau'):
            p = os.path.join(dp, f)
            rel = os.path.relpath(p, SRC).replace(os.sep, '/')[:-len('.luau')]
            mods.append(('Rayfield/' + rel, p))

def rank(entry):
    rel = entry[0]
    if rel == 'Rayfield/init': return (3, rel)
    if rel.startswith('Rayfield/utility'): return (0, rel)
    if rel.startswith('Rayfield/themes'): return (1, rel)
    return (2, rel)
mods.sort(key=rank)

# ---- node identifiers ----
def var(path):
    p = path[:-len('/init')] if path.endswith('/init') else path
    return p.replace('/', '_')

folders = set()
for path, _ in mods:
    parts = (path[:-5] if path.endswith('/init') else path).split('/')
    for i in range(1, len(parts)):
        folders.add('/'.join(parts[:i]))

header = '''--!nocheck
-- Rayfield Gen2 v1.2.0 - deobfuscated single-file build
-- Reconstructed from the darklua bundle at https://sirius.menu/gen2
--
-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.
--
-- Layout: a table stands in for each ModuleScript/Folder of the original
-- Rojo tree, so `script.Parent.Parent.utility.locale` resolves exactly as it
-- did in the real hierarchy. Modules are lazily evaluated on first require.

local Modules, Cache = {}, {}

local NodeMeta = {
    __tostring = function(self)
        return rawget(self, "Name")
    end,
}

local function FindFirstChild(self, name)
    return rawget(self, name)
end

local function Node(name, parent)
    local node = setmetatable({ Name = name, Parent = parent, FindFirstChild = FindFirstChild }, NodeMeta)
    if parent then
        parent[name] = node
    end
    return node
end

local function define(node, factory)
    Modules[node] = factory
end

local function require(node)
    local cached = Cache[node]
    if cached ~= nil then
        return cached
    end
    local factory = Modules[node]
    if not factory then
        error("attempt to require an unknown module: " .. tostring(node), 2)
    end
    local result = factory(node, require)
    Cache[node] = result
    return result
end

-- ---------------------------------------------------------------- tree
'''

lines = [header]
for f in sorted(folders):
    parts = f.split('/')
    parent = 'nil' if len(parts) == 1 else var('/'.join(parts[:-1]))
    lines.append('local %s = Node("%s", %s)' % (var(f), parts[-1], parent))
lines.append('')
# module leaves are nodes too (the root, Rayfield/init, is already declared above)
for path, _ in mods:
    if path.endswith('/init'):
        continue
    parts = path.split('/')
    lines.append('local %s = Node("%s", %s)' % (var(path), parts[-1], var('/'.join(parts[:-1]))))
lines.append('')

body_parts = []
for path, p in mods:
    src = io.open(p, encoding='utf-8').read()
    src = re.sub(r'^--.*\n', '', src, count=2).strip('\n')          # drop pass-1 header
    indented = '\n'.join(('    ' + l) if l.strip() else '' for l in src.split('\n'))
    title = path[:-5] if path.endswith('/init') else path
    body_parts.append(
        '-- %s\n-- %s\ndefine(%s, function(script, require)\n%s\nend)\n'
        % ('-' * 70, title, var(path), indented))

lines.append('\n'.join(body_parts))
lines.append('-- ' + '-' * 70)
lines.append('return require(Rayfield)')

io.open(DEST, 'w', encoding='utf-8').write('\n'.join(lines) + '\n')
print('%d modules -> %s' % (len(mods), DEST))
