local HttpService = game:GetService("HttpService")
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
            pcall(task.cancel, worker)
        elseif succeeded and type(response) == "table"
            and tonumber(response.StatusCode) == 200 and response.Success ~= false then
            local value = readTable(response.Body, raw)
            if value then return value end
        end
    end

    local ok, source = pcall(function() return game:HttpGet(raw) end)
    local value = ok and readTable(source, raw)
    if value then return value end
    error("BHUB: Failed to load " .. raw, 0)
end

return fetchNoCache
