# -*- coding: utf-8 -*-
"""Assemble Rayfield Gen2 + the MonoUI adapter + the MM2 feature code into one file."""
import io, re, sys

LOCAL_LIMIT = 200  # Luau's registers-per-function limit

# Printed once on load, before anything else runs. Built from U+2588 alone, which
# the Roblox console renders reliably; box-drawing glyphs do not always survive.
BANNER = '''print([==[

 \u2588\u2588\u2588    \u2588\u2588\u2588  \u2588\u2588\u2588\u2588\u2588\u2588  \u2588\u2588\u2588    \u2588\u2588  \u2588\u2588\u2588\u2588\u2588\u2588
 \u2588\u2588\u2588\u2588  \u2588\u2588\u2588\u2588 \u2588\u2588    \u2588\u2588 \u2588\u2588\u2588\u2588   \u2588\u2588 \u2588\u2588    \u2588\u2588
 \u2588\u2588 \u2588\u2588\u2588\u2588 \u2588\u2588 \u2588\u2588    \u2588\u2588 \u2588\u2588 \u2588\u2588  \u2588\u2588 \u2588\u2588    \u2588\u2588
 \u2588\u2588  \u2588\u2588  \u2588\u2588 \u2588\u2588    \u2588\u2588 \u2588\u2588  \u2588\u2588 \u2588\u2588 \u2588\u2588    \u2588\u2588
 \u2588\u2588      \u2588\u2588  \u2588\u2588\u2588\u2588\u2588\u2588  \u2588\u2588   \u2588\u2588\u2588\u2588  \u2588\u2588\u2588\u2588\u2588\u2588

            M A D E   B Y   X O C A T

]==])

'''

rf = io.open('C:/Users/santi/Downloads/rayfield-gen2-deobf.luau', encoding='utf-8').read().rstrip()
shim = io.open('monoshim.luau', encoding='utf-8').read().rstrip()
mono = io.open('mono.lua', encoding='utf-8').read().split('\n')

# ---- feature code: everything past the embedded MONOUI_SOURCE string ----
feat = '\n'.join(mono[3734:])
old = 'local MonoUI=loadstring(MONOUI_SOURCE)()'
assert old in feat, 'library entry point not found'
feat = feat.replace(old, 'local MonoUI = MakeMonoUI(Rayfield)')
feat = feat.replace('if typeof(loadstring)~="function" then\n'
                    '    return error("[MONO] Your executor has no loadstring, which the UI library needs.",0)',
                    'if false then\n    return error("",0)')

if shim.endswith('return MakeMonoUI'):
    shim = shim[:-len('return MakeMonoUI')].rstrip()

# ---- Rayfield goes inside an IIFE ----
# The feature code alone declares ~170 top-level locals. Left flat, the bundle's
# own 78 would push the chunk past Luau's 200-register limit and it would fail to
# compile ("Out of local registers"). An IIFE gives them their own scope, so the
# whole library costs one local out here.
assert rf.endswith('return require(Rayfield)')
body = rf.split('\n')
head = []
while body and (body[0].startswith('--') or not body[0].strip()):
    head.append(body.pop(0))
indented = '\n'.join(('    ' + l) if l.strip() else '' for l in body)
rf_block = '\n'.join(head) + '\nlocal Rayfield = (function()\n' + indented + '\nend)()\n'

out = ('-- Mono MM2, running on Rayfield Gen2.\n--\n'
       '-- Script and UI originally by https://robloxscripts.com/user/Fleece (MonoMM2).\n'
       '-- The bundled MonoUI library is replaced by the adapter below; the feature\n'
       '-- code is unmodified apart from its one library entry point.\n--\n'
       '-- Rayfield Gen2 (c) 2026 Corridon Capital, MPL-2.0 - https://mozilla.org/MPL/2.0/\n\n'
       + BANNER + rf_block + '\n-- ' + '=' * 70 + '\n' + shim
       + '\n\n-- ' + '=' * 70 + '\n-- Mono MM2 feature code\n-- ' + '=' * 70 + '\n' + feat)


def toplevel_locals(text):
    """Names declared at chunk scope, i.e. at column 0."""
    names = []
    for line in text.split('\n'):
        if line[:1] in (' ', '\t') or not line.startswith('local'):
            continue
        m = re.match(r'local\s+function\s+([A-Za-z_]\w*)', line)
        if m:
            names.append(m.group(1))
            continue
        m = re.match(r'local\s+([A-Za-z_][\w,\s]*?)\s*(?:=|$)', line)
        if m:
            names += [p.strip() for p in m.group(1).split(',') if p.strip()]
    return names


n = len(toplevel_locals(out))
if n >= LOCAL_LIMIT:
    raise SystemExit('BUILD FAILED: %d top-level locals, Luau allows %d. '
                     'Wrap another section in a do...end or an IIFE.' % (n, LOCAL_LIMIT))

io.open('mono-rayfield.luau', 'w', encoding='utf-8').write(out)

# split halves, purely so the pieces fit under the test harness transport cap
L = out.split('\n')
i = [k for k, l in enumerate(L) if l == 'end)()'][0]   # column 0 = the outer IIFE, not a nested one
p1 = L[:i]
while p1 and p1[-1].strip() in ('', 'return require(Rayfield)'):
    p1.pop()                                    # drop the IIFE's own return
io.open('part1_rayfield.luau', 'w', encoding='utf-8').write(
    '\n'.join(p1).replace('local Rayfield = (function()', 'do', 1)
    + '\ngetgenv().__RF_GEN2 = require(Rayfield)\nend\n')
io.open('part2_mono.luau', 'w', encoding='utf-8').write(
    'local Rayfield = getgenv().__RF_GEN2\n' + '\n'.join(L[i + 1:]))

print('lines %d, top-level locals %d / %d' % (len(L), n, LOCAL_LIMIT))
