--print("v2")
--[[

Rayfield Interface Suite
by Sirius

shlex | Designing + Programming
iRay  | Programming

roge4087 | rewrote basically the entire ui atp

]]

local function custom_match(s, pattern)
	return string.find(s, pattern, 1, true)
end


_G.Theme = _G.RayfieldTheme or _G.Theme

local Release = "Beta 7R"
local NotificationDuration = 6.5
local RayfieldFolder = "Rayfield"
local ConfigurationFolder = RayfieldFolder.."/Configurations"
local ConfigurationExtension = ".rfld"


local RayfieldLibrary = {
	Flags = {},
	Theme = {
		Default = {
			TextFont = "Default", -- Default will use the various font faces used across Rayfield
			TextColor = Color3.fromRGB(240, 240, 240),

			SearchIcon = Color3.fromRGB(240, 240, 240),
			XIcon = Color3.fromRGB(240, 240, 240),

			Divider = Color3.fromRGB(255,255,255),

			LoadingBackground = Color3.fromRGB(25, 25, 25),

			Background = Color3.fromRGB(25, 25, 25),
			Topbar = Color3.fromRGB(34, 34, 34),
			Shadow = Color3.fromRGB(20, 20, 20),

			NotificationBackground = Color3.fromRGB(20, 20, 20),
			NotificationActionsBackground = Color3.fromRGB(230, 230, 230),

			TabBackground = Color3.fromRGB(80, 80, 80),
			TabStroke = Color3.fromRGB(85, 85, 85),
			TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
			TabTextColor = Color3.fromRGB(240, 240, 240),
			SelectedTabTextColor = Color3.fromRGB(50, 50, 50),

			ElementBackground = Color3.fromRGB(35, 35, 35),
			ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
			SecondaryElementBackground = Color3.fromRGB(25, 25, 25), -- For labels and paragraphs
			ElementStroke = Color3.fromRGB(50, 50, 50),
			SecondaryElementStroke = Color3.fromRGB(40, 40, 40), -- For labels and paragraphs

			SliderBackground = Color3.fromRGB(43, 105, 159),
			SliderProgress = Color3.fromRGB(43, 105, 159),
			SliderStroke = Color3.fromRGB(48, 119, 177),

			ToggleBackground = Color3.fromRGB(30, 30, 30),
			ToggleEnabled = Color3.fromRGB(0, 146, 214),
			ToggleDisabled = Color3.fromRGB(100, 100, 100),
			ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
			ToggleDisabledStroke = Color3.fromRGB(125, 125, 125),
			ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
			ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65),

			InputBackground = Color3.fromRGB(30, 30, 30),
			InputStroke = Color3.fromRGB(65, 65, 65),
			PlaceholderColor = Color3.fromRGB(178, 178, 178)
		},
		Light = {
			TextFont = "Gotham",  -- Default will use the various font faces used across Rayfield
			TextColor = Color3.fromRGB(50, 50, 50), -- i need to make all text 240, 240, 240 and base gray on transparency not color to do this

			SearchIcon = Color3.fromRGB(240, 240, 240),
			XIcon = Color3.fromRGB(240, 240, 240),

			Divider = Color3.fromRGB(0,0,0),

			LoadingBackground = Color3.fromRGB(255, 255, 255),

			Background = Color3.fromRGB(255, 255, 255),
			Topbar = Color3.fromRGB(217, 217, 217),
			Shadow = Color3.fromRGB(223, 223, 223),

			NotificationBackground = Color3.fromRGB(20, 20, 20),
			NotificationActionsBackground = Color3.fromRGB(230, 230, 230),

			TabBackground = Color3.fromRGB(220, 220, 220),
			TabStroke = Color3.fromRGB(112, 112, 112),
			TabBackgroundSelected = Color3.fromRGB(0, 142, 208),
			TabTextColor = Color3.fromRGB(240, 240, 240),
			SelectedTabTextColor = Color3.fromRGB(255, 140, 0),

			ElementBackground = Color3.fromRGB(198, 198, 198),
			ElementBackgroundHover = Color3.fromRGB(230, 230, 230),
			SecondaryElementBackground = Color3.fromRGB(136, 136, 136), -- For labels and paragraphs
			ElementStroke = Color3.fromRGB(180, 199, 97),
			SecondaryElementStroke = Color3.fromRGB(40, 40, 40),  --For labels and paragraphs

			SliderBackground = Color3.fromRGB(31, 159, 71),
			SliderProgress = Color3.fromRGB(31, 159, 71),
			SliderStroke = Color3.fromRGB(42, 216, 94),

			ToggleBackground = Color3.fromRGB(170, 203, 60),
			ToggleEnabled = Color3.fromRGB(32, 214, 29),
			ToggleDisabled = Color3.fromRGB(100, 22, 23),
			ToggleEnabledStroke = Color3.fromRGB(17, 255, 0),
			ToggleDisabledStroke = Color3.fromRGB(65, 8, 8),
			ToggleEnabledOuterStroke = Color3.fromRGB(0, 170, 0),
			ToggleDisabledOuterStroke = Color3.fromRGB(170, 0, 0),

			InputBackground = Color3.fromRGB(31, 159, 71),
			InputStroke = Color3.fromRGB(19, 65, 31),
			PlaceholderColor = Color3.fromRGB(178, 178, 178)
		},
		Yellow2 = {
			TextFont = Enum.Font.GothamBold,
			TextColor = Color3.fromRGB(235, 235, 235),
		
			SearchIcon = Color3.fromRGB(255, 225, 90),
			XIcon = Color3.fromRGB(40, 40, 20),
		
			Divider = Color3.fromRGB(220, 220, 180),
		
			LoadingBackground = Color3.fromRGB(255, 225, 90),
		
			Background = Color3.fromRGB(20, 20, 20),
			Topbar = Color3.fromRGB(80, 78, 35),
			Shadow = Color3.fromRGB(255, 200, 70),
		
			NotificationBackground = Color3.fromRGB(170, 150, 55),
			NotificationActionsBackground = Color3.fromRGB(15, 15, 15),
		
			TabBackground = Color3.fromRGB(95, 92, 50),
			TabStroke = Color3.fromRGB(140, 135, 65),
			TabBackgroundSelected = Color3.fromRGB(170, 145, 45),
			TabTextColor = Color3.fromRGB(235, 235, 235),
			SelectedTabTextColor = Color3.fromRGB(255, 240, 120),
		
			ElementBackground = Color3.fromRGB(30, 30, 30),
			ElementBackgroundHover = Color3.fromRGB(45, 45, 45),
			SecondaryElementBackground = Color3.fromRGB(22, 22, 22),
			ElementStroke = Color3.fromRGB(55, 55, 55),
			SecondaryElementStroke = Color3.fromRGB(45, 45, 45),
		
			SliderBackground = Color3.fromRGB(190, 170, 70),
			SliderProgress = Color3.fromRGB(255, 225, 90),
			SliderStroke = Color3.fromRGB(255, 210, 80),
		
			ToggleBackground = Color3.fromRGB(28, 28, 28),
			ToggleEnabled = Color3.fromRGB(255, 225, 90),
			ToggleDisabled = Color3.fromRGB(180, 60, 60),
			ToggleEnabledStroke = Color3.fromRGB(120, 110, 55),
			ToggleDisabledStroke = Color3.fromRGB(70, 25, 25),
			ToggleEnabledOuterStroke = Color3.fromRGB(255, 225, 90),
			ToggleDisabledOuterStroke = Color3.fromRGB(255, 225, 90),
		
			InputBackground = Color3.fromRGB(28, 28, 28),
			InputStroke = Color3.fromRGB(60, 60, 60),
			PlaceholderColor = Color3.fromRGB(200, 200, 150)
		},
		Yellow = {
			TextFont = Enum.Font.GothamBold,
			TextColor = Color3.fromRGB(240, 240, 240),

			SearchIcon = Color3.fromRGB(255, 235, 80),
			XIcon = Color3.fromRGB(55, 55, 25),

			Divider = Color3.fromRGB(255, 255, 255),

			LoadingBackground = Color3.fromRGB(255, 235, 80),

			Background = Color3.fromRGB(25, 25, 25),
			Topbar = Color3.fromRGB(92, 92, 37),
			Shadow = Color3.fromRGB(255, 215, 55),

			NotificationBackground = Color3.fromRGB(190, 170, 60),
			NotificationActionsBackground = Color3.fromRGB(9, 9, 9),

			TabBackground = Color3.fromRGB(108, 108, 60),
			TabStroke = Color3.fromRGB(156, 156, 69),
			TabBackgroundSelected = Color3.fromRGB(150, 130, 40),
			TabTextColor = Color3.fromRGB(240, 240, 240),
			SelectedTabTextColor = Color3.fromRGB(255, 255, 0),

			ElementBackground = Color3.fromRGB(35, 35, 35),
			ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
			SecondaryElementBackground = Color3.fromRGB(25, 25, 25),
			ElementStroke = Color3.fromRGB(50, 50, 50),
			SecondaryElementStroke = Color3.fromRGB(40, 40, 40),

			SliderBackground = Color3.fromRGB(200, 180, 60),
			SliderProgress = Color3.fromRGB(255, 235, 80),
			SliderStroke = Color3.fromRGB(255, 220, 60),

			ToggleBackground = Color3.fromRGB(30, 30, 30),
			ToggleEnabled = Color3.fromRGB(255, 235, 80),
			ToggleDisabled = Color3.fromRGB(195, 52, 52),
			ToggleEnabledStroke = Color3.fromRGB(140, 130, 60),
			ToggleDisabledStroke = Color3.fromRGB(74, 23, 23),
			ToggleEnabledOuterStroke = Color3.fromRGB(255, 235, 80),
			ToggleDisabledOuterStroke = Color3.fromRGB(255, 235, 80),

			InputBackground = Color3.fromRGB(30, 30, 30),
			InputStroke = Color3.fromRGB(65, 65, 65),
			PlaceholderColor = Color3.fromRGB(220, 220, 180)
		},
		Verny = {
			TextFont = "Default", -- Default will use the various font faces used across Rayfield
			TextColor = Color3.fromRGB(240, 240, 240),

			SearchIcon = Color3.fromRGB(255, 227, 36),
			XIcon = Color3.fromRGB(55, 14, 14),

			Divider = Color3.fromRGB(255,255,255),

			LoadingBackground = Color3.fromRGB(255, 78, 78),

			Background = Color3.fromRGB(25, 25, 25),
			Topbar = Color3.fromRGB(92, 37, 37),
			Shadow = Color3.fromRGB(255, 55, 55),

			NotificationBackground = Color3.fromRGB(152, 50, 39),
			NotificationActionsBackground = Color3.fromRGB(9, 9, 9),

			TabBackground = Color3.fromRGB(108, 80, 80),
			TabStroke = Color3.fromRGB(156, 69, 69),
			TabBackgroundSelected = Color3.fromRGB(117, 34, 34),
			TabTextColor = Color3.fromRGB(240, 240, 240),
			SelectedTabTextColor = Color3.fromRGB(255, 255, 0),

			ElementBackground = Color3.fromRGB(35, 35, 35),
			ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
			SecondaryElementBackground = Color3.fromRGB(25, 25, 25), -- For labels and paragraphs
			ElementStroke = Color3.fromRGB(50, 50, 50),
			SecondaryElementStroke = Color3.fromRGB(40, 40, 40), -- For labels and paragraphs

			SliderBackground = Color3.fromRGB(43, 105, 159),
			SliderProgress = Color3.fromRGB(43, 105, 159),
			SliderStroke = Color3.fromRGB(48, 119, 177),

			ToggleBackground = Color3.fromRGB(30, 30, 30),
			ToggleEnabled = Color3.fromRGB(31, 213, 68),
			ToggleDisabled = Color3.fromRGB(195, 52, 52),
			ToggleEnabledStroke = Color3.fromRGB(74, 123, 84),
			ToggleDisabledStroke = Color3.fromRGB(74, 23, 23),
			ToggleEnabledOuterStroke = Color3.fromRGB(233, 0, 0),
			ToggleDisabledOuterStroke = Color3.fromRGB(233, 0, 0),

			InputBackground = Color3.fromRGB(30, 30, 30),
			InputStroke = Color3.fromRGB(65, 65, 65),
			PlaceholderColor = Color3.fromRGB(178, 178, 178)
		},
		Green = {
			TextFont = Enum.Font.FredokaOne, -- Default will use the various font faces used across Rayfield
			TextColor = Color3.fromRGB(240, 240, 240),

			SearchIcon = Color3.fromRGB(120, 255, 120),
			XIcon = Color3.fromRGB(240, 240, 240),

			Divider = Color3.fromRGB(255, 255, 255),

			LoadingBackground = Color3.fromRGB(60, 85, 60),

			Background = Color3.fromRGB(20, 25, 20),
			Topbar = Color3.fromRGB(65, 90, 65),
			Shadow = Color3.fromRGB(0, 255, 100),

			NotificationBackground = Color3.fromRGB(70, 140, 70),
			NotificationActionsBackground = Color3.fromRGB(15, 15, 15),

			TabBackground = Color3.fromRGB(100, 130, 100),
			TabStroke = Color3.fromRGB(140, 170, 140),
			TabBackgroundSelected = Color3.fromRGB(60, 190, 100),
			TabTextColor = Color3.fromRGB(240, 240, 240),
			SelectedTabTextColor = Color3.fromRGB(0, 255, 100),

			ElementBackground = Color3.fromRGB(35, 45, 35),
			ElementBackgroundHover = Color3.fromRGB(45, 55, 45),
			SecondaryElementBackground = Color3.fromRGB(25, 30, 25), -- For labels and paragraphs
			ElementStroke = Color3.fromRGB(55, 70, 55),
			SecondaryElementStroke = Color3.fromRGB(45, 55, 45), -- For labels and paragraphs

			SliderBackground = Color3.fromRGB(50, 150, 90),
			SliderProgress = Color3.fromRGB(50, 190, 110),
			SliderStroke = Color3.fromRGB(60, 200, 120),

			ToggleBackground = Color3.fromRGB(30, 35, 30),
			ToggleEnabled = Color3.fromRGB(80, 255, 130),
			ToggleDisabled = Color3.fromRGB(195, 52, 52),
			ToggleEnabledStroke = Color3.fromRGB(90, 200, 120),
			ToggleDisabledStroke = Color3.fromRGB(90, 32, 32),
			ToggleEnabledOuterStroke = Color3.fromRGB(0, 255, 100),
			ToggleDisabledOuterStroke = Color3.fromRGB(0, 255, 100),

			InputBackground = Color3.fromRGB(30, 35, 30),
			InputStroke = Color3.fromRGB(70, 85, 70),
			PlaceholderColor = Color3.fromRGB(178, 200, 178)
		}
	}
}


-- Services

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

-- Interface Management


--[[
local Rayfield =  game:GetService("ReplicatedStorage")["Rayfield"] --14412610844

--studio
function gethui() return Rayfield end local http_request = nil local syn = {protect_gui = false,request = false,}local http = nil function writefile(tt,t,ttt)end function isfolder(t)end function makefolder(t)end function isfile(r)end function readfile(t)end

if gethui then
	Rayfield.Parent = game.Players.LocalPlayer.PlayerGui
elseif syn.protect_gui then 
	syn.protect_gui(Rayfield)
	Rayfield.Parent = CoreGui
elseif CoreGui:FindFirstChild("RobloxGui") then
	Rayfield.Parent = CoreGui:FindFirstChild("RobloxGui")
else
	Rayfield.Parent = CoreGui
end

if gethui then
	for _, Interface in ipairs(gethui():GetChildren()) do
		if Interface.Name == Rayfield.Name and Interface ~= Rayfield then
			Interface.Enabled = false
			Interface.Name = "Rayfield-Old"
		end
	end
else
	for _, Interface in ipairs(CoreGui:GetChildren()) do
		if Interface.Name == Rayfield.Name and Interface ~= Rayfield then
			Interface.Enabled = false
			Interface.Name = "Rayfield-Old"
		end
	end
end
]]
--

-- Which execution owns the screen. Testers and devs re-execute even though a user only gets one
-- go, and that used to be decided by whichever copy's asset finished downloading first, because
-- the load below yields: a slow first execution would arrive after a fast second one, disable and
-- rename the window that was already animating, then claim the shared _G entry points for a
-- window nobody could see. The generation is claimed before that yield, so the newest execution
-- to *start* always wins and an older one stands down instead of fighting it for the screen.
-- _G.RayfieldBackgroundTest loads a second tree for harnesses and must not increment that
-- counter or unparent the window that already owns the screen.
local BackgroundTest = _G.RayfieldBackgroundTest == true
if not BackgroundTest then
	_G.RayfieldGeneration = (_G.RayfieldGeneration or 0) + 1
end
local Generation = BackgroundTest and -1 or _G.RayfieldGeneration
local function isCurrent()
	return _G.RayfieldGeneration == Generation
end

local preservedInterfaces = {}
if BackgroundTest then
	pcall(function()
		for _, child in ipairs(gethui():GetChildren()) do
			if child.Name == "Rayfield" or child.Name == "Rayfield-Old" then
				table.insert(preservedInterfaces, {gui = child, parent = child.Parent, enabled = child.Enabled})
			end
		end
	end)
end

local Rayfield =  game:GetObjects(_G.ASSETID_123)[1]
if BackgroundTest then
	Rayfield.Name = "Rayfield-BackgroundTest"
	Rayfield.Parent = nil
end

local function restorePreservedInterfaces()
	if not BackgroundTest then
		return
	end
	for _, row in ipairs(preservedInterfaces) do
		pcall(function()
			local parent = row.parent or (gethui and gethui())
			if row.gui and parent and row.gui.Parent ~= parent then
				row.gui.Parent = parent
			end
			if row.gui and row.enabled ~= nil then
				row.gui.Enabled = row.enabled
			end
		end)
	end
end
restorePreservedInterfaces()

--[[
local RayfieldURL = "https://github.com/diepedyt/RBXM_UIS/raw/refs/heads/main/RayfielUIv7v2.rbxm"
local RayfieldUIFileName = "RayfieldUI.rbxm"

local Rayfield;
while not Rayfield do
	local response;
	pcall(function()
    		response = game:HttpGet(RayfieldURL)
	end)
	if response then
    		writefile(RayfieldUIFileName, response)
    		local assetUrl = getcustomasset(RayfieldUIFileName)
    		Rayfield = game:GetObjects(assetUrl)[1]
	end
end
]]

--studio
--function gethui() return Rayfield end local http_request = nil local syn = {protect_gui = false,request = false,}local http = nil function writefile(tt,t,ttt)end function isfolder(t)end function makefolder(t)end function isfile(r)end function readfile(t)end

Rayfield.Enabled = false
Rayfield.Notifications.Template.Description.Text = ""

-- A superseded execution is never parented, so it cannot disturb the window that owns the screen.
-- Its script carries on building into an orphaned tree, which is invisible and harmless.
-- A background test stays orphaned on purpose: parenting it into gethui makes the executor
-- treat the live window as a duplicate, and parenting it into PlayerGui runs the asset's
-- LocalScripts.
if BackgroundTest then
	Rayfield.Name = "Rayfield-BackgroundTest"
	Rayfield.Parent = nil
	local TestToggle = Rayfield:FindFirstChild("bhubToggle")
	if TestToggle then
		TestToggle.Visible = false
	end
	restorePreservedInterfaces()
	task.defer(restorePreservedInterfaces)
	task.spawn(function()
		local stop = tick() + 3
		while _G.RayfieldBackgroundTest and tick() < stop do
			restorePreservedInterfaces()
			task.wait(0.1)
		end
		restorePreservedInterfaces()
	end)
elseif isCurrent() then
	local InterfaceParent
	if gethui then
		InterfaceParent = gethui()
	elseif syn.protect_gui then
		InterfaceParent = CoreGui
	elseif CoreGui:FindFirstChild("RobloxGui") then
		InterfaceParent = CoreGui:FindFirstChild("RobloxGui")
	else
		InterfaceParent = CoreGui
	end

	-- Remove the previous window before parenting the new one so gethui never has two
	-- live ScreenGuis named Rayfield during a re-execution.
	-- Unparented and not destroyed: Destroy detaches every descendant as well, so the
	-- execution that owns this window would error on its next child lookup and its error reporter
	-- would fire on each one. Out here it renders nowhere and is collected with its execution.
	if isCurrent() then
		for _, Interface in ipairs(InterfaceParent:GetChildren()) do
			if Interface.Name == Rayfield.Name or Interface.Name == "Rayfield-Old" then
				Interface.Parent = nil
			end
		end
		if not gethui and syn.protect_gui then
			syn.protect_gui(Rayfield)
		end
		Rayfield.Parent = InterfaceParent
	end
end

-- Potassium raises its own admin-detection prompt as a full screen gui above everything else, over
-- and over, and its Ignore button does not stop it coming back. It belongs to the executor rather
-- than to any script, so there is no flag to read and it has to be recognised by the text it shows.
-- Matched loosely because the wording carries the game's name, and unparented rather than destroyed
-- so whatever created it does not error walking its own children.
local function isForeignPrompt(Object)
	if not Object:IsA("TextLabel") and not Object:IsA("TextButton") then return false end

	local Text = string.lower(Object.Text)
	return string.find(Text, "joined your session", 1, true) ~= nil
		or (string.find(Text, "administrator", 1, true) ~= nil and string.find(Text, "disconnect", 1, true) ~= nil)
end

local function clearForeignPrompt(Object)
	if not isCurrent() then return end
	if not isForeignPrompt(Object) then return end

	local Root = Object
	while Root.Parent and not Root:IsA("ScreenGui") do
		Root = Root.Parent
	end

	if Root ~= Rayfield and Root:IsA("ScreenGui") then
		Root.Parent = nil
	end
end

local PromptContainers = {CoreGui}
if gethui then table.insert(PromptContainers, gethui()) end
local PlayerGui = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
if PlayerGui then table.insert(PromptContainers, PlayerGui) end

if not BackgroundTest then
	for _, Container in ipairs(PromptContainers) do
		-- CoreGui is not readable on every executor, and the connection is worth nothing if the sweep
		-- that precedes it throws.
		pcall(function()
			for _, Object in ipairs(Container:GetDescendants()) do
				clearForeignPrompt(Object)
			end

			Container.DescendantAdded:Connect(function(Object)
				-- Deferred because the text is usually assigned after the label is parented in.
				task.defer(clearForeignPrompt, Object)
			end)
		end)
	end
end



--Object Variables

local Camera = workspace.CurrentCamera
local Main = Rayfield.Main
Main.Visible = false
local Topbar = Main.Topbar
local TabListBack = Main.TabListBack
local Elements = Main.Elements
local PremiumTag = Main.Premium
PremiumTag.ZIndex = 5
PremiumTag.TextLabel.ZIndex = 10
PremiumTag.BackgroundTransparency = 0.8
PremiumTag.TextLabel.Text = "⭐ Premium Only"
-- PremiumTag setting: true = permanent lock; number = unlock stamp (countdown + Discord).
-- Countdown uses GetServerTimeNow to match AnimeAstral FeatureLocks (not os.time).
local PremiumDiscordInvite = "discord.gg/BananaHub"
local function premiumLockNow()
	return workspace:GetServerTimeNow()
end
local function premiumFormatLeft(seconds)
	local left = math.max(0, math.floor(tonumber(seconds) or 0))
	local days = math.floor(left / 86400)
	local hours = math.floor((left % 86400) / 3600)
	local mins = math.floor((left % 3600) / 60)
	local secs = math.floor(left % 60)
	if days > 0 then
		return string.format("%dd %02d:%02d:%02d", days, hours, mins, secs)
	end
	return string.format("%02d:%02d:%02d", hours, mins, secs)
end
-- A locked row keeps its own title readable under the scrim and swaps the control it cannot
-- use for a badge pinned to the same right gutter every control sits in, so a locked row
-- still lines up with the rows around it. The badge is one line on purpose: the invite used
-- to sit under it on a second line, and TextScaled then shrank both to half the height of a
-- row title. The invite and the pitch moved to the click notification, which is where the
-- user has already reached for the feature.
local PremiumGold = Color3.fromRGB(255, 167, 44)
local PremiumGreen = Color3.fromRGB(126, 217, 87)
-- Row controls pin their right edge to 1 - ElementRowGutter (declared with the other row
-- insets below); the badge stands in for one, so it lands on that same edge.
local PremiumBadgeRight = 1 - 0.0256
-- Width is per state so a short badge and a long one TextScale to the same height as each other
-- (and as the row titles). The widest stops short of 0.6175, where a dropdown's title box ends —
-- that is the widest title in the file, and it is tweened rather than set, so a badge that
-- clears it is worth more than a title pulled back out from under the badge on every tween.
local function premiumBadgeState(premiumSetting)
	if type(premiumSetting) == "number" then
		local left = premiumSetting - premiumLockNow()
		if left <= 0 then
			return "✓ Rejoin & re-execute", 0.3, PremiumGreen
		end
		-- Seconds two days out are noise, and a day count spelled out to the second needs a
		-- badge wider than a dropdown's title. Precision arrives with the urgency: whole hours
		-- until the last day, and a clock the same width once the wait is one.
		local days = math.floor(left / 86400)
		if days > 0 then
			return string.format("⭐ Premium · free in %dd %02dh", days, math.floor((left % 86400) / 3600)), 0.35, PremiumGold
		end
		return "⭐ Premium · free in "..premiumFormatLeft(left), 0.35, PremiumGold
	end
	return "⭐ Premium only", 0.24, PremiumGold
end
local function attachPremiumOverlay(parent, premiumSetting)
	if not premiumSetting then return nil end
	local tag = PremiumTag:Clone()
	tag.Visible = true
	tag.Parent = parent
	local _, badgeWidth, badgeColor = premiumBadgeState(premiumSetting)

	local badge = Instance.new("Frame")
	badge.Name = "Badge"
	badge.AnchorPoint = Vector2.new(1, 0.5)
	badge.Position = UDim2.new(PremiumBadgeRight, 0, 0.5, 0)
	badge.Size = UDim2.new(badgeWidth, 0, 0.62, 0)
	badge.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
	badge.BackgroundTransparency = 0.25
	badge.BorderSizePixel = 0
	badge.ZIndex = 10
	badge.Parent = tag

	local badgeCorner = Instance.new("UICorner")
	badgeCorner.CornerRadius = UDim.new(0.35, 0)
	badgeCorner.Parent = badge

	local badgeStroke = Instance.new("UIStroke")
	badgeStroke.Color = badgeColor
	badgeStroke.Thickness = 1
	badgeStroke.Transparency = 0.6
	badgeStroke.Parent = badge

	-- A locked row still has to name what it is selling, so a title box that would run under
	-- the badge is pulled in and TextScaled shrinks the words instead. Row titles are right
	-- anchored and label titles are not, so the left edge is solved from the anchor. This runs
	-- deferred because the label and input constructors move their own title after this returns.
	local function clampTitle()
		local title = parent:FindFirstChild("Title")
		if not title then return end
		local titleRight = PremiumBadgeRight - badgeWidth - 0.02
		local titleLeft = title.Position.X.Scale - title.AnchorPoint.X * title.Size.X.Scale
		if titleLeft + title.Size.X.Scale > titleRight then
			local width = math.max(0.1, titleRight - titleLeft)
			title.Size = UDim2.new(width, 0, title.Size.Y.Scale, 0)
			title.Position = UDim2.new(titleLeft + title.AnchorPoint.X * width, 0, title.Position.Y.Scale, 0)
		end
	end
	clampTitle()
	task.defer(clampTitle)

	-- Drop the asset label (it was sized for the full-row Premium overlay). Text lives in a
	-- slightly inset frame so TextScaled keeps a little air from the pill edge.
	local oldLabel = tag:FindFirstChild("TextLabel")
	if oldLabel then
		oldLabel:Destroy()
	end
	local textBox = Instance.new("Frame")
	textBox.Name = "TextBox"
	textBox.BackgroundTransparency = 1
	textBox.AnchorPoint = Vector2.new(0.5, 0.5)
	textBox.Position = UDim2.new(0.5, 0, 0.5, 0)
	textBox.Size = UDim2.new(0.88, 0, 0.72, 0)
	textBox.ZIndex = 11
	textBox.Parent = badge

	local label = Instance.new("TextLabel")
	label.Name = "TextLabel"
	label.BackgroundTransparency = 1
	label.Size = UDim2.new(1, 0, 1, 0)
	label.Font = Enum.Font.GothamBold
	label.TextWrapped = false
	label.TextXAlignment = Enum.TextXAlignment.Center
	label.TextYAlignment = Enum.TextYAlignment.Center
	label.ZIndex = 12
	-- TextWrapped above clears TextScaled on this executor — set it last, after every other prop.
	label.TextScaled = true
	label.Parent = textBox

	local function paintBadge(setting)
		local text, width, color = premiumBadgeState(setting)
		badge.Size = UDim2.new(width, 0, 0.62, 0)
		badgeStroke.Color = color
		label.Text = text
		label.TextColor3 = color
	end
	paintBadge(premiumSetting)

	if type(premiumSetting) == "number" then
		local unlockAt = premiumSetting
		task.spawn(function()
			while tag.Parent and unlockAt > premiumLockNow() do
				paintBadge(unlockAt)
				local now = premiumLockNow()
				if now >= unlockAt then
					break
				end
				local waitFor = 1 - (now % 1)
				if waitFor < 0.02 then
					waitFor = waitFor + 1
				end
				task.wait(waitFor)
			end
			if tag.Parent then
				paintBadge(unlockAt)
			end
		end)
	end
	local interact = parent:FindFirstChild("Interact")
	if interact and interact:IsA("GuiButton") then
		interact.MouseButton1Click:Connect(function()
			local title, content
			local now = premiumLockNow()
			if type(premiumSetting) == "number" and premiumSetting > now then
				title = "Premium Early Access"
				content = parent.Name.." goes free for everyone in "..premiumFormatLeft(premiumSetting - now)..". Use it right now with Premium — "..PremiumDiscordInvite
			elseif type(premiumSetting) == "number" then
				title = "Now Free"
				content = parent.Name.." is free now — rejoin and re-execute the script to use it."
			else
				title = "Premium Feature"
				content = parent.Name.." is Premium only. Unlock it now — "..PremiumDiscordInvite
			end
			RayfieldLibrary:Notify({Title = title, Content = content, Duration = 6})
		end)
	end
	return tag
end
local LoadingFrame = Main.LoadingFrame
local TabList = Main.TabList
local SearchBar = Main.Searchbar
local Filler = SearchBar.CanvasGroup.Filler
local SearchInput = SearchBar.Input
local SearchTitle
local SearchInputFrame
local Prompt = Main.Prompt
local CustomText = Topbar.CustomText


--Window Chrome

Topbar.Size = UDim2.new(Topbar.Size.X.Scale, Topbar.Size.X.Offset, Topbar.Size.Y.Scale * 0.85, Topbar.Size.Y.Offset * 0.85)
Topbar.Hide.Size = UDim2.new(Topbar.Hide.Size.X.Scale * 0.85 * 0.9, Topbar.Hide.Size.X.Offset * 0.85 * 0.9, Topbar.Hide.Size.Y.Scale * 0.9, Topbar.Hide.Size.Y.Offset * 0.9)

-- Only Search and Hide sit on the bar. Theme and ChangeSize stay as the asset
-- ships them (hidden, parked off-window).
Topbar.Search.Size = Topbar.Hide.Size
Topbar.Search.AnchorPoint = Vector2.new(0.5, 0.5)
Topbar.Search.Position = UDim2.new(Topbar.Search.Position.X.Scale, 0, Topbar.Hide.Position.Y.Scale, 0)
local TitleLeft = Elements.Position.X.Scale - Elements.Size.X.Scale * Elements.AnchorPoint.X
local TitleInset = Elements.Position.X.Offset - Elements.Size.X.Offset * Elements.AnchorPoint.X + Elements.Template.ScrollBarThickness - Elements.Template.Toggle.Size.X.Offset / 2
Topbar.Title.AnchorPoint = Vector2.new(0, 0.5)
Topbar.Title.Position = UDim2.new((TitleLeft - Topbar.Position.X.Scale) / Topbar.Size.X.Scale, TitleInset - Topbar.Position.X.Offset, Topbar.Hide.Position.Y.Scale, Topbar.Hide.Position.Y.Offset)
Topbar.Theme.Visible = false
Topbar.ChangeSize.Visible = false

-- Where each topbar control sits when nothing is happening to it, read off the asset
-- before any animation has touched it. The icons rest at different weights on purpose
-- (the X carries the row, the rest sit back), and unhide used to fade every one of them to
-- fully opaque, so the hierarchy was lost after the first hide. Hover states grow and
-- brighten from here, and unhide puts everything back, which also matters because a
-- window hidden while the cursor is on the X never gets its MouseLeave.
local TopbarButtonRest = {}
for _, TopbarButton in ipairs(Topbar:GetChildren()) do
	if TopbarButton.ClassName == "ImageButton" then
		TopbarButtonRest[TopbarButton] = {ImageTransparency = TopbarButton.ImageTransparency, Size = TopbarButton.Size}
	end
end
-- Search ships hidden in the asset. It is a first-class topbar control, so it rests at
-- 0.8 rather than staying invisible after Unhide.
Topbar.Search.Visible = true
if TopbarButtonRest[Topbar.Search] then
	TopbarButtonRest[Topbar.Search].ImageTransparency = 0.8
end

-- Chrome controls are sized in a mix of scale and offset, so a hover or press grows them
-- by a factor rather than a fixed size.
local function scaleSize(Size, Factor)
	return UDim2.new(Size.X.Scale * Factor, Size.X.Offset * Factor, Size.Y.Scale * Factor, Size.Y.Offset * Factor)
end


--Element Sizing

-- Every element root carries a UIAspectRatioConstraint driven by width, so its rendered
-- height is (column width / AspectRatio) and any Size.Y.Offset on the root is ignored.
-- Heights are therefore expressed in rows: one row is ElementRowAspect, and anything
-- taller divides it. The template ships three different ratios for what are all single
-- rows, so they are normalised here rather than in each constructor.
--
-- The panel widths the asset ships with are left alone. Height is width over aspect, so
-- widening the element column makes every element taller unless every aspect below is
-- scaled by the same factor.
local ElementRowAspect = 11.847293853759766
local ElementRowTitle = 0.33
local ElementRowControl = 0.701
local ElementRowInfoRows = 1.5
local ElementRowGutter = 0.0256
local DropdownOpenAspect = ElementRowAspect / 5.5

-- The list sits inside the open panel, so a row measured across the list comes out at 0.944
-- of a page row. The asset ships every option and the search box at a full row, which is why
-- an open dropdown reads as a stack of elements rather than a list of choices.
local DropdownListRow = ElementRowAspect * 0.944
local DropdownOptionAspect = DropdownListRow / 0.73
local DropdownSearchAspect = DropdownListRow / 0.77

for _, Template in ipairs({Elements.Template.Button, Elements.Template.Label, Elements.Template.Toggle, Elements.Template.Input, Elements.Template.Keybind, Elements.Template.Slider}) do
	Template.UIAspectRatioConstraint.AspectRatio = ElementRowAspect
	Template.Title.Size = UDim2.new(Template.Title.Size.X.Scale, 0, ElementRowTitle, 0)
end

Elements.Template.BigLabel.UIAspectRatioConstraint.AspectRatio = ElementRowAspect
Elements.Template.Space.UIAspectRatioConstraint.AspectRatio = ElementRowAspect / 1.25

Elements.Template.Input.InputFrame.Size = UDim2.new(0.241, 0, ElementRowControl, 0)
Elements.Template.Keybind.KeybindFrame.Size = UDim2.new(0.073, 0, ElementRowControl, 0)
Elements.Template.Slider.Main.Size = UDim2.new(0.480, 0, ElementRowControl, 0)

local DropdownList = Elements.Template.Dropdown.List
for _, Row in ipairs({DropdownList.Template, DropdownList["Select All"], DropdownList["Reset List"]}) do
	Row.UIAspectRatioConstraint.AspectRatio = DropdownOptionAspect
end
DropdownList[",---S=()earch"].UIAspectRatioConstraint.AspectRatio = DropdownSearchAspect

-- The list ends with five spacers, which leaves most of a panel of empty scroll under the last
-- option. One is enough to lift it clear of the panel's bottom edge.
local DropdownTrail = 0
for _, Row in ipairs(DropdownList:GetChildren()) do
	if Row:IsA("Frame") and Row.LayoutOrder == 9999 then
		DropdownTrail = DropdownTrail + 1
		Row.UIAspectRatioConstraint.AspectRatio = DropdownOptionAspect
		Row.Visible = DropdownTrail == 1
	end
end

-- The template leaves every control a different distance from the row's right edge
-- (9px on a toggle switch, 11px on a slider, 16px on an input box), so scrolling a page
-- shows a ragged right column. Solving for the right edge rather than the position keeps
-- the gutter once an input or keybind grows to fit its own text.
local function pinRight(Control)
	Control.Position = UDim2.new(1 - ElementRowGutter - (1 - Control.AnchorPoint.X) * Control.Size.X.Scale, Control.Position.X.Offset, Control.Position.Y.Scale, Control.Position.Y.Offset)
end

pinRight(Elements.Template.Button.ElementIndicator)
pinRight(Elements.Template.Toggle.Switch)
pinRight(Elements.Template.Input.InputFrame)
pinRight(Elements.Template.Keybind.KeybindFrame)
pinRight(Elements.Template.Slider.Main)

-- Searchbar is one element row in the element column, not the old 480x40 Size tween.
-- Clone the working row constraint rather than creating a new one while the tree is unparented.
local SearchBarAspect = SearchBar:FindFirstChildOfClass("UIAspectRatioConstraint")
if not SearchBarAspect then
	SearchBarAspect = Elements.Template.Button.UIAspectRatioConstraint:Clone()
	SearchBarAspect.Parent = SearchBar
end
SearchBarAspect.AspectRatio = ElementRowAspect
SearchBar.Size = UDim2.new(Elements.Size.X.Scale, -10, Topbar.Size.Y.Scale * (52.8 / 47), 0)
SearchBar.AnchorPoint = Vector2.new(0.5, 0)
SearchBar.Position = UDim2.new(Elements.Position.X.Scale, 0, SearchBar.Position.Y.Scale, 0)
SearchBar.Visible = false

SearchTitle = SearchBar:FindFirstChild("Title")
if SearchTitle then
	SearchTitle.Visible = false
end
SearchInputFrame = SearchBar:FindFirstChild("InputFrame")
if SearchInputFrame then
	SearchInputFrame.Visible = false
end

SearchBar.Icon.Visible = true
SearchBar.Icon.AnchorPoint = Vector2.new(0, 0.5)
SearchBar.Icon.Position = UDim2.new(0.03, 0, 0.5, 0)
SearchBar.Icon.Size = UDim2.new(20 / 480, 0, 20 / 40, 0)
SearchBar.Icon.ZIndex = SearchBar.ZIndex + 1

SearchBar.Clear.Visible = true
SearchBar.Clear.AnchorPoint = Vector2.new(1, 0.5)
SearchBar.Clear.Position = UDim2.new(0.98, 0, 0.5, 0)
SearchBar.Clear.Size = UDim2.new(21 / 480, 0, 21 / 40, 0)
SearchBar.Clear.ZIndex = SearchBar.ZIndex + 1

SearchBar.Filter.Visible = false
SearchBar.Filter.ZIndex = SearchBar.ZIndex + 1

SearchInput.Parent = SearchBar
SearchInput.AnchorPoint = Vector2.new(0, 0.5)
SearchInput.Position = UDim2.new(0.095, 0, 0.5, 0)
SearchInput.Size = UDim2.new(0.98 - 21 / 480 - 0.095, 0, 1, 0)
SearchInput.TextXAlignment = Enum.TextXAlignment.Left
SearchInput.TextScaled = false
SearchInput.TextSize = 15
SearchInput.TextWrapped = false
SearchInput.Visible = false
SearchInput.ZIndex = SearchBar.ZIndex + 2

SearchBar.CanvasGroup.Visible = false
Filler.Visible = false
Filler.Active = false
Filler.Size = UDim2.new(0, 1, 0, 1)
Filler.BackgroundTransparency = 1

-- SectionTitle is the one element that spans the page edge to edge while every other
-- root is inset 5px a side, so without the extra inset a heading starts left of the rows
-- it heads.
local SectionTitleInset = 0.0425
Elements.Template.SectionTitle.Title.Position = UDim2.new(SectionTitleInset, 0, Elements.Template.SectionTitle.Title.Position.Y.Scale, 0)
Elements.Template.SectionTitle.Title.Size = UDim2.new(1 - SectionTitleInset * 2, 0, Elements.Template.SectionTitle.Title.Size.Y.Scale, 0)

for _, Template in ipairs({Elements.Template.Button, Elements.Template.Toggle, Elements.Template.Input, Elements.Template.Keybind, Elements.Template.Slider}) do
	Template.Description.AnchorPoint = Vector2.new(0, 0)
	Template.Description.Position = UDim2.new(0.035, 0, 0.7, 0)
	Template.Description.Size = UDim2.new(0.93, 0, 0.26, 0)
	Template.Description.TextWrapped = true
end

-- Hovering an element with Info grows it to ElementRowInfoRows to make room for the
-- description. Its children are positioned in scale, so dividing their Y scale by the
-- same factor holds them in the original row band instead of letting them drift down.
local function connectInfoDescription(Element)
	local Band = {}
	for _, Child in ipairs(Element:GetChildren()) do
		if Child:IsA("GuiObject") and Child ~= Element.Description then
			Band[Child] = {Child.Position, Child.Size}
		end
	end

	local IsHover = false
	local opened = false
	local Info = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

	local function Expand(Rows)
		TweenService:Create(Element.UIAspectRatioConstraint, Info, {AspectRatio = ElementRowAspect / Rows}):Play()
		for Child, Original in pairs(Band) do
			local Position, Size = Original[1], Original[2]
			TweenService:Create(Child, Info, {
				Position = UDim2.new(Position.X.Scale, Position.X.Offset, Position.Y.Scale / Rows, Position.Y.Offset),
				Size = UDim2.new(Size.X.Scale, Size.X.Offset, Size.Y.Scale / Rows, Size.Y.Offset)
			}):Play()
		end
	end

	Element.MouseEnter:Connect(function()
		IsHover = true
		wait(0.2)
		if IsHover then
			opened = true
			Element.Description.Visible = true
			Expand(ElementRowInfoRows)
		end
	end)
	Element.MouseLeave:Connect(function()
		if IsHover then IsHover = false end
		if opened then
			opened = false
			Expand(1)
			delay(.4, function()
				if not opened then Element.Description.Visible = false end
			end)
		end
	end)
end

-- An open dropdown is five and a half rows tall, so one near the bottom of a page opens into
-- the part of the page that is clipped away and had to be scrolled to before it could be read.
-- The page is nudged up by whatever hangs past its bottom edge instead. The tween is delayed
-- past the panel's own growth because the page's canvas only reaches its new height once the
-- panel has finished growing, and a scroll is clamped to the canvas as it plays.
local function revealDropdown(Dropdown)
	local Page = Dropdown.Parent
	local Overflow = Dropdown.AbsolutePosition.Y + Dropdown.AbsoluteSize.X / DropdownOpenAspect - Page.AbsolutePosition.Y - Page.AbsoluteSize.Y + Page.UIPadding.PaddingBottom.Offset
	if Overflow <= 0 then return end
	TweenService:Create(Page, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0.15), {CanvasPosition = Vector2.new(0, Page.CanvasPosition.Y + Overflow + 10)}):Play()
end


--Tab Sizing

-- Tabs are laid out by a UIGridLayout whose cell height is a scale of the tab list. The
-- 10000px cell width is how the asset forces one tab per row; the tab's own aspect
-- constraint is what turns the cell height into its width. TabRowTitle is tuned so tab
-- text lands on the same height as an element row title.
--
-- TabRowAspect is only the width a tab starts at. Once the last tab has been idle a
-- moment, fitTabsToTitles tweens every tab down to the width its longest title actually
-- needs. All the paddings are fractions of the tab height, so the starting width, the
-- fitted width and the icon and title positions derived from them all scale together.
local TabListHeightScale = TabList.Size.Y.Scale / Elements.Size.Y.Scale
TabList.Position = UDim2.new(TabList.Position.X.Scale, TabList.Position.X.Offset, Elements.Position.Y.Scale, Elements.Position.Y.Offset)
TabList.Size = UDim2.new(TabList.Size.X.Scale, TabList.Size.X.Offset, Elements.Size.Y.Scale, Elements.Size.Y.Offset)
TabList.Placeholder.Visible = false
local ElementViewportPosition = Elements.Position
local ElementViewportSize = Elements.Size
local ElementViewportAnchor = Elements.AnchorPoint

local TabRowHeight = 0.0935 * TabListHeightScale
local TabRowGap = 0.0262 * TabListHeightScale
local TabRowAspect = 6.25
local TabRowTitle = 0.4035
local TabFitPad = 0.4
local TabFitIcon = 0.585
local TabFitGap = 0.25
local TabFitFloor = 0.8
local tabFitQueued = 0
local tabFitAspect = TabRowAspect

local TabTextLeft = (TabFitPad + TabFitIcon + TabFitGap) / TabRowAspect
local TabTextWidth = 1 - TabTextLeft - TabFitPad / TabRowAspect

TabList.UIGridLayout.CellSize = UDim2.new(0, 10000, TabRowHeight, 0)
TabList.UIGridLayout.CellPadding = UDim2.new(0, 0, TabRowGap, 0)
TabList.Template.UIAspectRatioConstraint.AspectRatio = TabRowAspect
TabList.Template.UICorner.CornerRadius = UDim.new(0.2, 0)
TabList.Template.UIStroke.Thickness = 1
TabList.Template.UIStroke.BorderStrokePosition = Enum.BorderStrokePosition.Inner
TabList.Template.Image.Position = UDim2.new(TabFitPad / TabRowAspect, 0, 0.5, 0)
TabList.Template.Title.Size = UDim2.new(TabTextWidth, 0, TabRowTitle, 0)
TabList.Template.Title.Position = UDim2.new(TabTextLeft + TabTextWidth / 2, 0, 0.5, 0)

local function isTabButton(Child)
	return Child:IsA("Frame") and Child.Name ~= "Template" and Child.Name ~= "Placeholder"
end

-- The fitted width belongs to the column rather than to one tab: every measurement it is
-- built from is a fraction of the tab height, so it reduces to an aspect ratio any tab can
-- be given. With a TweenInfo a tab animates down to it; without one it is set outright,
-- which is how a tab created after the column has already been fitted avoids appearing at
-- the full width and being shrunk a moment later.
local function applyTabFit(TabButton, Fit)
	local textLeft = (TabFitPad + TabFitIcon + TabFitGap) / tabFitAspect
	local textWidth = 1 - textLeft - TabFitPad / tabFitAspect
	local ImagePosition = UDim2.new(TabFitPad / tabFitAspect, 0, 0.5, 0)
	local TitleSize = UDim2.new(textWidth, 0, TabRowTitle, 0)
	local TitlePosition = UDim2.new(textLeft + textWidth / 2, 0, 0.5, 0)

	if Fit then
		TweenService:Create(TabButton.UIAspectRatioConstraint, Fit, {AspectRatio = tabFitAspect}):Play()
		TweenService:Create(TabButton.Image, Fit, {Position = ImagePosition}):Play()
		TweenService:Create(TabButton.Title, Fit, {Size = TitleSize, Position = TitlePosition}):Play()
	else
		TabButton.UIAspectRatioConstraint.AspectRatio = tabFitAspect
		TabButton.Image.Position = ImagePosition
		TabButton.Title.Size = TitleSize
		TabButton.Title.Position = TitlePosition
	end
end

-- A fit is clamped to TabFitFloor of the column, and with the title lengths a hub actually
-- uses that floor is what it lands on: AnimeAstral's longest tab needs 167px of a 237px
-- floor. So the width a tab will settle at is known from the column alone, before a single
-- title has been measured, and seeding the first tab with it means the usual case never
-- animates at all. A hub whose titles need more than the floor still gets one widening
-- from fitTabsToTitles once that title exists.
local function seedTabFit()
	if tabFitAspect ~= TabRowAspect then return end
	local height = TabRowHeight * (ElementViewportSize.Y.Scale * Main.AbsoluteSize.Y + ElementViewportSize.Y.Offset)
	if height == 0 or TabList.AbsoluteSize.X == 0 then return end
	tabFitAspect = math.min(TabList.AbsoluteSize.X * TabFitFloor / height, TabRowAspect)
end

local function fitTabsToTitles()
	local widest, height = 0, 0
	for _, TabButton in ipairs(TabList:GetChildren()) do
		if isTabButton(TabButton) then
			widest = math.max(widest, TabButton.Title.TextBounds.X)
			height = TabButton.AbsoluteSize.Y
		end
	end
	if widest == 0 or height == 0 or TabList.AbsoluteSize.X == 0 then return end

	local textLeft = height * (TabFitPad + TabFitIcon + TabFitGap)
	local width = math.clamp(textLeft + widest + 3 + height * TabFitPad, TabList.AbsoluteSize.X * TabFitFloor, height * TabRowAspect)

	-- A hub builds its tabs across its whole load and the debounce below only resolves when
	-- the script yields, so this runs several times before the last tab exists. Replaying
	-- the shrink each time reads as the column resizing itself over and over, so only a fit
	-- that actually changes the width animates. The tolerance absorbs the window still
	-- growing into place under FastLoad, which moves the measurements by a pixel without
	-- changing the shape.
	local fit
	if math.abs(width / height - tabFitAspect) >= 0.05 then
		tabFitAspect = width / height

		fit = TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
		for _, TabButton in ipairs(TabList:GetChildren()) do
			if isTabButton(TabButton) then
				applyTabFit(TabButton, fit)
			end
		end
	end

	local dividerX = (Elements.AbsolutePosition.X + Elements.AbsoluteSize.X + TabList.AbsolutePosition.X + (TabList.AbsoluteWindowSize.X - height * tabFitAspect) / 2) / 2
	local position = UDim2.new((dividerX - TabListBack.AbsolutePosition.X) / TabListBack.AbsoluteSize.X, 0, 0, 0)
	if fit then
		TweenService:Create(TabListBack.Divider, fit, {Position = position}):Play()
	else
		TabListBack.Divider.Position = position
	end
end

local function queueTabFit()
	local height = TabRowHeight * (ElementViewportSize.Y.Scale * Main.AbsoluteSize.Y + ElementViewportSize.Y.Offset)
	if height > 0 and TabList.AbsoluteSize.X > 0 and TabListBack.AbsoluteSize.X > 0 then
		local aspect = tabFitAspect
		if aspect == TabRowAspect then
			aspect = math.min(TabList.AbsoluteSize.X * TabFitFloor / height, TabRowAspect)
		end
		local dividerX = (Elements.AbsolutePosition.X + Elements.AbsoluteSize.X + TabList.AbsolutePosition.X + (TabList.AbsoluteWindowSize.X - math.round(height) * aspect) / 2) / 2
		TabListBack.Divider.Position = UDim2.new((dividerX - TabListBack.AbsolutePosition.X) / TabListBack.AbsoluteSize.X, 0, 0, 0)
	end

	tabFitQueued = tabFitQueued + 1
	local queued = tabFitQueued
	task.delay(0.35, function()
		if queued == tabFitQueued then fitTabsToTitles() end
	end)
end


TabListBack.BackgroundTransparency = 1
TabList.Placeholder.Title.TextTransparency = 1
TabListBack.BackgroundTransparency = 1
TabListBack.AnchorPoint = Vector2.new(TabListBack.AnchorPoint.X, 0)
TabListBack.Divider.AnchorPoint = Vector2.new(0.5, 0)
TabListBack.Divider.Size = UDim2.new(0, 1, 0, 0)

-- Both dividers are a 1px hairline in the theme's Divider colour, which is pure white in
-- every theme but Yellow2. Drawn opaque they read as a seam rather than a separator.
local DividerTransparency = 0.82

TabList.ScrollBarThickness = 5

Rayfield.DisplayOrder = BackgroundTest and 0 or 100
LoadingFrame.Version.Text = Release

Rayfield.Enabled = true



--Variables

local request = (syn and syn.request) or (http and http.request) or http_request
local CFileName = nil
local CEnabled = false
local Minimised = false
local Hidden = false
local Debounce = false
local clicked = false
local SearchHided = true
local Notifications = Rayfield.Notifications

local SelectedTheme = RayfieldLibrary.Theme[_G.Theme or _G.RayfieldTheme or "Yellow"]
Topbar.Search.ImageColor3 = SelectedTheme.SearchIcon
Topbar.Hide.ImageColor3 = SelectedTheme.XIcon


local function ChangeTheme(ThemeName)
	SelectedTheme = RayfieldLibrary.Theme[ThemeName]
	for _, obj in ipairs(Rayfield:GetDescendants()) do
		if obj.ClassName == "TextLabel" or obj.ClassName == "TextBox" or obj.ClassName == "TextButton" then
			if SelectedTheme.TextFont ~= "Default" then 
				obj.TextColor3 = SelectedTheme.TextColor
				obj.Font = SelectedTheme.TextFont
			end
		end
	end

	Rayfield.Main.BackgroundColor3 = SelectedTheme.LoadingBackground
	Rayfield.Main.Topbar.BackgroundColor3 = SelectedTheme.Topbar
	Rayfield.Main.Topbar.CornerRepair.BackgroundColor3 = SelectedTheme.Topbar
	Rayfield.Main.Shadow.Image.ImageColor3 = SelectedTheme.Shadow

	Rayfield.Main.Topbar.Hide.ImageColor3 = SelectedTheme.XIcon
	Rayfield.Main.Topbar.Search.ImageColor3 = SelectedTheme.SearchIcon
	SearchBar.BackgroundColor3 = SelectedTheme.ElementBackground
	SearchBar.UIStroke.Color = SelectedTheme.ElementStroke
	SearchInput.PlaceholderColor3 = SelectedTheme.PlaceholderColor
	if SearchInputFrame then
		SearchInputFrame.BackgroundColor3 = SelectedTheme.InputBackground
		if SearchInputFrame:FindFirstChild("UIStroke") then
			SearchInputFrame.UIStroke.Color = SelectedTheme.InputStroke
		end
	end
	if SearchTitle then
		SearchTitle.TextColor3 = SelectedTheme.TextColor
	end

	for _, TabPage in ipairs(Elements:GetChildren()) do
		for _, Element in ipairs(TabPage:GetChildren()) do
			if Element.ClassName == "Frame" and Element.Name ~= "Placeholder" and Element.Name ~= "SectionSpacing" and Element.Name ~= "SectionTitle"  then
				Element.BackgroundColor3 = SelectedTheme.ElementBackground
				Element.UIStroke.Color = SelectedTheme.ElementStroke
				if Element:FindFirstChild("Switch") then
					Element.Switch.UIStroke.Color = SelectedTheme.ElementStroke
				end
			end
		end
	end

end
local function ColorDragger()

end
local function AddDraggingFunctionality(DragPoint, Main)
	pcall(function()
		local Dragging, DragInput, MousePos, FramePos = false,false,false,false
		DragPoint.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				Dragging = true
				MousePos = Input.Position
				FramePos = Main.Position

				Input.Changed:Connect(function()
					if Input.UserInputState == Enum.UserInputState.End then
						Dragging = false
					end
				end)
			end
		end)
		DragPoint.InputChanged:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseMovement then
				DragInput = Input
			end
		end)
		UserInputService.InputChanged:Connect(function(Input)
			if Input == DragInput and Dragging then
				local Delta = Input.Position - MousePos
				TweenService:Create(Main, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position  = UDim2.new(FramePos.X.Scale,FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)}):Play()
			end
		end)
	end)
end   

local function PackColor(Color)
	return {R = Color.R * 255, G = Color.G * 255, B = Color.B * 255}
end    

local function UnpackColor(Color)
	return Color3.fromRGB(Color.R, Color.G, Color.B)
end

local LoadingConfiguration = false

local function LoadConfiguration(Configuration)
	LoadingConfiguration = true
	pcall(function()
		local Data = HttpService:JSONDecode(Configuration)
		table.foreach(Data, function(FlagName, FlagValue)
			if RayfieldLibrary.Flags[FlagName] then
				spawn(function()
					if RayfieldLibrary.Flags[FlagName].Type == "Colorpicker" then
						RayfieldLibrary.Flags[FlagName]:Set(UnpackColor(FlagValue))
					else
						if RayfieldLibrary.Flags[FlagName].CurrentValue or RayfieldLibrary.Flags[FlagName].CurrentKeybind or RayfieldLibrary.Flags[FlagName].CurrentOption ~= FlagValue then RayfieldLibrary.Flags[FlagName]:Set(FlagValue, nil, nil, nil, true, true) end
					end    
				end)
			else
				--RayfieldLibrary:Notify({Title = "Flag Error", Content = "Rayfield was unable to find '"..FlagName.. "'' in the current script"})
			end
		end)
	end)
	task.delay(2, function()
		LoadingConfiguration = false
	end)
end

local function SaveConfiguration()
	--warn("save configuariton called")
	if LoadingConfiguration then return end
	if not _G.NowLoaded then return end
	if not CEnabled then return end
	--warn("--2")
	local Data = {}
	for i,v in pairs(RayfieldLibrary.Flags) do
		if v.Type == "Colorpicker" then
			Data[i] = PackColor(v.CurrentValue)
		else
            if v.DontSaveCurrentValue and v.PreviousValue ~= nil then
				--warn("ok dont save config we are goign to set to", v.PreviousValue)
                Data[i] = v.PreviousValue
            else
			    Data[i] = (v.SelectedOptions and game:GetService("HttpService"):JSONEncode(v.SelectedOptions)) or v.CurrentValue or v.CurrentKeybind or v.CurrentOption
            end
			if Data[i] == nil then
				Data[i] = false
			end
		end
	end
	--warn("--3")
	local config = _G._ACTIVECONFIG
	config = config or "main"
	local saveName = string.format("%s/%s%s%s", ConfigurationFolder, CFileName, config, ConfigurationExtension)
	writefile(saveName, tostring(HttpService:JSONEncode(Data)))
	--warn("--4")
end

local neon = (function()  --Open sourced neon module
	local module = {}

	do
		local function IsNotNaN(x)
			return x == x
		end
		local continued = IsNotNaN(Camera:ScreenPointToRay(0,0).Origin.x)
		while not continued do
			RunService.RenderStepped:wait()
			continued = IsNotNaN(Camera:ScreenPointToRay(0,0).Origin.x)
		end
	end
	local RootParent = Camera
	if false == nil then
		RootParent = Camera
	else
		if not false then
			RootParent = Camera
		else 
			RootParent = nil
		end
	end


	local binds = {}
	local root = Instance.new('Folder', RootParent)
	root.Name = 'neon'


	local GenUid; do
		local id = 0
		function GenUid()
			id = id + 1
			return 'neon::'..tostring(id)
		end
	end

	local DrawQuad; do
		local acos, max, pi, sqrt = math.acos, math.max, math.pi, math.sqrt
		local sz = 0.2

		local function DrawTriangle(v1, v2, v3, p0, p1)
			local s1 = (v1 - v2).magnitude
			local s2 = (v2 - v3).magnitude
			local s3 = (v3 - v1).magnitude
			local smax = max(s1, s2, s3)
			local A, B, C
			if s1 == smax then
				A, B, C = v1, v2, v3
			elseif s2 == smax then
				A, B, C = v2, v3, v1
			elseif s3 == smax then
				A, B, C = v3, v1, v2
			end

			local para = ( (B-A).x*(C-A).x + (B-A).y*(C-A).y + (B-A).z*(C-A).z ) / (A-B).magnitude
			local perp = sqrt((C-A).magnitude^2 - para*para)
			local dif_para = (A - B).magnitude - para

			local st = CFrame.new(B, A)
			local za = CFrame.Angles(pi/2,0,0)

			local cf0 = st

			local Top_Look = (cf0 * za).lookVector
			local Mid_Point = A + CFrame.new(A, B).LookVector * para
			local Needed_Look = CFrame.new(Mid_Point, C).LookVector
			local dot = Top_Look.x*Needed_Look.x + Top_Look.y*Needed_Look.y + Top_Look.z*Needed_Look.z

			local ac = CFrame.Angles(0, 0, acos(dot))

			cf0 = cf0 * ac
			if ((cf0 * za).lookVector - Needed_Look).magnitude > 0.01 then
				cf0 = cf0 * CFrame.Angles(0, 0, -2*acos(dot))
			end
			cf0 = cf0 * CFrame.new(0, perp/2, -(dif_para + para/2))

			local cf1 = st * ac * CFrame.Angles(0, pi, 0)
			if ((cf1 * za).lookVector - Needed_Look).magnitude > 0.01 then
				cf1 = cf1 * CFrame.Angles(0, 0, 2*acos(dot))
			end
			cf1 = cf1 * CFrame.new(0, perp/2, dif_para/2)

			if not p0 then
				p0 = Instance.new('Part')
				p0.FormFactor = 'Custom'
				p0.TopSurface = 0
				p0.BottomSurface = 0
				p0.Anchored = true
				p0.CanCollide = false
				p0.Material = 'Glass'
				p0.Size = Vector3.new(sz, sz, sz)
				local mesh = Instance.new('SpecialMesh', p0)
				mesh.MeshType = 2
				mesh.Name = 'WedgeMesh'
			end
			p0.WedgeMesh.Scale = Vector3.new(0, perp/sz, para/sz)
			p0.CFrame = cf0

			if not p1 then
				p1 = p0:clone()
			end
			p1.WedgeMesh.Scale = Vector3.new(0, perp/sz, dif_para/sz)
			p1.CFrame = cf1

			return p0, p1
		end

		function DrawQuad(v1, v2, v3, v4, parts)
			parts[1], parts[2] = DrawTriangle(v1, v2, v3, parts[1], parts[2])
			parts[3], parts[4] = DrawTriangle(v3, v2, v4, parts[3], parts[4])
		end
	end

	function module:BindFrame(frame, properties)
		if RootParent == nil then return end
		if binds[frame] then
			return binds[frame].parts
		end

		local uid = GenUid()
		local parts = {}
		local f = Instance.new('Folder', root)
		f.Name = frame.Name

		local parents = {}
		do
			local function add(child)
				if child:IsA'GuiObject' then
					parents[#parents + 1] = child
					add(child.Parent)
				end
			end
			add(frame)
		end

		local function UpdateOrientation(fetchProps)
			local zIndex = 1 - 0.05*frame.ZIndex
			local tl, br = frame.AbsolutePosition, frame.AbsolutePosition + frame.AbsoluteSize
			local tr, bl = Vector2.new(br.x, tl.y), Vector2.new(tl.x, br.y)
			do
				local rot = 0;
				for _, v in ipairs(parents) do
					rot = rot + v.Rotation
				end
				if rot ~= 0 and rot%180 ~= 0 then
					local mid = tl:lerp(br, 0.5)
					local s, c = math.sin(math.rad(rot)), math.cos(math.rad(rot))
					local vec = tl
					tl = Vector2.new(c*(tl.x - mid.x) - s*(tl.y - mid.y), s*(tl.x - mid.x) + c*(tl.y - mid.y)) + mid
					tr = Vector2.new(c*(tr.x - mid.x) - s*(tr.y - mid.y), s*(tr.x - mid.x) + c*(tr.y - mid.y)) + mid
					bl = Vector2.new(c*(bl.x - mid.x) - s*(bl.y - mid.y), s*(bl.x - mid.x) + c*(bl.y - mid.y)) + mid
					br = Vector2.new(c*(br.x - mid.x) - s*(br.y - mid.y), s*(br.x - mid.x) + c*(br.y - mid.y)) + mid
				end
			end
			DrawQuad(
				Camera:ScreenPointToRay(tl.x, tl.y, zIndex).Origin, 
				Camera:ScreenPointToRay(tr.x, tr.y, zIndex).Origin, 
				Camera:ScreenPointToRay(bl.x, bl.y, zIndex).Origin, 
				Camera:ScreenPointToRay(br.x, br.y, zIndex).Origin, 
				parts
			)
			if fetchProps then
				for _, pt in pairs(parts) do
					pt.Parent = f
				end
				for propName, propValue in pairs(properties) do
					for _, pt in pairs(parts) do
						pt[propName] = propValue
					end
				end
			end
		end

		UpdateOrientation(true)
		RunService:BindToRenderStep(uid, 2000, UpdateOrientation)

		binds[frame] = {
			uid = uid;
			parts = parts;
		}
		return binds[frame].parts
	end

	function module:Modify(frame, properties)
		local parts = module:GetBoundParts(frame)
		if parts then
			for propName, propValue in pairs(properties) do
				for _, pt in pairs(parts) do
					pt[propName] = propValue
				end
			end
		end
	end

	function module:UnbindFrame(frame)
		if RootParent == nil then return end
		local cb = binds[frame]
		if cb then
			RunService:UnbindFromRenderStep(cb.uid)
			for _, v in pairs(cb.parts) do
				v:Destroy()
			end
			binds[frame] = nil
		end
	end

	function module:HasBinding(frame)
		return binds[frame] ~= nil
	end

	function module:GetBoundParts(frame)
		return binds[frame] and binds[frame].parts
	end


	return module


end)()
local function ClosePrompt()
	local PromptUI = Prompt.Prompt
	clicked = false
	TweenService:Create(Prompt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(PromptUI, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 1,Size = UDim2.new(0,340,0,140)}):Play()
	TweenService:Create(PromptUI.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	TweenService:Create(PromptUI.Title, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(PromptUI.Content, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(PromptUI.Sub, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	for _,button in pairs(PromptUI.Buttons:GetChildren()) do
		if button.Name ~= 'Template' and button:IsA("Frame") then
			TweenService:Create(button.UIStroke,TweenInfo.new(0.2, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
			TweenService:Create(button.TextLabel,TweenInfo.new(0.2, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
			delay(.2,function()
				button:Destroy()
			end)
		end
	end
	wait(.5)
	Prompt.Visible = false
end
function RayfieldLibrary:Notify(NotificationSettings)
	spawn(function()
			if NotificationSettings.Content and NotificationSettings.Content:lower():match("frappe") then return end
			if NotificationSettings.Title and NotificationSettings.Title:lower():match("frappe") then return end
		local ActionCompleted = true
		local Notification = Notifications.Template:Clone()
		Notification.Parent = Notifications
		Notification.Name = NotificationSettings.Title or "Unknown Title"
		Notification.Visible = true

		local blurlight = nil
		if not false then
			blurlight = Instance.new("DepthOfFieldEffect",game:GetService("Lighting"))
			blurlight.Enabled = true
			blurlight.FarIntensity = 0
			blurlight.FocusDistance = 51.6
			blurlight.InFocusRadius = 50
			blurlight.NearIntensity = 1
			game:GetService("Debris"):AddItem(script,0)
		end

		Notification.Actions.Template.Visible = false

		if NotificationSettings.Actions then
			for _, Action in pairs(NotificationSettings.Actions) do
				ActionCompleted = false
				local NewAction = Notification.Actions.Template:Clone()
				NewAction.BackgroundColor3 = SelectedTheme.NotificationActionsBackground
				if SelectedTheme ~= RayfieldLibrary.Theme.Default then
					NewAction.TextColor3 = SelectedTheme.TextColor
				end
				NewAction.Name = Action.Name
				NewAction.Visible = true
				NewAction.Parent = Notification.Actions
				NewAction.Text = Action.Name
				NewAction.BackgroundTransparency = 1
				NewAction.TextTransparency = 1
				NewAction.Size = UDim2.new(0, NewAction.TextBounds.X + 27, 0, 36)

				NewAction.MouseButton1Click:Connect(function()
					local Success, Response = pcall(Action.Callback)
					if not Success then
						--print("Rayfield | Action: "..Action.Name.." Callback Error " ..tostring(Response))
					end
					ActionCompleted = true
				end)
			end
		end
		Notification.BackgroundColor3 = SelectedTheme.Background
		Notification.Title.Text = NotificationSettings.Title or "Unknown"
		Notification.Title.TextTransparency = 1
		Notification.Title.TextColor3 = SelectedTheme.TextColor
		Notification.Description.Text = NotificationSettings.Content or "Unknown"
		Notification.Description.TextTransparency = 1
		Notification.Description.TextColor3 = SelectedTheme.TextColor
		Notification.Icon.ImageColor3 = SelectedTheme.TextColor
		if NotificationSettings.Image then
			Notification.Icon.Image = "rbxassetid://"..tostring(NotificationSettings.Image) 
		else
			Notification.Icon.Image = "rbxassetid://3944680095"
		end

		Notification.Icon.ImageTransparency = 1

		Notification.Parent = Notifications
		Notification.Size = UDim2.new(0.604, 0,0.149, 0)
		Notification.BackgroundTransparency = 1

		TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0.687, 0,0.17, 0)}):Play()
		TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.1}):Play()
		Notification:TweenPosition(UDim2.new(0.5,0,0.915,0),'Out','Quint',0.8,true)

		wait(0.3)
		TweenService:Create(Notification.Icon, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
		TweenService:Create(Notification.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
		TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.2}):Play()
		wait(0.2)



		-- Requires Graphics Level 8-10
		if false == nil then
			TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.4}):Play()
		else
			if not false then
				TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.4}):Play()
			else 
				TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			end
		end

		if Rayfield.Name == "Rayfield" then
			neon:BindFrame(Notification.BlurModule, {
				Transparency = 0.98;
				BrickColor = BrickColor.new("Institutional white");
			})
		end

		if not NotificationSettings.Actions then
			wait(NotificationSettings.Duration or NotificationDuration - 0.5)
		else
			wait(0.8)
			TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Size = UDim2.new(0.996, 0,0.246, 0)}):Play()
			wait(0.3)
			for _, Action in ipairs(Notification.Actions:GetChildren()) do
				if Action.ClassName == "TextButton" and Action.Name ~= "Template" then
					TweenService:Create(Action, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.2}):Play()
					TweenService:Create(Action, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
					wait(0.05)
				end
			end
		end

		repeat wait(0.001) until ActionCompleted

		for _, Action in ipairs(Notification.Actions:GetChildren()) do
			if Action.ClassName == "TextButton" and Action.Name ~= "Template" then
				TweenService:Create(Action, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
				TweenService:Create(Action, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
			end
		end

		TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Position = UDim2.new(0.47, 0,0.234, 0)}):Play()
		TweenService:Create(Notification.Description, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {Position = UDim2.new(0.528, 0,0.637, 0)}):Play()
		TweenService:Create(Notification, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0.626, 0,0.155, 0)}):Play()
		TweenService:Create(Notification.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
		TweenService:Create(Notification, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.6}):Play()

		wait(0.3)
		TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.4}):Play()
		TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.5}):Play()
		wait(0.4)
		TweenService:Create(Notification, TweenInfo.new(0.9, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 0,0, 0)}):Play()
		TweenService:Create(Notification, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
		TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
		TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
		wait(0.2)
		if not false then
			neon:UnbindFrame(Notification.BlurModule)
			blurlight:Destroy()
		end
		wait(0.9)
		Notification:Destroy()
	end)
end

local function Hide()
	Debounce = true
	RayfieldLibrary:Notify({Title = "Interface Hidden", Content = "Tap Tab or the floating icon to bring the interface back.", Duration = 7})
	--TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 470, 0, 400)}):Play()
	--TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 470, 0, 45)}):Play()
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Main.Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Main.Topbar.CornerRepair, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Main.Topbar.Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	TweenService:Create(Main.UIStroke, TweenInfo.new(.25, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	TweenService:Create(Main.TabListBack.Divider, TweenInfo.new(.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Main.TabList.Placeholder.Title, TweenInfo.new(.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(CustomText, TweenInfo.new(.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	TweenService:Create(CustomText.UIStroke, TweenInfo.new(.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	TweenService:Create(TabList, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
	for _, TopbarButton in ipairs(Topbar:GetChildren()) do
		if TopbarButton.ClassName == "ImageButton" then
			TweenService:Create(TopbarButton, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
		end
	end
	for _, tabbtn in ipairs(TabList:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
			TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
			TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
			TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
			TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
			TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
		end
	end
	for _, tab in ipairs(Elements:GetChildren()) do
		if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
			TweenService:Create(tab, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
			for _, element in ipairs(tab:GetChildren()) do
				if element.ClassName == "Frame" then
					if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" then
						if element.Name == "SectionTitle" then
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						else
							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
							TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						end
						for _, child in ipairs(element:GetChildren()) do
							if child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel" then
								child.Visible = false
							end
						end
					end
				end
			end
		end
	end
	wait(0.5)
	Main.Visible = false
	Debounce = false
end

local function Unhide()
	Debounce = true
	--Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Visible = true
	--TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(.5, 0,0.5, 0)}):Play()
	--TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0.999, 0,0.095, 0)}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0.4}):Play()
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Main.Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = DividerTransparency}):Play()
	TweenService:Create(Main.Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Main.Topbar.Title, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	TweenService:Create(Main.UIStroke, TweenInfo.new(1, Enum.EasingStyle.Quint), {Transparency = 0.1}):Play()
	TweenService:Create(Main.TabListBack.Divider, TweenInfo.new(.5, Enum.EasingStyle.Quint), {BackgroundTransparency = DividerTransparency}):Play()
	TweenService:Create(Main.TabList.Placeholder.Title, TweenInfo.new(.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	TweenService:Create(CustomText, TweenInfo.new(.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	TweenService:Create(CustomText.UIStroke, TweenInfo.new(.5, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
	TweenService:Create(TabList, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 0}):Play()
	if Minimised then
		spawn(Maximise)
	end
	for _, TopbarButton in ipairs(Topbar:GetChildren()) do
		if TopbarButton.ClassName == "ImageButton" then
			local Goal = table.clone(TopbarButtonRest[TopbarButton])
			if TopbarButton == Topbar.Hide then Goal.ImageColor3 = SelectedTheme.XIcon end
			TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), Goal):Play()
		end
	end
	for _, tabbtn in ipairs(TabList:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
			if tostring(Elements.UIPageLayout.CurrentPage) == tabbtn.Title.Text then
				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
				TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
				TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()
				TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
				TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
			else
				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
				TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
				TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.7}):Play()
				TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
				TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			end

		end
	end
	for _, tab in ipairs(Elements:GetChildren()) do
		if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
			TweenService:Create(tab, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 0}):Play()
			for _, element in ipairs(tab:GetChildren()) do
				if element.ClassName == "Frame" then
					if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" and element.Name ~= "Space" then
						if element.Name == "SectionTitle" then
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						else
							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
							TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						end
						for _, child in ipairs(element:GetChildren()) do
							if child.Name ~= 'Description' and (child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel") then
								child.Visible = true
							end
						end
					end
				end
			end
		end
	end
	wait(0.5)
	Minimised = false
	Debounce = false
end

local searchNavigate
local searchArmed
local CloseSearch, OpenSearch
local SearchHitName = "SearchHit"
local SearchDragPixels = 12
local SearchScrollPixels = 6

local SearchResults = Elements.Template:Clone()
SearchResults.Name = "SearchResults"
SearchResults.Visible = false
SearchResults.ZIndex = Elements.ZIndex
SearchResults.BackgroundTransparency = 1
for _, Child in ipairs(SearchResults:GetChildren()) do
	if Child:IsA("Frame") then
		Child:Destroy()
	end
end
SearchResults.Size = Elements.Size
SearchResults.Position = Elements.Position
SearchResults.AnchorPoint = Elements.AnchorPoint
SearchResults.Parent = Main

-- Searchbar sits on the first row of the element column. A pad the same height
-- keeps result rows from starting underneath it (and under its Global ZIndex).
local SearchPad = Instance.new("Frame")
SearchPad.Name = "SearchPad"
SearchPad.BackgroundTransparency = 1
SearchPad.BorderSizePixel = 0
SearchPad.Size = UDim2.new(1, -10, 0, 0)
SearchPad.LayoutOrder = -1
SearchPad.ZIndex = SearchResults.ZIndex
SearchPad.Parent = SearchResults
local SearchPadAspect = Elements.Template.Button.UIAspectRatioConstraint:Clone()
SearchPadAspect.Parent = SearchPad
SearchPadAspect.AspectRatio = ElementRowAspect

local function clearSearchResults()
	for _, Child in ipairs(SearchResults:GetChildren()) do
		if Child:IsA("Frame") and Child ~= SearchPad then
			local hit = Child:FindFirstChild(SearchHitName)
			if hit then
				hit:Destroy()
			end
			Child:Destroy()
		end
	end
	SearchResults.Visible = false
end

local function isSearchableElement(element)
	return element:IsA("Frame")
		and element.Name ~= "Placeholder"
		and element.Name ~= "SectionSpacing"
		and element.Name ~= "SectionTitle"
		and not element:GetAttribute("SectionTitle")
end

local function forEachPageElement(fn)
	for _, page in ipairs(Elements:GetChildren()) do
		if page.Name ~= "Template" and page:IsA("ScrollingFrame") then
			for _, element in ipairs(page:GetChildren()) do
				fn(page, element)
			end
		end
	end
end

local function silenceInteract(element)
	for _, child in ipairs(element:GetDescendants()) do
		if child:IsA("GuiButton") or child:IsA("TextBox") then
			if child:GetAttribute("SearchPrevActive") == nil then
				child:SetAttribute("SearchPrevActive", child.Active)
			end
			child.Active = false
		end
	end
end

local function restoreInteract(element)
	for _, child in ipairs(element:GetDescendants()) do
		if child:IsA("GuiButton") or child:IsA("TextBox") then
			local prev = child:GetAttribute("SearchPrevActive")
			if prev ~= nil then
				child.Active = prev
				child:SetAttribute("SearchPrevActive", nil)
			end
		end
	end
end

local function searchReleaseIsClick(startPos, endPos, startCanvas, endCanvas)
	return (endPos - startPos).Magnitude <= SearchDragPixels
		and (endCanvas - startCanvas).Magnitude <= SearchScrollPixels
end

local function clearSearchHit(element)
	local hit = element:FindFirstChild(SearchHitName)
	if searchArmed and searchArmed.element == element then
		searchArmed = nil
	end
	if hit then
		hit:Destroy()
	end
	restoreInteract(element)
end

local function restoreSearchVisibility()
	searchArmed = nil
	clearSearchResults()
	Elements.Visible = true
	forEachPageElement(function(_, element)
		if element:IsA("Frame") and element.Name ~= "Placeholder" and element.Name ~= "SectionSpacing" then
			element.Visible = true
		end
		if isSearchableElement(element) then
			clearSearchHit(element)
		end
	end)
end

local function goToSearchElement(page, element)
	if not page or not element or not element.Parent then
		return
	end
	local tabName = element:GetAttribute("SearchTab") or page.Name
	local elementName = element:GetAttribute("SearchElement") or element.Name
	SearchHided = true
	restoreSearchVisibility()
	task.spawn(CloseSearch)
	task.spawn(function()
		task.wait()
		if searchNavigate then
			searchNavigate(tabName, elementName)
		end
	end)
end

local function setSearchHit(page, element, enabled)
	local hit = element:FindFirstChild(SearchHitName)
	if not enabled then
		clearSearchHit(element)
		return
	end
	if hit then
		return
	end
	silenceInteract(element)
	hit = Instance.new("TextButton")
	hit.Name = SearchHitName
	hit.BackgroundTransparency = 1
	hit.Text = ""
	hit.AutoButtonColor = false
	hit.Selectable = false
	hit.BorderSizePixel = 0
	hit.Size = UDim2.fromScale(1, 1)
	hit.Position = UDim2.fromScale(0, 0)
	hit.ZIndex = element.ZIndex + 1
	hit.Parent = element
	hit.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		searchArmed = {
			page = page,
			element = element,
			pos = Vector2.new(input.Position.X, input.Position.Y),
			canvas = page.CanvasPosition,
		}
	end)
end

local function applySearchFilter()
	local InputText = string.upper(SearchInput.Text)
	local searching = not SearchHided and InputText ~= ""
	clearSearchResults()
	if not searching then
		Elements.Visible = true
		forEachPageElement(function(_, element)
			if element:IsA("Frame") and element.Name ~= "Placeholder" and element.Name ~= "SectionSpacing" then
				element.Visible = true
			end
			if isSearchableElement(element) then
				clearSearchHit(element)
			end
		end)
		return
	end
	Elements.Visible = false
	SearchResults.Visible = true
	SearchResults.ZIndex = Elements.ZIndex
	SearchResults.BackgroundTransparency = 1
	forEachPageElement(function(page, element)
		if not isSearchableElement(element) then
			return
		end
		if custom_match(string.upper(element.Name), InputText) == nil then
			return
		end
		local row = Elements.Template.Button:Clone()
		row.Name = page.Name.." :: "..element.Name
		row.Title.Text = element.Name
		row:SetAttribute("SearchTab", page.Name)
		row:SetAttribute("SearchElement", element.Name)
		row.Visible = true
		row.BackgroundTransparency = 0
		row.UIStroke.Transparency = 0
		row.Title.TextTransparency = 0
		row.ZIndex = Elements.ZIndex + 1
		row.Title.ZIndex = row.ZIndex
		row.BackgroundColor3 = SelectedTheme.ElementBackground
		row.UIStroke.Color = SelectedTheme.ElementStroke
		local Interact = row:FindFirstChild("Interact")
		if Interact then
			Interact:Destroy()
		end
		row.Parent = SearchResults
		setSearchHit(SearchResults, row, true)
	end)
end

local function finishSearchPress(endPos, endCanvas)
	local armed = searchArmed
	searchArmed = nil
	if not armed or SearchHided or not armed.element or not armed.element.Parent then
		return false
	end
	if not searchReleaseIsClick(armed.pos, endPos, armed.canvas, endCanvas or armed.page.CanvasPosition) then
		return false
	end
	goToSearchElement(armed.page, armed.element)
	return true
end

CloseSearch = function()
	SearchHided = true
	restoreSearchVisibility()
	Debounce = true
	TweenService:Create(SearchBar, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(SearchBar.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	TweenService:Create(SearchBar.Clear, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	TweenService:Create(SearchBar.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	TweenService:Create(SearchBar.Filter, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	TweenService:Create(SearchInput, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	if SearchTitle then
		TweenService:Create(SearchTitle, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
	end
	if SearchInputFrame then
		TweenService:Create(SearchInputFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	end
	delay(.3,function()
		SearchInput.Visible = false
	end)
	wait(0.5)
	SearchBar.Visible = false
	Debounce = false
end

OpenSearch = function()
	if SearchInput.Text ~= "" then
		SearchInput.Text = ""
	end
	SearchHided = false
	Debounce = true
	SearchBar.Visible = true
	SearchInput.Visible = true
	SearchBar.BackgroundColor3 = SelectedTheme.ElementBackground
	SearchBar.UIStroke.Color = SelectedTheme.ElementStroke
	SearchInput.PlaceholderColor3 = SelectedTheme.PlaceholderColor
	if SearchInputFrame then
		SearchInputFrame.BackgroundColor3 = SelectedTheme.InputBackground
		SearchInputFrame.BackgroundTransparency = 0
		if SearchInputFrame:FindFirstChild("UIStroke") then
			SearchInputFrame.UIStroke.Color = SelectedTheme.InputStroke
		end
	end
	TweenService:Create(SearchBar, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(SearchBar.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.5}):Play()
	TweenService:Create(SearchBar.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
	TweenService:Create(SearchBar.Clear, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = .8}):Play()
	TweenService:Create(SearchBar.Filter, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = .8}):Play()
	TweenService:Create(SearchInput, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	if SearchTitle then
		SearchTitle.TextColor3 = SelectedTheme.TextColor
		TweenService:Create(SearchTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	end
	task.wait(.1)
	SearchInput:CaptureFocus()
	wait(0.5)
	Debounce = false
end
SearchInput:GetPropertyChangedSignal('Text'):Connect(applySearchFilter)
UserInputService.InputEnded:Connect(function(input)
	if not searchArmed then
		return
	end
	if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
		return
	end
	local page = searchArmed.page
	finishSearchPress(Vector2.new(input.Position.X, input.Position.Y), page.CanvasPosition)
end)

if BackgroundTest then
	_G.RayfieldSearchDebug = {
		applyFilter = applySearchFilter,
		goTo = goToSearchElement,
		goToNamed = function(tabName, elementName)
			local page = Elements:FindFirstChild(tabName)
			local element = page and page:FindFirstChild(elementName)
			if not page or not element then
				return false
			end
			goToSearchElement(page, element)
			return true
		end,
		isClick = searchReleaseIsClick,
		restore = restoreSearchVisibility,
		isHidden = function()
			return SearchHided
		end,
		query = function()
			return SearchInput.Text 
		end,
		open = function()
			OpenSearch()
		end,
		close = CloseSearch,
		setSearching = function(on)
			SearchHided = not on
		end,
		arm = function(tabName, elementName, pos, canvas)
			local rowName = tabName.." :: "..elementName
			local element = SearchResults:FindFirstChild(rowName)
			local page = SearchResults
			if not element then
				page = Elements:FindFirstChild(tabName)
				element = page and page:FindFirstChild(elementName)
			end
			if not page or not element then
				return false
			end
			searchArmed = {
				page = page,
				element = element,
				pos = pos or Vector2.zero,
				canvas = canvas or page.CanvasPosition,
			}
			return true
		end,
		release = function(endPos, endCanvas)
			return finishSearchPress(endPos or Vector2.zero, endCanvas)
		end,
		results = function()
			local names = {}
			for _, child in ipairs(SearchResults:GetChildren()) do
				if child:IsA("Frame") then
					table.insert(names, child.Name)
				end
			end
			local first = SearchResults:FindFirstChildOfClass("Frame")
			local interactActive = nil
			if first then
				local interact = first:FindFirstChild("Interact")
				interactActive = interact and interact.Active
			end
			return {
				visible = SearchResults.Visible,
				n = #names,
				names = names,
				elementsVisible = Elements.Visible,
				query = SearchInput.Text,
				hidden = SearchHided,
				interactActive = interactActive,
				hasHit = first ~= nil and first:FindFirstChild(SearchHitName) ~= nil,
			}
		end,
	}
end
SearchBar.Clear.MouseButton1Down:Connect(function()
	if SearchInput.Text ~= "" then
		SearchInput.Text = ''
		return
	end
	if Debounce or Minimised then return end
	SearchHided = true
	CloseSearch()
end)

local function Maximise()
	Debounce = true
	Topbar.ChangeSize.Image = "rbxassetid://"..10137941941


	TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 0.4}):Play()
	TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = DividerTransparency}):Play()
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(.5, 0,0.5, 0)}):Play()
	TweenService:Create(Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 45 * 0.85)}):Play()
	TabList.Visible = true
	wait(0.2)

	Elements.Visible = true

	for _, tab in ipairs(Elements:GetChildren()) do
		if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
			for _, element in ipairs(tab:GetChildren()) do
				if element.ClassName == "Frame" then
					if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" then
						if element.Name == "SectionTitle" then
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						else
							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
							TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						end
						for _, child in ipairs(element:GetChildren()) do
							if child.Name ~= 'Description' and (child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel") then
								child.Visible = true
							end
						end
					end
				end
			end
		end
	end


	wait(0.1)

	for _, tabbtn in ipairs(TabList:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
			if tostring(Elements.UIPageLayout.CurrentPage) == tabbtn.Title.Text then
				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
				TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
				TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
				TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
				TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()
			else
				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
				TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.7}):Play()
				TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
				TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
				TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			end

		end
	end


	wait(0.5)
	Debounce = false
end

local function Minimise()
	Debounce = true
	Topbar.ChangeSize.Image = "rbxassetid://"..11036884234

	for _, tabbtn in ipairs(TabList:GetChildren()) do
		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
			TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
			TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
			TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
			TweenService:Create(tabbtn.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
			TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
		end
	end

	for _, tab in ipairs(Elements:GetChildren()) do
		if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
			for _, element in ipairs(tab:GetChildren()) do
				if element.ClassName == "Frame" then
					if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" then
						if element.Name == "SectionTitle" then
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						else
							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
							TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						end
						for _, child in ipairs(element:GetChildren()) do
							if child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel" then
								child.Visible = false
							end
						end
					end
				end
			end
		end
	end

	TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
	TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 495, 0, 45)}):Play()
	TweenService:Create(Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 495, 0, 45 * 0.85)}):Play()

	wait(0.3)

	Elements.Visible = false
	TabList.Visible = false

	wait(0.2)
	Debounce = false
end

-- Intro timing: the waits in here are deliberate, not leftovers. Shortening them measurably cost
-- sales, which is the labor illusion (Buell & Norton, Management Science 57(9), 2011): a wait that
-- shows effort is valued more highly than an instant result, even when the result is identical.
-- Their limit was a decline past roughly 30s, so a few seconds is well inside it. A blind wait is
-- the weak version of the effect, so the card breathes and the window assembles a piece at a time
-- rather than sitting frozen. Rejoins pass FastLoad (ScriptManager:QueueFastLoad) and skip all of
-- it, so this only ever runs on a first manual execution, which is exactly the deciding moment.
function RayfieldLibrary:CreateWindow(Settings, wl)

	local fastLoad = Settings.FastLoad

	local ShellCorner = UDim.new(0, 12)
	Main.UICorner.CornerRadius = ShellCorner
	Topbar.UICorner.CornerRadius = ShellCorner
	Topbar.CornerRepair.AnchorPoint = Vector2.new(0.5, 1)
	Topbar.CornerRepair.Position = UDim2.new(0.5, 0, 1, 0)
	Topbar.CornerRepair.Size = UDim2.new(1, 0, 0, 12)
	Main.UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Main.UIStroke.BorderStrokePosition = Enum.BorderStrokePosition.Inner
	Main.UIStroke.LineJoinMode = Enum.LineJoinMode.Round
	Main.UIStroke.Thickness = 2
	Topbar.UIStroke.BorderStrokePosition = Enum.BorderStrokePosition.Inner
	Topbar.UIStroke.LineJoinMode = Enum.LineJoinMode.Round

	local Passthrough = false
	Topbar.Title.Text = Settings.Name
	Main.Size = UDim2.new(0, 450, 0, 260)
	Main.Visible = true
	Main.BackgroundTransparency = 1
	LoadingFrame.Title.TextTransparency = 1
	LoadingFrame.Subtitle.TextTransparency = 1
	Main.Shadow.Image.ImageTransparency = 1
	LoadingFrame.Version.TextTransparency = 1
	LoadingFrame.BG.Image = Settings.PreloadImage or "rbxassetid://98323186589806"

	Main.Visible = true

	--local id = "rbxassetid://98323186589806"

	--[[
	task.spawn(function()
		game:GetService("ContentProvider"):PreloadAsync({Instance.new("ImageLabel")})
		LoadingFrame.BG.Image = id
	end)
	
	task.delay(5, function()
		if LoadingFrame.BG.Image ~= id then
			LoadingFrame.BG.Image = id
		end
	end)
	]]


	LoadingFrame.BG.ImageTransparency = 1

	-- The loading card is the rounded window at its smallest, but the artwork is a plain
	-- ImageLabel inside a parent that does not clip, so it squared the window's corners off
	-- for the whole intro. Matching Main's radius keeps the card the same shape it opens into.
	local LoadingCorner = LoadingFrame.BG:FindFirstChildOfClass("UICorner") or Instance.new("UICorner")
	LoadingCorner.CornerRadius = Main.UICorner.CornerRadius
	LoadingCorner.Parent = LoadingFrame.BG

	LoadingFrame.Title.Text = Settings.LoadingTitle or "Rayfield Interface Suite"
	LoadingFrame.Subtitle.Text = Settings.LoadingSubtitle or "by Sirius"
	if Settings.LoadingTitle ~= "Rayfield Interface Suite" then
		LoadingFrame.Version.Text = "Rayfield UI"
	end
	Topbar.Visible = false
	Elements.Visible = false
	LoadingFrame.Visible = true


	pcall(function()
		if not Settings.ConfigurationSaving.FileName then
			Settings.ConfigurationSaving.FileName = tostring(game.PlaceId)
		end
		if not isfolder(RayfieldFolder.."/".."Configuration Folders") then

		end
		if Settings.ConfigurationSaving.Enabled == nil then
			Settings.ConfigurationSaving.Enabled = false
		end
		CFileName = Settings.ConfigurationSaving.FileName
		ConfigurationFolder = Settings.ConfigurationSaving.FolderName or ConfigurationFolder
		CEnabled = Settings.ConfigurationSaving.Enabled

		if Settings.ConfigurationSaving.Enabled then
			if not isfolder(ConfigurationFolder) then
				makefolder(ConfigurationFolder)
			end	
		end
	end)

	AddDraggingFunctionality(Topbar,Main)

	for _, TabButton in ipairs(TabList:GetChildren()) do
		if TabButton.ClassName == "Frame" and TabButton.Name ~= "Placeholder" then
			TabButton.BackgroundTransparency = 1
			TabButton.Title.TextTransparency = 1
			TabButton.Shadow.ImageTransparency = 1
			TabButton.Image.ImageTransparency = 1
			TabButton.UIStroke.Transparency = 1
		end
	end

	if Settings.Discord then
		if not isfolder(RayfieldFolder.."/Discord Invites") then
			makefolder(RayfieldFolder.."/Discord Invites")
		end
		if not isfile(RayfieldFolder.."/Discord Invites".."/"..Settings.Discord.Invite..ConfigurationExtension) then
			if request then
				request({
					Url = 'http://127.0.0.1:6463/rpc?v=1',
					Method = 'POST',
					Headers = {
						['Content-Type'] = 'application/json',
						Origin = 'https://discord.com'
					},
					Body = HttpService:JSONEncode({
						cmd = 'INVITE_BROWSER',
						nonce = HttpService:GenerateGUID(false),
						args = {code = Settings.Discord.Invite}
					})
				})
			end

			if Settings.Discord.RememberJoins then -- We do logic this way so if the developer changes this setting, the user still won't be prompted, only new users
				writefile(RayfieldFolder.."/Discord Invites".."/"..Settings.Discord.Invite..ConfigurationExtension,"Rayfield RememberJoins is true for this invite, this invite will not ask you to join again")
			end
		else

		end
	end

	if Settings.KeySystem then
		if not Settings.KeySettings then
			Passthrough = true
			return
		end

		if not isfolder(RayfieldFolder.."/Key System") then
			makefolder(RayfieldFolder.."/Key System")
		end

		if Settings.KeySettings.GrabKeyFromSite then
			local Success, Response = pcall(function()
				Settings.KeySettings.Key = game:HttpGet(Settings.KeySettings.Key)
			end)
			if not Success then
				--print("Rayfield | "..Settings.KeySettings.Key.." Error " ..tostring(Response))
			end
		end

		if not Settings.KeySettings.FileName then
			Settings.KeySettings.FileName = "No file name specified"
		end

		if isfile(RayfieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension) then
			if readfile(RayfieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension) == Settings.KeySettings.Key then
				Passthrough = true
			end
		end

		if not Passthrough then
			local AttemptsRemaining = math.random(2,6)
			Rayfield.Enabled = false
			local KeyUI = game:GetObjects("rbxassetid://11695805160")[1]
			KeyUI.Enabled = true
			if gethui then
				KeyUI.Parent = gethui()
			elseif syn.protect_gui then
				syn.protect_gui(Rayfield)
				KeyUI.Parent = CoreGui
			else
				KeyUI.Parent = CoreGui
			end

			if gethui then
				for _, Interface in ipairs(gethui():GetChildren()) do
					if Interface.Name == KeyUI.Name and Interface ~= KeyUI then
						Interface.Enabled = false
						Interface.Name = "KeyUI-Old"
					end
				end
			else
				for _, Interface in ipairs(CoreGui:GetChildren()) do
					if Interface.Name == KeyUI.Name and Interface ~= KeyUI then
						Interface.Enabled = false
						Interface.Name = "KeyUI-Old"
					end
				end
			end

			local KeyMain = KeyUI.Main
			KeyMain.Title.Text = Settings.KeySettings.Title or Settings.Name
			KeyMain.Subtitle.Text = Settings.KeySettings.Subtitle or "Key System"
			KeyMain.NoteMessage.Text = Settings.KeySettings.Note or "No instructions"

			KeyMain.Size = UDim2.new(0, 467, 0, 175)
			KeyMain.BackgroundTransparency = 1
			KeyMain.EShadow.ImageTransparency = 1
			KeyMain.Title.TextTransparency = 1
			KeyMain.Subtitle.TextTransparency = 1
			KeyMain.KeyNote.TextTransparency = 1
			KeyMain.Input.BackgroundTransparency = 1
			KeyMain.Input.UIStroke.Transparency = 1
			KeyMain.Input.InputBox.TextTransparency = 1
			KeyMain.NoteTitle.TextTransparency = 1
			KeyMain.NoteMessage.TextTransparency = 1
			KeyMain.Hide.ImageTransparency = 1

			TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 187)}):Play()
			TweenService:Create(KeyMain.EShadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 0.5}):Play()
			if not fastLoad then
				wait(0.05)
			end
			TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			if not fastLoad then
				wait(0.05)
			end
			TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			if not fastLoad then
				wait(0.05)
			end
			TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			if not fastLoad then
				wait(0.15)
			end
			TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 0.3}):Play()


			KeyUI.Main.Input.InputBox.FocusLost:Connect(function()
				if KeyMain.Input.InputBox.Text == Settings.KeySettings.Key then
					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
					TweenService:Create(KeyMain.EShadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
					TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
					TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
					delay(.4,function()
						KeyMain.Hide.Visible = false
					end)
					wait(0.51)
					Passthrough = true
					if Settings.KeySettings.SaveKey then
						if writefile then
							writefile(RayfieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension, Settings.KeySettings.Key)
						end
						RayfieldLibrary:Notify({Title = "Key System", Content = "The key for this script has been saved successfully"})
					end
				else
					if AttemptsRemaining == 0 then
						TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
						TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
						TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
						TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
						TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
						TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
						TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
						wait(0.45)
						game.Players.LocalPlayer:Kick("No Attempts Remaining")
						game:Shutdown()
					end
					KeyMain.Input.InputBox.Text = ""
					AttemptsRemaining = AttemptsRemaining - 1
					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
					TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Elastic), {Position = UDim2.new(0.495,0,0.5,0)}):Play()
					wait(0.1)
					TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Elastic), {Position = UDim2.new(0.505,0,0.5,0)}):Play()
					wait(0.1)
					TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Position = UDim2.new(0.5,0,0.5,0)}):Play()
					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 187)}):Play()
				end
			end)

			KeyMain.Hide.MouseButton1Click:Connect(function()
				TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
				TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 467, 0, 175)}):Play()
				TweenService:Create(KeyMain.EShadow, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
				TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
				TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
				TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
				TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
				wait(0.51)
				RayfieldLibrary:Destroy()
				KeyUI:Destroy()
			end)
		else
			Passthrough = true
		end
	end
	if Settings.KeySystem then
		repeat wait() until Passthrough
	end

	Notifications.Template.Visible = false
	Notifications.Visible = true
	Rayfield.Enabled = true
	if BackgroundTest then
		Main.Position = UDim2.fromScale(3, 0)
	end
	Main.UIStroke.Transparency = 1
	if not fastLoad then
		wait(0.45)
	end
	-- The card, its shadow, its artwork and its border all arrive on one beat. They used to be
	-- split across a blocking wait with the artwork taking nearly twice as long as the card it
	-- sits in, so an empty panel appeared first and filled itself in afterwards.
	TweenService:Create(Main, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {ImageTransparency = 0.55}):Play()
	--[[
	TweenService:Create(LoadingFrame.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	wait(0.05)
	TweenService:Create(LoadingFrame.Subtitle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	wait(0.05)
	TweenService:Create(LoadingFrame.Version, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	]]
	TweenService:Create(Main.UIStroke, TweenInfo.new(1, Enum.EasingStyle.Quint), {Transparency = 0.1, Color = Color3.fromRGB(255,255,255), Thickness = 2}):Play()
	TweenService:Create(LoadingFrame.BG, TweenInfo.new(0.75, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0.08), {ImageTransparency = 0}):Play()

	-- The card is held on screen long enough to be read, so the border sweeps rather than freezes:
	-- a wait showing nothing happening reads as a hang. Rotation is the one thing on the card that
	-- nothing else animates yet, and -180 to 180 is a full turn, so repeating it never jumps.
	-- Anything sharing a property with the tweens above would seize it the moment it played.
	local LoadingSweep = TweenService:Create(Main.UIStroke.UIGradient, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {Rotation = 180})
	LoadingSweep:Play()

	task.spawn(function()
		if not isCurrent() then return end
		_G.UiSizeDown = function(amount)
			local correctSizeX = Main.Size.X.Scale - (amount * 0.12)
			local correctSizeY = Main.Size.Y.Scale - (amount * 0.10)
			--Main.Size = UDim2.new(correctSizeX, 0, correctSizeY, 0)
			TweenService:Create(Main, TweenInfo.new(0.25, Enum.EasingStyle.Exponential), {Size = UDim2.new(correctSizeX, 0, correctSizeY, 0)}):Play()
		end

		_G.UiSizeUp = function(amount)
			local correctSizeX = Main.Size.X.Scale + (amount * 0.12)
			local correctSizeY = Main.Size.Y.Scale + (amount * 0.10)
			--Main.Size = UDim2.new(correctSizeX, 0, correctSizeY, 0)
			TweenService:Create(Main, TweenInfo.new(0.25, Enum.EasingStyle.Exponential), {Size = UDim2.new(correctSizeX, 0, correctSizeY, 0)}):Play()
		end
	end)


	--task.wait(9999)


	Elements.Template.LayoutOrder = 100000
	Elements.Template.Visible = false

	Elements.UIPageLayout.FillDirection = Enum.FillDirection.Horizontal
	TabList.Template.Visible = false

	---- AI CODE



	local scrollingFrame = TabList
	local gridLayout = scrollingFrame:WaitForChild("UIGridLayout")

	scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.None
	local TabPadding = scrollingFrame:FindFirstChildOfClass("UIPadding") or Instance.new("UIPadding")
	TabPadding.Parent = scrollingFrame

	local TabFade = Instance.new("Frame")
	TabFade.Name = "TabTopFade"
	TabFade.Visible = false
	TabFade.Size = UDim2.new(0, 0, 0, 0)
	TabFade.BorderSizePixel = 0
	TabFade.Active = false
	TabFade.ZIndex = Topbar.ZIndex
	TabFade.AnchorPoint = Vector2.new(0, 0)
	TabFade.Parent = Main
	local TabFadeGradient = Instance.new("UIGradient")
	TabFadeGradient.Rotation = 90
	TabFadeGradient.Transparency = NumberSequence.new(0, 1)
	TabFadeGradient.Parent = TabFade
	local TabBottomFade = TabFade:Clone()
	TabBottomFade.Name = "TabBottomFade"
	TabBottomFade.UIGradient.Rotation = 270
	TabBottomFade.Parent = Main

	local function updateTabFade()
		TabFade.BackgroundColor3 = Main.BackgroundColor3
		TabFade.BackgroundTransparency = Main.BackgroundTransparency
		local height = math.round(TabRowHeight * (ElementViewportSize.Y.Scale * Main.AbsoluteSize.Y + ElementViewportSize.Y.Offset))
		local aspect = tabFitAspect
		if height > 0 and aspect == TabRowAspect then
			aspect = math.min(scrollingFrame.AbsoluteSize.X * TabFitFloor / height, TabRowAspect)
		end
		local width = height * aspect
		local inset = (scrollingFrame.AbsoluteWindowSize.X - width) / 2 - 1
		TabFade.Position = UDim2.new(scrollingFrame.Position.X.Scale, scrollingFrame.Position.X.Offset - scrollingFrame.AbsoluteSize.X * scrollingFrame.AnchorPoint.X + inset, scrollingFrame.Position.Y.Scale, scrollingFrame.Position.Y.Offset)
		TabFade.Size = UDim2.new(0, math.ceil(width) + 2, TabFade.Size.Y.Scale, TabFade.Size.Y.Offset)
		TabFade.Visible = scrollingFrame.Visible and Topbar.Visible and not LoadingFrame.Visible and height > 0 and TabFade.AbsoluteSize.Y > 0
		TabBottomFade.Position = UDim2.new(TabFade.Position.X.Scale, TabFade.Position.X.Offset, scrollingFrame.Position.Y.Scale + scrollingFrame.Size.Y.Scale, scrollingFrame.Position.Y.Offset + scrollingFrame.Size.Y.Offset - TabBottomFade.Size.Y.Offset)
		TabBottomFade.Size = UDim2.new(TabFade.Size.X.Scale, TabFade.Size.X.Offset, 0, TabBottomFade.Size.Y.Offset)
		TabBottomFade.BackgroundColor3 = Main.BackgroundColor3
		TabBottomFade.BackgroundTransparency = Main.BackgroundTransparency
		TabBottomFade.Visible = scrollingFrame.Visible and Topbar.Visible and not LoadingFrame.Visible and height > 0 and TabBottomFade.Size.Y.Offset > 0
	end
	Main:GetPropertyChangedSignal("BackgroundColor3"):Connect(updateTabFade)
	Main:GetPropertyChangedSignal("BackgroundTransparency"):Connect(updateTabFade)
	scrollingFrame:GetPropertyChangedSignal("Visible"):Connect(updateTabFade)
	Topbar:GetPropertyChangedSignal("Visible"):Connect(updateTabFade)
	LoadingFrame:GetPropertyChangedSignal("Visible"):Connect(updateTabFade)
	TabListBack.Divider:GetPropertyChangedSignal("Position"):Connect(updateTabFade)
	TabFade:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateTabFade)

	local ElementFadeHeight = 0
	local ElementBottomFadeHeight = 0
	local ElementFade = Instance.new("Frame")
	ElementFade.Name = "ElementTopFade"
	ElementFade.Visible = false
	ElementFade.Size = UDim2.new(0, 0, 0, 0)
	ElementFade.BorderSizePixel = 0
	ElementFade.Active = false
	ElementFade.ZIndex = Topbar.ZIndex + 1
	ElementFade.Parent = Main
	local ElementFadeGradient = Instance.new("UIGradient")
	ElementFadeGradient.Rotation = 90
	ElementFadeGradient.Transparency = NumberSequence.new(0, 1)
	ElementFadeGradient.Parent = ElementFade
	local ElementBottomFade = ElementFade:Clone()
	ElementBottomFade.Name = "ElementBottomFade"
	ElementBottomFade.UIGradient.Rotation = 270
	ElementBottomFade.Parent = Main

	local function updateElementFade()
		local corner = Main.UICorner.CornerRadius
		local radius = math.min(math.min(Main.AbsoluteSize.X, Main.AbsoluteSize.Y) / 2, corner.Scale * math.min(Main.AbsoluteSize.X, Main.AbsoluteSize.Y) + corner.Offset)
		local height = ElementViewportSize.Y.Scale * Main.AbsoluteSize.Y + ElementViewportSize.Y.Offset
		local contentTop = ElementViewportPosition.Y.Scale - ElementViewportSize.Y.Scale * ElementViewportAnchor.Y
		local contentTopOffset = ElementViewportPosition.Y.Offset - ElementViewportSize.Y.Offset * ElementViewportAnchor.Y
		local fadeTop = Topbar.Position.Y.Scale + Topbar.Size.Y.Scale * (1 - Topbar.AnchorPoint.Y)
		local fadeTopOffset = Topbar.Position.Y.Offset + Topbar.Size.Y.Offset * (1 - Topbar.AnchorPoint.Y) + Topbar.Divider.Size.Y.Offset
		local fadeScale = contentTop - fadeTop
		local fadeOffset = contentTopOffset - fadeTopOffset
		ElementFadeHeight = math.max(0, fadeScale * Main.AbsoluteSize.Y + fadeOffset)
		if ElementFadeHeight == 0 then
			fadeTop, fadeTopOffset = contentTop, contentTopOffset
			fadeScale, fadeOffset = 0, 0
		end
		local safeTop = math.max(0, radius + 1 - (fadeTop * Main.AbsoluteSize.Y + fadeTopOffset))
		fadeTopOffset = fadeTopOffset + safeTop
		fadeOffset = fadeOffset - safeTop
		ElementFadeHeight = math.max(0, ElementFadeHeight - safeTop)
		local left = 1 - scrollingFrame.Position.X.Scale - scrollingFrame.Size.X.Scale * (1 - scrollingFrame.AnchorPoint.X)
		local leftOffset = -scrollingFrame.Position.X.Offset - scrollingFrame.Size.X.Offset * (1 - scrollingFrame.AnchorPoint.X)
		local extraWidth = ElementViewportPosition.X.Scale - ElementViewportSize.X.Scale * ElementViewportAnchor.X - left
		local extraOffset = ElementViewportPosition.X.Offset - ElementViewportSize.X.Offset * ElementViewportAnchor.X - leftOffset
		local contentBottom = contentTop * Main.AbsoluteSize.Y + contentTopOffset + height
		local bottomInset = math.max(0, contentBottom - (Main.AbsoluteSize.Y - 1))
		local bottomExtension = math.max(0, Main.AbsoluteSize.Y - 1 - contentBottom)
		ElementBottomFadeHeight = math.min(math.max(ElementFadeHeight, bottomExtension), math.max(0, Main.AbsoluteSize.Y - 1 - (fadeTop * Main.AbsoluteSize.Y + fadeTopOffset)))
		Elements.AnchorPoint = Vector2.new(0, 0)
		Elements.Position = UDim2.new(left, leftOffset, fadeTop, fadeTopOffset)
		Elements.Size = UDim2.new(ElementViewportSize.X.Scale + extraWidth, ElementViewportSize.X.Offset + extraOffset, ElementViewportSize.Y.Scale + fadeScale, ElementViewportSize.Y.Offset + fadeOffset - bottomInset + bottomExtension)
		ElementFade.Position = UDim2.new(ElementViewportPosition.X.Scale - ElementViewportSize.X.Scale * ElementViewportAnchor.X, ElementViewportPosition.X.Offset - ElementViewportSize.X.Offset * ElementViewportAnchor.X - 1, fadeTop, fadeTopOffset)
		ElementFade.Size = UDim2.new(ElementViewportSize.X.Scale, ElementViewportSize.X.Offset + 2, fadeScale, fadeOffset)
		ElementFade.BackgroundColor3 = Main.BackgroundColor3
		ElementFade.BackgroundTransparency = Main.BackgroundTransparency
		ElementFade.Visible = Elements.Visible and Topbar.Visible and not LoadingFrame.Visible and height > 0 and ElementFadeHeight > 0
		ElementBottomFade.Position = UDim2.new(ElementFade.Position.X.Scale, ElementFade.Position.X.Offset, 1, -1 - ElementBottomFadeHeight)
		ElementBottomFade.Size = UDim2.new(ElementFade.Size.X.Scale, ElementFade.Size.X.Offset, 0, ElementBottomFadeHeight)
		ElementBottomFade.BackgroundColor3 = Main.BackgroundColor3
		ElementBottomFade.BackgroundTransparency = Main.BackgroundTransparency
		ElementBottomFade.Visible = Elements.Visible and Topbar.Visible and not LoadingFrame.Visible and height > 0 and ElementBottomFadeHeight > 0
	end
	Main:GetPropertyChangedSignal("BackgroundColor3"):Connect(updateElementFade)
	Main:GetPropertyChangedSignal("BackgroundTransparency"):Connect(updateElementFade)
	Elements:GetPropertyChangedSignal("Visible"):Connect(updateElementFade)
	Topbar:GetPropertyChangedSignal("Visible"):Connect(updateElementFade)
	LoadingFrame:GetPropertyChangedSignal("Visible"):Connect(updateElementFade)

	local function updateCanvas()
		updateElementFade()
		-- Row sizing uses the original viewport, excluding the fade's extra scroll area.
		local height = ElementViewportSize.Y.Scale * Main.AbsoluteSize.Y + ElementViewportSize.Y.Offset
		gridLayout.CellSize = UDim2.new(0, 10000, 0, math.round(TabRowHeight * height))
		gridLayout.CellPadding = UDim2.new(0, 0, 0, math.round(TabRowGap * height))
		local dividerTop = Topbar.Position.Y.Scale + Topbar.Size.Y.Scale * (1 - Topbar.AnchorPoint.Y)
		local dividerTopOffset = Topbar.Position.Y.Offset + Topbar.Size.Y.Offset * (1 - Topbar.AnchorPoint.Y)
		local fadeHeight = ElementFadeHeight
		scrollingFrame.AnchorPoint = Vector2.new(scrollingFrame.AnchorPoint.X, 0)
		scrollingFrame.Position = UDim2.new(scrollingFrame.Position.X.Scale, scrollingFrame.Position.X.Offset, Elements.Position.Y.Scale, Elements.Position.Y.Offset)
		scrollingFrame.Size = UDim2.new(scrollingFrame.Size.X.Scale, scrollingFrame.Size.X.Offset, Elements.Size.Y.Scale, Elements.Size.Y.Offset)
		scrollingFrame.ClipsDescendants = true
		scrollingFrame.ElasticBehavior = Enum.ElasticBehavior.Never
		scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
		scrollingFrame.HorizontalScrollBarInset = Enum.ScrollBarInset.None
		TabPadding.PaddingTop = UDim.new(0, fadeHeight)
		TabPadding.PaddingBottom = UDim.new(0, ElementBottomFadeHeight)
		scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, gridLayout.AbsoluteContentSize.Y + fadeHeight + ElementBottomFadeHeight)
		TabFade.Size = UDim2.new(TabFade.Size.X.Scale, TabFade.Size.X.Offset, ElementFade.Size.Y.Scale, ElementFade.Size.Y.Offset)
		TabBottomFade.Size = UDim2.new(TabBottomFade.Size.X.Scale, TabBottomFade.Size.X.Offset, 0, ElementBottomFadeHeight)
		TabListBack.Position = UDim2.new(TabListBack.Position.X.Scale, TabListBack.Position.X.Offset, dividerTop, dividerTopOffset)
		TabListBack.Size = UDim2.new(TabListBack.Size.X.Scale, TabListBack.Size.X.Offset, 1 - dividerTop, -dividerTopOffset)
		queueTabFit()
		updateTabFade()
	end

	-- Scroll to the bottom of the ScrollingFrame
	local scrollEnabled = false
	local function scrollToBottom()
		if not scrollEnabled then return end
		-- Wait a frame to ensure layout updates are done
		task.defer(function()
			updateCanvas()
			scrollingFrame.CanvasPosition = Vector2.new(
				0,
				math.max(0, scrollingFrame.CanvasSize.Y.Offset - scrollingFrame.AbsoluteWindowSize.Y)
			)
		end)
	end

	-- Update on content size change
	gridLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		updateCanvas()
		scrollToBottom()
	end)
	scrollingFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateCanvas)
	Main:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateCanvas)
	Topbar:GetPropertyChangedSignal("Size"):Connect(updateCanvas)
	updateCanvas()


	------- AI CODE END

	-- Tab
	local FirstTab = false
	local Window = {}

	function Window:EnableTabCreateScroll()
		scrollEnabled = true
	end

	local firstTabPage;
	function Window:ResetTabListPosition()
		scrollingFrame.CanvasPosition = Vector2.new(0, 0)
		if firstTabPage then
			--warn("jumped")
			Elements.UIPageLayout:JumpTo(firstTabPage)
		end
	end

	local tabSelectors = {}
	local tabPages = {}

	-- Both scrolls measure an offset within the scrolling frame rather than a position on screen,
	-- so a page the UIPageLayout has parked off to the side measures the same as the visible one
	-- and neither jump has to wait out the page animation. ElementName is the element's display
	-- text, which every constructor also writes to the frame's Name.
	function Window:SelectTab(TabName, ElementName)
		local Selector = tabSelectors[TabName]
		if not Selector then return end

		task.spawn(Selector)

		local TabButton = TabList:FindFirstChild(TabName)
		if TabButton then
			updateCanvas()
			local ButtonOffset = TabButton.AbsolutePosition.Y - TabList.AbsolutePosition.Y + TabList.CanvasPosition.Y - TabPadding.PaddingTop.Offset
			local Limit = math.max(0, TabList.CanvasSize.Y.Offset - TabList.AbsoluteWindowSize.Y)
			local Target = math.clamp(ButtonOffset - (TabList.AbsoluteWindowSize.Y - TabPadding.PaddingTop.Offset - TabPadding.PaddingBottom.Offset - TabButton.AbsoluteSize.Y) / 2, 0, Limit)
			TweenService:Create(TabList, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {CanvasPosition = Vector2.new(0, Target)}):Play()
		end

		local TabPage = tabPages[TabName]
		local Element = ElementName and TabPage and TabPage:FindFirstChild(ElementName)
		if not Element then return end

		local ElementOffset = Element.AbsolutePosition.Y - TabPage.AbsolutePosition.Y + TabPage.CanvasPosition.Y - ElementFadeHeight
		TweenService:Create(TabPage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {CanvasPosition = Vector2.new(0, math.max(0, ElementOffset - 10))}):Play()

		task.spawn(function()
			local Background = Element.BackgroundColor3
			for _ = 1, 2 do
				TweenService:Create(Element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
				task.wait(0.35)
				TweenService:Create(Element, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Background}):Play()
				task.wait(0.35)
			end
		end)
	end
	searchNavigate = function(TabName, ElementName)
		Window:SelectTab(TabName, ElementName)
	end

    local addedUiGradientStrokes = {}

	function Window:CreateTab(Name, Image, customUIStrokeGradient)
		local SDone = false
		local TabButton = TabList.Template:Clone()
		TabButton.Name = Name
		TabButton.Title.Text = Name
        TabButton.Title.ZIndex = 4
		TabButton.Parent = TabList
		--TabButton.Title.TextWrapped = false
		--TabButton.Size = UDim2.new(0, 201, 0, 30)

		if Image then
			TabButton.Title.AnchorPoint = Vector2.new(0.5, 0.5)
			TabButton.Title.Position = UDim2.new(TabTextLeft + TabTextWidth / 2, 0, 0.5, 0)
			TabButton.Image.Image = "rbxassetid://"..Image
			TabButton.Image.Visible = true
			TabButton.Title.TextXAlignment = Enum.TextXAlignment.Left
			--TabButton.Size = UDim2.new(0, 201, 0, 30)
		end

		TabButton.BackgroundTransparency = 1
		TabButton.Title.TextTransparency = 1
		TabButton.Shadow.ImageTransparency = 1
		TabButton.Image.ImageTransparency = 1
		TabButton.UIStroke.Transparency = 1

		TabButton.Visible = true

		seedTabFit()
		applyTabFit(TabButton)
		queueTabFit()

		--Create Elements Page
		local TabPage = Elements.Template:Clone()
		if not firstTabPage then
			firstTabPage = TabPage
		end
		TabPage.Name = Name
		TabPage.Visible = true

		TabPage.LayoutOrder = #Elements:GetChildren()

		for _, TemplateElement in ipairs(TabPage:GetChildren()) do
			if TemplateElement.ClassName == "Frame" and TemplateElement.Name ~= "Placeholder" then
				TemplateElement:Destroy()
			end
		end

		TabPage.Parent = Elements
		TabPage.AutomaticCanvasSize = Enum.AutomaticSize.None
		TabPage.VerticalScrollBarInset = Enum.ScrollBarInset.Always
		local TabPageLayout = TabPage.UIListLayout
		local TabPagePadding = TabPageLayout.Padding
		local ElementPadding = TabPage:FindFirstChildOfClass("UIPadding") or Instance.new("UIPadding")
		ElementPadding.Parent = TabPage
		local function updateTabCanvas()
			-- Scale gaps use the original page height, excluding the fade's extra scroll area.
			local height = ElementViewportSize.Y.Scale * Main.AbsoluteSize.Y + ElementViewportSize.Y.Offset
			TabPageLayout.Padding = UDim.new(0, TabPagePadding.Scale * height + TabPagePadding.Offset)
			local left = ElementViewportPosition.X.Scale - ElementViewportSize.X.Scale * ElementViewportAnchor.X
			local leftOffset = ElementViewportPosition.X.Offset - ElementViewportSize.X.Offset * ElementViewportAnchor.X
			ElementPadding.PaddingLeft = UDim.new(0, (left - Elements.Position.X.Scale) * Main.AbsoluteSize.X + leftOffset - Elements.Position.X.Offset)
			ElementPadding.PaddingTop = UDim.new(0, ElementFadeHeight)
			ElementPadding.PaddingBottom = UDim.new(0, ElementBottomFadeHeight)
			TabPage.ScrollBarThickness = scrollingFrame.ScrollBarThickness
			TabPage.ClipsDescendants = true
			TabPage.ElasticBehavior = Enum.ElasticBehavior.Never
			TabPage.ScrollingDirection = Enum.ScrollingDirection.Y
			TabPage.HorizontalScrollBarInset = Enum.ScrollBarInset.None
			TabPage.CanvasSize = UDim2.new(0, 0, 0, TabPageLayout.AbsoluteContentSize.Y + ElementFadeHeight + ElementBottomFadeHeight)
		end
		TabPageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateTabCanvas)
		TabPage:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateTabCanvas)
		updateTabCanvas()
		tabPages[Name] = TabPage
		if not FirstTab then
			Elements.UIPageLayout.Animated = false
			Elements.UIPageLayout:JumpTo(TabPage)
			Elements.UIPageLayout.Animated = true
		end

		if SelectedTheme ~= RayfieldLibrary.Theme.Default then
			TabButton.Shadow.Visible = false
		end
		TabButton.UIStroke.Color = SelectedTheme.TabStroke

		if customUIStrokeGradient then

            TabButton.UIStroke.Color = Color3.fromRGB(255, 255, 255)

			local uiGradient = Instance.new("UIGradient")
			uiGradient.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, customUIStrokeGradient[1]),
				ColorSequenceKeypoint.new(1, customUIStrokeGradient[2])
			})
			uiGradient.Offset = Vector2.new(-55, 0)
			uiGradient.Parent = TabButton.UIStroke
			
			local c3Hex = customUIStrokeGradient[1]:ToHex()
			
			local curStrokes = (addedUiGradientStrokes[c3Hex] or 0)
			addedUiGradientStrokes[c3Hex] = (curStrokes+1)
			
			
			local defOffset = (-0.7)
			for i = 1, curStrokes do
				defOffset = defOffset - 0.01
			end
	
			TweenService:Create(uiGradient, TweenInfo.new(0.85, Enum.EasingStyle.Quint), {Offset = Vector2.new(defOffset, 0)}):Play()

		end

		--Animate

		-- Staggers each tab's entrance. This is added to tween durations rather than used
		-- as a delay, so it has to stay bounded: unclamped, a 29 tab hub leaves the last
		-- tabs animating their text and corners for half a minute after load.
		local customDelay = math.min(#TabList:GetChildren() * 0.03, 0.5)

		if FirstTab then
			TabButton:SetAttribute("Selected", false)
			TabButton.BackgroundColor3 = SelectedTheme.TabBackground
			TabButton.Image.ImageColor3 = SelectedTheme.TabTextColor
			TabButton.Title.TextColor3 = SelectedTheme.TabTextColor
			TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
			TweenService:Create(TabButton.Title, TweenInfo.new(1.5 + customDelay, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
			TweenService:Create(TabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(TabButton.UICorner, TweenInfo.new(0.8 + customDelay, Enum.EasingStyle.Quint), {CornerRadius = UDim.new(0.2, 0)}):Play()

			TweenService:Create(TabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.7}):Play()
		else
			FirstTab = Name
			TabButton:SetAttribute("Selected", true)
			TabButton.BackgroundColor3 = SelectedTheme.TabBackgroundSelected
			TabButton.Image.ImageColor3 = SelectedTheme.SelectedTabTextColor
			TabButton.Title.TextColor3 = SelectedTheme.SelectedTabTextColor
			TweenService:Create(TabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()
			TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
			TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(TabButton.Title, TweenInfo.new(1.5 + customDelay, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(TabButton.UICorner, TweenInfo.new(0.8 + customDelay, Enum.EasingStyle.Quint), {CornerRadius = UDim.new(0.2, 0)}):Play()
			--TweenService:Create(TabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
		end


		local function selectThisTab()
			if Minimised then return end
			TabButton:SetAttribute("Selected", true)
			TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(TabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
			TweenService:Create(TabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
			TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.TabBackgroundSelected}):Play()
			TweenService:Create(TabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextColor3 = SelectedTheme.SelectedTabTextColor}):Play()
			TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageColor3 = SelectedTheme.SelectedTabTextColor}):Play()
			TweenService:Create(TabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.9}):Play()

			for _, OtherTabButton in ipairs(TabList:GetChildren()) do
				if OtherTabButton.Name ~= "Template" and OtherTabButton.ClassName == "Frame" and OtherTabButton ~= TabButton and OtherTabButton.Name ~= "Placeholder" then
					OtherTabButton:SetAttribute("Selected", false)
					TweenService:Create(OtherTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.TabBackground}):Play()
					TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextColor3 = SelectedTheme.TabTextColor}):Play()
					TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageColor3 = SelectedTheme.TabTextColor}):Play()
					TweenService:Create(OtherTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.7}):Play()
					TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
					TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
					TweenService:Create(OtherTabButton.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ImageTransparency = 0.7}):Play()
					TweenService:Create(OtherTabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end
			end
			if Elements.UIPageLayout.CurrentPage ~= TabPage then
				TweenService:Create(TabButton.UICorner, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {CornerRadius = UDim.new(0.4, 0)}):Play()
				task.delay(0.15, function()
					TweenService:Create(TabButton.UICorner, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {CornerRadius = UDim.new(0.2, 0)}):Play()
				end)
				--TweenService:Create(Elements, TweenInfo.new(1, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 460,0, 330)}):Play()
				Elements.UIPageLayout:JumpTo(TabPage)
				task.wait(0.25)
				--TweenService:Create(Elements, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {Size = UDim2.new(0.662, 0,0.857, 0)}):Play()
			end

		end
		tabSelectors[Name] = selectThisTab

		TabButton.Interact.MouseButton1Click:Connect(selectThisTab)

		-- Every element row answers the pointer but the tabs did not, so the column read as
		-- static until something was actually clicked. The selected tab is already painted
		-- by the click handler, so only the unselected ones lift.
		local function hoverTab(Hovering)
			if Minimised or TabButton:GetAttribute("Selected") then return end
			TweenService:Create(TabButton, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {BackgroundTransparency = Hovering and 0.5 or 0.7}):Play()
		end

		TabButton.MouseEnter:Connect(function()
			hoverTab(true)
		end)

		TabButton.MouseLeave:Connect(function()
			hoverTab(false)
		end)

		local Tab = {}

		-- Button
		function Tab:CreateButton(ButtonSettings)
			local ButtonValue = {}

			local Button = Elements.Template.Button:Clone()
			Button.Name = ButtonSettings.Name
			Button.Title.Text = ButtonSettings.Name
			Button.ElementIndicator.Text = ButtonSettings.Interact or 'button'
            Button.ElementIndicator.TextTransparency = 0.9
			Button.Visible = true
			Button.Parent = TabPage

			Button.BackgroundTransparency = 1
			Button.UIStroke.Transparency = 1
			Button.Title.TextTransparency = 1

			TweenService:Create(Button, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Button.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Button.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			if ButtonSettings.Info then
				Button.Description.Text = ButtonSettings.Info
				connectInfoDescription(Button)
			end

			Button.Interact.MouseButton1Click:Connect(function()
				local Success, Response = pcall(ButtonSettings.Callback)
				if not Success then
					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					Button.Title.Text = "Callback Error"
					--print("Rayfield | "..ButtonSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					Button.Title.Text = ButtonSettings.Name
					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
					TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				else
					SaveConfiguration()
					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
					TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
					TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					wait(0.2)
					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
					TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end
			end)

			Button.MouseEnter:Connect(function()
				TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
				TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.7}):Play()
			end)

			Button.MouseLeave:Connect(function()
				TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
				TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextTransparency = 0.9}):Play()
			end)

			function ButtonValue:Set(NewButton,Interaction)
				Button.Title.Text = NewButton
				Button.Name = NewButton
				Button.ElementIndicator.Text = Interaction
			end

			return ButtonValue
		end

		-- Section
		function Tab:CreateSection(SectionName)

			local SectionValue = {}

			if SDone then
				local SectionSpace = Elements.Template.SectionSpacing:Clone()
				SectionSpace.Visible = true
				SectionSpace.Parent = TabPage
			end

			local Section = Elements.Template.SectionTitle:Clone()
			Section.Title.Text = SectionName
			Section.Visible = true
			Section.Parent = TabPage

			Section.Title.TextTransparency = 1
			TweenService:Create(Section.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()

			function SectionValue:Set(NewSection)
				Section.Title.Text = NewSection
			end

			SDone = true

			return SectionValue
		end

		-- Label
		function Tab:CreateLabel(LabelText, premiumTag)
			local LabelValue = {}

			local Label = Elements.Template.Label:Clone()
			
			if premiumTag then
				attachPremiumOverlay(Label, premiumTag)
			end
			
			Label.Title.Position = UDim2.new(0.514, 0, 0.5, 0)
			Label.Title.Text = LabelText
			Label.Visible = true
			Label.Parent = TabPage

			Label.BackgroundTransparency = 1
			Label.UIStroke.Transparency = 1
			Label.Title.TextTransparency = 1
																																								
			Label.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
			Label.UIStroke.Color = SelectedTheme.SecondaryElementStroke

			TweenService:Create(Label, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Label.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Label.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			function LabelValue:Set(NewLabel)
				Label.Title.Text = NewLabel
			end

			function LabelValue:GetLabel()
				return Label
			end

			return LabelValue
		end

		-- Big Label
		function Tab:CreateBigLabel(LabelText, Size, premiumTag)
			local LabelValue = {}

			local Label = Elements.Template.BigLabel:Clone()
			
			if premiumTag then
				attachPremiumOverlay(Label, premiumTag)
			end
			
			Label.Title.Text = LabelText
			Label.Visible = true
			Label.Parent = TabPage

			Label.Size = UDim2.new(1,-10, 0, Size or 35)

			Label.BackgroundTransparency = 1
			Label.UIStroke.Transparency = 1
			Label.Title.TextTransparency = 1

			Label.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
			Label.UIStroke.Color = SelectedTheme.SecondaryElementStroke

			TweenService:Create(Label, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Label.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Label.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			function LabelValue:Set(NewLabel, NewSize)
				Label.Title.Text = NewLabel
				Label.Size = UDim2.new(1,-10, 0, NewSize or 35)
			end

			return LabelValue
		end

		-- Space
		function Tab:CreateSpace(Size)
			local SpaeceValue = {}

			local Space = Elements.Template.Space:Clone()
			Space.Visible = true
			Space.Parent = TabPage

			Space.Size = UDim2.new(1,-10, 0, Size or 35)


			function SpaeceValue:Set(NewSize)
				Space.Size = UDim2.new(1,-10, 0, NewSize or 35)
			end

			return SpaeceValue
		end

		-- Paragraph
		function Tab:CreateParagraph(ParagraphSettings)
			local ParagraphValue = {}

			local Paragraph = Elements.Template.Paragraph:Clone()
			Paragraph.Title.Text = ParagraphSettings.Title
			Paragraph.Content.Text = ParagraphSettings.Content
			Paragraph.Visible = true
			Paragraph.Parent = TabPage

			Paragraph.Content.Size = UDim2.new(0.946, 0, 0.738, 0)
			--Paragraph.Content.Position = UDim2.new(1, -10, 0,76)
			Paragraph.Size = UDim2.new(1, -10, 0, Paragraph.Content.TextBounds.Y + 40)

			Paragraph.BackgroundTransparency = 1
			Paragraph.UIStroke.Transparency = 1
			Paragraph.Title.TextTransparency = 1
			Paragraph.Content.TextTransparency = 1

			Paragraph.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
			Paragraph.UIStroke.Color = SelectedTheme.SecondaryElementStroke

			TweenService:Create(Paragraph, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Paragraph.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Paragraph.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	
			TweenService:Create(Paragraph.Content, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			function ParagraphValue:Set(NewParagraphSettings)
				Paragraph.Title.Text = NewParagraphSettings.Title
				Paragraph.Content.Text = NewParagraphSettings.Content
			end

			return ParagraphValue
		end

		function Tab:CreateSavingInput(InputSettings)
			local Input = Elements.Template.Input:Clone()
			
			if InputSettings.PremiumTag then
				attachPremiumOverlay(Input, InputSettings.PremiumTag)
				Input.InputFrame.InputBox.Active = false
				Input.InputFrame.InputBox.Selectable = false
				Input.InputFrame.InputBox.TextEditable = false
			end
			
			Input.Title.Position = UDim2.new(0.266, 0, 0.5, 0)
			Input.Name = InputSettings.Name
			--Input.Title.RichText = true
			Input.Title.Text = InputSettings.Name..":"
			if InputSettings.CurrentValue ~= "" then
				local value = InputSettings.CurrentValue
				local vTextFunc = InputSettings.vTextFunc
				local vText = vTextFunc and vTextFunc(value)
				Input.Title.Text = string.format("%s %s", Input.Title.Text, vText or value)
			end
			Input.Visible = true
			Input.Parent = TabPage


			Input.BackgroundTransparency = 1
			Input.UIStroke.Transparency = 1
			Input.Title.TextTransparency = 1

			Input.InputFrame.BackgroundColor3 = SelectedTheme.InputBackground
			Input.InputFrame.UIStroke.Color = SelectedTheme.InputStroke

			TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Input.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Input.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			Input.InputFrame.InputBox.PlaceholderText = InputSettings.PlaceholderText
			local originalInputFrameSize = UDim2.new(0.130, 0, ElementRowControl, 0)
			Input.InputFrame.Size = originalInputFrameSize

			-- Nothing here is committed until Enter, and the box kept whatever was typed after
			-- that, so a value that was never applied sat there looking applied and the field read
			-- as broken. The hint sits beside the box while it is being edited and rides its left
			-- edge, since the box grows leftwards as it fills. It keeps the ZIndex it is cloned
			-- with: the ScreenGui is ZIndexBehavior.Global, so anything below the row's own ZIndex
			-- renders behind the row's opaque background instead of on it.
			local HintGap = 0.014
			local HintFloor = 0.68
			local Hint = Input.Description:Clone()
			Hint.Name = "EnterHint"
			Hint.Text = "press enter to save"
			Hint.TextXAlignment = Enum.TextXAlignment.Right
			Hint.TextWrapped = false
			Hint.AnchorPoint = Vector2.new(1, 0.5)
			Hint.Size = UDim2.new(0.34, 0, ElementRowTitle, 0)
			Hint.TextTransparency = 1
			Hint.Visible = true
			Hint.Parent = Input

			local HintShown = false
			local HintWidth = originalInputFrameSize.X.Scale
			local function moveHint(Duration)
				-- Past the floor the box has eaten the gap between itself and the row title, so
				-- there is nowhere left for the hint to sit and it steps aside.
				local Room = 1 - ElementRowGutter - HintWidth - HintGap
				TweenService:Create(Hint, TweenInfo.new(Duration, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
					Position = UDim2.new(Room, 0, Hint.Position.Y.Scale, 0),
					TextTransparency = (HintShown and Room > HintFloor) and 0.35 or 1
				}):Play()
			end

			Hint.Position = UDim2.new(1 - ElementRowGutter - HintWidth - HintGap, 0, 0.5, 0)

			if InputSettings.Info then
				Input.Description.Text = InputSettings.Info
				connectInfoDescription(Input)
			end
			
			if not InputSettings.PremiumTag then
				if InputSettings.NumbersOnly or InputSettings.CharacterLimit then
					Input.InputFrame.InputBox:GetPropertyChangedSignal('Text'):Connect(function()
						if InputSettings.CharacterLimit then Input.InputFrame.InputBox.Text = Input.InputFrame.InputBox.Text:sub(1,InputSettings.CharacterLimit) end
						if InputSettings.NumbersOnly then Input.InputFrame.InputBox.Text = Input.InputFrame.InputBox.Text:gsub('%D+', '') end
					end)
				end

				Input.InputFrame.InputBox.Focused:Connect(function()
					HintShown = true
					moveHint(0.25)
				end)

				Input.InputFrame.InputBox.FocusLost:Connect(function(enter)
					HintShown = false
					moveHint(0.3)
					-- Clearing what was not committed is the whole point: the title keeps showing
					-- the value that is actually set, so an abandoned edit cannot pass for one.
					if not enter then Input.InputFrame.InputBox.Text = "" return end
					local text = Input.InputFrame.InputBox.Text
					InputSettings:Set(text)
					Input.InputFrame.InputBox.Text = ""
				end)

				Input.MouseEnter:Connect(function()
					TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
				end)

				Input.MouseLeave:Connect(function()
					TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
				end)

				local lastCalled;
				Input.InputFrame.InputBox:GetPropertyChangedSignal("Text"):Connect(function()
				local rId = tick()
				lastCalled = rId
				local Text = Input.InputFrame.InputBox.Text
				--TweenService:Create(Input.InputFrame, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 24, 0, 30)}):Play()
				local newSize = UDim2.new(originalInputFrameSize.X.Scale + (#Text * 0.01), 0, ElementRowControl, 0)
				HintWidth = newSize.X.Scale
				moveHint(0.55)
				TweenService:Create(Input.InputFrame, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(newSize.X.Scale, 0, newSize.Y.Scale - 0.1, 0)}):Play()
				task.wait(0.25)
				if lastCalled == rId then
					TweenService:Create(Input.InputFrame, TweenInfo.new(0.55, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {Size = newSize}):Play()
				end
				end)
			end

			function InputSettings:Set(value, _, _, _, _, skipSave)

				local DefaultValue = InputSettings.DefaultValue

				if type(value) ~= "string" then
					value = DefaultValue
				end

				local vTextFunc = InputSettings.vTextFunc
				local vText = vTextFunc and vTextFunc(value)
				local Success, Response = pcall(function()
					InputSettings.Callback(value)
				end)
				if not Success then
					TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(Input.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					Input.Title.Text = "Callback Error"
					--print("Rayfield | "..InputSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					Input.Title.Text = InputSettings.Name
					TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Input.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end



				InputSettings.CurrentValue = value
				Input.Title.Text = string.format("%s: %s", InputSettings.Name, vText or value)
				if not skipSave then
					SaveConfiguration()
				end
			end

			if Settings.ConfigurationSaving then
				if Settings.ConfigurationSaving.Enabled and InputSettings.Flag then
					RayfieldLibrary.Flags[InputSettings.Flag] = InputSettings
				end
			end

			return InputSettings
		end

		-- Input
		function Tab:CreateInput(InputSettings)
			local Input = Elements.Template.Input:Clone()
			Input.Title.Position = UDim2.new(0.266, 0, 0.5, 0)
			Input.Name = InputSettings.Name
			Input.Title.Text = InputSettings.Name
			Input.Visible = true
			Input.Parent = TabPage


			Input.BackgroundTransparency = 1
			Input.UIStroke.Transparency = 1
			Input.Title.TextTransparency = 1

			Input.InputFrame.BackgroundColor3 = SelectedTheme.InputBackground
			Input.InputFrame.UIStroke.Color = SelectedTheme.InputStroke

			TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Input.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Input.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			Input.InputFrame.InputBox.PlaceholderText = InputSettings.PlaceholderText
			Input.InputFrame.Size = UDim2.new(0.241, 0, ElementRowControl, 0)

			if InputSettings.Info then
				Input.Description.Text = InputSettings.Info
				connectInfoDescription(Input)
			end

			if InputSettings.NumbersOnly or InputSettings.CharacterLimit then
				Input.InputFrame.InputBox:GetPropertyChangedSignal('Text'):Connect(function()
					if InputSettings.CharacterLimit then Input.InputFrame.InputBox.Text = Input.InputFrame.InputBox.Text:sub(1,InputSettings.CharacterLimit) end
					if InputSettings.NumbersOnly then Input.InputFrame.InputBox.Text = Input.InputFrame.InputBox.Text:gsub('%D+', '') end
				end)
			end

			Input.InputFrame.InputBox.FocusLost:Connect(function(enter)
				if InputSettings.OnEnter and not enter then if InputSettings.RemoveTextAfterFocusLost then Input.InputFrame.InputBox.Text = "" end return end
				local Success, Response = pcall(function()
					InputSettings.Callback(Input.InputFrame.InputBox.Text)
				end)
				if not Success then
					TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(Input.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					Input.Title.Text = "Callback Error"
					--print("Rayfield | "..InputSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					Input.Title.Text = InputSettings.Name
					TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Input.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end

				if InputSettings.RemoveTextAfterFocusLost then Input.InputFrame.InputBox.Text = "" end
				SaveConfiguration()
			end)

			Input.MouseEnter:Connect(function()
				TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
			end)

			Input.MouseLeave:Connect(function()
				TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
			end)

			Input.InputFrame.InputBox:GetPropertyChangedSignal("Text"):Connect(function()
				TweenService:Create(Input.InputFrame, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 24, ElementRowControl, 0)}):Play()
			end)
		end

		-- Dropdown
		function Tab:CreateDropdown(DropdownSettings)
			local Dropdown = Elements.Template.Dropdown:Clone()
			
			if DropdownSettings.PremiumTag then
				attachPremiumOverlay(Dropdown, DropdownSettings.PremiumTag)
			end
			
			if string.find(DropdownSettings.Name,"closed") then
				Dropdown.Name = "Dropdown"
			else
				Dropdown.Name = DropdownSettings.Name
			end
			Dropdown.Title.Text = DropdownSettings.Name
			Dropdown.UIAspectRatioConstraint.AspectRatio = ElementRowAspect
			Dropdown.Visible = true
			Dropdown.Parent = TabPage

			Dropdown.List.UIListLayout.SortOrder = "LayoutOrder"

			Dropdown.List.Visible = false

			Dropdown.Selected.Text = DropdownSettings.CurrentOption

			Dropdown.BackgroundTransparency = 1
			Dropdown.UIStroke.Transparency = 1
			Dropdown.Title.TextTransparency = 1

			Dropdown.Size = UDim2.new(1, -10, 0, 45)

			TweenService:Create(Dropdown, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Dropdown.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			--custom shi
			TweenService:Create(Dropdown.Toggle, TweenInfo.new(.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0.07, 0, 0.636, 0), Position = UDim2.new(0.9394, 0, 0.479, 0)}):Play()
			TweenService:Create(Dropdown.Selected, TweenInfo.new(.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0.366, 0, 0.318, 0), Position = UDim2.new(0.7194, 0, 0.479, 0)}):Play()
			TweenService:Create(Dropdown.Title, TweenInfo.new(.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0.563, 0, ElementRowTitle, 0), Position = UDim2.new(0.316, 0, 0.479, 0)}):Play()      
			--

			for _, ununusedoption in ipairs(Dropdown.List:GetChildren()) do
				if ununusedoption.ClassName == "Frame" and ununusedoption.Name ~= "ZZZZZZZZZ" and ununusedoption.Name ~= "," and ununusedoption.Name ~= ",---S=()earch" then
					ununusedoption:Destroy()
				end
			end

			Dropdown.Toggle.Rotation = 180
			
			if not DropdownSettings.PremiumTag then
				Dropdown.Interact.MouseButton1Click:Connect(function()
					TweenService:Create(Dropdown, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
					TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					wait(0.1)
					TweenService:Create(Dropdown, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
					if Debounce then return end
					if Dropdown.List.Visible then
						--custom shi
						TweenService:Create(Dropdown.Toggle, TweenInfo.new(.5, Enum.EasingStyle.Cubic), {Size = UDim2.new(0.07, 0, 0.636, 0), Position = UDim2.new(0.9394, 0, 0.479, 0)}):Play()
						TweenService:Create(Dropdown.Selected, TweenInfo.new(.5, Enum.EasingStyle.Cubic), {Size = UDim2.new(0.366, 0, 0.318, 0), Position = UDim2.new(0.7194, 0, 0.479, 0)}):Play()
						TweenService:Create(Dropdown.Title, TweenInfo.new(.5, Enum.EasingStyle.Cubic), {Size = UDim2.new(0.563, 0, ElementRowTitle, 0), Position = UDim2.new(0.316, 0, 0.479, 0)}):Play()     
						--
						Debounce = true
						Dropdown.UICorner.CornerRadius = UDim.new(0.2,0)
						TweenService:Create(Dropdown.UIAspectRatioConstraint, TweenInfo.new(0.5, Enum.EasingStyle.Cubic), {AspectRatio = ElementRowAspect}):Play()
						TweenService:Create(Dropdown, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {Size = UDim2.new(1, -10, 0, 45)}):Play()
						for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
							if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= "ZZZZZZZZZ" and DropdownOpt.Name ~= "," and DropdownOpt.Name ~= ",---S=()earch" then
								TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
								TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
								TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
							end
						end
						TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
						TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 180}):Play()	
						wait(0.05)
						Dropdown.List.Visible = false
						Debounce = false
					else
						--custom shi
						TweenService:Create(Dropdown.Toggle, TweenInfo.new(.15, Enum.EasingStyle.Cubic), {Size = UDim2.new(0.054, 0,0.142, 0), Position = UDim2.new(0.945, 0,0.099, 0)}):Play()
						TweenService:Create(Dropdown.Selected, TweenInfo.new(.15, Enum.EasingStyle.Cubic), {Size = UDim2.new(0.285, 0,0.071, 0), Position = UDim2.new(0.775, 0,0.1, 0)}):Play()
						TweenService:Create(Dropdown.Title, TweenInfo.new(.15, Enum.EasingStyle.Cubic), {Size = UDim2.new(0.552, 0,0.065, 0), Position = UDim2.new(0.312, 0,0.11, 0)}):Play()
						--
						--Dropdown.UIAspectRatioConstraint.AspectRatio = 2.3
						Dropdown.UICorner.CornerRadius = UDim.new(0.06,0)
						TweenService:Create(Dropdown.UIAspectRatioConstraint, TweenInfo.new(0.15, Enum.EasingStyle.Cubic), {AspectRatio = DropdownOpenAspect}):Play()
						TweenService:Create(Dropdown, TweenInfo.new(0.15, Enum.EasingStyle.Cubic), {Size = UDim2.new(0.966, 0,0.664, 0)}):Play()
						revealDropdown(Dropdown)
						task.wait(.05)
						Dropdown.List.Visible = true
						TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 0.7}):Play()
						TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 0}):Play()	
						for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
							if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= "ZZZZZZZZZ" and DropdownOpt.Name ~= "," and DropdownOpt.Name ~= ",---S=()earch" then
								TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
								TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
								TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
							end
						end
					end
				end)

				Dropdown.List[',---S=()earch'].Input:GetPropertyChangedSignal('Text'):Connect(function()
					local InputText=string.upper(Dropdown.List[',---S=()earch'].Input.Text)
					for _,item in ipairs(Dropdown.List:GetChildren()) do
						if item:IsA('Frame') and item.Name ~= 'Template' and item.Name ~= ',---S=()earch' and item.Name ~= ',' and item.Name ~= 'ZZZZZZZZZ' then
							if InputText==""or custom_match(string.upper(item.Name),InputText)~=nil then
								item.Visible=true
							else
								item.Visible=false
							end
						end
					end
				end)

				Dropdown.MouseEnter:Connect(function()
					if not Dropdown.List.Visible then
						TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
					end
				end)

				Dropdown.MouseLeave:Connect(function()
					TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
				end)
			end

			local function Error(text)
				TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
				TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
				Dropdown.Title.Text = text
				wait(0.5)
				Dropdown.Title.Text = DropdownSettings.Name
				TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
				TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			end

			local function AddOption(Option,Selected,LayoutOrder)
				local DropdownOption = Elements.Template.Dropdown.List.Template:Clone()
				DropdownOption.Name = Option
				DropdownOption.Title.Text = Option
				DropdownOption.Parent = Dropdown.List
				DropdownOption.Visible = true

				if DropdownSettings.CurrentOption == Option then
					DropdownOption.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				end

				DropdownOption.BackgroundTransparency = 1
				DropdownOption.UIStroke.Transparency = 1
				DropdownOption.Title.TextTransparency = 1

				DropdownOption.Interact.ZIndex = 50
				DropdownOption.Interact.MouseButton1Click:Connect(function()
					if Dropdown.Selected.Text ~= Option then
						Dropdown.Selected.Text = Option
						DropdownSettings.CurrentOption = Option

						SaveConfiguration()
						local Success, Response = pcall(function()
							DropdownSettings.Callback(Option)
						end)
						if not Success then
							Error('Callback Error')
							--print("Rayfield | "..DropdownSettings.Name.." Callback Error " ..tostring(Response))
						end
						for _, droption in ipairs(Dropdown.List:GetChildren()) do
							if droption.ClassName == "Frame" and droption.Name ~= "ZZZZZZZZZ" and droption.Name ~= "," and droption.Name ~= ",---S=()earch" and droption.Name ~= DropdownSettings.CurrentOption then
								TweenService:Create(droption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
							end
						end
						TweenService:Create(DropdownOption.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
						TweenService:Create(DropdownOption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
						Debounce = true
						wait(0.2)
						TweenService:Create(DropdownOption.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
						wait(0.1)

						--custom shi
						TweenService:Create(Dropdown.Toggle, TweenInfo.new(.5, Enum.EasingStyle.Cubic), {Size = UDim2.new(0.07, 0, 0.636, 0), Position = UDim2.new(0.9394, 0, 0.479, 0)}):Play()
						TweenService:Create(Dropdown.Selected, TweenInfo.new(.5, Enum.EasingStyle.Cubic), {Size = UDim2.new(0.366, 0, 0.318, 0), Position = UDim2.new(0.7194, 0, 0.479, 0)}):Play()
						TweenService:Create(Dropdown.Title, TweenInfo.new(.5, Enum.EasingStyle.Cubic), {Size = UDim2.new(0.563, 0, ElementRowTitle, 0), Position = UDim2.new(0.316, 0, 0.479, 0)}):Play()     
						--
						Debounce = true
						Dropdown.UICorner.CornerRadius = UDim.new(0.2,0)
						TweenService:Create(Dropdown.UIAspectRatioConstraint, TweenInfo.new(0.5, Enum.EasingStyle.Cubic), {AspectRatio = ElementRowAspect}):Play()
						TweenService:Create(Dropdown, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {Size = UDim2.new(1, -10, 0, 45)}):Play()
						for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
							if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= "ZZZZZZZZZ" and DropdownOpt.Name ~= "," and DropdownOpt.Name ~= ",---S=()earch" then
								TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
								TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
								TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
							end
						end
						TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
						TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 180}):Play()	
						wait(0.05)
						Dropdown.List.Visible = false
						Debounce = false

					end
				end)
			end
			function DropdownSettings:Add(Item,Selected)
				AddOption(Item,Selected)
			end
			local function AddOptions(Options,Selected)
				for i, Option in ipairs(Options) do
					AddOption(Option,Selected,i)
				end
				if Settings.ConfigurationSaving then
					if Settings.ConfigurationSaving.Enabled and DropdownSettings.Flag then
						RayfieldLibrary.Flags[DropdownSettings.Flag] = DropdownSettings
					end
				end
			end
			AddOptions(DropdownSettings.Options)

			function DropdownSettings:Set(NewOption, _, _, _, _, skipSave)
				_G.A = NewOption
				Dropdown.Selected.Text = NewOption
				DropdownSettings.CurrentOption = NewOption
				if not skipSave then
					SaveConfiguration()
				end
				local Success, Response = pcall(function()
					DropdownSettings.Callback(NewOption)
				end)
				if not Success then
					TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					Dropdown.Title.Text = "Callback Error"
					--print("Rayfield | "..DropdownSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					Dropdown.Title.Text = DropdownSettings.Name
					TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end

				for _, droption in ipairs(Dropdown.List:GetChildren()) do
					if droption.Name ~= NewOption then
						if droption.ClassName == "Frame" and droption.Name ~= "ZZZZZZZZZ" and droption.Name ~= "," and droption.Name ~= '---S=()earch' then
							droption.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
						end
					else
						droption.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
					end

				end
			end
			function DropdownSettings:Error(text)
				Error(text)
			end
			function DropdownSettings:Refresh(NewOptions,Default)
				--Dropdown.Selected.Text = Default
				for _, option in ipairs(Dropdown.List:GetChildren()) do
					if option.ClassName == "Frame" and option.Name ~= ',---S=()earch' and option.Name ~= "ZZZZZZZZZ" and option.Name ~= "," and option.Name ~= '---S=()earch' then
						option:Destroy()
					end
				end
				AddOptions(NewOptions,Default)
			end
			function DropdownSettings:Remove(Item)
				if Item.Name ~= "ZZZZZZZZZ" and Item.Name ~= "," and Item ~= '---S=()earch' then
					if Dropdown.List:FindFirstChild(Item) then
						Dropdown.List[Item]:Destroy()
					else
						Error('Option not found.')
					end
				else
					Error("No")
				end
				if Dropdown.Selected.Text == Item then
					Dropdown.Selected.Text = ''
				end
			end

			return DropdownSettings
		end

		-- Multi-Dropdown
		function Tab:CreateMultiDropdown(DropdownSettings)
			local Dropdown = Elements.Template.Dropdown:Clone()
			
			if DropdownSettings.PremiumTag then
				attachPremiumOverlay(Dropdown, DropdownSettings.PremiumTag)
			end
			
			if string.find(DropdownSettings.Name,"closed") then
				Dropdown.Name = "Dropdown"
			else
				Dropdown.Name = DropdownSettings.Name
			end
			Dropdown.Title.Text = DropdownSettings.Name
			Dropdown.UIAspectRatioConstraint.AspectRatio = ElementRowAspect
			Dropdown.Visible = true
			Dropdown.Parent = TabPage


			Dropdown.List.Visible = false

			local buts = {
				["Select All"] = {
					Element = Dropdown.List["Select All"],
					Color = Color3.fromRGB(10,10,10),
				},
				["Reset List"] = {
					Element = Dropdown.List["Reset List"],
					Color = Color3.fromRGB(10,10,10),
				}
			}
			
			if not DropdownSettings.PremiumTag then
				for name, data in pairs(buts) do

					local SpecialCallbacks = DropdownSettings.SpecialCallbacks
					SpecialCallbacks = SpecialCallbacks and SpecialCallbacks[name]

					if not SpecialCallbacks then continue end

					data.Element.Visible = true

					data.Element.MouseEnter:Connect(function()
						TweenService:Create(data.Element, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = data.Color}):Play()
					end)

					data.Element.MouseLeave:Connect(function()
						TweenService:Create(data.Element, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(20,20,20)}):Play()
					end)

					data.Element.Interact.MouseButton1Click:Connect(function()
						SpecialCallbacks()
					end)

					data.Element.Visible = true
				end
			end

			local wl = {"ZZZZZZZZZ", ",", ",---S=()earch", "Select All", "Reset List"}

			local selectedOptions = {}

			local function getSelected()
				return selectedOptions
			end

			local function highlightSelected()
				local selected = getSelected()
				for _, but in pairs(Dropdown.List:GetChildren()) do
					if but.ClassName ~= "Frame" then continue end
					if table.find(selected, but.Name) then
						--but.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
						TweenService:Create(but.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
						task.delay(.1, function()
							TweenService:Create(but.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
						end)
						TweenService:Create(but, TweenInfo.new(0.3, Enum.EasingStyle.Cubic), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
					elseif not table.find(wl, but.Name) then
						--but.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
						TweenService:Create(but.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
						task.delay(.1, function()
							TweenService:Create(but.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
						end)
						TweenService:Create(but, TweenInfo.new(0.15, Enum.EasingStyle.Cubic), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
					end
				end
			end	

			local function setSelectedOptions(option, change)
				if option ~= "" then
					selectedOptions = change or selectedOptions
					if option and table.find(selectedOptions, option) then
						table.remove(selectedOptions, table.find(selectedOptions, option))
					elseif option then
						table.insert(selectedOptions, option)
					end
					Dropdown.Selected.Text = table.concat(selectedOptions, ", ")
					DropdownSettings.SelectedOptions = selectedOptions
				end
				highlightSelected()
			end	

			--setSelectedOptions(DropdownSettings.CurrentOption)

			Dropdown.Selected.Text = ""

			Dropdown.BackgroundTransparency = 1
			Dropdown.UIStroke.Transparency = 1
			Dropdown.Title.TextTransparency = 1

			Dropdown.Size = UDim2.new(1, -10, 0, 45)

			TweenService:Create(Dropdown, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Dropdown.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			--custom shi
			TweenService:Create(Dropdown.Toggle, TweenInfo.new(.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0.07, 0, 0.636, 0), Position = UDim2.new(0.9394, 0, 0.479, 0)}):Play()
			TweenService:Create(Dropdown.Selected, TweenInfo.new(.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0.366, 0, 0.318, 0), Position = UDim2.new(0.7194, 0, 0.479, 0)}):Play()
			TweenService:Create(Dropdown.Title, TweenInfo.new(.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0.563, 0, ElementRowTitle, 0), Position = UDim2.new(0.316, 0, 0.479, 0)}):Play()      
			--


			for _, ununusedoption in ipairs(Dropdown.List:GetChildren()) do
				if ununusedoption.ClassName == "Frame" and not table.find(wl, ununusedoption.Name) then
					ununusedoption:Destroy()
				end
			end
			
			if not DropdownSettings.PremiumTag then
				Dropdown.Toggle.Rotation = 180

				Dropdown.Interact.MouseButton1Click:Connect(function()
					TweenService:Create(Dropdown, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
					TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					wait(0.1)
					TweenService:Create(Dropdown, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
					if Debounce then return end
					if Dropdown.List.Visible then
						--custom shi
						TweenService:Create(Dropdown.Toggle, TweenInfo.new(.5, Enum.EasingStyle.Cubic), {Size = UDim2.new(0.07, 0, 0.636, 0), Position = UDim2.new(0.9394, 0, 0.479, 0)}):Play()
						TweenService:Create(Dropdown.Selected, TweenInfo.new(.5, Enum.EasingStyle.Cubic), {Size = UDim2.new(0.366, 0, 0.318, 0), Position = UDim2.new(0.7194, 0, 0.479, 0)}):Play()
						TweenService:Create(Dropdown.Title, TweenInfo.new(.5, Enum.EasingStyle.Cubic), {Size = UDim2.new(0.563, 0, ElementRowTitle, 0), Position = UDim2.new(0.316, 0, 0.479, 0)}):Play()     
						--
						Debounce = true

						--Dropdown.UIAspectRatioConstraint.AspectRatio = 10.5
						Dropdown.UICorner.CornerRadius = UDim.new(0.2,0)
						TweenService:Create(Dropdown.UIAspectRatioConstraint, TweenInfo.new(0.5, Enum.EasingStyle.Cubic), {AspectRatio = ElementRowAspect}):Play()
						TweenService:Create(Dropdown, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {Size = UDim2.new(1, -10, 0, 45)}):Play()
						for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
							if DropdownOpt.ClassName == "Frame" and not table.find(wl, DropdownOpt.Name) then
								TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
								TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
								TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
							end
						end
						TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
						TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 180}):Play()	
						wait(0.05)
						Dropdown.List.Visible = false
						Debounce = false
					else
						--custom shi
						TweenService:Create(Dropdown.Toggle, TweenInfo.new(.15, Enum.EasingStyle.Cubic), {Size = UDim2.new(0.054, 0,0.142, 0), Position = UDim2.new(0.945, 0,0.099, 0)}):Play()
						TweenService:Create(Dropdown.Selected, TweenInfo.new(.15, Enum.EasingStyle.Cubic), {Size = UDim2.new(0.285, 0,0.071, 0), Position = UDim2.new(0.775, 0,0.1, 0)}):Play()
						TweenService:Create(Dropdown.Title, TweenInfo.new(.15, Enum.EasingStyle.Cubic), {Size = UDim2.new(0.552, 0,0.065, 0), Position = UDim2.new(0.312, 0,0.11, 0)}):Play()
						--
						--print(Dropdown.UIAspectRatioConstraint.AspectRatio)
						--Dropdown.UIAspectRatioConstraint.AspectRatio = 2.3
						Dropdown.UICorner.CornerRadius = UDim.new(0.06,0)
						TweenService:Create(Dropdown.UIAspectRatioConstraint, TweenInfo.new(0.15, Enum.EasingStyle.Cubic), {AspectRatio = DropdownOpenAspect}):Play()
						TweenService:Create(Dropdown, TweenInfo.new(0.15, Enum.EasingStyle.Cubic), {Size = UDim2.new(0.966, 0,0.664, 0)}):Play()
						revealDropdown(Dropdown)
						task.wait(.05)
						Dropdown.List.Visible = true
						TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 0.7}):Play()
						TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 0}):Play()	
						for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
							if DropdownOpt.ClassName == "Frame" and not table.find(wl, DropdownOpt.Name) then
								TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
								TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
								TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
							end
						end
						task.wait(.1)
						Dropdown.List[',---S=()earch'].Input:CaptureFocus()
					end
				end)

				Dropdown.List[',---S=()earch'].Input:GetPropertyChangedSignal('Text'):Connect(function()
					local InputText=string.upper(Dropdown.List[',---S=()earch'].Input.Text)
					for _,item in ipairs(Dropdown.List:GetChildren()) do

						if item:IsA('Frame') and item.Name ~= 'Template' and not table.find(wl, item.Name) then
							if InputText==""or custom_match(string.upper(item.Name),InputText)~=nil then
								item.Visible=true
							else
								item.Visible=false
							end
						end
					end
				end)
				Dropdown.MouseEnter:Connect(function()
					if not Dropdown.List.Visible then
						TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
					end
				end)

				Dropdown.MouseLeave:Connect(function()
					TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
				end)
			end

			local function Error(text)
				TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
				TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
				Dropdown.Title.Text = text
				wait(0.5)
				Dropdown.Title.Text = DropdownSettings.Name
				TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
				TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			end


			local function AddOption(Option,Selected,LayoutOrder)
				local DropdownOption = Elements.Template.Dropdown.List.Template:Clone()
				DropdownOption.Name = Option
				DropdownOption.Title.Text = Option
				DropdownOption.Parent = Dropdown.List
				DropdownOption.LayoutOrder = (LayoutOrder or 0) + 2
				DropdownOption.Visible = true

				if DropdownSettings.CurrentOption == Option then
					DropdownOption.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				end

				DropdownOption.BackgroundTransparency = 1
				DropdownOption.UIStroke.Transparency = 1
				DropdownOption.Title.TextTransparency = 1

				DropdownOption.Interact.ZIndex = 50
				DropdownOption.Interact.MouseButton1Click:Connect(function()
					if Dropdown.Selected.Text ~= Option or true then
						--Dropdown.Selected.Text = Option

						setSelectedOptions(Option)

						SaveConfiguration()
						local Success, Response = pcall(function()
							DropdownSettings.Callback(selectedOptions)
						end)
						if not Success then
							Error('Callback Error')
							--print("Rayfield | "..DropdownSettings.Name.." Callback Error " ..tostring(Response))
						end
						DropdownSettings.CurrentOption = Option
						for _, droption in ipairs(Dropdown.List:GetChildren()) do
							if droption.ClassName == "Frame" and not table.find(wl, droption.Name) and droption.Name ~= DropdownSettings.CurrentOption then
								--TweenService:Create(droption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
							end
						end
						highlightSelected()
						TweenService:Create(DropdownOption.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
						--TweenService:Create(DropdownOption, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
						Debounce = true
						wait(0.2)
						TweenService:Create(DropdownOption.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
						wait(0.1)
						--[[hide
						--custom shi
						TweenService:Create(Dropdown.Toggle, TweenInfo.new(.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0.07, 0, 0.636, 0), Position = UDim2.new(0.9394, 0, 0.479, 0)}):Play()
						TweenService:Create(Dropdown.Selected, TweenInfo.new(.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0.366, 0, 0.318, 0), Position = UDim2.new(0.7194, 0, 0.479, 0)}):Play()
						TweenService:Create(Dropdown.Title, TweenInfo.new(.5, Enum.EasingStyle.Quint), {Size = UDim2.new(0.563, 0, ElementRowTitle, 0), Position = UDim2.new(0.316, 0, 0.479, 0)}):Play()      
						--
						TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Size = UDim2.new(1, -10, 0, 45)}):Play()
						for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
							if DropdownOpt.ClassName == "Frame" and not table.find(wl, DropdownOpt.Name) then
								TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
								TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
								TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
							end
						end
						TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {ScrollBarImageTransparency = 1}):Play()
						TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Rotation = 180}):Play()	
						wait(0.35)
						Dropdown.List.Visible = false
						]]
						Debounce = false	

					end
				end)
			end
			function DropdownSettings:Add(Item,Selected)
				AddOption(Item,Selected)
			end
			local function AddOptions(Options,Selected)
				for i, Option in ipairs(Options) do
					AddOption(Option,Selected,i)
				end
				if Settings.ConfigurationSaving then
					if Settings.ConfigurationSaving.Enabled and DropdownSettings.Flag then
						RayfieldLibrary.Flags[DropdownSettings.Flag] = DropdownSettings
					end
				end
			end
			AddOptions(DropdownSettings.Options)

			function DropdownSettings:Set(NewOption, a, b, c, decode, skipSave)
				if decode then
					local s,f = pcall(function()
						NewOption = game:GetService("HttpService"):JSONDecode(NewOption)
					end)
				end
				--Dropdown.Selected.Text = NewOption
				--DropdownSettings.CurrentOption = NewOption
				setSelectedOptions(nil, (type(NewOption) == "table" and NewOption) or {NewOption})
				if not skipSave then
					SaveConfiguration()
				end
				local Success, Response = pcall(function()
					DropdownSettings.Callback(selectedOptions)
				end)
				if not Success then
					TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					Dropdown.Title.Text = "Callback Error"
					--print("Rayfield | "..DropdownSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					Dropdown.Title.Text = DropdownSettings.Name
					TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end

				--[[
				for _, droption in ipairs(Dropdown.List:GetChildren()) do
					if droption.Name ~= NewOption then
						if droption.ClassName == "Frame" and not table.find(wl, droption.Name) then
							droption.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
						end
					else
						droption.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
					end

				end
				]]
			end
			function DropdownSettings:Error(text)
				Error(text)
			end
			function DropdownSettings:Refresh(NewOptions,Default)
				--Dropdown.Selected.Text = Default
				--selectedOptions = (type(Default) == "table" and Default) or {Default}
				--setSelectedOptions()
				for _, option in ipairs(Dropdown.List:GetChildren()) do
					if option.ClassName == "Frame" and not table.find(wl, option.Name) then
						option:Destroy()
					end
				end
				AddOptions(NewOptions,Default)
			end
			function DropdownSettings:Remove(Item)
				if not table.find(wl, Item.Name) then
					if Dropdown.List:FindFirstChild(Item) then
						Dropdown.List[Item]:Destroy()
					else
						Error('Option not found.')
					end
				else
					Error("No")
				end
				if table.find(selectedOptions, Item) then
					setSelectedOptions(Item)
				end
			end

			return DropdownSettings
		end

		-- Keybind
		function Tab:CreateKeybind(KeybindSettings)
			local CheckingForKey = false
			local Keybind = Elements.Template.Keybind:Clone()
			Keybind.Name = KeybindSettings.Name
			Keybind.Title.Text = KeybindSettings.Name
			Keybind.Visible = true
			Keybind.Parent = TabPage

			Keybind.BackgroundTransparency = 1
			Keybind.UIStroke.Transparency = 1
			Keybind.Title.TextTransparency = 1

			Keybind.KeybindFrame.BackgroundColor3 = SelectedTheme.InputBackground
			Keybind.KeybindFrame.UIStroke.Color = SelectedTheme.InputStroke

			TweenService:Create(Keybind, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Keybind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Keybind.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			if KeybindSettings.Info then
				Keybind.Description.Text = KeybindSettings.Info
				connectInfoDescription(Keybind)
			end

			Keybind.KeybindFrame.KeybindBox.Text = KeybindSettings.CurrentKeybind
			Keybind.KeybindFrame.Size = UDim2.new(0, Keybind.KeybindFrame.KeybindBox.TextBounds.X + 24, ElementRowControl, 0)

			Keybind.KeybindFrame.KeybindBox.Focused:Connect(function()
				CheckingForKey = true
				Keybind.KeybindFrame.KeybindBox.Text = ""
			end)
			Keybind.KeybindFrame.KeybindBox.FocusLost:Connect(function()
				CheckingForKey = false
				if Keybind.KeybindFrame.KeybindBox.Text == nil or "" then
					Keybind.KeybindFrame.KeybindBox.Text = KeybindSettings.CurrentKeybind
					SaveConfiguration()
				end
			end)

			Keybind.MouseEnter:Connect(function()
				TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
			end)

			Keybind.MouseLeave:Connect(function()
				TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
			end)

			UserInputService.InputBegan:Connect(function(input, processed)

				if CheckingForKey then
					if input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode ~= Enum.KeyCode.RightShift then
						local SplitMessage = string.split(tostring(input.KeyCode), ".")
						local NewKeyNoEnum = SplitMessage[3]
						Keybind.KeybindFrame.KeybindBox.Text = tostring(NewKeyNoEnum)
						KeybindSettings.CurrentKeybind = tostring(NewKeyNoEnum)
						Keybind.KeybindFrame.KeybindBox:ReleaseFocus()
						SaveConfiguration()
					end
				elseif KeybindSettings.CurrentKeybind ~= nil and (input.KeyCode == Enum.KeyCode[KeybindSettings.CurrentKeybind] and not processed) then  --Test
					local Held = true
					local Connection
					Connection = input.Changed:Connect(function(prop)
						if prop == "UserInputState" then
							Connection:Disconnect()
							Held = false
						end
					end)

					if not KeybindSettings.HoldToInteract then
						local Success, Response = pcall(KeybindSettings.Callback)
						if not Success then
							TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
							TweenService:Create(Keybind.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
							Keybind.Title.Text = "Callback Error"
							--print("Rayfield | "..KeybindSettings.Name.." Callback Error " ..tostring(Response))
							wait(0.5)
							Keybind.Title.Text = KeybindSettings.Name
							TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
							TweenService:Create(Keybind.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
						end
					else
						wait(0.25)
						if Held then
							local Loop; Loop = RunService.Stepped:Connect(function()
								if not Held then
									KeybindSettings.Callback(false) -- maybe pcall this
									Loop:Disconnect()
								else
									KeybindSettings.Callback(true) -- maybe pcall this
								end
							end)	
						end
					end
				end
			end)

			Keybind.KeybindFrame.KeybindBox:GetPropertyChangedSignal("Text"):Connect(function()
				TweenService:Create(Keybind.KeybindFrame, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, Keybind.KeybindFrame.KeybindBox.TextBounds.X + 24, ElementRowControl, 0)}):Play()
			end)

			function KeybindSettings:Set(NewKeybind, _, _, _, _, skipSave)
				Keybind.KeybindFrame.KeybindBox.Text = tostring(NewKeybind)
				KeybindSettings.CurrentKeybind = tostring(NewKeybind)
				Keybind.KeybindFrame.KeybindBox:ReleaseFocus()
				if not skipSave then
					SaveConfiguration()
				end
			end
			if Settings.ConfigurationSaving then
				if Settings.ConfigurationSaving.Enabled and KeybindSettings.Flag then
					RayfieldLibrary.Flags[KeybindSettings.Flag] = KeybindSettings
				end
			end
			return KeybindSettings
		end

		-- Toggle
		function Tab:CreateToggle(ToggleSettings)
			local ToggleValue = {}
			

			local Toggle = Elements.Template.Toggle:Clone()
			
			if ToggleSettings.PremiumTag then
				attachPremiumOverlay(Toggle, ToggleSettings.PremiumTag)
			end
			
			Toggle.Name = ToggleSettings.Name
			Toggle.Title.Text = ToggleSettings.Name
			Toggle.Visible = true
			Toggle.Parent = TabPage

			Toggle.BackgroundTransparency = 1
			Toggle.UIStroke.Transparency = 1
			Toggle.Switch.UIStroke.Color = SelectedTheme.ToggleDisabledOuterStroke
			Toggle.Title.TextTransparency = 1
			Toggle.Switch.BackgroundColor3 = SelectedTheme.ToggleBackground

			if SelectedTheme ~= RayfieldLibrary.Theme.Default then
				Toggle.Switch.Shadow.Visible = false
			end

			TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Toggle.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			if ToggleSettings.Info then
				Toggle.Description.Text = ToggleSettings.Info
				connectInfoDescription(Toggle)
			end

			if not ToggleSettings.CurrentValue then
				Toggle.Switch.Indicator.Position = UDim2.new(0.1, 0,0.5, 0)
				Toggle.Switch.Indicator.UIStroke.Color = SelectedTheme.ToggleDisabledStroke
				Toggle.Switch.Indicator.BackgroundColor3 = SelectedTheme.ToggleDisabled
				Toggle.Switch.UIStroke.Color = SelectedTheme.ToggleDisabledOuterStroke
			else
				Toggle.Switch.Indicator.Position = UDim2.new(0.55, 0,0.5, 0)
				Toggle.Switch.Indicator.UIStroke.Color = SelectedTheme.ToggleEnabledStroke
				Toggle.Switch.Indicator.BackgroundColor3 = SelectedTheme.ToggleEnabled
				Toggle.Switch.UIStroke.Color = SelectedTheme.ToggleEnabledOuterStroke
			end
			
			if not ToggleSettings.PremiumTag then
				Toggle.MouseEnter:Connect(function()
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
				end)

				Toggle.MouseLeave:Connect(function()
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
				end)

				Toggle.Interact.MouseButton1Click:Connect(function()

					ToggleSettings.PreviousValue = nil
                    ToggleSettings.DontSaveCurrentValue = nil

					if ToggleSettings.CurrentValue then
						ToggleSettings.CurrentValue = false
						TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
						TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
						TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.1, 0,0.5, 0)}):Play()
						TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0.246, 0,0.518, 0)}):Play()
						TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledStroke}):Play()
						TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleDisabled}):Play()
						TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledOuterStroke}):Play()
						wait(0.05)
						TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0.346, 0,0.729, 0)}):Play()	
						wait(0.15)
						TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
						TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()	
					else
						ToggleSettings.CurrentValue = true
						TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
						TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
						TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.55, 0,0.5, 0)}):Play()
						TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0.246, 0,0.518, 0)}):Play()
						TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledStroke}):Play()
						TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleEnabled}):Play()
						TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledOuterStroke}):Play()
						wait(0.05)
						TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0.346, 0,0.729, 0)}):Play()	
						wait(0.15)
						TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
						TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()		
					end

					SaveConfiguration()

					local Success, Response = pcall(function()
						ToggleSettings.Callback(ToggleSettings.CurrentValue)
					end)

					if not Success then
						TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
						TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
						Toggle.Title.Text = "Callback Error"
						--print("Rayfield | "..ToggleSettings.Name.." Callback Error " ..tostring(Response))
						wait(0.5)
						Toggle.Title.Text = ToggleSettings.Name
						TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
						TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
					end


				end)
			end

			function ToggleSettings:Set(NewToggleValue, dontSave, _, _, _, skipSave)

				if ToggleSettings.PremiumTag then return end
				if NewToggleValue == ToggleSettings.CurrentValue then return end

                if dontSave then
					--warn("SET DONT SAVE")
					if ToggleSettings.PreviousValue ~= nil then
						ToggleSettings.PreviousValue = ToggleSettings.PreviousValue
					else
						ToggleSettings.PreviousValue = (ToggleSettings.CurrentValue or false)
					end
                    ToggleSettings.DontSaveCurrentValue = true
                else
                    ToggleSettings.PreviousValue = nil
                    ToggleSettings.DontSaveCurrentValue = nil
                end


				if NewToggleValue then
					ToggleSettings.CurrentValue = true
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.55, 0,0.5, 0)}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0.246, 0,0.518, 0)}):Play()
					TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledStroke}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleEnabled}):Play()
					TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledOuterStroke}):Play()
					wait(0.05)
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0.346, 0,0.729, 0)}):Play()	
					wait(0.15)
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()	
				else
					ToggleSettings.CurrentValue = false
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.1, 0,0.5, 0)}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0.246, 0,0.518, 0)}):Play()
					TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledStroke}):Play()
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleDisabled}):Play()
					TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledOuterStroke}):Play()
					wait(0.05)
					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0.346, 0,0.729, 0)}):Play()	
					wait(0.15)
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()	
				end

				if not skipSave then
					SaveConfiguration()
				end

				local Success, Response = pcall(function()
					ToggleSettings.Callback(ToggleSettings.CurrentValue)
				end)
				if not Success then
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					Toggle.Title.Text = "Callback Error"
					--print("Rayfield | "..ToggleSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					Toggle.Title.Text = ToggleSettings.Name
					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end
			end

			if Settings.ConfigurationSaving then
				if Settings.ConfigurationSaving.Enabled and ToggleSettings.Flag then
					RayfieldLibrary.Flags[ToggleSettings.Flag] = ToggleSettings
				end
			end

			return ToggleSettings
		end

		--Colorpicker
		function Tab:CreateColorpicker(ColorSettings)
			local ColorPicker = Elements.Template.Color:Clone()
			ColorPicker.Name = ColorSettings.Name
			ColorPicker.Title.Text = ColorSettings.Name
			ColorPicker.Visible = true
			ColorPicker.Parent = TabPage
			local Current = ColorSettings.CurrentColor
			local main = ColorPicker.Main
			local hue, saturation, value = ColorSettings.CurrentColor:ToHSV()

			local function inbounds(position, range, offset)
				local left = offset
				local right = offset + range

				if position + left < left + 3 then
					position = left + 3
				elseif position + left > right - 3 then
					position = right - 3
				end

				position = offset + position
				return position, -(left + range * 0.5 - position)
			end

			local hueposition, huerelposition = inbounds(main.Hue.Selector.AbsoluteSize.X * hue, main.Hue.Selector.AbsoluteSize.X, main.Hue.Selector.AbsolutePosition.X)
			local satposition, satrelposition = inbounds(main.Hue.Selector.AbsoluteSize.X * saturation, main.Hue.Selector.AbsoluteSize.X, main.Hue.Selector.AbsolutePosition.X)
			local valposition, valrelposition = inbounds(main.Hue.Selector.AbsoluteSize.X * value, main.Hue.Selector.AbsoluteSize.X, main.Hue.Selector.AbsolutePosition.X)

			main.Hue.Selector.Position = UDim2.new(0.5, -(main.Hue.Selector.AbsolutePosition.X + main.Hue.Selector.AbsoluteSize.X * 0.5 - hueposition), 0.5, 0)
			main.Value.Selector.Position = UDim2.new(0.5, satrelposition, 0.5, 0)
			main.Saturation.Selector.Position = UDim2.new(0.5, valrelposition, 0.5, 0)

			main.Hue.Show.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
			main.Value.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
			main.Value.Show.BackgroundColor3 = Color3.fromHSV(hue, saturation, 1)
			main.Saturation.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
			main.Saturation.Show.BackgroundColor3 = Color3.fromHSV(hue, 1, value)

			main.Hue.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					local left = main.Hue.AbsolutePosition.X
					local right = left + main.Hue.AbsoluteSize.X
					local barsize = main.Hue.AbsoluteSize.X
					local size = main.Hue.Selector.AbsoluteSize.X

					local loop; loop = RunService.RenderStepped:Connect(function()
						if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
							local location = UserInputService:GetMouseLocation().X

							if location < left + size * 0.5 then
								location = left + size * 0.5
							elseif location > right - size * 0.5 then
								location = right - size * 0.5
							end

							hue = (location - left) / barsize
							main.Hue.Selector.Position = UDim2.new(0.5, -(left + barsize * 0.5 - location), 0.5, 0)
							main.Hue.Show.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
							main.Saturation.BackgroundColor3 = main.Hue.Show.BackgroundColor3
							main.Value.BackgroundColor3 = main.Hue.Show.BackgroundColor3
						else
							loop:Disconnect()
						end
					end)
				end
			end)

			main.Saturation.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					local left = main.Saturation.AbsolutePosition.X
					local right = left + main.Saturation.AbsoluteSize.X
					local barsize = main.Saturation.AbsoluteSize.X
					local size = main.Saturation.Selector.AbsoluteSize.X

					local loop; loop = RunService.RenderStepped:Connect(function()
						if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
							local location = UserInputService:GetMouseLocation().X

							if location < left + size * 0.5 then
								location = left + size * 0.5
							elseif location > right - size * 0.5 then
								location = right - size * 0.5
							end

							value = (location - left) / barsize
							main.Saturation.Selector.Position = UDim2.new(0.5, -(left + barsize * 0.5 - location), 0.5, 0)
							main.Saturation.Show.BackgroundColor3 = Color3.fromHSV(hue, 1, value)
						else
							loop:Disconnect()
						end
					end)
				end
			end)
		end

		--Slider
		function Tab:CreateSlider(SliderSettings)
			local Dragging = false
			local Slider = Elements.Template.Slider:Clone()
			Slider.Name = SliderSettings.Name
			Slider.Title.Text = SliderSettings.Name
			Slider.Visible = true
			Slider.Parent = TabPage

			Slider.BackgroundTransparency = 1
			Slider.UIStroke.Transparency = 1
			Slider.Title.TextTransparency = 1

			if SelectedTheme ~= RayfieldLibrary.Theme.Default then
				Slider.Main.Shadow.Visible = false
			end

			if SliderSettings.Info then
				Slider.Description.Text = SliderSettings.Info
				connectInfoDescription(Slider)
			end

			Slider.Main.BackgroundColor3 = SelectedTheme.SliderBackground
			Slider.Main.UIStroke.Color = SelectedTheme.SliderStroke
			Slider.Main.Progress.BackgroundColor3 = SelectedTheme.SliderProgress

			TweenService:Create(Slider, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
			TweenService:Create(Slider.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(Slider.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()	

			Slider.Main.Progress.Size = UDim2.new(0, Slider.Main.AbsoluteSize.X * ((SliderSettings.CurrentValue + SliderSettings.Range[1]) / (SliderSettings.Range[2] - SliderSettings.Range[1])) > 5 and Slider.Main.AbsoluteSize.X * (SliderSettings.CurrentValue / (SliderSettings.Range[2] - SliderSettings.Range[1])) or 5, 1, 0)

			if not SliderSettings.Suffix then
				Slider.Main.Information.Text = tostring(SliderSettings.CurrentValue)
			else
				Slider.Main.Information.Text = tostring(SliderSettings.CurrentValue) .. " " .. SliderSettings.Suffix
			end

			Slider.MouseEnter:Connect(function()
				TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
			end)

			Slider.MouseLeave:Connect(function()
				TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
			end)

			Slider.Main.Interact.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then 
					Dragging = true 
				end 
			end)
			Slider.Main.Interact.InputEnded:Connect(function(Input) 
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then 
					Dragging = false 
				end 
			end)

			Slider.Main.Interact.InputChanged:Connect(function(Input)
				if Dragging and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
					local Location = UserInputService:GetMouseLocation().X
					if Input.UserInputType == Enum.UserInputType.Touch then
						Location = Input.Position.X
					end
					local Current = Slider.Main.Progress.AbsolutePosition.X + Slider.Main.Progress.AbsoluteSize.X
					local Start = Current

					local Loop; Loop = RunService.Stepped:Connect(function()
						if Dragging then
							if Input.UserInputType == Enum.UserInputType.MouseMovement then
								Location = UserInputService:GetMouseLocation().X
							elseif Input.UserInputType == Enum.UserInputType.Touch then
								Location = Input.Position.X
							end
							Current = Current + 0.025 * (Location - Start)

							if Location < Slider.Main.AbsolutePosition.X then
								Location = Slider.Main.AbsolutePosition.X
							elseif Location > Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X then
								Location = Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X
							end

							if Current < Slider.Main.AbsolutePosition.X + 5 then
								Current = Slider.Main.AbsolutePosition.X + 5
							elseif Current > Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X then
								Current = Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X
							end

							if Current <= Location and (Location - Start) < 0 then
								Start = Location
							elseif Current >= Location and (Location - Start) > 0 then
								Start = Location
							end
							TweenService:Create(Slider.Main.Progress, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, Current - Slider.Main.AbsolutePosition.X, 1, 0)}):Play()
							local NewValue = SliderSettings.Range[1] + (Location - Slider.Main.AbsolutePosition.X) / Slider.Main.AbsoluteSize.X * (SliderSettings.Range[2] - SliderSettings.Range[1])

							NewValue = math.floor(NewValue / SliderSettings.Increment + 0.5) * (SliderSettings.Increment * 10000000) / 10000000
							if not SliderSettings.Suffix then
								Slider.Main.Information.Text = tostring(NewValue)
							else
								Slider.Main.Information.Text = tostring(NewValue) .. " " .. SliderSettings.Suffix
							end

							if SliderSettings.CurrentValue ~= NewValue then
								SaveConfiguration()
								local Success, Response = pcall(function()
									SliderSettings.Callback(NewValue)
								end)
								if not Success then
									TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
									TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
									Slider.Title.Text = "Callback Error"
									--print("Rayfield | " .. SliderSettings.Name .. " Callback Error " .. tostring(Response))
									wait(0.5)
									Slider.Title.Text = SliderSettings.Name
									TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
									TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
								end

								SliderSettings.CurrentValue = NewValue
							end
						else
							TweenService:Create(Slider.Main.Progress, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, Location - Slider.Main.AbsolutePosition.X > 5 and Location - Slider.Main.AbsolutePosition.X or 5, 1, 0)}):Play()
							Loop:Disconnect()
						end
					end)
				end
			end)


			function SliderSettings:Set(NewVal, _, _, _, _, skipSave)
				TweenService:Create(Slider.Main.Progress, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, Slider.Main.AbsoluteSize.X * ((NewVal + SliderSettings.Range[1]) / (SliderSettings.Range[2] - SliderSettings.Range[1])) > 5 and Slider.Main.AbsoluteSize.X * (NewVal / (SliderSettings.Range[2] - SliderSettings.Range[1])) or 5, 1, 0)}):Play()
				Slider.Main.Information.Text = tostring(NewVal) .. " " .. SliderSettings.Suffix
				if not skipSave then
					SaveConfiguration()
				end
				local Success, Response = pcall(function()
					SliderSettings.Callback(NewVal)
				end)
				if not Success then
					TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
					TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
					Slider.Title.Text = "Callback Error"
					--print("Rayfield | "..SliderSettings.Name.." Callback Error " ..tostring(Response))
					wait(0.5)
					Slider.Title.Text = SliderSettings.Name
					TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
					TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				end
				SliderSettings.CurrentValue = NewVal
			end
			if Settings.ConfigurationSaving then
				if Settings.ConfigurationSaving.Enabled and SliderSettings.Flag then
					RayfieldLibrary.Flags[SliderSettings.Flag] = SliderSettings
				end
			end
			return SliderSettings
		end


		return Tab
	end

	Elements.Visible = true

	-- How long the splash is held. It carries the branding and the Discord link, so this is the
	-- one moment the artwork is ever read, and shortening it measurably cost sales. Deliberately
	-- longer than it needs to be: see the intro timing note above CreateWindow.
	if not fastLoad then
		wait(3)
	end

	-- Handed back to the signature sweep below, which expects to start from the asset's angle.
	LoadingSweep:Cancel()
	Main.UIStroke.UIGradient.Rotation = -180

	-- The card used to fade out on its own, hold still for a fifth of a second, and only then
	-- start growing, which read as three separate steps. Fading the card against the growth
	-- reads as it opening into the window instead.
	local IntroFade = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
	local IntroOpen = TweenInfo.new(1.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

	TweenService:Create(LoadingFrame.Title, IntroFade, {TextTransparency = 1}):Play()
	TweenService:Create(LoadingFrame.Subtitle, IntroFade, {TextTransparency = 1}):Play()
	TweenService:Create(LoadingFrame.Version, IntroFade, {TextTransparency = 1}):Play()
	TweenService:Create(LoadingFrame.BG, IntroFade, {ImageTransparency = 1}):Play()
	TweenService:Create(Main, IntroFade, {BackgroundColor3 = SelectedTheme.Background}):Play()

	TweenService:Create(Main, IntroOpen, {Size = UDim2.new(.5, 0,0.5, 0)}):Play()
	TweenService:Create(Main.Shadow.Image, IntroOpen, {ImageTransparency = 0.4}):Play()

	-- LoadingFrame covers the whole window at ZIndex 30, so it comes out once it is clear.
	task.delay(0.5, function()
		LoadingFrame.Visible = false
	end)

	Topbar.BackgroundTransparency = 1
	Topbar.Divider.Size = UDim2.new(0, 0, 0, 1)
	TabListBack.Divider.Size = UDim2.new(0, 1, 0, 0)
	Topbar.CornerRepair.BackgroundTransparency = 1
	Topbar.Title.TextTransparency = 1
	Topbar.Theme.ImageTransparency = 1
	Topbar.ChangeSize.ImageTransparency = 1
	Topbar.Hide.ImageTransparency = 1
	Topbar.Search.ImageTransparency = 1

	-- graident smooth

	local gradient = Main.UIStroke.UIGradient

	local numval = Instance.new("NumberValue")
	numval.Changed:Connect(function()
		gradient.Transparency = NumberSequence.new(numval.Value)
	end)


	TweenService:Create(numval, TweenInfo.new(.6, Enum.EasingStyle.Quint), {Value = 0}):Play()
	TweenService:Create(gradient, TweenInfo.new(6, Enum.EasingStyle.Circular), {Rotation = 180}):Play()
	TweenService:Create(gradient.Parent, TweenInfo.new(4, Enum.EasingStyle.Cubic), {Thickness = 1.25}):Play()
	TweenService:Create(numval, TweenInfo.new(6, Enum.EasingStyle.Quint), {Value = 1}):Play()
	task.delay(6, function()
		if not gradient.Parent then
			return
		end
		gradient.Parent.Transparency = 1
		gradient.Enabled = false
		-- What the border settles to once the intro sweep is done. Mixing the theme's glow
		-- colour most of the way into its background leaves a rim that reads as an edge in
		-- every theme instead of the fixed near-black this used to be.
		gradient.Parent.Color = SelectedTheme.Shadow:Lerp(SelectedTheme.Background, 0.82)
		TweenService:Create(gradient.Parent, TweenInfo.new(3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
	end)

	--

	Topbar.Visible = true

	-- The topbar arrived through a chain of blocking waits, so each step landed a frame or two
	-- late of where it was asked to and the cascade drifted past the window's own growth. The
	-- order is the same, carried by each tween's own delay so it stays locked to the opening.
	local function IntroStep(Duration, Delay)
		return TweenInfo.new(Duration, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, Delay)
	end

	TweenService:Create(Topbar, IntroStep(0.6, 0.28), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Topbar.CornerRepair, IntroStep(0.6, 0.28), {BackgroundTransparency = 0}):Play()
	TweenService:Create(Topbar.Title, IntroStep(0.6, 0.34), {TextTransparency = 0}):Play()
	TweenService:Create(Topbar.Divider, IntroStep(1, 0.4), {Size = UDim2.new(1, 0, 0, 1), BackgroundColor3 = SelectedTheme.Divider, BackgroundTransparency = DividerTransparency}):Play()
	TweenService:Create(TabListBack.Divider, IntroStep(1.6, 0.5), {Size = UDim2.new(0, 1, 1, 0), BackgroundColor3 = SelectedTheme.Divider, BackgroundTransparency = DividerTransparency}):Play()
	TweenService:Create(TabList.Placeholder.Title, IntroStep(0.35, 0.5), {TextTransparency = 0}):Play()
	TweenService:Create(Topbar.Hide, IntroStep(0.6, 0.66), {ImageTransparency = 0.1}):Play()
	TweenService:Create(Topbar.Search, IntroStep(0.6, 0.58), {ImageTransparency = 0.8}):Play()

	-- Held until the cascade is done so the hub's own load does not stutter the opening.
	if not fastLoad then
		wait(1.35)
	end
	function Window:Prompt(PromptSettings)
		local _,f = pcall(function()
			local PromptUI = Prompt.Prompt
			Prompt.Visible = true
			Prompt.BackgroundTransparency = 1
			PromptUI.BackgroundTransparency = 1
			PromptUI.UIStroke.Transparency = 1
			PromptUI.Content.TextTransparency = 1
			PromptUI.Title.TextTransparency = 1
			PromptUI.Sub.TextTransparency = 1
			PromptUI.Size = UDim2.new(0,340,0,140)
			PromptUI.Buttons.Template.Visible = false
			PromptUI.Buttons.Template.TextLabel.TextTransparency = 1
			PromptUI.Buttons.Template.UIStroke.Transparency = 1
			PromptUI.Buttons.UIListLayout.HorizontalAlignment = 0
			--PromptUI.Buttons.Middle.Visible = false
			--PromptUI.Buttons.Middle.TextLabel.TextTransparency = 1
			--PromptUI.Buttons.Middle.UIStroke.Transparency = 1

			PromptUI.Title.Text = PromptSettings.Title or ''
			PromptUI.Content.Text = PromptSettings.Content or ''
			PromptUI.Sub.Text = PromptSettings.SubTitle or ''

			if PromptSettings.Actions then
				for name,info in pairs(PromptSettings.Actions) do
					local Button = PromptUI.Buttons.Template:Clone()
					Button.TextLabel.Text = info.Name
					Button.Interact.MouseButton1Up:Connect(function()
						if info.FinishButton then
							if not clicked then
								local Success, Response = pcall(info.Callback)
								clicked = true
								if not Success then
									ClosePrompt()
									--print("Rayfield | "..info.Name.." Callback Error " ..tostring(Response))
								else
									ClosePrompt()
								end
							end
						else
							pcall(info.Callback)
						end
					end)
					Button.Name = name
					Button.Parent = PromptUI.Buttons -- saving memory
					Button.Size = UDim2.fromOffset(Button.TextLabel.TextBounds.X + 24, 30)
				end
			end

			TweenService:Create(Prompt, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = .5}):Play()
			wait(.2)
			TweenService:Create(PromptUI, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 0,Size = UDim2.new(0,350,0,150)}):Play()
			wait(0.2)
			TweenService:Create(PromptUI.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
			TweenService:Create(PromptUI.Title, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(PromptUI.Content, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			TweenService:Create(PromptUI.Sub, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			wait(1)
			if PromptSettings.Actions then
				for _,button in pairs(PromptUI.Buttons:GetChildren()) do
					if button.Name ~= 'Template' and button.Name ~= 'Middle' and button:IsA('Frame') then
						button.Visible = true
						TweenService:Create(button.UIStroke,TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
						TweenService:Create(button.TextLabel,TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
						wait(.1)
					end
				end
			else
				--TweenService:Create(PromptUI.Buttons.Middle.UIStroke,TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Transparency = 0}):Play()
				--TweenService:Create(PromptUI.Buttons.Middle.TextLabel,TweenInfo.new(0.3, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
			end

			if f then
				ClosePrompt()
			end

		end)
	end

	return Window
end


function RayfieldLibrary:Destroy()
	Rayfield:Destroy()
	restorePreservedInterfaces()
end

Topbar.ChangeSize.MouseButton1Click:Connect(function()
	if Debounce then return end
	if Minimised then
		Minimised = false
		Maximise()
	else
		if not SearchHided then SearchHided = true spawn(CloseSearch)  end
		Minimised = true
		Minimise()
	end
end)
Topbar.Search.MouseButton1Click:Connect(function()
	if Debounce or Minimised then return end
	if SearchHided then
		OpenSearch()
		SearchHided = false
	else
		SearchHided = true
		CloseSearch()
	end
end)
Topbar.Hide.MouseButton1Click:Connect(function()
	if Debounce then return end
	if Hidden then
		Hidden = false
		Minimised = false
		Unhide()
	else
		if not SearchHided then SearchHided = true spawn(CloseSearch)  end
		Hidden = true
		Hide()
	end
end)

local UIDisabled = false
local RayfieldConnections = {}
local bhubToggleRef = nil

table.insert(RayfieldConnections, UserInputService.InputBegan:Connect(function(input, processed)
	if UIDisabled or not isCurrent() then return end
	if (input.KeyCode == Enum.KeyCode.Tab and processed) then
		if Debounce then return end
		if Hidden then
			Hidden = false
			Unhide()
		else
			if not SearchHided then SearchHided = true spawn(CloseSearch) end
			Hidden = true
			Hide()
		end
	end
end))

if Rayfield:FindFirstChild("bhubToggle") then
	local bhubToggle = Rayfield.bhubToggle
	bhubToggleRef = bhubToggle

	-- Only the execution that owns the screen may own the entry points. A stale one reaching here
	-- late used to repoint them at its own invisible window, which is what made the live window
	-- stop responding to its own topbar.
	if isCurrent() then
		_G.ShowUI = function()
			if UIDisabled then return end
			Hidden = false
			Unhide()
		end

		_G.HideUI = function()
			if UIDisabled then return end
			Hidden = true
			Hide()
		end
	end

	-- The button was anchored to its top left corner, so growing it or popping it in slid
	-- the whole thing sideways. Re-anchoring to its centre keeps it where it was authored.
	bhubToggle.AnchorPoint = Vector2.new(0.5, 0.5)
	bhubToggle.Position = UDim2.new(bhubToggle.Position.X.Scale + bhubToggle.Size.X.Scale / 2, 0, bhubToggle.Position.Y.Scale + bhubToggle.Size.Y.Scale / 2, 0)

	-- A flat yellow square floating over the game has no edge of its own. The window and
	-- topbar both carry a stroke, so the button gets one too.
	local ToggleStrokeTransparency = 0.45
	local ToggleStroke = Instance.new("UIStroke")
	ToggleStroke.Color = SelectedTheme.Background
	ToggleStroke.Thickness = 2
	ToggleStroke.Transparency = ToggleStrokeTransparency
	ToggleStroke.Parent = bhubToggle

	local ToggleRestSize = bhubToggle.Size
	local ToggleInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
	local ToggleShown = false

	bhubToggle.Size = scaleSize(ToggleRestSize, 0.5)
	bhubToggle.BackgroundTransparency = 1
	bhubToggle.button.ImageTransparency = 1
	ToggleStroke.Transparency = 1

	-- It used to appear and vanish on a frame, mid way through the window's own half second
	-- fade. Popping it in on the same beat is what makes the two read as one action.
	local function showToggle(Shown)
		if Shown == ToggleShown then return end
		ToggleShown = Shown
		if Shown then bhubToggle.Visible = true end
		local Motion = Shown and TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out) or TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
		TweenService:Create(bhubToggle, Motion, {Size = Shown and ToggleRestSize or scaleSize(ToggleRestSize, 0.5), BackgroundTransparency = Shown and 0 or 1}):Play()
		TweenService:Create(bhubToggle.button, ToggleInfo, {ImageTransparency = Shown and 0 or 1}):Play()
		TweenService:Create(ToggleStroke, ToggleInfo, {Transparency = Shown and ToggleStrokeTransparency or 1}):Play()
		if not Shown then
			task.delay(0.3, function()
				if not ToggleShown then bhubToggle.Visible = false end
			end)
		end
	end

	-- These carry the background with them even though only the size changes. Sharing Size with
	-- the pop above means a hover landing while the button is still appearing takes that tween
	-- over, and the background would be stranded at whatever transparency it had got to.
	bhubToggle.button.MouseEnter:Connect(function()
		if ToggleShown then TweenService:Create(bhubToggle, ToggleInfo, {Size = scaleSize(ToggleRestSize, 1.08), BackgroundTransparency = 0}):Play() end
	end)

	bhubToggle.button.MouseLeave:Connect(function()
		if ToggleShown then TweenService:Create(bhubToggle, ToggleInfo, {Size = ToggleRestSize, BackgroundTransparency = 0}):Play() end
	end)

	bhubToggle.button.MouseButton1Down:Connect(function()
		if ToggleShown then TweenService:Create(bhubToggle, TweenInfo.new(0.1, Enum.EasingStyle.Quint), {Size = scaleSize(ToggleRestSize, 0.94), BackgroundTransparency = 0}):Play() end
	end)

	-- The button sits over whatever the game draws there, so it has to be movable. Dragging
	-- it must not also count as a click or nudging it aside reopens the interface, hence the
	-- small threshold before a press becomes a drag.
	local DragOrigin, DragFrom, DragMoved
	bhubToggle.button.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			DragOrigin, DragFrom, DragMoved = Input.Position, bhubToggle.Position, false
		end
	end)

	table.insert(RayfieldConnections, UserInputService.InputChanged:Connect(function(Input)
		if not DragOrigin then return end
		if Input.UserInputType ~= Enum.UserInputType.MouseMovement and Input.UserInputType ~= Enum.UserInputType.Touch then return end
		local Delta = Input.Position - DragOrigin
		if not DragMoved and Delta.Magnitude < 6 then return end
		DragMoved = true
		bhubToggle.Position = UDim2.new(DragFrom.X.Scale, DragFrom.X.Offset + Delta.X, DragFrom.Y.Scale, DragFrom.Y.Offset + Delta.Y)
	end))

	table.insert(RayfieldConnections, UserInputService.InputEnded:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			if DragOrigin and ToggleShown then
				TweenService:Create(bhubToggle, ToggleInfo, {Size = ToggleRestSize, BackgroundTransparency = 0}):Play()
			end
			DragOrigin = nil
		end
	end))

	table.insert(RayfieldConnections, bhubToggle.button.MouseButton1Click:Connect(function()
		if DragMoved then return end
		_G.ShowUI()
	end))

	task.spawn(function()
		while task.wait(.1) do
			if UIDisabled then break end
			if not isCurrent() then
				-- Nothing else lets these go. They are listeners on UserInputService rather than
				-- on the window, so a superseded execution would keep them, and the window they
				-- close over, alive for the rest of the session.
				for _, connection in ipairs(RayfieldConnections) do
					pcall(function() connection:Disconnect() end)
				end
				RayfieldConnections = {}
				break
			end
			pcall(function()
				showToggle(Hidden)
			end)
		end
	end)
end

local DisableUI = function()
	if UIDisabled then return end
	UIDisabled = true

	-- Turn everything off: set all toggle flags to false and fire their callbacks.
	-- Toggles are identified by a boolean CurrentValue (sliders/inputs use numbers/strings).
	for _, flag in pairs(RayfieldLibrary.Flags) do
		pcall(function()
			if type(flag.CurrentValue) == "boolean" and flag.CurrentValue and type(flag.Set) == "function" then
				flag:Set(false)
			end
		end)
	end

	-- Make the UI unopenable by disabling re-open listeners and entry points
	for _, connection in ipairs(RayfieldConnections) do
		pcall(function() connection:Disconnect() end)
	end
	RayfieldConnections = {}

	_G.ShowUI = function() end
	_G.HideUI = function() end

	-- Hide and completely delete the UI
	pcall(function() Hidden = true Hide() end)
	pcall(function() Rayfield:Destroy() end)
end

-- Soft destroy: hide the UI and remove the reopen button, make it unopenable,
-- but DO NOT turn off toggles/features and DO NOT delete the UI (keeps running in the background).
local SoftDestroy = function()
	if UIDisabled then return end
	UIDisabled = true

	-- Disable every entry point that could re-open the UI
	for _, connection in ipairs(RayfieldConnections) do
		pcall(function() connection:Disconnect() end)
	end
	RayfieldConnections = {}

	_G.ShowUI = function() end
	_G.HideUI = function() end

	-- Make sure the reopen button is gone
	if bhubToggleRef then
		pcall(function() bhubToggleRef.Visible = false end)
	end

	-- Hide the UI without destroying it (features keep running)
	pcall(function() Hidden = true Hide() end)
end

-- Same reason as the show/hide entry points: a superseded execution must not hand the hub a
-- teardown that only tears down its own invisible window.
if isCurrent() then
	_G.DisableUI = DisableUI
	_G.SoftDestroy = SoftDestroy
end

-- The topbar controls had no feedback at all, so nothing on the window told you they were
-- clickable. Hover lifts an icon to full weight and grows it a little, pressing dips it,
-- and the X warms to red on the way in, which is what a close control looks like
-- everywhere else. Leaving restores the theme's own X colour so a theme change still wins.
local TopbarHoverGrow = 1.08
local TopbarPressShrink = 0.94
local XIconHover = Color3.fromRGB(228, 88, 76)

for _, TopbarButton in ipairs(Topbar:GetChildren()) do
	if TopbarButton.ClassName == "ImageButton" and TopbarButton.Visible then
		local Rest = TopbarButtonRest[TopbarButton]
		local IsHide = TopbarButton == Topbar.Hide
		local Info = TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

		-- MouseButton1Click fires before MouseButton1Up, so releasing the X started the hide
		-- and then this put the icon straight back to full weight, leaving it sitting there
		-- until the window went invisible. Hide, unhide and minimise own the chrome while 
		-- they run, so hover keeps out of their way.
		local function hover(Hovering)
			if Hidden or (Debounce and (TopbarButton ~= Topbar.Search or Hovering)) then return end
			local Goal = {ImageTransparency = Hovering and 0 or Rest.ImageTransparency, Size = Hovering and scaleSize(Rest.Size, TopbarHoverGrow) or Rest.Size}
			if IsHide then Goal.ImageColor3 = Hovering and XIconHover or SelectedTheme.XIcon end
			TweenService:Create(TopbarButton, Info, Goal):Play()
		end

		TopbarButton.MouseEnter:Connect(function()
			hover(true)
		end)

		TopbarButton.MouseLeave:Connect(function()
			hover(false)
		end)

		TopbarButton.MouseButton1Down:Connect(function()
			if Debounce or Hidden then return end
			TweenService:Create(TopbarButton, TweenInfo.new(0.1, Enum.EasingStyle.Quint), {ImageTransparency = 0, Size = scaleSize(Rest.Size, TopbarPressShrink)}):Play()
		end)

		TopbarButton.MouseButton1Up:Connect(function()
			hover(true)
		end)
	end
end

local firstTimeLoad = true
local defaultConfig = {}

function RayfieldLibrary:LoadConfiguration(config)
	if firstTimeLoad then
		firstTimeLoad = false
		defaultConfig = table.clone(RayfieldLibrary.Flags)
	end
	config = config or "main"
	local oldSaveName = string.format("%s/%s%s", ConfigurationFolder, CFileName..game.Players.LocalPlayer.Name, ConfigurationExtension)
	local saveName = string.format("%s/%s%s%s", ConfigurationFolder, CFileName, config, ConfigurationExtension)
	if isfile(oldSaveName) then
		local file = readfile(oldSaveName)
		writefile(saveName, file)
		delfile(oldSaveName)
	end

	if CEnabled then
		pcall(function()
			if isfile(saveName) then
				LoadConfiguration(readfile(saveName))
				RayfieldLibrary:Notify({Title = "Configuration Loaded", Content = "The configuration file for this script has been loaded succesfully."})
			end
		end)
	end
end

function RayfieldLibrary:GetFlagsConfig(config)
	local Data = {}

	for index, data in pairs(config) do
		if data.Type == "Colorpicker" then
			Data[index] = PackColor(data.CurrentValue)
		else
			Data[index] = (data.SelectedOptions and game:GetService("HttpService"):JSONEncode(data.SelectedOptions)) or data.CurrentValue or data.CurrentKeybind or data.CurrentOption
			if Data[index] == nil then
				Data[index] = false
			end
		end
	end

	return Data
end

local HS = game:GetService("HttpService")

function RayfieldLibrary:GetDefaultConfig()
	local Data = {}

	local flags = RayfieldLibrary.Flags
	for index, data in pairs(flags) do
		local value;

		if data.SelectedOptions then
			value = HS:JSONEncode({})
		elseif data.CurrentValue then
			value = false
		elseif data.CurrentOption then
			value = "None"
		end

		if value == nil then
			value = false
		end

		Data[index] = value
	end


	return Data
end


function RayfieldLibrary:CreateConfig(config, data, default)
	if default then
		data = RayfieldLibrary:GetDefaultConfig()
	else
		data = data
	end
	data = HS:JSONEncode(data)
	_G.TEMPDATA = data
	local saveName = string.format("%s/%s%s%s", ConfigurationFolder, CFileName, config, ConfigurationExtension)
	writefile(saveName, data)
end

function RayfieldLibrary:GetConfig(config)

	local saveName = string.format("%s/%s%s%s", ConfigurationFolder, CFileName, config, ConfigurationExtension)
	local file = isfile(saveName) and readfile(saveName)
	if file then
		return file
	end
end

function RayfieldLibrary:GetCustomText()
	return CustomText
end

ChangeTheme(_G.Theme or _G.RayfieldTheme or "Yellow")

return RayfieldLibrary
