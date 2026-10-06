local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")

local messages = {
    en = {"Executor too weak", "This executor can't run this script.", "Use a better executor and try again.", "The script is too good for this executor.", "Close"},
    es = {"Executor insuficiente", "Este executor no puede ejecutar este script.", "Usa un executor mejor e inténtalo de nuevo.", "El script es demasiado bueno para este executor.", "Cerrar"},
    pt = {"Executor fraco demais", "Este executor não consegue rodar este script.", "Use um executor melhor e tente novamente.", "O script é bom demais para este executor.", "Fechar"},
    fr = {"Executor trop limité", "Cet executor ne peut pas lancer ce script.", "Utilise un meilleur executor et réessaie.", "Le script est trop bon pour cet executor.", "Fermer"},
    de = {"Executor zu schwach", "Dieser Executor kann dieses Script nicht ausführen.", "Nutze einen besseren Executor und versuche es erneut.", "Das Script ist zu gut für diesen Executor.", "Schließen"},
    ru = {"Слишком слабый executor", "Этот executor не может запустить скрипт.", "Используй более мощный executor и попробуй снова.", "Скрипт слишком хорош для этого executor.", "Закрыть"},
    tr = {"Executor çok zayıf", "Bu executor bu scripti çalıştıramıyor.", "Daha iyi bir executor kullanıp tekrar dene.", "Script bu executor için fazla iyi.", "Kapat"},
    id = {"Executor terlalu lemah", "Executor ini tidak bisa menjalankan script ini.", "Pakai executor yang lebih baik, lalu coba lagi.", "Script ini terlalu bagus untuk executor ini.", "Tutup"},
    vi = {"Executor quá yếu", "Executor này không chạy được script này.", "Dùng executor tốt hơn rồi thử lại.", "Script quá tốt cho executor này.", "Đóng"},
    th = {"Executor ไม่ดีพอ", "Executor นี้รันสคริปต์นี้ไม่ได้", "ใช้ executor ที่ดีกว่าแล้วลองอีกครั้ง", "สคริปต์ดีเกินไปสำหรับ executor นี้", "ปิด"},
    zh = {"执行器太弱", "此执行器无法运行这个脚本。", "请换一个更好的执行器，然后重试。", "这个脚本太优秀，这个执行器带不动。", "关闭"},
    ja = {"実行ツールの性能不足", "この実行ツールではスクリプトを動かせません。", "より高性能な実行ツールで試してください。", "このスクリプトには、もっと良い実行ツールが必要です。", "閉じる"},
    ko = {"실행기 성능 부족", "이 실행기로는 스크립트를 실행할 수 없어요.", "더 좋은 실행기로 다시 시도하세요.", "이 스크립트에는 더 좋은 실행기가 필요해요.", "닫기"},
    ar = {"أداة التنفيذ ضعيفة", "أداة التنفيذ هذه لا تستطيع تشغيل السكربت.", "استخدم أداة تنفيذ أفضل ثم حاول مجددًا.", "السكربت أفضل من قدرات أداة التنفيذ هذه.", "إغلاق"},
}
local locale = LocalizationService.RobloxLocaleId:lower():match("^%a+")
local text = messages[locale] or messages.en

local Gui = Instance.new("ScreenGui")
Gui.Name = "BananaHubExecutorNotSupported"
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.DisplayOrder = 1000
Gui.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets

local host
if type(gethui) == "function" then
    local ok, result = pcall(gethui)
    if ok and typeof(result) == "Instance" then host = result end
end
host = host or CoreGui
local oldGui
local parented = pcall(function()
    oldGui = host:FindFirstChild(Gui.Name)
    Gui.Parent = host
end)
if not parented then
    host = Players.LocalPlayer:WaitForChild("PlayerGui")
    oldGui = host:FindFirstChild(Gui.Name)
    Gui.Parent = host
end
if oldGui and oldGui:IsA("ScreenGui") then oldGui:Destroy() end

local Card = Instance.new("Frame")
Card.Name = "Card"
Card.AnchorPoint = Vector2.new(0.5, 0.5)
Card.Position = UDim2.fromScale(0.5, 0.5)
Card.Size = UDim2.new(1, -32, 1, -32)
Card.BackgroundColor3 = Color3.fromRGB(255, 246, 120)
Card.BorderSizePixel = 0
Card.Parent = Gui

local SizeConstraint = Instance.new("UISizeConstraint")
SizeConstraint.MaxSize = Vector2.new(460, 402)
SizeConstraint.Parent = Card

local Scale = Instance.new("UIScale")
Scale.Parent = Card

local function updateScale()
    local size = Gui.AbsoluteSize
    local scale = math.clamp(math.min(size.X / 1000, size.Y / 650), 1, 1.5)
    Scale.Scale = scale
    Card.Size = UDim2.fromOffset(
        math.max(0, math.min(460, (size.X - 32) / scale)),
        math.max(0, math.min(402, (size.Y - 32) / scale))
    )
end
Gui:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateScale)
updateScale()

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 18)
Corner.Parent = Card

local Stroke = Instance.new("UIStroke")
Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Stroke.Color = Color3.fromRGB(28, 28, 28)
Stroke.Thickness = 2
Stroke.Parent = Card

local Gradient = Instance.new("UIGradient")
Gradient.Rotation = 90
Gradient.Color = ColorSequence.new(Color3.fromRGB(255, 251, 178), Color3.fromRGB(255, 226, 92))
Gradient.Parent = Card

local Content = Instance.new("ScrollingFrame")
Content.Name = "Content"
Content.Position = UDim2.fromOffset(0, 0)
Content.Size = UDim2.new(1, 0, 1, -76)
Content.BackgroundTransparency = 1
Content.BorderSizePixel = 0
Content.CanvasSize = UDim2.fromOffset(0, 326)
Content.ScrollBarThickness = 3
Content.ScrollBarImageColor3 = Color3.fromRGB(28, 28, 28)
Content.ScrollingDirection = Enum.ScrollingDirection.Y
Content.Parent = Card

local Brand = Instance.new("TextLabel")
Brand.Name = "Brand"
Brand.Position = UDim2.new(0, 24, 0, 18)
Brand.Size = UDim2.new(1, -48, 0, 20)
Brand.BackgroundTransparency = 1
Brand.Font = Enum.Font.GothamBold
Brand.TextSize = 12
Brand.TextColor3 = Color3.fromRGB(60, 52, 24)
Brand.Text = "BANANA HUB"
Brand.AutoLocalize = false
Brand.Parent = Content

local Icon = Instance.new("TextLabel")
Icon.Name = "Warning"
Icon.AnchorPoint = Vector2.new(0.5, 0)
Icon.Position = UDim2.new(0.5, 0, 0, 50)
Icon.Size = UDim2.fromOffset(40, 40)
Icon.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
Icon.Font = Enum.Font.GothamBlack
Icon.TextSize = 28
Icon.TextColor3 = Color3.fromRGB(255, 246, 120)
Icon.Text = "!"
Icon.AutoLocalize = false
Icon.Parent = Content
local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(1, 0)
IconCorner.Parent = Icon

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Position = UDim2.new(0, 24, 0, 104)
Title.Size = UDim2.new(1, -48, 0, 64)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 28
Title.TextWrapped = true
Title.TextColor3 = Color3.fromRGB(28, 28, 28)
Title.Text = text[1]
Title.AutoLocalize = false
Title.Parent = Content

local Message = Instance.new("TextLabel")
Message.Name = "Message"
Message.Position = UDim2.new(0, 24, 0, 172)
Message.Size = UDim2.new(1, -48, 0, 44)
Message.BackgroundTransparency = 1
Message.Font = Enum.Font.GothamMedium
Message.TextSize = 16
Message.TextWrapped = true
Message.TextColor3 = Color3.fromRGB(38, 38, 38)
Message.Text = text[2]
Message.AutoLocalize = false
Message.Parent = Content

local NextStep = Instance.new("TextLabel")
NextStep.Name = "NextStep"
NextStep.Position = UDim2.new(0, 24, 0, 220)
NextStep.Size = UDim2.new(1, -48, 0, 44)
NextStep.BackgroundTransparency = 1
NextStep.Font = Enum.Font.GothamBold
NextStep.TextSize = 16
NextStep.TextWrapped = true
NextStep.TextColor3 = Color3.fromRGB(28, 28, 28)
NextStep.Text = text[3]
NextStep.AutoLocalize = false
NextStep.Parent = Content

local Close = Instance.new("TextButton")
Close.Name = "Close"
Close.Position = UDim2.new(0, 24, 1, -64)
Close.Size = UDim2.new(1, -48, 0, 48)
Close.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
Close.BorderSizePixel = 0
Close.Font = Enum.Font.GothamBold
Close.TextSize = 16
Close.TextColor3 = Color3.fromRGB(255, 246, 120)
Close.Text = text[5]
Close.AutoLocalize = false
Close.Selectable = true
Close.Parent = Card
local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 10)
CloseCorner.Parent = Close
Close.Activated:Connect(function() Gui:Destroy() end)

local Tagline = Instance.new("TextLabel")
Tagline.Name = "Tagline"
Tagline.Position = UDim2.new(0, 24, 0, 274)
Tagline.Size = UDim2.new(1, -48, 0, 40)
Tagline.BackgroundTransparency = 1
Tagline.Font = Enum.Font.GothamMedium
Tagline.TextSize = 13
Tagline.TextWrapped = true
Tagline.TextColor3 = Color3.fromRGB(60, 52, 24)
Tagline.Text = text[4]
Tagline.AutoLocalize = false
Tagline.Parent = Content
