# CmdMaster

CmdMaster is a Lua script that allows you to create a customizable admin panel in Roblox using the Roblox Lua programming language. With CmdMaster, you can easily create commands and manage your game with an intuitive GUI interface.

![CmdMaster Preview](link.to.preview.image)

## Features

- Create custom commands
- Add aliases and parameters to commands
- User-friendly GUI interface
- Easily customizable

## Installation

To use CmdMaster in your Roblox game, follow these steps:

1. Download the latest release of CmdMaster from the [releases page](link.to.releases).
2. Insert the CmdMaster script into your Roblox game.
3. Customize the script to fit your needs by editing the settings and commands.
4. Enjoy managing your game with CmdMaster!

## Usage

```lua
-- Load CmdMaster module
local CMaster = require(path.to.CMaster)

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
