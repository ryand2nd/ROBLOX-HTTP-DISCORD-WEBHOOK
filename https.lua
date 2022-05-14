local https = game:GetService("HttpService")
local WebHook = "" -- WebHook URL

function sendMessage(player)

   -- Message when player join the Studio
	local dataStudio = {
		["embeds"] = {{
			["author"] = {
				["name"] = "Roblox Studio",
				["icon_url"] = "https://cdn.discordapp.com/attachments/972108355432763482/972113780597215292/ROBLOX_Studio_icon.png"
			};
			["description"] = "**"..player.Name.." running Roblox Studio**";
		}}
	}
	
  -- Message when player join the Game
	local dataServer = {
		["embeds"] = {{
			["author"] = {
				["name"] = "Roblox Studio",
				["icon_url"] = "https://cdn.discordapp.com/attachments/972108355432763482/972113780597215292/ROBLOX_Studio_icon.png"
			};
			["description"] = "**"..player.Name.." joined the Game**";
		}}
	}
	
  
	local newData = https:JSONEncode(dataStudio, dataServer) -- Checking JSON
	https:PostAsync(WebHook, newData) -- Start sending message
end

game.Players.PlayerAdded:Connect(sendMessage) -- Detect when player Joined
