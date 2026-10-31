repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local cGameId = game.GameId
local statusBase = "https://raw.githubusercontent.com/diepedyt/BHUB_STATUS/refs/heads/main/"

local requestFn = request or http_request or (syn and syn.request) or (http and http.request)

local function readTable(source, name)
    if type(source) ~= "string" or source == "" then return nil end
    local chunk = loadstring(source, "@" .. name)
    if not chunk then return nil end
    local ok, result = pcall(chunk)
    if ok and type(result) == "table" then return result end
end

local function fetchNoCache(raw)
    if type(requestFn) == "function" then
        local completed, succeeded, response = false, false, nil
        local deadline = os.clock() + 10
        local worker = task.spawn(function()
            succeeded, response = pcall(requestFn, {
                Url = raw .. (raw:find("?", 1, true) and "&" or "?")
                    .. "_bhub=" .. HttpService:GenerateGUID(false),
                Method = "GET",
                Headers = {
                    ["Cache-Control"] = "no-cache, no-store, max-age=0",
                    ["Pragma"] = "no-cache",
                },
                Timeout = 10,
            })
            completed = true
        end)

        while not completed and os.clock() < deadline do
            task.wait(0.05)
        end

        if not completed then
            -- Some executors cannot cancel a pending native HTTP call.
            -- That worker only collects a response; it never runs downloaded code.
            pcall(task.cancel, worker)
        elseif succeeded and type(response) == "table"
            and tonumber(response.StatusCode) == 200 and response.Success ~= false then
            local value = readTable(response.Body, raw)
            if value then return value end
        end
    end

    -- Original URL, without the cache-busting query. This fallback uses the
    -- executor's usual HttpGet cache and timeout behavior.
    local ok, source = pcall(function() return game:HttpGet(raw) end)
    local value = ok and readTable(source, raw)
    if value then return value end
    error("BHUB: Failed to load " .. raw, 0)
end

local FFA = fetchNoCache(statusBase .. "FFA.lua")
local GAMEID_SCRIPT = fetchNoCache(statusBase .. "GAMEID_SCRIPT.lua")
local SCRIPT_TO_LOADER = fetchNoCache(statusBase .. "SCRIPT_TO_LOADER.lua")
local SCRIPT_TO_PROJECTID = fetchNoCache(statusBase .. "SCRIPT_TO_PROJECTID.lua")
local SCRIPT_TO_SCRIPTID = fetchNoCache(statusBase .. "SCRIPT_TO_SCRIPTID.lua")

local scriptName = GAMEID_SCRIPT[cGameId]
if type(scriptName) ~= "string" or scriptName == "" then
    player:Kick("BHUB: GAME NOT SUPPORTED")
    return
end

local scriptId = SCRIPT_TO_SCRIPTID[scriptName]
local projectId = SCRIPT_TO_PROJECTID[scriptName]
local loader = SCRIPT_TO_LOADER[scriptName]
local function isId(value)
    return type(value) == "string" and #value == 32 and value:match("^[a-f0-9]+$") ~= nil
end

if not isId(scriptId) or not isId(projectId) or type(loader) ~= "string" then
    player:Kick("BHUB: SCRIPT CONFIGURATION MISSING")
    return
end

if loader:match("^https://api%.luarmor%.net/files/v[34]/loaders/([a-f0-9]+)%.lua$") ~= scriptId then
    player:Kick("BHUB: SCRIPT CONFIGURATION MISMATCH")
    return
end

task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/BHUB_UPDATE/refs/heads/main/NOTIFY_MISSED.lua"))()
end)

local BHUB_NOTIFY = loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/BHUB/refs/heads/main/BHUBNOTIFICATION.lua"))()

local _script_key = nil
pcall(function()
    local env = getfenv(1)
    local tSK = (env and env.script_key)
    if tSK then
        _script_key = tSK
        BHUB_NOTIFY({
            Title = "Key Loaded",
            Content = "Key Loaded Succesfully"
        })
    end
end)
script_key = _script_key

-- Free trial: one POST with an empty body. The server decides everything (who, how
-- long, limits). Returns {key, minutes} or nil; any error or timeout is just nil.
local function requestTrial()
    if type(requestFn) ~= "function" then return nil end
    local result, done = nil, false
    local ok, worker = pcall(task.spawn, function()
        local sent, response = pcall(requestFn, {
            Url = "https://57.129.160.111/v2/trial",
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = "{}",
            Timeout = 8,
        })
        if sent and type(response) == "table" and tonumber(response.StatusCode) == 200 then
            local decoded, data = pcall(HttpService.JSONDecode, HttpService, response.Body)
            if decoded and type(data) == "table" and type(data.key) == "string" and #data.key == 32 then
                result = data
            end
        end
        done = true
    end)
    if not ok then return nil end
    local deadline = os.clock() + 8
    while not done and os.clock() < deadline do
        task.wait(0.05)
    end
    if not done then pcall(task.cancel, worker) end
    return result
end

if FFA[scriptName] ~= true and not script_key then
    local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
    local module = loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/BHUB/refs/heads/main/BHUBKEYSYS.lua"))()
    api.script_id = scriptId
    module:SetSavedKeyFile("BananaHub" .. scriptId .. tostring(player.UserId))

    -- true: KEY_VALID. false: no usable key (none, KEY_EXPIRED, KEY_INVALID, KEY_INCORRECT).
    -- nil: unknown (SDK error, HWID lock, ban, time/security/executor error, anything else).
    local checked = {}
    local function checkKey(key)
        key = type(key) == "string" and key:gsub("%s+", "") or ""
        if key == "" then return false end
        checked[key] = true
        local ok, status = pcall(api.check_key, key)
        local code = ok and type(status) == "table" and status.code
        if code == "KEY_VALID" then return true end
        if code == "KEY_EXPIRED" or code == "KEY_INVALID" or code == "KEY_INCORRECT" then return false end
        return nil
    end

    local function keyWorks(key)
        return checkKey(key) == true
    end

    -- Keys work in every BHUB script, but each script saves its own key file. Checks up to 5
    -- other keys this player saved (other scripts, older names, the key UI's default file).
    -- Returns the first valid key, or nil and whether any check was inconclusive.
    local function findOtherSavedKey()
        if type(listfiles) ~= "function" or type(isfile) ~= "function" or type(readfile) ~= "function" then
            return nil, false
        end
        local listed, files = pcall(listfiles, "")
        if not listed or type(files) ~= "table" then return nil, false end
        local userId = tostring(player.UserId)
        local ownFile, defaultFile = "BananaHub" .. scriptId .. userId .. ".txt", "savedKey12038" .. userId .. ".txt"
        local pattern = "^BananaHub%w+" .. userId .. "%.txt$"
        local checks, unsure = 0, false
        for _, path in ipairs(files) do
            local name = type(path) == "string" and path:match("[^/\\]+$")
            if name and name ~= ownFile and (name == defaultFile or name:match(pattern)) then
                local read, key = pcall(function() return isfile(name) and readfile(name) end)
                key = read and type(key) == "string" and key:gsub("%s+", "") or ""
                if key ~= "" and not checked[key] then
                    local works = checkKey(key)
                    if works then return key end
                    unsure = unsure or works == nil
                    checks = checks + 1
                    if checks == 5 then break end
                end
            end
        end
        return nil, unsure
    end

    -- Only players who definitely have no usable key ask for a trial: nothing saved, or every
    -- saved key checked is expired, invalid or incorrect. Anything else (SDK error, HWID lock,
    -- ban, ...) runs the normal key system, so nobody with a real key is switched onto a
    -- short trial key. Luarmor checks the trial key too.
    local savedKey = module:GetSavedKey()
    local works = checkKey(savedKey)
    local unsure = works == nil
    if works == false then
        local otherKey
        otherKey, unsure = findOtherSavedKey()
        if otherKey then
            savedKey, works = otherKey, true
            pcall(module.SaveKey, module, otherKey)
        end
    end
    if works then
        script_key = savedKey
        BHUB_NOTIFY({
            Title = "Key Loaded",
            Content = "Key Loaded Succesfully"
        })
    elseif not unsure then
        local trial = requestTrial()
        if trial and keyWorks(trial.key) then
            script_key = trial.key
            BHUB_NOTIFY({
                Title = "Free Trial",
                Content = "You got " .. tostring(trial.minutes) .. " free minutes! Get a key to keep using the script."
            })
        end
    end

    if not script_key then
        BHUB_NOTIFY({
            Title = "Key System",
            Content = "Enter A Key To Continue"
        })

        script_key = module:GetKeyInput(
            "discord.gg/BananaHub",
            "https://raw.githubusercontent.com/diepedyt/bui/refs/heads/main/HowToFreeKey.txt",
            function(key)
                if type(key) ~= "string" then return false end
                key = key:gsub("%s+", "")
                local ok, status = pcall(api.check_key, key)
                local keyIsValid = (ok and type(status) == "table" and status.code == "KEY_VALID")
                if not keyIsValid then
                    BHUB_NOTIFY({
                        Title = "Key Error",
                        Content = "The Entered Key Is Incorrect",
                        Theme = {SliderProgress = Color3.fromRGB(255, 10, 10)}
                    })
                end
                return keyIsValid
            end
        )

        BHUB_NOTIFY({
            Title = "Key Loaded",
            Content = "Key Loaded Succesfully"
        })

        if type(script_key) ~= "string" or script_key == "" then
            player:Kick("BHUB: KEY REQUIRED")
            return
        end
    end
end

loadstring(game:HttpGet(loader))()
