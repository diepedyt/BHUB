local module = loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/refs/heads/main/BananaHubKeyLoaderV2.lua"))()
module:SetSavedKeyFile("BananaHub"..game.gameId..game.Players.LocalPlayer.UserId)
script_key = module:GetKeyInput("discord.gg/BananaHub", "https://raw.githubusercontent.com/diepedyt/bui/refs/heads/main/HowToFreeKey.txt", function(key)
	key = key:gsub(" ", "")
	key = key:lower()
	return key == "banana"
end)
loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/f851a47b38e9ab3340681452d8b3e133.lua"))()

