# Mono MM2 on Rayfield Gen2

[MonoMM2](https://github.com/fleecelolll/MonoMM2) running on the
[Rayfield Gen2](https://docs.sirius.menu/rayfield-gen2) UI library instead of its
own bundled UI.

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/dlyrr/mono-mm2-rayfield/main/Script.luau"))()
```

## What this is

MonoMM2 ships a ~3,700-line UI library (`MONOUI_SOURCE`) embedded as a string
literal, then builds its features on top. Rather than hand-porting 49 modules and
16 settings, `src/monoui-adapter.luau` **implements MonoUI's API on top of
Rayfield**, so the feature code runs unmodified apart from one line:

```lua
local MonoUI = loadstring(MONOUI_SOURCE)()   -- before
local MonoUI = MakeMonoUI(Rayfield)          -- after
```

## Layout mapping

The two libraries structure things differently:

| MonoUI | Rayfield |
| --- | --- |
| tab → category → section → module → settings drawer | tab → section → elements |

So a MonoUI **category becomes a tab**, and a module's settings sit directly
beneath it rather than behind a drawer. Modules become toggles, or buttons when
declared `Action`. `Desc` and `Info` merge into Rayfield's single description slot.

Two details that matter:

- **Flags are namespaced** (`Combat_Aimbot_FOV`). Rayfield derives config keys from
  element names, and several modules each have a "Speed" slider — unqualified they
  would collide and silently share saved state.
- **Unmapped methods no-op.** `MonoUI.__index` returns a no-op for any capitalised
  key the adapter does not implement (`SetSmoothScroll`, `ToggleFullscreen`), so
  cosmetic calls cannot crash the script. Lowercase field reads behave normally.

## Keybinds

MonoUI puts a bindable chip on every module row, so any feature can be bound at
runtime. Rayfield rows have no such slot, and a keybind under all 49 toggles would
bury the features, so the binds are collected onto one **Keybinds** page: a
section per category, one key per feature.

Binding a toggle flips it; a `Hold` feature such as Aimbot is active only while the
key is down; an `Action` feature fires. Binds are saved with the rest of the config.
The page is built from `Present()`, the last call the feature code makes, because
only then does every module exist.

Pressing a bind raises a toast naming the feature and its new state, since the menu
is usually closed at the time and there is otherwise no sign anything happened.
Clicking a toggle in the menu does not toast: you can already see it move.

## Players and Server pages

MonoUI builds these itself, so they are rebuilt on Rayfield elements:

- **Server** — Place / Session / Live sections, with `Players`, `FPS`, `Ping` and
  `Memory` driven by a heartbeat loop, plus uptime and a copy-Job-ID button.
- **Players** — a player dropdown that resyncs on join/leave, with a detail block
  (user ID, display name, account age, membership, locale, team, health, distance).
  `Menu.DetailExtra` is still honoured for game-specific rows.

Every dropdown that lists players re-syncs on join and leave: the Players picker
and all four teleport `Target` dropdowns. MonoUI re-evaluated `GetValues` each
time its drawer opened, which Rayfield has no equivalent of, so the adapter
registers those dropdowns against a single pair of `PlayerAdded`/`PlayerRemoving`
connections instead. A selection that is still in the refreshed list is kept; one
that left is cleared and the callback fires so the feature drops its target. Live
lists are marked `ForgetState`, since a roster is not worth persisting between
sessions.

## Not carried over

- MonoUI's **Configs / Settings / Credits** pages — Rayfield ships its own.
- The **guided tour**, which points at MonoUI's own window chrome. Every feature's
  explanation is in its description instead.
- **Favorites**, and `Menu.onCloseRequest` — Rayfield's close button hides the
  window rather than exposing a hook, so the unload confirmation does not fire
  from it.

## src/rayfield-gen2

Rayfield Gen2 is distributed minified through a darklua bundle. `src/rayfield-gen2`
is that bundle reconstructed into its original 67-module Rojo tree, and
`Script.luau` embeds it directly rather than fetching it at runtime. The scripts
that produced it are in `src/`:

| | |
| --- | --- |
| `deobf.py` | splits the bundle into modules using its own manifest |
| `pass2.py` | renames mangled locals (class tables, requires, `self`) |
| `bundle.py` | re-bundles the tree into one loadable file |
| `build.py` | assembles Rayfield + adapter + feature code into `Script.luau` |

`build.py` wraps the Rayfield bundle in an IIFE. Luau allows 200 locals per
function, and a chunk is a function: the feature code alone declares ~170 at top
level, so the bundle's own 78 would push the file past the limit and it would
fail to compile with `Out of local registers`. Inside an IIFE the whole library
costs one local. The build asserts on the count so this cannot regress.

## Credits

Script and original UI by [Fleece](https://robloxscripts.com/user/Fleece).
Rayfield Gen2 © 2026 Corridon Capital, [MPL-2.0](https://mozilla.org/MPL/2.0/).
