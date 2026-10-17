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

return fetchNoCache
