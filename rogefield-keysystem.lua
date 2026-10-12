local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local module = {
    Version = 1,
    SavedKeyFile = "savedKey12038"..Players.LocalPlayer.UserId..".txt",
    RogefieldUrl = "https://raw.githubusercontent.com/diepedyt/bui/refs/heads/main/Rogefield.lua",
}

local kinds = {
    Button = true, Section = true, Label = true, BigLabel = true, Space = true,
    Paragraph = true, SavingInput = true, Input = true, Dropdown = true,
    MultiDropdown = true, Keybind = true, Toggle = true, Colorpicker = true, Slider = true,
}
local function text(value, name, optional)
    if optional and value == nil then return nil end
    assert(type(value) == "string" and #value <= 8192, "Invalid visual "..name)
    return value
end
local function number(value, name, low, high)
    assert(type(value) == "number" and value == value and value >= low and value <= high, "Invalid visual "..name)
    return value
end
local function array(value, name, limit)
    assert(type(value) == "table", "Invalid visual "..name)
    local count = 0
    for key in pairs(value) do
        assert(type(key) == "number" and key % 1 == 0 and key >= 1 and key <= #value, "Invalid visual "..name.." array")
        count += 1
    end
    assert(count == #value and count <= limit, "Visual "..name.." is too large or sparse")
    return value
end

function module:ValidatePackage(package)
    assert(type(package) == "table" and package.SchemaVersion == 1, "Unsupported visual package schema")
    assert(type(package.Window) == "table", "Visual package has no window")
    local window = package.Window
    local result = {SchemaVersion = 1, Window = {}, Tabs = {}}
    for _, key in ipairs({"Name", "LoadingTitle", "LoadingSubtitle", "PreloadImage", "Theme", "AssetId"}) do
        result.Window[key] = text(window[key], key, key ~= "Name")
    end
    local ids, names, total = {}, {}, 0
    for _, tab in ipairs(array(package.Tabs, "tabs", 100)) do
        assert(type(tab) == "table", "Invalid visual tab")
        local record = {Id = text(tab.Id, "tab id"), Name = text(tab.Name, "tab name"), Elements = {}}
        assert(not ids[record.Id] and not names[record.Name], "Duplicate visual tab")
        ids[record.Id], names[record.Name] = true, true
        if tab.Image ~= nil then record.Image = number(tab.Image, "tab image", 0, 1e16) end
        if tab.Gradient then
            assert(#array(tab.Gradient, "gradient", 2) == 2, "Visual gradient needs two colors")
            record.Gradient = {}
            for _, color in ipairs(tab.Gradient) do
                assert(#array(color, "color", 3) == 3, "Invalid visual RGB color")
                table.insert(record.Gradient, {number(color[1], "red", 0, 255), number(color[2], "green", 0, 255), number(color[3], "blue", 0, 255)})
            end
        end
        for _, element in ipairs(array(tab.Elements, "elements", 4096)) do
            total += 1
            assert(total <= 4096 and type(element) == "table" and kinds[element.Kind], "Unsupported or excessive visual elements")
            local row = {Kind = element.Kind, Id = text(element.Id, "element id"), Name = text(element.Name, "element name")}
            assert(not ids[row.Id], "Duplicate visual element id")
            ids[row.Id] = true
            for _, key in ipairs({"Flag", "Info", "Interact", "PlaceholderText", "Suffix", "Content"}) do
                row[key] = text(element[key], key, true)
            end
            for _, key in ipairs({"Size", "Increment", "CharacterLimit"}) do
                if element[key] ~= nil then row[key] = number(element[key], key, 0, 1e6) end
            end
            if element.NumbersOnly == true then row.NumbersOnly = true end
            if element.PremiumTag == true then row.PremiumTag = true end
            if row.Kind == "Dropdown" or row.Kind == "MultiDropdown" then
                row.Options = {}
                for _, option in ipairs(array(element.Options, "options", 4096)) do table.insert(row.Options, text(option, "option")) end
                if element.Actions then
                    row.Actions = {}
                    for _, action in ipairs(array(element.Actions, "actions", 2)) do
                        assert(action == "Select All" or action == "Reset List", "Unsupported visual dropdown action")
                        table.insert(row.Actions, action)
                    end
                end
            end
            if row.Kind == "Slider" then
                assert(#array(element.Range, "range", 2) == 2, "Slider needs a range")
                row.Range = {number(element.Range[1], "minimum", -1e12, 1e12), number(element.Range[2], "maximum", -1e12, 1e12)}
                assert(row.Range[2] > row.Range[1] and (row.Increment or 1) > 0, "Invalid slider range or increment")
            end
            table.insert(record.Elements, row)
        end
        table.insert(result.Tabs, record)
    end
    return result
end

function module:SelectPackage(package, selection)
    package = self:ValidatePackage(package)
    if not selection then return package end
    assert(type(selection) == "table", "Selection must be a table")
    local chosenTabs, chosenRows = {}, {}
    if selection.Tabs then
        for _, selector in ipairs(array(selection.Tabs, "tab selectors", 100)) do
            local found
            for _, tab in ipairs(package.Tabs) do
                if tab.Id == selector or tab.Name == selector then
                    assert(not found, "Ambiguous visual tab selector: "..tostring(selector))
                    found = tab
                end
            end
            assert(found, "Visual tab not found: "..tostring(selector))
            chosenTabs[found.Id] = true
        end
    else
        for _, tab in ipairs(package.Tabs) do chosenTabs[tab.Id] = true end
    end
    if selection.Controls then
        for _, selector in ipairs(array(selection.Controls, "control selectors", 4096)) do
            text(selector, "selector")
            local found
            for _, tab in ipairs(package.Tabs) do
                if not chosenTabs[tab.Id] then continue end
                for _, row in ipairs(tab.Elements) do
                    if row.Id == selector or row.Flag == selector or row.Name == selector then
                        assert(not found, "Ambiguous visual control selector: "..selector.."; use its Id")
                        found = row
                    end
                end
            end
            assert(found, "Visual control not found: "..selector)
            chosenRows[found.Id] = true
        end
    end
    local result = {SchemaVersion = package.SchemaVersion, Window = package.Window, Tabs = {}}
    for _, tab in ipairs(package.Tabs) do
        if not chosenTabs[tab.Id] then continue end
        local rows, heading, insertedHeading = {}, nil, nil
        for _, row in ipairs(tab.Elements) do
            if not selection.Controls then table.insert(rows, row) continue end
            if row.Kind == "Section" then heading = row end
            if not chosenRows[row.Id] then continue end
            if heading and insertedHeading ~= heading and heading ~= row then table.insert(rows, heading) end
            table.insert(rows, row)
            insertedHeading = heading
        end
        if not selection.Controls or #rows > 0 then
            local selected = table.clone(tab)
            selected.Elements = rows
            table.insert(result.Tabs, selected)
        end
    end
    assert(#result.Tabs > 0, "Visual selection contains no tabs or controls")
    return result
end

function module:SetSavedKeyFile(fileName)
    assert(type(fileName) == "string" and fileName ~= "", "Saved key file needs a name")
    self.SavedKeyFile = fileName..".txt"
end

function module:GetSavedKey()
    if type(isfile) ~= "function" or type(readfile) ~= "function" then return nil end
    local ok, value = pcall(function()
        if isfile(self.SavedKeyFile) then return readfile(self.SavedKeyFile) end
    end)
    return ok and type(value) == "string" and value or nil
end

function module:SaveKey(key)
    if type(writefile) ~= "function" then return false end
    return pcall(writefile, self.SavedKeyFile, key)
end

function module:DestroyUI()
    local request = self.active
    if not request then return end
    request.alive = false
    for _, connection in ipairs(request.connections) do connection:Disconnect() end
    request.connections = {}
    if request.library then pcall(function() request.library:Destroy() end) end
    if request.gui then pcall(function() request.gui:Destroy() end) end
end

local function assetId(catalogId)
    assert(catalogId:match("^rbxassetid://%d+$"), "Visual package needs a portable catalog asset id")
    if type(getcustomasset) ~= "function" or type(writefile) ~= "function" or type(isfile) ~= "function" then return catalogId end
    local id = catalogId:match("%d+")
    local ok, result = pcall(function()
        local file = id..".rbxm"
        if not isfile(file) then
            local body = game:HttpGet("https://raw.githubusercontent.com/diepedyt/RBXM_UIS/refs/heads/main/"..file)
            assert(type(body) == "string" and #body > 1000, "Invalid Rogefield asset response")
            writefile(file, body)
        end
        local uri = getcustomasset(file)
        assert(type(uri) == "string" and uri ~= "", "Could not register Rogefield asset")
        return uri
    end)
    return ok and result or catalogId
end

local function noop() end
function module:RenderPackage(library, package, initialTab)
    local settings = table.clone(package.Window)
    settings.ConfigurationSaving = {Enabled = false}
    local window = library:CreateWindow(settings)
    for _, tabData in ipairs(package.Tabs) do
        local gradient
        if tabData.Gradient then
            gradient = {}
            for _, rgb in ipairs(tabData.Gradient) do table.insert(gradient, Color3.fromRGB(rgb[1], rgb[2], rgb[3])) end
        end
        local tab = window:CreateTab(tabData.Name, tabData.Image, gradient)
        for _, row in ipairs(tabData.Elements) do
            local data = table.clone(row)
            data.Callback, data.Flag = noop, nil
            if row.Kind == "Section" then tab:CreateSection(row.Name)
            elseif row.Kind == "Label" then tab:CreateLabel(row.Name, row.PremiumTag)
            elseif row.Kind == "BigLabel" then tab:CreateBigLabel(row.Name, row.Size, row.PremiumTag)
            elseif row.Kind == "Space" then tab:CreateSpace(row.Size)
            elseif row.Kind == "Paragraph" then tab:CreateParagraph({Title = row.Name, Content = row.Content or ""})
            else
                if row.Kind == "Toggle" then data.CurrentValue = false end
                if row.Kind == "Dropdown" or row.Kind == "MultiDropdown" then
                    data.CurrentOption = "None"
                    if row.Actions then
                        data.SpecialCallbacks = {}
                        for _, action in ipairs(row.Actions) do data.SpecialCallbacks[action] = noop end
                    end
                end
                if row.Kind == "SavingInput" or row.Kind == "Input" then
                    data.CurrentValue, data.DefaultValue = "", ""
                    data.PlaceholderText = row.PlaceholderText or ""
                end
                if row.Kind == "Keybind" then data.CurrentKeybind, data.HoldToInteract = "Unknown", false end
                if row.Kind == "Colorpicker" then data.CurrentColor = Color3.fromRGB(160, 160, 160) end
                if row.Kind == "Slider" then data.CurrentValue, data.Increment, data.Suffix = row.Range[1], row.Increment or 1, row.Suffix or "" end
                tab["Create"..row.Kind](tab, data)
            end
        end
    end
    if initialTab then window:SelectPreviewTab(initialTab) end
    return window
end

function module:GetKeyInput(discordLink, keyLink, verifyKey, preview)
    assert(not self.active or not self.active.alive, "A key request is already active")
    assert(verifyKey == nil or type(verifyKey) == "function", "Key verifier must be a function")
    text(discordLink, "Discord invite")
    text(keyLink, "key instructions URL", true)
    local saved = self:GetSavedKey()
    if saved and verifyKey then
        saved = saved:gsub("%s+", "")
        local ok, accepted = pcall(verifyKey, saved)
        if ok and accepted then return saved end
    end
    local options = type(preview) == "string" and {PackageUrl = preview} or preview or {}
    assert(type(options) == "table", "Preview must be a package URL or options table")
    local request = {alive = true, connections = {}, checking = false}
    self.active = request
    local success, result = pcall(function()
        local package = options.Package
        if options.PackageUrl then
            assert(not package, "Specify Package or PackageUrl, not both")
            local body = game:HttpGet(text(options.PackageUrl, "package URL"))
            assert(type(body) == "string" and #body <= 2e6, "Invalid or excessive visual package response")
            package = HttpService:JSONDecode(body)
        end
        package = package or {SchemaVersion = 1, Window = {Name = "Banana Hub", LoadingTitle = "Banana Hub", LoadingSubtitle = "by Banana Hub - roge4087", Theme = "Yellow2"}, Tabs = {}}
        package = self:SelectPackage(package, options.Selection)
        if options.InitialTab then
            local found = false
            for _, tab in ipairs(package.Tabs) do if tab.Name == options.InitialTab then found = true end end
            assert(found, "InitialTab is not present in the selected preview")
        end
        local source = game:HttpGet(options.RogefieldUrl or self.RogefieldUrl)
        assert(type(source) == "string" and source:find("RayfieldLibrary.KeyPreviewVersion = 1", 1, true), "Publish the KeyPreview-compatible Rogefield.lua first")
        local chunk, compileError = loadstring(source)
        assert(chunk, compileError)
        local resolvedAsset = assetId(package.Window.AssetId or "rbxassetid://84518421079373")
        assert(request.alive, "Key request cancelled")
        request.library = chunk({Mode = "KeyPreview", Theme = package.Window.Theme or "Yellow2", AssetId = resolvedAsset, OnCreated = function(gui)
            request.gui = gui
            if not request.alive then gui:Destroy() error("Key request cancelled") end
        end})
        assert(request.library.KeyPreviewVersion == 1, "Unsupported Rogefield KeyPreview API")
        local window = self:RenderPackage(request.library, package, options.InitialTab)
        task.wait(2)
        assert(request.alive, "Key request cancelled")
        request.library:Notify({Title = "Configuration Not Loaded", Content = "Pass The Key System", Duration = 6})
        local prompt = window:ShowKeyPrompt({KeyLink = keyLink})
        local function submit()
            if not request.alive or request.checking or request.key then return end
            local key = prompt.Input.Text:gsub("%s+", "")
            if key == "" then prompt:SetStatus("Enter a key first.", false) return end
            request.checking = true
            prompt:SetStatus("Checking your key...", true)
            local ok, accepted = true, true
            if verifyKey then ok, accepted = pcall(verifyKey, key) end
            if not request.alive then return end
            request.checking = false
            if not ok then prompt:SetStatus("Key verification failed. Please try again.", false) return end
            if not accepted then prompt:SetStatus("Invalid key. Join Discord to get the current key.", false) return end
            request.key = key
        end
        local function copyLink(link, message)
            if not request.alive or request.checking then return end
            if type(setclipboard) == "function" and pcall(setclipboard, link) then
                prompt:SetStatus(message, false)
            else
                prompt.Input.Text = link
                prompt:SetStatus("Clipboard unavailable. Select and copy the link above, then enter your key.", false)
            end
        end
        table.insert(request.connections, prompt.Enter.Activated:Connect(submit))
        table.insert(request.connections, prompt.Input.FocusLost:Connect(function(enter) if enter then submit() end end))
        table.insert(request.connections, prompt.Discord.Activated:Connect(function() copyLink(discordLink, "Discord invite copied: "..discordLink) end))
        table.insert(request.connections, prompt.Help.Activated:Connect(function() copyLink(keyLink, "Key instructions link copied.") end))
        while request.alive and not request.key do task.wait(0.05) end
        assert(request.alive and request.key, "Key request cancelled")
        self:SaveKey(request.key)
        prompt:Close()
        return request.key
    end)
    if self.active == request then
        self:DestroyUI()
        self.active = nil
    else
        if request.library then pcall(function() request.library:Destroy() end) end
        if request.gui then pcall(function() request.gui:Destroy() end) end
    end
    if not success then error("Rogefield key system: "..tostring(result), 2) end
    return result
end

return module
