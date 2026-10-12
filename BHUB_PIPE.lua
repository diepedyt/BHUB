local defaultPipe = "https://api.luarmor.net/files/v3/loaders/180154ec7abc246752b60603a7adc12d.lua"

local pipeOverrides = {
  ["https://api.luarmor.net/files/v4/loaders/f851a47b38e9ab3340681452d8b3e133.lua"] = {10708913337, 10035204815}
}

for pipe, games in pairs(pipeOverrides) do
    if table.find(games, game.GameId) then
        defaultPipe = pipe
        break
    end
end

return loadstring(game:HttpGet(defaultPipe))()
