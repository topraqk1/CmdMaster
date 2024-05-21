# CmdMaster

CmdMaster is a Lua script that allows you to create a customizable admin panel in Roblox using the Roblox Lua programming language. With CmdMaster, you can easily create commands and manage your game with an intuitive GUI interface.

![CmdMaster Preview](link.to.preview.image)

## Features

- Create custom commands
- Add aliases and parameters to commands
- User-friendly GUI interface
- Easily customizable

## Usage

```lua
-- Load CmdMaster
local CMaster = loadstring(game:HttpGet("https://raw.githubusercontent.com/topraqk1/CmdMaster/main/source.lua"))()

-- Create a CmdMaster instance
local CM = CMaster:Create()

-- Create a example teleport command
CM:CreateCommand({
	Name = "teleport",
	Description = "Teleports the user to the specified target.",
	Aliases = {"tp"},
	Params = {"user"},
	Callback = function(params)
		local user = params[1]
		if user then
			-- Find the target player
			local targetPlayer = game.Players:FindFirstChild(user)
			if targetPlayer then
				-- Teleport the user to the target player's character
				game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(targetPlayer.Character.PrimaryPart.CFrame)
				print("Teleported to " .. user)
			else
				print("User '" .. user .. "' not found.")
			end
		else
			print("Please specify a user to teleport to.")
		end
	end
})
```

## Contributing

Contributions to CmdMaster are welcome! If you have any ideas for improvements or new features, feel free to open an issue or submit a pull request.
