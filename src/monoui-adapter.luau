-- MonoUI -> Rayfield Gen2 adapter.
--
-- MonoMM2 ships its own 3,700-line UI library and drives it through a small API.
-- Rather than rewrite ~3,500 lines of feature code, this implements that API on
-- top of Rayfield, so the feature code below runs untouched.
--
-- Model differences that shape the mapping:
--   MonoUI:   tab -> category -> section -> module -> per-module settings drawer
--   Rayfield:        tab                 -> section -> elements (no drawer)
-- so a MonoUI *category* becomes a Rayfield *tab*, and a module's settings are
-- laid out directly beneath the module instead of behind a drawer.

local function MakeMonoUI(Rayfield)
    local MonoUI = {}

    local function noop() end

    -- Unmapped MonoUI methods (cosmetic ones: SetSmoothScroll, ToggleFullscreen,
    -- Refresh...) resolve to a no-op rather than erroring. Only capitalised keys,
    -- so plain field reads such as `Menu.uiSettings` still return their value.
    MonoUI.__index = function(_, k)
        local v = rawget(MonoUI, k)
        if v ~= nil then
            return v
        end
        if type(k) == "string" and k:sub(1, 1):match("%u") then
            return noop
        end
        return nil
    end

    local function words(s)
        return (tostring(s):gsub("(%l)(%u)", "%1 %2"))
    end

    -- Rayfield derives a config flag from the element name, so two modules that
    -- each have a "Speed" slider would collide. Namespace every flag explicitly.
    local function flagFor(...)
        return (table.concat({ ... }, "_"):gsub("[^%w_]", ""))
    end

    function MonoUI.new(cfg)
        cfg = cfg or {}
        local self = setmetatable({}, MonoUI)

        local title = cfg.Title or "Mono"
        self.window = Rayfield:CreateWindow({
            Name = title,
            Subtitle = cfg.Version,
            SidebarLayout = true,
            -- Without this the collapsed pill reads "Rayfield" rather than the
            -- script's own name.
            ShowName = title,
            Configuration = { AutoSave = true, AutoLoad = true, FileName = title },
        })

        self.categories, self.tabs, self.allModules = {}, {}, {}
        self.uiSettings = {} -- the feature code table.inserts into this directly
        self.tourSteps = {}
        return self
    end

    -- MonoUI's top-level tabs (Players/Server/Configs/Settings/Credits) are pages
    -- the library fills in itself. Rayfield supplies its own settings and config
    -- UI, so these are recorded and otherwise ignored.
    function MonoUI:Tab(name)
        local tab = { name = name }
        table.insert(self.tabs, tab)

        -- Players and Server are pages MonoUI builds itself. Rebuilt here on
        -- Rayfield elements. Configs/Settings/Credits are dropped: Rayfield
        -- ships its own equivalents.
        if name == "Players" then
            self:_buildPlayersPage()
        elseif name == "Server" then
            self:_buildServerPage()
        end
        return tab
    end

    -- Ordered after the feature categories (which default to 0) but before
    -- Rayfield's own settings tab (1000).
    local PAGE_ORDER = { Keybinds = 899, Players = 900, Server = 901 }

    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local Stats = game:GetService("Stats")
    local TeleportService = game:GetService("TeleportService")

    local function copyToClipboard(text)
        local fn = (getgenv and getgenv().setclipboard) or setclipboard
        if typeof(fn) == "function" then
            pcall(fn, tostring(text))
            return true
        end
        return false
    end

    -- Anything that lists players re-syncs here on join/leave: the Players page
    -- picker, and every `GetValues` dropdown the feature code declares (the
    -- teleport modules each get one). Connections are bound once, on first use.
    function MonoUI:_onPlayersChanged(fn)
        if not self._playerWatchers then
            self._playerWatchers = {}
            local function resync()
                -- deferred so GetPlayers() no longer includes a leaver
                task.defer(function()
                    for _, watcher in self._playerWatchers do
                        pcall(watcher)
                    end
                end)
            end
            self.window:Connect(Players.PlayerAdded, resync)
            self.window:Connect(Players.PlayerRemoving, resync)
        end
        table.insert(self._playerWatchers, fn)
    end

    local function clock(seconds)
        seconds = math.floor(seconds)
        local h, m = math.floor(seconds / 3600), math.floor(seconds % 3600 / 60)
        if h > 0 then
            return string.format("%dh %dm", h, m)
        elseif m > 0 then
            return string.format("%dm %ds", m, seconds % 60)
        end
        return seconds .. "s"
    end

    function MonoUI:_buildPlayersPage()
        local tab = self.window:CreateTab({ Name = "Players", CustomOrder = PAGE_ORDER.Players })
        local selected

        local function names()
            local list = {}
            for _, p in Players:GetPlayers() do
                table.insert(list, p.Name)
            end
            table.sort(list)
            return list
        end

        tab:CreateSection({ Name = "Player" })
        local picker
        local detail = tab:CreateText({ Name = "Select a player", Text = "" })

        local function render()
            local plr = selected and Players:FindFirstChild(selected)
            if not plr then
                detail:SetTitle("Select a player")
                detail:Set("")
                return
            end

            local me = Players.LocalPlayer
            local rows = {
                { "User ID", plr.UserId },
                { "Display name", plr.DisplayName },
                { "Username", plr.Name },
                { "Account age", plr.AccountAge .. " days" },
                { "Membership", (tostring(plr.MembershipType):gsub("Enum.MembershipType.", "")) },
                { "Locale", plr.LocaleId ~= "" and plr.LocaleId or "?" },
                { "Team", plr.Team and plr.Team.Name or "None" },
                { "Follows you", tostring(me and plr.FollowUserId == me.UserId) },
            }

            local char = plr.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum then
                table.insert(rows, { "Health", string.format("%d / %d", hum.Health, hum.MaxHealth) })
            end
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local myRoot = me and me.Character and me.Character:FindFirstChild("HumanoidRootPart")
            if root and myRoot then
                table.insert(
                    rows,
                    { "Distance", string.format("%d studs", (root.Position - myRoot.Position).Magnitude) }
                )
            end

            -- MonoUI lets the script append game-specific rows via Menu.DetailExtra.
            -- rawget, because the no-op __index would otherwise hand back a function.
            local extraFn = rawget(self, "DetailExtra")
            if extraFn then
                local ok, extra = pcall(extraFn, plr)
                if ok and type(extra) == "table" then
                    for _, grp in ipairs(extra) do
                        if grp.Section then
                            table.insert(rows, { "-- " .. grp.Section, "" })
                        end
                        for _, pair in ipairs(grp.Rows or {}) do
                            table.insert(rows, { pair[1], pair[2] })
                        end
                    end
                end
            end

            local lines = {}
            for _, r in rows do
                table.insert(lines, r[1] .. ":  " .. tostring(r[2]))
            end
            detail:SetTitle(plr.DisplayName .. "  (@" .. plr.Name .. ")")
            detail:Set(table.concat(lines, "\n"))
        end

        picker = tab:CreateDropdown({
            Name = "Player",
            Options = names(),
            Placeholder = "Pick a player",
            ForgetState = true,
            Callback = function(v)
                selected = v
                render()
            end,
        })

        tab:CreateButton({
            Name = "Refresh details",
            Callback = render,
        })

        tab:CreateButton({
            Name = "Copy user ID",
            Callback = function()
                local plr = selected and Players:FindFirstChild(selected)
                if plr and copyToClipboard(plr.UserId) then
                    self.window:Toast({ Title = "Copied", Subtitle = tostring(plr.UserId) })
                end
            end,
        })

        self:_onPlayersChanged(function()
            picker:Refresh(names())
            render()
        end)

        self.pagePlayers = tab
    end

    function MonoUI:_buildServerPage()
        local tab = self.window:CreateTab({ Name = "Server", CustomOrder = PAGE_ORDER.Server })

        local function info(name, value)
            return tab:CreateText({ Name = name, Text = tostring(value) })
        end

        tab:CreateSection({ Name = "Place" })
        info("Place ID", game.PlaceId)
        info("Place version", game.PlaceVersion)
        info("Universe ID", game.GameId)
        info("Creator ID", game.CreatorId)
        info("Creator type", game.CreatorType.Name)

        tab:CreateSection({ Name = "Session" })
        local jobId = game.JobId ~= "" and game.JobId or "(studio / no job id)"
        info("Job ID", jobId)
        info("Max players", Players.MaxPlayers)
        info("Preferred players", Players.PreferredPlayers)
        info("Streaming enabled", tostring(workspace.StreamingEnabled))
        info("Filtering enabled", tostring(workspace.FilteringEnabled))
        local uptime = info("Uptime", "-")

        tab:CreateButton({
            Name = "Copy Job ID",
            Callback = function()
                if copyToClipboard(game.JobId) then
                    self.window:Toast({ Title = "Job ID copied" })
                end
            end,
        })

        tab:CreateButton({
            Name = "Rejoin this server",
            Description = "Reconnects to this exact server instance rather than a new one."
                .. " Fails if it fills up or shuts down while you are reconnecting.",
            Callback = function()
                -- empty in Studio, and there is no instance to return to
                if game.JobId == "" then
                    self.window:Toast({
                        Title = "Cannot rejoin",
                        Subtitle = "this session has no job id",
                    })
                    return
                end
                self.window:Toast({ Title = "Rejoining", Subtitle = "same server" })
                local ok, err = pcall(function()
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
                end)
                -- an async failure arrives on TeleportInitFailed, which the
                -- feature code already reports; this catches the immediate throw
                if not ok then
                    self.window:Toast({ Title = "Rejoin failed", Subtitle = tostring(err):sub(1, 60) })
                end
            end,
        })

        tab:CreateSection({ Name = "Live" })
        local statPlayers = tab:CreateStat({ Name = "Players", Value = #Players:GetPlayers() })
        local statFps = tab:CreateStat({ Name = "FPS", Value = 60 })
        local statPing = tab:CreateStat({ Name = "Ping", Value = 0, Suffix = " ms" })
        local statMem = tab:CreateStat({ Name = "Memory", Value = 0, Suffix = " MB" })

        local started, frames, acc = os.clock(), 0, 0
        self.window:Connect(RunService.Heartbeat, function(dt)
            frames += 1
            acc += dt
            if acc < 1 then
                return
            end

            statFps:Set(math.floor(frames / acc + 0.5))
            frames, acc = 0, 0

            statPlayers:Set(#Players:GetPlayers())
            uptime:Set(clock(os.clock() - started))

            pcall(function()
                statMem:Set(math.floor(Stats:GetTotalMemoryUsageMb()))
                local item = Stats.Network.ServerStatsItem["Data Ping"]
                statPing:Set(math.floor(tonumber(item:GetValueString():match("%d+%.?%d*")) or 0))
            end)
        end)

        self.pageServer = tab
    end

    function MonoUI:Category(name, icon)
        local cat = { name = name, icon = icon, ui = self, modules = {} }

        -- Created lazily: "Favorites" is populated by MonoUI itself and would
        -- otherwise show up as an empty tab.
        function cat:_tab()
            if not self._rfTab then
                self._rfTab = self.ui.window:CreateTab({ Name = self.name })
            end
            return self._rfTab
        end

        function cat:Section(sectionName)
            self:_tab():CreateSection({ Name = sectionName })
            self._section = sectionName
            return self
        end

        function cat:Module(opts)
            return self.ui:_module(self, opts or {})
        end

        function cat:Adopt() end
        function cat:Drop() end

        table.insert(self.categories, cat)
        return cat
    end

    function MonoUI:_module(cat, opts)
        local tab = cat:_tab()
        local m = {
            name = opts.Name or "Module",
            desc = opts.Desc or "",
            info = opts.Info,
            bind = opts.Bind,
            state = opts.Default and true or false,
            callback = opts.Callback,
            action = opts.Action and true or false,
            hold = opts.Hold and true or false,
            category = cat,
            ui = self,
            settings = {},
        }

        -- MonoUI shows Desc inline and Info in the drawer; Rayfield has one
        -- description slot, so join them when both are present.
        local description = m.info or m.desc
        if m.info and m.desc ~= "" then
            description = m.desc .. "\n\n" .. m.info
        end

        if opts.Action then
            m.element = tab:CreateButton({
                Name = words(m.name),
                Description = description,
                Callback = function()
                    if m.callback then
                        m.callback(true)
                    end
                end,
            })
        else
            m.element = tab:CreateToggle({
                Name = words(m.name),
                Description = description,
                Value = m.state,
                Flag = flagFor(cat.name, m.name),
                Callback = function(v)
                    m.state = v
                    if m.callback then
                        m.callback(v)
                    end
                end,
            })
        end

        -- Binds are not created here. In MonoUI any module can be bound at runtime
        -- from its row, so every module gets a keybind on the Keybinds page once
        -- they all exist; opts.Bind becomes that keybind's default.

        function m:Get()
            return self.state
        end

        function m:Toggle(v)
            if v == nil then
                v = not self.state
            end
            self.state = v and true or false
            if self.element and self.element.Set then
                self.element:Set(self.state)
            end
        end

        function m:SetDesc(t)
            self.desc = t
        end

        function m:SetBind(k)
            self.bind = k
            if self.keybind then
                self.keybind:Set(k or Enum.KeyCode.Unknown, true)
            end
        end

        function m:SetFavorite() end

        function m:Setting(cfg)
            table.insert(self.settings, cfg)
            self.ui:_setting(tab, self, cfg)
            return self
        end

        table.insert(cat.modules, m)
        table.insert(self.allModules, m)
        return m
    end

    function MonoUI:_setting(tab, m, cfg)
        local kind = cfg.Type or "Toggle"
        local title = cfg.Title or cfg.Text or kind
        local flag = flagFor(m.category.name, m.name, title)
        local cb = cfg.Callback or noop

        if kind == "Slider" then
            return tab:CreateSlider({
                Name = title,
                Range = { cfg.Min or 0, cfg.Max or 100 },
                Increment = cfg.Step or cfg.Increment or 1,
                Value = cfg.Default or cfg.Min or 0,
                Suffix = cfg.Suffix,
                Flag = flag,
                Callback = function(v)
                    cb(v)
                end,
            })
        elseif kind == "Dropdown" then
            -- MonoUI re-evaluates GetValues every time its drawer opens; Rayfield
            -- wants the options up front. Seed them, then re-sync on join/leave so
            -- the teleport target lists stay current.
            local dynamic = cfg.GetValues
            local values = cfg.Values or (dynamic and cfg.GetValues()) or {}
            local handle = tab:CreateDropdown({
                Name = title,
                Options = values,
                Value = cfg.Default,
                -- a live player list is not worth persisting between sessions
                ForgetState = dynamic and true or nil,
                Flag = (not dynamic) and flag or nil,
                Callback = function(v)
                    cb(v)
                end,
            })
            if dynamic then
                self:_onPlayersChanged(function()
                    -- Refresh keeps the current selection when it is still in the
                    -- list, and fires the callback when it is not.
                    handle:Refresh(cfg.GetValues())
                end)
            end
            return handle
        elseif kind == "Toggle" then
            return tab:CreateToggle({
                Name = title,
                Value = cfg.Default and true or false,
                Flag = flag,
                Callback = function(v)
                    cb(v)
                end,
            })
        elseif kind == "Keybind" then
            return tab:CreateKeybind({
                Name = title,
                Value = cfg.Default,
                Flag = flag,
                OnChanged = function(k)
                    cb(k)
                end,
            })
        elseif kind == "Button" then
            return tab:CreateButton({
                Name = title,
                Callback = function()
                    cb()
                end,
            })
        elseif kind == "Section" then
            return tab:CreateSection({ Name = cfg.Text or title })
        elseif kind == "Label" then
            return tab:CreateText({ Text = cfg.Text or title })
        end
        return nil
    end

    function MonoUI:Notify(cfg)
        cfg = cfg or {}
        return self.window:Notify({
            Title = cfg.Title or "Mono",
            Content = cfg.Content or cfg.Body or "",
            Duration = cfg.Duration,
        })
    end

    function MonoUI:Confirm(cfg)
        cfg = cfg or {}
        return self.window:Popup({
            Title = cfg.Title or "Confirm",
            Content = cfg.Body or cfg.Content,
            Options = {
                { text = cfg.ConfirmText or "Confirm", style = "danger", callback = cfg.OnConfirm },
                { text = cfg.CancelText or "Cancel", callback = cfg.OnCancel },
            },
        })
    end

    function MonoUI:AddTourStep(cfg)
        table.insert(self.tourSteps, cfg)
    end

    function MonoUI:StartTour()
        self:Notify({
            Title = "Tour unavailable",
            Content = "The guided tour points at MonoUI's own window chrome, which Rayfield does not have."
                .. " Each feature's explanation is in its description instead.",
        })
    end

    -- Pressing a bind gives no on-screen feedback on its own, and the menu is
    -- usually closed at the time, so say what just happened. Only from a keybind:
    -- clicking the toggle in the menu is its own feedback.
    function MonoUI:_bindToast(m, state)
        self.window:Toast({ Title = words(m.name), Subtitle = state, Duration = 1.5 })
    end

    -- MonoUI puts a bindable chip on every module row. Rayfield rows have no such
    -- slot, and a keybind under all 49 toggles would bury the features, so the
    -- binds are collected onto one page. Built from Present() because that is the
    -- last thing the feature code calls, by which point every module exists.
    function MonoUI:_buildKeybindsPage()
        if self.pageKeybinds or #self.allModules == 0 then
            return
        end
        local tab = self.window:CreateTab({ Name = "Keybinds", CustomOrder = PAGE_ORDER.Keybinds })
        self.pageKeybinds = tab

        tab:CreateText({
            Name = "Binds",
            Text = "Set a key against any feature to toggle it without opening the menu."
                .. " Click a key to rebind, right-click to clear.",
        })

        local currentCategory
        for _, m in self.allModules do
            if m.category ~= currentCategory then
                currentCategory = m.category
                tab:CreateSection({ Name = currentCategory.name })
            end

            m.keybind = tab:CreateKeybind({
                Name = words(m.name),
                Value = m.bind,
                Hold = m.hold,
                Flag = flagFor(m.category.name, m.name, "bind"),
                Callback = function(v)
                    if m.action then
                        if m.callback then
                            m.callback(true)
                        end
                        self:_bindToast(m, "Triggered")
                        return
                    end
                    if m.hold then
                        -- a Hold keybind reports true on press and false on release
                        m:Toggle(v == true)
                    else
                        m:Toggle()
                    end
                    self:_bindToast(m, m.state and "On" or "Off")
                end,
                OnChanged = function(k)
                    m.bind = k
                end,
            })
        end
    end

    function MonoUI:Present()
        self:_buildKeybindsPage()
        self.window:Show()
    end

    function MonoUI:Minimize()
        self.window:ToggleMinimise()
    end

    function MonoUI:Restore()
        self.window:Show()
    end

    function MonoUI:Destroy()
        self.window:Unload()
    end

    function MonoUI:SelectTab() end

    function MonoUI:SelectCategory(cat)
        if cat and cat._rfTab then
            self.window:Navigate(cat._rfTab)
        end
    end

    function MonoUI:GetConfig()
        return self.window.Flags
    end

    function MonoUI:LoadConfig(name)
        return self.window:Load(name)
    end

    function MonoUI:SaveConfig(name)
        return self.window:Save(name)
    end

    function MonoUI:ResetSettings()
        self:Notify({
            Title = "Settings",
            Content = "Rayfield keeps its own settings; nothing to reset here.",
        })
    end

    return MonoUI
end

return MakeMonoUI
