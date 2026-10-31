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

    local function keyWorks(key)
        if type(key) ~= "string" then return false end
        local ok, status = pcall(api.check_key, (key:gsub("%s+", "")))
        return ok and type(status) == "table" and status.code == "KEY_VALID"
    end

    -- Only players without a working saved key ask for a trial, so nobody with a real
    -- key is ever switched onto a short trial key. Luarmor checks the trial key too.
    local savedKey = module:GetSavedKey()
    if keyWorks(savedKey) then
        script_key = savedKey
        BHUB_NOTIFY({
            Title = "Key Loaded",
            Content = "Key Loaded Succesfully"
        })
    else
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
