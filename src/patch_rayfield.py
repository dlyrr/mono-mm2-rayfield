# -*- coding: utf-8 -*-
"""Additions to the deobfuscated Rayfield tree that upstream does not have.

Run after pass2.py and before bundle.py. Idempotent: re-running is a no-op, so a
full pipeline regeneration cannot silently drop these.

Currently one feature: pinning a saved configuration to load on start. Rayfield's
autoLoad only ever restores the default file, so a named configuration had to be
loaded by hand every session.
"""
import io, os, sys

ROOT = sys.argv[1] if len(sys.argv) > 1 else 'out/Rayfield'
MARK = 'autoloadConfig'


def patch(path, edits):
    p = os.path.join(ROOT, path)
    s = io.open(p, encoding='utf-8').read()
    if MARK in s:
        return 'already patched'
    for old, new in edits:
        assert old in s, '%s: anchor not found:\n%s' % (path, old[:120])
        s = s.replace(old, new, 1)
    io.open(p, 'w', encoding='utf-8').write(s)
    return 'patched'


# ---------------------------------------------------------------- settings file
print('persistenceSettings.luau:', patch('utility/persistenceSettings.luau', [
    ('        showProfile = ak.settings.showProfile,',
     '        showProfile = ak.settings.showProfile,\n'
     '        autoloadConfig = ak.settings.autoloadConfig,'),
    ('''    if type(c.showProfile) == "boolean" then
        al.settings.showProfile = c.showProfile
    end''',
     '''    if type(c.showProfile) == "boolean" then
        al.settings.showProfile = c.showProfile
    end
    if type(c.autoloadConfig) == "string" then
        al.settings.autoloadConfig = c.autoloadConfig
    end'''),
]))

# ---------------------------------------------------------------- window
print('window.luau:', patch('components/window.luau', [
    # Show(): prefer the pinned configuration over the default file
    ('''    if self.configuration.autoLoad and not self._autoLoaded then
        self._autoLoaded = true
        local default, K = pcall(self.Load, self)''',
     '''    if self.configuration.autoLoad and not self._autoLoaded then
        self._autoLoaded = true
        -- A pinned configuration wins over the default file. If it has been
        -- deleted since, fall back rather than starting with nothing applied.
        local pinned = self.settings.autoloadConfig
        if pinned and not table.find(self:ListConfigs(), pinned) then
            pinned = nil
            self.settings.autoloadConfig = nil
            self:SaveSettings()
        end
        local default, K = pcall(self.Load, self, pinned)'''),

    # forward-declare the toggle so the dropdown callback can refresh it
    ('        local default, K, L = self:ListConfigs()[1]',
     '        local default, K, L, autoPin = self:ListConfigs()[1]'),

    # keep the toggle in step with whichever configuration is selected
    ('''            callback = function(N)
                default = N
            end,
        })''',
     '''            callback = function(N)
                default = N
                if autoPin then
                    autoPin:Set(self.settings.autoloadConfig == N, true)
                end
            end,
        })
        autoPin = self.rfSettings:CreateToggle({
            name = "Load this configuration on start",
            description = [[Applies the selected configuration every time the script runs,]]
                .. [[ instead of restoring whatever was last in use.]],
            value = self.settings.autoloadConfig ~= nil
                and self.settings.autoloadConfig == default,
            forgetState = true,
            callback = function(on)
                if on and default and default ~= "" then
                    self.settings.autoloadConfig = default
                else
                    self.settings.autoloadConfig = nil
                end
                self:SaveSettings()
            end,
        })'''),

    # deleting the pinned configuration must unpin it
    ('''                if self:DeleteConfig(O) then
                    M()''',
     '''                if self:DeleteConfig(O) then
                    if self.settings.autoloadConfig == O then
                        self.settings.autoloadConfig = nil
                        self:SaveSettings()
                    end
                    M()'''),
]))
