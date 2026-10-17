repeat task.wait() until game:IsLoaded()

local RS = game:GetService("ReplicatedStorage")
local TS = game:GetService("TweenService")

if not isfile or not readfile or not writefile or not setclipboard then
	isfile = function() return end
	readfile = function() return end
	writefile = function() return end
	setclipboard = function() return end
end

local module = {}

module.SavedKeyFile = "savedKey12038"..game.Players.LocalPlayer.UserId..".txt"
module.UI_PACKAGE = game:GetObjects("rbxassetid://139906473639831")[1]

function module:DestroyUI()
	local ui = self.ui
	if ui then
		ui:Destroy()
	end
end

function module:GetUI()
	local ui = self.ui
	if not ui then
		self.ui = self.UI_PACKAGE:Clone()
		ui = self.ui
	end
	
	local ui_data = {
		ui = ui,
		MainBG = ui.BG.Main,
		KeyUI = ui.BG.Main.KeyUI,
		Loader = ui.BG.Main.Loader,
		Buttons = {
			Enter = ui.BG.Main.KeyUI.Enter,
			GetKey = ui.BG.Main.KeyUI.GetKey,
			BuyPermKey = ui.BG.Main.KeyUI.BuyPermKey
		},
		AutoKey = {
			Frame = ui.BG.Main.KeyUI.AutoKey,
			Text = ui.BG.Main.KeyUI.AutoKey.AutoKey
		},
		KeyBox = {
			TextBox = ui.BG.Main.KeyUI.KeyBox
		}
	}
	
	return ui_data
end

function module:ProtectUI()
    local ui = self:GetUI().ui
    if gethui then
        ui.Parent = gethui()
    elseif syn and syn.protect_gui then 
        syn.protect_gui(ui)
        ui.Parent = CoreGui
    elseif CoreGui:FindFirstChild("RobloxGui") then
        ui.Parent = CoreGui:FindFirstChild("RobloxGui")
    else
        ui.Parent = CoreGui
    end
end

function module:StyleUI()
	local ui = self:GetUI()
	-- The key gate opens before RideAPet selects Rogefield's Yellow2 theme.
	local theme = {
		Background = Color3.fromRGB(20, 20, 20),
		Topbar = Color3.fromRGB(80, 78, 35),
		TextColor = Color3.fromRGB(235, 235, 235),
		ElementBackground = Color3.fromRGB(30, 30, 30),
		ElementBackgroundHover = Color3.fromRGB(45, 45, 45),
		ElementStroke = Color3.fromRGB(55, 55, 55),
		InputBackground = Color3.fromRGB(28, 28, 28),
		InputStroke = Color3.fromRGB(60, 60, 60),
		PlaceholderColor = Color3.fromRGB(200, 200, 150),
		Accent = Color3.fromRGB(255, 225, 90),
		AccentHover = Color3.fromRGB(255, 240, 120)
	}

	local function round(inst, radius)
		local c = inst:FindFirstChildOfClass("UICorner") or Instance.new("UICorner")
		c.CornerRadius = UDim.new(0, radius)
		c.Parent = inst
	end

	local function stroke(inst, color)
		local s = inst:FindFirstChildOfClass("UIStroke") or Instance.new("UIStroke")
		s.Color = color
		s.Thickness = 1
		s.Transparency = 0
		s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		s.Parent = inst
		return s
	end

	local function setFont(inst, size, font)
		inst.Font = font
		inst.TextSize = size
		inst.TextScaled = false
		inst.TextColor3 = theme.TextColor
		inst.TextTransparency = 0
		inst.TextStrokeTransparency = 1
	end

	local function addHover(btn, color, hoverColor)
		btn.AutoButtonColor = false
		table.insert(self.cons, btn.MouseEnter:Connect(function()
			TS:Create(btn, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundColor3 = hoverColor}):Play()
		end))
		table.insert(self.cons, btn.MouseLeave:Connect(function()
			TS:Create(btn, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundColor3 = color}):Play()
		end))
	end

	local main = ui.MainBG
	local aspect = main:FindFirstChildOfClass("UIAspectRatioConstraint")
	if aspect then aspect:Destroy() end
	main.AnchorPoint = Vector2.new(0.5, 0.5)
	main.Position = UDim2.fromScale(0.5, 0.5)
	main.BackgroundColor3 = theme.Background
	main.BorderSizePixel = 0
	round(main, 12)
	stroke(main, theme.ElementStroke)

	local scale = main:FindFirstChildOfClass("UIScale") or Instance.new("UIScale")
	scale.Parent = main
	local function resize()
		local available = main.Parent.AbsoluteSize
		local deviceScale = math.max(1, math.min(available.X / 1366, available.Y / 768))
		local width = math.clamp(available.X - 32, 320, 460)
		main.Size = UDim2.fromOffset(width, 378)
		scale.Scale = math.max(0.01, math.min(deviceScale, (available.X - 32) / width, (available.Y - 32) / 378))
	end
	table.insert(self.cons, main.Parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(resize))
	resize()

	ui.KeyUI.AnchorPoint = Vector2.zero
	ui.KeyUI.Position = UDim2.fromScale(0, 0)
	ui.KeyUI.Size = UDim2.fromScale(1, 1)
	ui.KeyUI.BackgroundTransparency = 1
	ui.KeyUI.BorderSizePixel = 0

	local title = ui.KeyUI.Title
	setFont(title, 22, Enum.Font.GothamBold)
	title.Text = "Banana Hub"
	title.TextWrapped = false
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.BackgroundTransparency = 1
	title.AnchorPoint = Vector2.zero
	title.Position = UDim2.fromOffset(20, 20)
	title.Size = UDim2.new(1, -150, 0, 28)

	for _, data in ipairs({
		{"Subtitle", "Enter your key to continue.", UDim2.fromOffset(20, 54), UDim2.new(1, -40, 0, 20), 14},
		{"KeyLabel", "YOUR KEY", UDim2.fromOffset(20, 108), UDim2.new(1, -40, 0, 16), 13},
		{"KeyBadge", "KEY SYSTEM", UDim2.new(1, -114, 0, 22), UDim2.fromOffset(94, 24), 13}
	}) do
		local label = ui.KeyUI:FindFirstChild(data[1]) or Instance.new("TextLabel")
		label.Name = data[1]
		label.Text = data[2]
		label.Position = data[3]
		label.Size = data[4]
		label.BackgroundTransparency = 1
		label.BorderSizePixel = 0
		label.TextXAlignment = Enum.TextXAlignment.Left
		setFont(label, data[5], Enum.Font.GothamMedium)
		label.TextTransparency = 0.2
		if data[1] == "KeyBadge" then
			label.BackgroundTransparency = 0
			label.BackgroundColor3 = theme.Topbar
			label.TextColor3 = theme.AccentHover
			label.TextTransparency = 0
			label.TextXAlignment = Enum.TextXAlignment.Center
			round(label, 6)
		end
		label.Parent = ui.KeyUI
	end

	local divider = ui.KeyUI:FindFirstChild("Divider") or Instance.new("Frame")
	divider.Name = "Divider"
	divider.Position = UDim2.fromOffset(20, 91)
	divider.Size = UDim2.new(1, -40, 0, 1)
	divider.BackgroundColor3 = theme.ElementStroke
	divider.BorderSizePixel = 0
	divider.Parent = ui.KeyUI

	local keyBox = ui.KeyBox.TextBox
	setFont(keyBox, 15, Enum.Font.GothamMedium)
	keyBox.AnchorPoint = Vector2.zero
	keyBox.Position = UDim2.fromOffset(20, 132)
	keyBox.Size = UDim2.new(1, -40, 0, 44)
	keyBox.BackgroundColor3 = theme.InputBackground
	keyBox.BackgroundTransparency = 0
	keyBox.BorderSizePixel = 0
	keyBox.TextXAlignment = Enum.TextXAlignment.Left
	keyBox.TextWrapped = false
	keyBox.PlaceholderText = "Enter your key"
	keyBox.PlaceholderColor3 = theme.PlaceholderColor
	round(keyBox, 6)
	local inputStroke = stroke(keyBox, theme.InputStroke)
	local padding = keyBox:FindFirstChildOfClass("UIPadding") or Instance.new("UIPadding")
	padding.PaddingLeft = UDim.new(0, 12)
	padding.PaddingRight = UDim.new(0, 12)
	padding.Parent = keyBox
	table.insert(self.cons, keyBox.Focused:Connect(function()
		TS:Create(inputStroke, TweenInfo.new(0.15), {Color = theme.Accent}):Play()
	end))
	table.insert(self.cons, keyBox.FocusLost:Connect(function()
		TS:Create(inputStroke, TweenInfo.new(0.15), {Color = theme.InputStroke}):Play()
	end))

	ui.AutoKey.Frame.AnchorPoint = Vector2.zero
	ui.AutoKey.Frame.Position = UDim2.fromOffset(20, 180)
	ui.AutoKey.Frame.Size = UDim2.new(1, -40, 0, 16)
	ui.AutoKey.Frame.BackgroundTransparency = 1
	setFont(ui.AutoKey.Text, 12, Enum.Font.GothamMedium)
	ui.AutoKey.Text.TextXAlignment = Enum.TextXAlignment.Left
	ui.AutoKey.Text.TextColor3 = theme.PlaceholderColor

	for i, btn in ipairs({ui.Buttons.Enter, ui.Buttons.GetKey, ui.Buttons.BuyPermKey}) do
		local primary = i == 1
		local color = primary and theme.Accent or theme.ElementBackground
		setFont(btn, primary and 15 or 14, Enum.Font.GothamBold)
		btn.AnchorPoint = Vector2.zero
		btn.Position = UDim2.fromOffset(20, ({204, 260, 310})[i])
		btn.Size = UDim2.new(1, -40, 0, ({44, 40, 48})[i])
		btn.BackgroundColor3 = color
		btn.BackgroundTransparency = 0
		btn.BorderSizePixel = 0
		btn.TextColor3 = primary and theme.Background or theme.TextColor
		btn.TextWrapped = true
		round(btn, 6)
		stroke(btn, primary and theme.Accent or theme.ElementStroke)
		local padding = btn:FindFirstChildOfClass("UIPadding") or Instance.new("UIPadding")
		padding.PaddingLeft = UDim.new(0, 12)
		padding.PaddingRight = UDim.new(0, 12)
		padding.Parent = btn
		addHover(btn, color, primary and theme.AccentHover or theme.ElementBackgroundHover)
	end

	for _, object in ipairs(ui.KeyUI:GetDescendants()) do
		if object:IsA("GuiObject") then object.ZIndex = 2 end
	end
	ui.Loader.AnchorPoint = Vector2.new(0.5, 0.5)
	ui.Loader.Position = UDim2.fromScale(0.5, 0.5)
	ui.Loader.Size = UDim2.fromScale(1, 0)
	ui.Loader.BackgroundColor3 = theme.Background
	ui.Loader.BorderSizePixel = 0
	round(ui.Loader, 12)
end

module.cons = {}
function module:ClearCons()
	local cons = self.cons
	for _, con in pairs(cons) do
		con:Disconnect()
	end
end

function module:ResetUI()
	local ui = self:GetUI()
	
	
end

function module:LoadUI()
	self:ClearCons()
	self:ResetUI()
	
	local ui = self:GetUI()
	self:ProtectUI()
	pcall(function() self:StyleUI() end)

	local t = TS:Create(ui.Loader, TweenInfo.new(.4, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, 0, 1, 0), BorderSizePixel = 0, BackgroundColor3 = Color3.fromRGB(20, 20, 20)})
	local t2 = TS:Create(ui.MainBG, TweenInfo.new(1, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0})
	t:Play()
	t2:Play()
	t.Completed:Wait()

	ui.KeyUI.Visible = true

	local t = TS:Create(ui.Loader, TweenInfo.new(.9, Enum.EasingStyle.Quart), {BackgroundTransparency = 1, BorderSizePixel = 0})
	t:Play()
	t.Completed:Wait()
	ui.Loader.Visible = false
end

function module:UnloadUI()
	local ui = self:GetUI()

	ui.Loader.Visible = true
	local t = TS:Create(ui.Loader, TweenInfo.new(.6, Enum.EasingStyle.Quart), {BackgroundTransparency = 0, BorderSizePixel = 0})
	t:Play()
	t.Completed:Wait()

	ui.KeyUI.Visible = false

	local t = TS:Create(ui.Loader, TweenInfo.new(.4, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 0, 0, 0), BorderSizePixel = 0, BackgroundColor3 = Color3.fromRGB(20, 20, 20)})
	local t2 = TS:Create(ui.MainBG, TweenInfo.new(1, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1})
	t:Play()
	t2:Play()
	t.Completed:Wait()

	self:DestroyUI()

end

function module:SaveKey(key)
	pcall(function()
		writefile(self.SavedKeyFile, key)
	end)
end

function module:GetSavedKey()
	local file_name = self.SavedKeyFile
	local file = isfile(file_name) and readfile(file_name)
	return file
end

module.KeyBoxInputChanged = nil -- tick
module.KeyEntered = nil -- boolean

function module:SetupKeyInput()
	local ui = self:GetUI()
	local c;
	self.KeyEntered = false
	c = ui.Buttons.Enter.Activated:Connect(function()
		c:Disconnect()
		self.KeyEntered = true
	end)
end

function module:SetKeyError()
	local ui = self:GetUI()
	ui.KeyBox.TextBox.Text = ""
	ui.Buttons.Enter.Text = "Key Error!"
	task.delay(0.75, function()
		ui.Buttons.Enter.Text = "Enter"
	end)
end

function module:SetupAutoKey()
	local savedKey = self:GetSavedKey()
	
	if savedKey then
		local ui = self:GetUI()
		local TextBox = ui.KeyBox.TextBox
		TextBox.Text = savedKey
		
		self.KeyBoxInputChanged = os.time() + 15
		
		local c;
		c = TextBox:GetPropertyChangedSignal("Text"):Connect(function()
			c:Disconnect()
			self.KeyBoxInputChanged = nil
		end)
		
	end
end


function module:GetFinalKey()
	local ui = self:GetUI()
	local TextBox = ui.KeyBox.TextBox
	
	local KeyBoxInput = false --self.KeyBoxInputChanged
	if KeyBoxInput then
		local timeLeft = (KeyBoxInput - os.time())
	
		ui.AutoKey.Text.Text = string.format("Auto Using Key in %ss", timeLeft)
		ui.AutoKey.Frame.Visible = true
		
		if timeLeft <= 0 then
			return TextBox.Text
		end
	else
		ui.AutoKey.Frame.Visible = false
	end
	
	if self.KeyEntered then
		return TextBox.Text:gsub("%s+", "")
	end
	
end

function module:SetUpBuyPermKey(discord_link)
	local ui = self:GetUI()
	local BuyPermKey = ui.Buttons.BuyPermKey
	local originalText = BuyPermKey.Text
	BuyPermKey.Activated:Connect(function()
		BuyPermKey.Text = string.format("Discord Copied (%s)", discord_link)
		setclipboard(discord_link)
		task.delay(2, function()
			BuyPermKey.Text = originalText
		end)
	end)
end

function module:SetUpGetKey(key_link)
	local ui = self:GetUI()
	local GetKey = ui.Buttons.GetKey
	local originalText = GetKey.Text
	GetKey.Activated:Connect(function()
		GetKey.Text = "Key Link Copied"
		setclipboard(key_link)
		task.delay(2, function()
			GetKey.Text = originalText
		end)
	end)
end

function module:GetKeyInput(discord_link, key_link, verify_key)

	local s_key = self:GetSavedKey()
	if s_key and verify_key and verify_key(s_key) then
		return s_key
	end
	
	self:LoadUI()
	
	self:SetupKeyInput()
	
	self:SetUpBuyPermKey(discord_link)
	self:SetUpGetKey(key_link)
	
	local key;
	while not key do

		key = self:GetFinalKey()
		
		if key and verify_key and not verify_key(key) then
			key = nil
			self:SetKeyError()
			self:SetupKeyInput()
		end

		if not key then
			task.wait(.1)
		end

	end

	key = tostring(key)
	key = key:gsub("%s+", "")

	self:SaveKey(key)
	self:UnloadUI()
	
	return key

end

function module:SetSavedKeyFile(file_name)
    module.SavedKeyFile = file_name..".txt"
end

return module
