import io, sys
rf   = io.open('C:/Users/santi/Downloads/rayfield-gen2-deobf.luau', encoding='utf-8').read().rstrip()
shim = io.open('monoshim.luau', encoding='utf-8').read().rstrip()
mono = io.open('mono.lua', encoding='utf-8').read().split('\n')

feat = '\n'.join(mono[3734:])
old = 'local MonoUI=loadstring(MONOUI_SOURCE)()'
assert old in feat
feat = feat.replace(old, 'local MonoUI = MakeMonoUI(Rayfield)')
feat = feat.replace('if typeof(loadstring)~="function" then\n'
                    '    return error("[MONO] Your executor has no loadstring, which the UI library needs.",0)',
                    'if false then\n    return error("",0)')

if shim.endswith('return MakeMonoUI'):
    shim = shim[:-len('return MakeMonoUI')].rstrip()

assert rf.endswith('return require(Rayfield)')
rf = rf[:-len('return require(Rayfield)')] + 'local Rayfield = require(Rayfield)\n'

out = ('-- Mono MM2, running on Rayfield Gen2.\n--\n'
       '-- Script and UI originally by https://robloxscripts.com/user/Fleece (MonoMM2).\n'
       '-- The bundled MonoUI library is replaced by the adapter below; the feature\n'
       '-- code is unmodified apart from its one library entry point.\n--\n'
       '-- Rayfield Gen2 (c) 2026 Corridon Capital, MPL-2.0 - https://mozilla.org/MPL/2.0/\n\n'
       + rf + '\n\n-- ' + '=' * 70 + '\n' + shim
       + '\n\n-- ' + '=' * 70 + '\n-- Mono MM2 feature code\n-- ' + '=' * 70 + '\n' + feat)
io.open('mono-rayfield.luau','w',encoding='utf-8').write(out)

L = out.split('\n')
i = [n for n,l in enumerate(L) if l.strip() == 'local Rayfield = require(Rayfield)'][0]
io.open('part1_rayfield.luau','w',encoding='utf-8').write('\n'.join(L[:i]) + '\ngetgenv().__RF_GEN2 = require(Rayfield)\n')
io.open('part2_mono.luau','w',encoding='utf-8').write('local Rayfield = getgenv().__RF_GEN2\n' + '\n'.join(L[i+1:]))
print('lines', len(L))
