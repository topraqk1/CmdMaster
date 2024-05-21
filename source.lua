local CMaster = {}
local prefix = ";"

function CMaster:validate(defaults, options)
	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function CMaster:Create()
	local CM = {}
	CM.commands = {}

	function CM:CreateCommand(options)
		local defaults = {
			Name = "Default Command",
			Description = "Default Description",
			Aliases = {},
			Params = {},
			Callback = function() end
		}
		options = CMaster:validate(defaults, options)
		
		CM.commands[options.Name:lower()] = options
		for _, alias in ipairs(options.Aliases) do
			CM.commands[alias:lower()] = options
		end

		-- StarterGui.CMaster.CMasterGUI.CMaster.CMaster.Commands.Command
		local Command = Instance.new("Frame", self["b"])
		Command.BorderSizePixel = 0
		Command.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		Command.Size = UDim2.new(1, 0, 0, 58)
		Command.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Command.Name = options.Name:lower()

		-- StarterGui.CMaster.CMasterGUI.CMaster.CMaster.Commands.Command.CommandName
		local CommandName = Instance.new("TextLabel", Command)
		CommandName.TextWrapped = true
		CommandName.BorderSizePixel = 0
		CommandName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CommandName.TextSize = 29
		CommandName.FontFace = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
		CommandName.TextColor3 = Color3.fromRGB(255, 255, 255)
		CommandName.BackgroundTransparency = 1
		CommandName.Size = UDim2.new(0, 178, 0, 58)
		CommandName.BorderColor3 = Color3.fromRGB(0, 0, 0)
		CommandName.Text = options.Name
		CommandName.Name = [[CommandName]]

		-- StarterGui.CMaster.CMasterGUI.CMaster.CMaster.Commands.Command.CommandDescription
		local CommandDescription = Instance.new("TextLabel", Command)
		CommandDescription.TextWrapped = true
		CommandDescription.BorderSizePixel = 0
		CommandDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CommandDescription.TextSize = 25
		CommandDescription.FontFace = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
		CommandDescription.TextDirection = Enum.TextDirection.LeftToRight
		CommandDescription.TextColor3 = Color3.fromRGB(255, 255, 255)
		CommandDescription.BackgroundTransparency = 1
		CommandDescription.Size = UDim2.new(0, 396, 0, 58)
		CommandDescription.BorderColor3 = Color3.fromRGB(0, 0, 0)
		CommandDescription.Text = options.Description
		CommandDescription.Name = [[CommandDescription]]
		CommandDescription.Position = UDim2.new(0.34698, 0, 0, 0)

		-- StarterGui.CMaster.CMasterGUI.CMaster.CMaster.Commands.Command.Line
		local CommandLine = Instance.new("Frame", Command)
		CommandLine.BorderSizePixel = 0
		CommandLine.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
		CommandLine.Size = UDim2.new(0, 1, 0, 58)
		CommandLine.Position = UDim2.new(0.24756, 50, 0, 0)
		CommandLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
		CommandLine.Name = [[Line]]

		CM["6"].FocusLost:Connect(function()
			local commandString = CM["6"].Text:lower() -- Girdiyi küçük harfe dönüştür
			local prefixLower = prefix:lower() -- Prefix'i küçük harfe dönüştür
			if commandString:sub(1, #prefixLower) == prefixLower then
				local commandParts = commandString:sub(#prefixLower + 1):split(" ")
				local commandName = commandParts[1]
				local params = {table.unpack(commandParts, 2)}
				local command = CM.commands[commandName]
				if command then
					command.Callback(params) -- Callback fonksiyonunu parametrelerle çağır
				end
			end
		end)
	end

	-- StarterGui.CMaster.CMasterGUI
	CM["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
	CM["1"]["Name"] = [[CMaster.CMasterGUI]]
	CM["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling

	-- StarterGui.CMaster.CMasterGUI.CMaster.CMaster
	CM["2"] = Instance.new("Frame", CM["1"])
	CM["2"]["BorderSizePixel"] = 0
	CM["2"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31)
	CM["2"]["Size"] = UDim2.new(0.52911, 0, 0.60333, 0)
	CM["2"]["Position"] = UDim2.new(0.20532, 0, 0.20458, 0)
	CM["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	CM["2"]["Name"] = [[CMaster.CMaster]]

	-- StarterGui.CMaster.CMasterGUI.CMaster.CMaster.Title
	CM["3"] = Instance.new("Frame", CM["2"])
	CM["3"]["BorderSizePixel"] = 0
	CM["3"]["BackgroundColor3"] = Color3.fromRGB(44, 44, 44)
	CM["3"]["Size"] = UDim2.new(1.00016, 0, 0.14943, 0)
	CM["3"]["Position"] = UDim2.new(-0, 0, 0, 0)
	CM["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	CM["3"]["Name"] = [[Title]]

	-- StarterGui.CMaster.CMasterGUI.CMaster.CMaster.Title.UICorner
	CM["4"] = Instance.new("UICorner", CM["3"])
	CM["4"]["CornerRadius"] = UDim.new(0, 5)

	-- StarterGui.CMaster.CMasterGUI.CMaster.CMaster.Title.TitleText
	CM["5"] = Instance.new("TextLabel", CM["3"])
	CM["5"]["TextWrapped"] = true
	CM["5"]["BorderSizePixel"] = 0
	CM["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	CM["5"]["TextSize"] = 33
	CM["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	CM["5"]["TextColor3"] = Color3.fromRGB(245, 245, 245)
	CM["5"]["BackgroundTransparency"] = 1
	CM["5"]["Size"] = UDim2.new(1, 0, 1, 0)
	CM["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	CM["5"]["Text"] = [[CmdMaster]]
	CM["5"]["Name"] = [[TitleText]];
	
	--[[ StarterGui.CmdMasterGUI.CmdMaster.Title.VersionText
	CM["v1"] = Instance.new("TextLabel", CM["3"]);
	CM["v1"]["TextWrapped"] = true;
	CM["v1"]["BorderSizePixel"] = 0;
	CM["v1"]["TextScaled"] = true;
	CM["v1"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	CM["v1"]["TextSize"] = 14;
	--CM["v1"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]]--, Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	--CM["v1"]["TextColor3"] = Color3.fromRGB(255, 0, 5);
	--CM["v1"]["BackgroundTransparency"] = 1;
	--CM["v1"]["Size"] = UDim2.new(0, 52, 0, 26);
	--CM["v1"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	--CM["v1"]["Text"] = [[v1]];
	--CM["v1"]["Name"] = [[VersionText]];
	--CM["v1"]["Position"] = UDim2.new(0.61246, 0, 0.38, 0);--]]

	-- StarterGui.CMaster.CMasterGUI.CMaster.CMaster.EnterCommand
	CM["6"] = Instance.new("TextBox", CM["2"])
	CM["6"]["CursorPosition"] = -1
	CM["6"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
	CM["6"]["PlaceholderColor3"] = Color3.fromRGB(255, 255, 255)
	CM["6"]["BorderSizePixel"] = 0
	CM["6"]["TextWrapped"] = true
	CM["6"]["TextSize"] = 29
	CM["6"]["Name"] = [[EnterCommand]]
	CM["6"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 28)
	CM["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	CM["6"]["PlaceholderText"] = [[Enter Command (prefix ;)]]
	CM["6"]["Size"] = UDim2.new(1.00016, 0, 0.17241, 0)
	CM["6"]["Position"] = UDim2.new(0, 0, 0.82759, 0)
	CM["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	CM["6"]["Text"] = [[]]

	-- StarterGui.CMaster.CMasterGUI.CMaster.CMaster.shadowHolder
	CM["7"] = Instance.new("Frame", CM["2"])
	CM["7"]["ZIndex"] = 0
	CM["7"]["Size"] = UDim2.new(1, 0, 1, 0)
	CM["7"]["Name"] = [[shadowHolder]]
	CM["7"]["BackgroundTransparency"] = 1

	-- StarterGui.CMaster.CMasterGUI.CMaster.CMaster.shadowHolder.umbraShadow
	CM["8"] = Instance.new("ImageLabel", CM["7"])
	CM["8"]["ZIndex"] = 0
	CM["8"]["SliceCenter"] = Rect.new(10, 10, 118, 118)
	CM["8"]["ScaleType"] = Enum.ScaleType.Slice
	CM["8"]["ImageTransparency"] = 0.86
	CM["8"]["ImageColor3"] = Color3.fromRGB(0, 0, 0)
	CM["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
	CM["8"]["Image"] = [[rbxassetid://1316045217]]
	CM["8"]["Size"] = UDim2.new(1, 10, 1, 10)
	CM["8"]["BackgroundTransparency"] = 1
	CM["8"]["Name"] = [[umbraShadow]]
	CM["8"]["Position"] = UDim2.new(0.5, 0, 0.5, 6)

	-- StarterGui.CMaster.CMasterGUI.CMaster.CMaster.shadowHolder.penumbraShadow
	CM["9"] = Instance.new("ImageLabel", CM["7"])
	CM["9"]["ZIndex"] = 0
	CM["9"]["SliceCenter"] = Rect.new(10, 10, 118, 118)
	CM["9"]["ScaleType"] = Enum.ScaleType.Slice
	CM["9"]["ImageTransparency"] = 0.88
	CM["9"]["ImageColor3"] = Color3.fromRGB(0, 0, 0)
	CM["9"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
	CM["9"]["Image"] = [[rbxassetid://1316045217]]
	CM["9"]["Size"] = UDim2.new(1, 10, 1, 10)
	CM["9"]["BackgroundTransparency"] = 1
	CM["9"]["Name"] = [[penumbraShadow]]
	CM["9"]["Position"] = UDim2.new(0.5, 0, 0.5, 6)

	-- StarterGui.CMaster.CMasterGUI.CMaster.CMaster.shadowHolder.ambientShadow
	CM["a"] = Instance.new("ImageLabel", CM["7"])
	CM["a"]["ZIndex"] = 0
	CM["a"]["SliceCenter"] = Rect.new(10, 10, 118, 118)
	CM["a"]["ScaleType"] = Enum.ScaleType.Slice
	CM["a"]["ImageTransparency"] = 0.88
	CM["a"]["ImageColor3"] = Color3.fromRGB(0, 0, 0)
	CM["a"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
	CM["a"]["Image"] = [[rbxassetid://1316045217]]
	CM["a"]["Size"] = UDim2.new(1, 10, 1, 10)
	CM["a"]["BackgroundTransparency"] = 1
	CM["a"]["Name"] = [[ambientShadow]]
	CM["a"]["Position"] = UDim2.new(0.5, 0, 0.5, 6)

	-- StarterGui.CMaster.CMasterGUI.CMaster.CMaster.Commands
	CM["b"] = Instance.new("ScrollingFrame", CM["2"])
	CM["b"]["BorderSizePixel"] = 0
	CM["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	CM["b"]["Name"] = [[Commands]]
	CM["b"]["Selectable"] = false
	CM["b"]["Size"] = UDim2.new(0.93362, 0, 0.48851, 0)
	CM["b"]["Position"] = UDim2.new(0.03329, 0, 0.27299, 0)
	CM["b"]["BorderColor3"] = Color3.fromRGB(255, 255, 255)
	CM["b"]["ScrollBarThickness"] = 0
	CM["b"]["BackgroundTransparency"] = 1
	CM["b"]["SelectionGroup"] = false

	-- StarterGui.CMaster.CMasterGUI.CMaster.Commands.UIListLayout
	CM["10"] = Instance.new("UIListLayout", CM["b"])
	CM["10"]["Padding"] = UDim.new(0, 10)
	CM["10"]["SortOrder"] = Enum.SortOrder.LayoutOrder

	-- StarterGui.CMaster.CMasterGUI.CMaster.CmdMaster.Commands.UIStroke
	CM["11"] = Instance.new("UIStroke", CM["b"])
	CM["11"]["Color"] = Color3.fromRGB(255, 255, 255)

	-- StarterGui.CMaster.CmdMasterGUI.CMaster.CmdMaster.CommandsText
	CM["1e"] = Instance.new("TextLabel", CM["2"])
	CM["1e"]["TextWrapped"] = true
	CM["1e"]["BorderSizePixel"] = 0
	CM["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	CM["1e"]["TextSize"] = 27
	CM["1e"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	CM["1e"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
	CM["1e"]["BackgroundTransparency"] = 1.03
	CM["1e"]["Size"] = UDim2.new(0.33246, 0, 0.10345, 0)
	CM["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	CM["1e"]["Text"] = [[Commands]]
	CM["1e"]["Name"] = [[CommandsText]]
	CM["1e"]["Position"] = UDim2.new(0.35006, 0, 0.14943, 0)

	-- StarterGui.CMaster.CMasterGUI.CMaster.CMaster.UICorner
	CM["1f"] = Instance.new("UICorner", CM["2"])
	CM["1f"]["CornerRadius"] = UDim.new(0, 11)

	-- StarterGui.CMaster.CMasterGUI.CMaster.CMaster.Line
	CM["20"] = Instance.new("Frame", CM["2"])
	CM["20"]["BorderSizePixel"] = 0
	CM["20"]["BackgroundColor3"] = Color3.fromRGB(62, 62, 62)
	CM["20"]["Size"] = UDim2.new(1.00016, 0, 0.00287, 0)
	CM["20"]["Position"] = UDim2.new(0, 0, 0.14655, 0)
	CM["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	CM["20"]["Name"] = [[Line]]

	return CM
end

return CMaster
