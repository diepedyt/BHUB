local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local Themes = {
	Default = {Background = Color3.fromRGB(25, 25, 25), TextColor = Color3.fromRGB(240, 240, 240), SliderProgress = Color3.fromRGB(43, 105, 159)},
	Light = {Background = Color3.fromRGB(255, 255, 255), TextColor = Color3.fromRGB(50, 50, 50), SliderProgress = Color3.fromRGB(31, 159, 71)},
	Yellow2 = {Background = Color3.fromRGB(20, 20, 20), TextColor = Color3.fromRGB(235, 235, 235), SliderProgress = Color3.fromRGB(255, 225, 90)},
	Yellow = {Background = Color3.fromRGB(25, 25, 25), TextColor = Color3.fromRGB(240, 240, 240), SliderProgress = Color3.fromRGB(255, 235, 80)},
	Verny = {Background = Color3.fromRGB(25, 25, 25), TextColor = Color3.fromRGB(240, 240, 240), SliderProgress = Color3.fromRGB(43, 105, 159)},
	Green = {Background = Color3.fromRGB(20, 25, 20), TextColor = Color3.fromRGB(240, 240, 240), SliderProgress = Color3.fromRGB(50, 190, 110)},
}
local SelectedTheme = Themes[_G.RayfieldTheme or _G.Theme or "Yellow"] or Themes.Yellow
local NotificationDuration = 6.5

local InterfaceParent
if gethui then
	InterfaceParent = gethui()
elseif syn and syn.protect_gui then
	InterfaceParent = game:GetService("CoreGui")
else
	InterfaceParent = Players.LocalPlayer:WaitForChild("PlayerGui")
end

local NotifyGui = Instance.new("ScreenGui")
NotifyGui.Name = "BHUBNotify"
NotifyGui.ResetOnSpawn = false
NotifyGui.DisplayOrder = 100
NotifyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
NotifyGui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
if not gethui and syn and syn.protect_gui then
	syn.protect_gui(NotifyGui)
end

local Notifications = Instance.new("Frame")
Notifications.Name = "Notifications"
Notifications.AnchorPoint = Vector2.new(1, 1)
Notifications.BackgroundTransparency = 1
Notifications.Active = false
Notifications.ClipsDescendants = false
Notifications.ZIndex = 50
Notifications.Parent = NotifyGui
local NotificationBounds = Instance.new("UISizeConstraint")
NotificationBounds.MaxSize = Vector2.new(390, 10000)
NotificationBounds.Parent = Notifications
local NotificationScale = Instance.new("UIScale")
NotificationScale.Parent = Notifications
local function updateNotificationScale()
	local RootSize = NotifyGui.AbsoluteSize
	if RootSize.X <= 0 or RootSize.Y <= 0 then return end
	-- Matches Rogefield's default half-width window at a 1920px reference viewport.
	local Scale = RootSize.X / 1920
	NotificationScale.Scale = Scale
	Notifications.Position = UDim2.new(1, -20 * Scale, 1, -20 * Scale)
	Notifications.Size = UDim2.fromOffset(math.max(0, math.min(390, RootSize.X / Scale - 40)), math.max(0, RootSize.Y / Scale - 40))
end
NotifyGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateNotificationScale)
local NotificationLayout = Instance.new("UIListLayout")
NotificationLayout.FillDirection = Enum.FillDirection.Vertical
NotificationLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
NotificationLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotificationLayout.SortOrder = Enum.SortOrder.LayoutOrder
NotificationLayout.Padding = UDim.new(0, 10)
NotificationLayout.Parent = Notifications
local NotificationOrder = 0
NotifyGui.Parent = InterfaceParent
updateNotificationScale()

local function Notify(NotificationSettings)
	task.spawn(function()
		if NotificationSettings.Content and NotificationSettings.Content:lower():match("frappe") then return end
		if NotificationSettings.Title and NotificationSettings.Title:lower():match("frappe") then return end
		if not NotifyGui.Parent then return end

		local Theme = NotificationSettings.Theme
		if type(Theme) == "string" then Theme = Themes[Theme] end
		if type(Theme) ~= "table" then Theme = SelectedTheme end
		local Background = Theme.Background or SelectedTheme.Background
		local TextColor = Theme.TextColor or SelectedTheme.TextColor
		local Accent = Theme.SliderProgress or SelectedTheme.SliderProgress
		local ActionCompleted = false
		local ActionRunning = false
		local HasActions = NotificationSettings.Actions and next(NotificationSettings.Actions) ~= nil
		local Notification = Instance.new("Frame")
		NotificationOrder = NotificationOrder + 1
		Notification.Name = NotificationSettings.Title or "Unknown Title"
		Notification.LayoutOrder = NotificationOrder
		Notification.AnchorPoint = Vector2.zero
		Notification.Position = UDim2.fromOffset(0, 0)
		Notification.Size = UDim2.new(1, 0, 0, 0)
		Notification.AutomaticSize = Enum.AutomaticSize.Y
		Notification.BackgroundTransparency = 1
		Notification.BorderSizePixel = 0
		Notification.ClipsDescendants = false
		Notification.ZIndex = 50
		Notification.Visible = true

		local Card = Instance.new("Frame")
		Card.Name = "Card"
		Card.Size = UDim2.new(1, 0, 0, 0)
		Card.Position = UDim2.fromOffset(24, 0)
		Card.AutomaticSize = Enum.AutomaticSize.Y
		Card.BackgroundColor3 = Background
		Card.BorderSizePixel = 0
		Card.ClipsDescendants = false
		Card.ZIndex = 50
		Card.Parent = Notification
		local Corner = Instance.new("UICorner")
		Corner.CornerRadius = UDim.new(0, 14)
		Corner.Parent = Card
		local Stroke = Instance.new("UIStroke")
		Stroke.Color = TextColor
		Stroke.Transparency = 0.88
		Stroke.Thickness = 1
		Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		Stroke.Parent = Card
		local Padding = Instance.new("UIPadding")
		Padding.PaddingTop = UDim.new(0, 16)
		Padding.PaddingBottom = UDim.new(0, 16)
		Padding.PaddingLeft = UDim.new(0, 16)
		Padding.PaddingRight = UDim.new(0, 16)
		Padding.Parent = Card
		local Layout = Instance.new("UIListLayout")
		Layout.SortOrder = Enum.SortOrder.LayoutOrder
		Layout.Padding = UDim.new(0, 12)
		Layout.Parent = Card

		local Header = Instance.new("Frame")
		Header.Name = "Header"
		Header.Size = UDim2.new(1, 0, 0, 40)
		Header.AutomaticSize = Enum.AutomaticSize.Y
		Header.BackgroundTransparency = 1
		Header.ZIndex = 51
		Header.LayoutOrder = 1
		Header.Parent = Card
		local Badge = Instance.new("Frame")
		Badge.Name = "Badge"
		Badge.Size = UDim2.fromOffset(40, 40)
		Badge.BackgroundColor3 = Accent
		Badge.BackgroundTransparency = 0.88
		Badge.BorderSizePixel = 0
		Badge.ZIndex = 51
		Badge.Parent = Header
		local BadgeCorner = Corner:Clone()
		BadgeCorner.CornerRadius = UDim.new(0, 11)
		BadgeCorner.Parent = Badge
		local BadgeStroke = Stroke:Clone()
		BadgeStroke.Color = Accent
		BadgeStroke.Transparency = 0.78
		BadgeStroke.Parent = Badge
		local Icon = Instance.new("ImageLabel")
		Icon.Name = "Icon"
		Icon.AnchorPoint = Vector2.new(0.5, 0.5)
		Icon.Position = UDim2.fromScale(0.5, 0.5)
		Icon.Size = UDim2.fromOffset(21, 21)
		Icon.BackgroundTransparency = 1
		local Image = NotificationSettings.Image or 3944680095
		Icon.Image = tonumber(Image) and "rbxassetid://"..tostring(Image) or tostring(Image)
		Icon.ImageColor3 = Accent
		Icon.ScaleType = Enum.ScaleType.Fit
		Icon.ZIndex = 52
		Icon.Parent = Badge

		local Copy = Instance.new("Frame")
		Copy.Name = "Copy"
		Copy.Position = UDim2.fromOffset(54, 0)
		Copy.Size = UDim2.new(1, -54, 0, 0)
		Copy.AutomaticSize = Enum.AutomaticSize.Y
		Copy.BackgroundTransparency = 1
		Copy.ZIndex = 51
		Copy.Parent = Header
		local CopyLayout = Instance.new("UIListLayout")
		CopyLayout.SortOrder = Enum.SortOrder.LayoutOrder
		CopyLayout.Padding = UDim.new(0, 5)
		CopyLayout.Parent = Copy
		local Title = Instance.new("TextLabel")
		Title.Name = "Title"
		Title.Size = UDim2.new(1, 0, 0, 0)
		Title.AutomaticSize = Enum.AutomaticSize.Y
		Title.BackgroundTransparency = 1
		Title.Text = NotificationSettings.Title or "Unknown"
		Title.Font = Enum.Font.GothamBold
		Title.TextSize = 14
		Title.TextColor3 = TextColor
		Title.TextWrapped = true
		Title.TextXAlignment = Enum.TextXAlignment.Left
		Title.TextYAlignment = Enum.TextYAlignment.Top
		Title.LayoutOrder = 1
		Title.ZIndex = 52
		Title.Parent = Copy
		local Description = Title:Clone()
		Description.Name = "Description"
		Description.Font = Enum.Font.Gotham
		Description.TextSize = 13
		Description.Text = NotificationSettings.Content or "Unknown"
		Description.TextColor3 = TextColor:Lerp(Background, 0.22)
		Description.LayoutOrder = 2
		Description.Visible = Description.Text ~= ""
		Description.Parent = Copy

		if HasActions then
			local Actions = Instance.new("Frame")
			Actions.Name = "Actions"
			Actions.Size = UDim2.new(1, 0, 0, 0)
			Actions.AutomaticSize = Enum.AutomaticSize.Y
			Actions.BackgroundTransparency = 1
			Actions.LayoutOrder = 2
			Actions.ZIndex = 51
			Actions.Parent = Card
			local ActionLayout = Layout:Clone()
			ActionLayout.Padding = UDim.new(0, 8)
			ActionLayout.Parent = Actions
			local ActionOrder = 0
			for _, Action in pairs(NotificationSettings.Actions) do
				ActionOrder = ActionOrder + 1
				local NewAction = Instance.new("TextButton")
				NewAction.Name = Action.Name
				NewAction.Size = UDim2.new(1, 0, 0, 36)
				NewAction.AutomaticSize = Enum.AutomaticSize.Y
				NewAction.BackgroundColor3 = Background:Lerp(Accent, 0.12)
				NewAction.BorderSizePixel = 0
				NewAction.AutoButtonColor = false
				NewAction.Font = Enum.Font.GothamMedium
				NewAction.TextSize = 13
				NewAction.TextColor3 = TextColor
				NewAction.Text = Action.Name
				NewAction.TextWrapped = true
				NewAction.LayoutOrder = ActionOrder
				NewAction.ZIndex = 52
				NewAction.Parent = Actions
				local ActionCorner = Corner:Clone()
				ActionCorner.CornerRadius = UDim.new(0, 8)
				ActionCorner.Parent = NewAction
				local ActionStroke = Stroke:Clone()
				ActionStroke.Color = Accent
				ActionStroke.Transparency = 0.72
				ActionStroke.Parent = NewAction
				local ActionPadding = Padding:Clone()
				ActionPadding.PaddingTop = UDim.new(0, 10)
				ActionPadding.PaddingBottom = UDim.new(0, 10)
				ActionPadding.PaddingLeft = UDim.new(0, 12)
				ActionPadding.PaddingRight = UDim.new(0, 12)
				ActionPadding.Parent = NewAction
				NewAction.MouseEnter:Connect(function()
					TweenService:Create(NewAction, TweenInfo.new(0.15), {BackgroundColor3 = Background:Lerp(Accent, 0.22)}):Play()
				end)
				NewAction.MouseLeave:Connect(function()
					TweenService:Create(NewAction, TweenInfo.new(0.15), {BackgroundColor3 = Background:Lerp(Accent, 0.12)}):Play()
				end)
				NewAction.Activated:Connect(function()
					if ActionCompleted or ActionRunning or not Notification.Parent then return end
					if not NotifyGui.Parent then return end
					ActionRunning = true
					pcall(Action.Callback)
					ActionCompleted = true
				end)
			end
		end

		local Progress = Instance.new("Frame")
		Progress.Name = "Progress"
		Progress.Size = UDim2.new(1, 0, 0, 2)
		Progress.BackgroundColor3 = Accent
		Progress.BackgroundTransparency = 0.9
		Progress.BorderSizePixel = 0
		Progress.LayoutOrder = 3
		Progress.ZIndex = 51
		Progress.Visible = not HasActions
		Progress.Parent = Card
		local ProgressCorner = Corner:Clone()
		ProgressCorner.CornerRadius = UDim.new(1, 0)
		ProgressCorner.Parent = Progress
		local Fill = Instance.new("Frame")
		Fill.Name = "Fill"
		Fill.Size = UDim2.fromScale(1, 1)
		Fill.BackgroundColor3 = Accent
		Fill.BorderSizePixel = 0
		Fill.ZIndex = 52
		Fill.Parent = Progress
		ProgressCorner:Clone().Parent = Fill
		local Gradient = Instance.new("UIGradient")
		Gradient.Color = ColorSequence.new(Accent:Lerp(TextColor, 0.3), Accent)
		Gradient.Parent = Fill

		local FadeTargets = {}
		for _, Object in ipairs(Notification:GetDescendants()) do
			local Properties = {}
			if Object:IsA("GuiObject") then
				Properties.BackgroundTransparency = Object.BackgroundTransparency
				if Object:IsA("TextLabel") or Object:IsA("TextButton") then
					Properties.TextTransparency = Object.TextTransparency
				elseif Object:IsA("ImageLabel") then
					Properties.ImageTransparency = Object.ImageTransparency
				end
			elseif Object:IsA("UIStroke") then
				Properties.Transparency = Object.Transparency
			end
			if next(Properties) then
				FadeTargets[Object] = Properties
				for Property in pairs(Properties) do Object[Property] = 1 end
			end
		end
		Notification.Parent = Notifications
		for Object, Properties in pairs(FadeTargets) do
			TweenService:Create(Object, TweenInfo.new(0.24, Enum.EasingStyle.Quint), Properties):Play()
		end
		TweenService:Create(Card, TweenInfo.new(0.32, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.fromOffset(0, 0)}):Play()
		task.wait(0.32)
		if not Notification.Parent then return end

		local Duration = math.max(0, tonumber(NotificationSettings.Duration) or NotificationDuration - 0.5)
		local Countdown
		if not HasActions then
			Countdown = TweenService:Create(Fill, TweenInfo.new(Duration, Enum.EasingStyle.Linear), {Size = UDim2.fromScale(0, 1)})
			Countdown:Play()
		end
		local Deadline = tick() + Duration
		while Notification.Parent and NotifyGui.Parent do
			if ActionCompleted or (not HasActions and tick() >= Deadline) then break end
			task.wait(0.1)
		end
		if Countdown then Countdown:Cancel() end
		if not Notification.Parent then return end
		if not NotifyGui.Parent then
			Notification:Destroy()
			return
		end

		for Object, Properties in pairs(FadeTargets) do
			local HiddenProperties = {}
			for Property in pairs(Properties) do HiddenProperties[Property] = 1 end
			TweenService:Create(Object, TweenInfo.new(0.2, Enum.EasingStyle.Quint), HiddenProperties):Play()
		end
		TweenService:Create(Card, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {Position = UDim2.fromOffset(20, 0)}):Play()
		task.wait(0.2)
		if not Notification.Parent then return end
		Notification.Size = UDim2.new(1, 0, 0, Notification.AbsoluteSize.Y / NotificationScale.Scale)
		Notification.AutomaticSize = Enum.AutomaticSize.None
		Card.Visible = false
		TweenService:Create(Notification, TweenInfo.new(0.18, Enum.EasingStyle.Quint), {Size = UDim2.new(1, 0, 0, 0)}):Play()
		task.wait(0.18)
		Notification:Destroy()
	end)
end

return Notify
