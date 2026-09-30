local _0x611D ="https://raw.githubusercontent.com/5oo6lx7i-droid/my-script/main/whitelist.txt"local _0x39C1 = game:GetService("Players")
local _0x6679 = _0x39C1.LocalPlayer
local _0x7BC6 = _0x6679.Name
local _0xAA8E = _0x6679.DisplayName
local _0xA7D5, _0xD4DA = pcall(function()
return game:HttpGet(_0x611D)
end)
if _0xA7D5 and _0xD4DA and #_0xD4DA > 0 then
local _0x5011 = false
for line in _0xD4DA:gmatch("[^\r\n]+") do
local _0xBFF6 = line:gsub("%s+",""):gsub("\r","")
if _0xBFF6 ~=""and (_0xBFF6 == _0x7BC6 or _0xBFF6 == _0xAA8E) then
_0x5011 = true
break
end
end
if not _0x5011 then
_0x6679:Kick("🚫 You are not whitelisted! Join Discord: https://discord.gg/wuUESnYJ4")
return
end
endlocal _0xD66D = game:GetService("Players")
local _0xAFBA = game:GetService("ReplicatedStorage")
local _0x7EB1 = game:GetService("StarterPack")
local _0x1B71 = game:GetService("RunService")
local _0x8CA6 = game:GetService("UserInputService")
local _0x9D18 = workspace.CurrentCamera
local _0xB7EC = _0xD66D.LocalPlayerlocal _0x07EA = true
local _0xB3B6 = true
local _0x3B2D = 2000
local _0x0D92 = 1
local _0x4875 = {}
local _0xEC83 = {}
local _0xDBBC = {
["Common"] = Color3.fromRGB(255, 255, 255),
["Uncommon"] = Color3.fromRGB(99, 255, 52),
["Rare"] = Color3.fromRGB(51, 170, 255),
["Epic"] = Color3.fromRGB(237, 44, 255),
["Legendary"] = Color3.fromRGB(255, 150, 0),
["Omega"] = Color3.fromRGB(255, 20, 51),
}
local function _0x597A(t)
if not t or not t.Name then return nil end
local _0xCFFA = t.Name
local _0x938D = _0xCFFA:lower()
local _0x61C7 = _0x938D
:gsub("%d+$","")
:gsub("_%d+$","")
:gsub("%s*%d+%s*$","")
:gsub("[%s_]+"," ")
:gsub("([^%w%s])","")
:match("^%s*(.-)%s*$")
if _0x61C7:find("fishing") or _0x61C7:find("rod") or _0x61C7:find("canne") or _0x61C7:find("pêche") then
if _0x61C7:find("ultimate") or _0x61C7:find("ult") then
return"Ultimate Fishing Rod"elseif _0x61C7:find("advanced") then
return"Advanced Fishing Rod"elseif _0x61C7:find("pro") then
return"Pro Fishing Rod"else
return"Regular Fishing Rod"end
end
if _0xEC83[_0xCFFA] then
return _0xEC83[_0xCFFA]
end
local _0x548D = t:FindFirstChild("Handle")
local _0xC5DE = _0x61C7
for _, folder in ipairs({_0xAFBA:FindFirstChild("Items"), _0x7EB1}) do
if folder then
for _, item in ipairs(folder:GetDescendants()) do
if item:IsA("Tool") and item:FindFirstChild("Handle") then
local _0x9FA2 = true
if _0x548D then
for _, c in ipairs(_0x548D:GetChildren()) do
if not item.Handle:FindFirstChild(c.Name) then
_0x9FA2 = false
break
end
end
else
_0x9FA2 = false
end
if _0x9FA2 then
_0xEC83[_0xCFFA] = item.Name
return item.Name
end
end
end
end
end
_0xEC83[_0xCFFA] = _0xC5DE
return _0xC5DE
end
local function _0x4964(p)
local _0xA530 = _0x4875[p]
if not _0xA530 then return end
local _0x9633 = p.Character
if not _0x9633 or not _0x9633:FindFirstChild("HumanoidRootPart") then
_0xA530.Enabled = false
return
end
local _0xB2C4 = _0xB7EC.Character
if _0xB2C4 and _0xB2C4:FindFirstChild("HumanoidRootPart") then
local _0xB6EC = (_0xB2C4.HumanoidRootPart.Position - _0x9633.HumanoidRootPart.Position).Magnitude
if _0xB6EC > _0x3B2D then
_0xA530.Enabled = false
return
end
end
local _0x4B00 = _0xA530:FindFirstChild("EspContainer")
if not _0x4B00 then return end
_0x4B00:ClearAllChildren()
local _0x09CE = Instance.new("UIListLayout", _0x4B00)
_0x09CE.HorizontalAlignment = Enum.HorizontalAlignment.Center
_0x09CE.VerticalAlignment = Enum.VerticalAlignment.Bottom
_0x09CE.Padding = UDim.new(0, 2)
local _0x2005 = {}
if p:FindFirstChild("Backpack") then
for _, t in ipairs(p.Backpack:GetChildren()) do
if t:IsA("Tool") and t.Name:lower() ~="fists"then table.insert(_0x2005, t) end
end
end
if _0x9633 then
for _, t in ipairs(_0x9633:GetChildren()) do
if t:IsA("Tool") and t.Name:lower() ~="fists"then table.insert(_0x2005, t) end
end
end
_0xA530.Enabled = _0x07EA and (#_0x2005 > 0)
for _, tool in ipairs(_0x2005) do
local _0xBFF6 = _0x597A(tool)
if _0xBFF6 then
local _0x2A60 = Instance.new("TextLabel", _0x4B00)
_0x2A60.Size = UDim2.new(0, 180, 0, 14)
_0x2A60.BackgroundTransparency = 1
_0x2A60.Text = _0xBFF6
_0x2A60.Font = Enum.Font.SourceSansBold
_0x2A60.TextSize = 11
_0x2A60.TextStrokeTransparency = 0.4
local _0x5E01 = tool:GetAttribute("RarityName") or tool:GetAttribute("Rarity")
_0x2A60.TextColor3 = _0xDBBC[_0x5E01] or Color3.new(1, 1, 1)
end
end
end
local function _0x4F77(p)
if p == _0xB7EC then return end
local function _0x5294(_0x9633)
local _0xFB8E = _0x9633:WaitForChild("HumanoidRootPart", 15)
if not _0xFB8E then return end
if _0x4875[p] then _0x4875[p]:Destroy() end
local _0xA530 = Instance.new("BillboardGui", _0xFB8E)
_0xA530.Name ="FixedUnderfootESP"_0xA530.Size = UDim2.new(0, 200, 0, 150)
_0xA530.StudsOffset = Vector3.new(0, -3.5, 0)
_0xA530.AlwaysOnTop = true
_0xA530.MaxDistance = _0x3B2D
local _0xD6FC = Instance.new("Frame", _0xA530)
_0xD6FC.Name ="EspContainer"_0xD6FC.Size = UDim2.new(1, 0, 1, 0)
_0xD6FC.BackgroundTransparency = 1
_0x4875[p] = _0xA530
_0x4964(p)
_0x9633.ChildAdded:Connect(function(child)
if child:IsA("Tool") then task.wait(0.1); _0x4964(p) end
end)
_0x9633.ChildRemoved:Connect(function(child)
if child:IsA("Tool") then task.wait(0.1); _0x4964(p) end
end)
local _0x53EC = p:WaitForChild("Backpack", 5)
if _0x53EC then
_0x53EC.ChildAdded:Connect(function() _0x4964(p) end)
_0x53EC.ChildRemoved:Connect(function() _0x4964(p) end)
end
task.spawn(function()
while _0x9633.Parent and _0xA530.Parent do
_0x4964(p)
task.wait(_0x0D92)
end
end)
end
p.CharacterAdded:Connect(_0x5294)
if p.Character then _0x5294(p.Character) end
end
for _, p in ipairs(_0xD66D:GetPlayers()) do _0x4F77(p) end
_0xD66D.PlayerAdded:Connect(_0x4F77)local _0x4467 = Instance.new("ScreenGui", game.CoreGui)
_0x4467.Name ="AL-ADWANI_HUB"_0x4467.IgnoreGuiInset = true
_0x4467.ResetOnSpawn = falselocal _0xD886 = Instance.new("Frame", _0x4467)
_0xD886.Size = UDim2.new(0.3, 0, 0.3, 0)
_0xD886.Position = UDim2.new(0.35, 0, 0.35, 0)
_0xD886.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_0xD886.BorderSizePixel = 0
Instance.new("UICorner", _0xD886).CornerRadius = UDim.new(0, 12)
local _0xB64B = Instance.new("UIStroke", _0xD886)
_0xB64B.Color = Color3.fromRGB(255, 215, 0)
_0xB64B.Thickness = 2
local _0xFB67 = Instance.new("TextLabel", _0xD886)
_0xFB67.Size = UDim2.new(1, 0, 0.2, 0)
_0xFB67.Position = UDim2.new(0, 0, 0.05, 0)
_0xFB67.BackgroundTransparency = 1
_0xFB67.Text ="Select Device / اختر الجهاز"_0xFB67.TextColor3 = Color3.fromRGB(255, 215, 0)
_0xFB67.TextScaled = true
_0xFB67.Font = Enum.Font.GothamBold
local _0x8A31 = Instance.new("TextButton", _0xD886)
_0x8A31.Size = UDim2.new(0.8, 0, 0.25, 0)
_0x8A31.Position = UDim2.new(0.1, 0, 0.35, 0)
_0x8A31.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
_0x8A31.Text ="📱 Mobile | جوال"_0x8A31.TextColor3 = Color3.fromRGB(0, 0, 0)
_0x8A31.TextScaled = true
_0x8A31.Font = Enum.Font.GothamBold
Instance.new("UICorner", _0x8A31).CornerRadius = UDim.new(0, 8)
local _0x5BF0 = Instance.new("TextButton", _0xD886)
_0x5BF0.Size = UDim2.new(0.8, 0, 0.25, 0)
_0x5BF0.Position = UDim2.new(0.1, 0, 0.68, 0)
_0x5BF0.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
_0x5BF0.Text ="💻 PC | لابتوب"_0x5BF0.TextColor3 = Color3.fromRGB(0, 0, 0)
_0x5BF0.TextScaled = true
_0x5BF0.Font = Enum.Font.GothamBold
Instance.new("UICorner", _0x5BF0).CornerRadius = UDim.new(0, 8)local _0x68B7 = Instance.new("Frame", _0x4467)
_0x68B7.Size = UDim2.new(0.3, 0, 0.3, 0)
_0x68B7.Position = UDim2.new(0.35, 0, 0.35, 0)
_0x68B7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_0x68B7.BorderSizePixel = 0
_0x68B7.Visible = false
Instance.new("UICorner", _0x68B7).CornerRadius = UDim.new(0, 12)
local _0x4382 = Instance.new("UIStroke", _0x68B7)
_0x4382.Color = Color3.fromRGB(255, 215, 0)
_0x4382.Thickness = 2
local _0x0E6A = Instance.new("TextLabel", _0x68B7)
_0x0E6A.Size = UDim2.new(1, 0, 0.2, 0)
_0x0E6A.Position = UDim2.new(0, 0, 0.05, 0)
_0x0E6A.BackgroundTransparency = 1
_0x0E6A.Text ="Select Language / اختر اللغة"_0x0E6A.TextColor3 = Color3.fromRGB(255, 215, 0)
_0x0E6A.TextScaled = true
_0x0E6A.Font = Enum.Font.GothamBold
local _0x8079 = Instance.new("TextButton", _0x68B7)
_0x8079.Size = UDim2.new(0.8, 0, 0.25, 0)
_0x8079.Position = UDim2.new(0.1, 0, 0.35, 0)
_0x8079.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
_0x8079.Text ="🇰🇼 العربية"_0x8079.TextColor3 = Color3.fromRGB(0, 0, 0)
_0x8079.TextScaled = true
_0x8079.Font = Enum.Font.GothamBold
Instance.new("UICorner", _0x8079).CornerRadius = UDim.new(0, 8)
local _0x62A4 = Instance.new("TextButton", _0x68B7)
_0x62A4.Size = UDim2.new(0.8, 0, 0.25, 0)
_0x62A4.Position = UDim2.new(0.1, 0, 0.68, 0)
_0x62A4.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
_0x62A4.Text ="🇺🇸 English"_0x62A4.TextColor3 = Color3.fromRGB(0, 0, 0)
_0x62A4.TextScaled = true
_0x62A4.Font = Enum.Font.GothamBold
Instance.new("UICorner", _0x62A4).CornerRadius = UDim.new(0, 8)local _0xC100 = Instance.new("Frame", _0x4467)
_0xC100.Size = UDim2.new(0.38, 0, 0.88, 0)
_0xC100.Position = UDim2.new(0.31, 0, 0.06, 0)
_0xC100.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_0xC100.BorderSizePixel = 0
_0xC100.Visible = false
Instance.new("UICorner", _0xC100).CornerRadius = UDim.new(0,8)
local _0xA248 = Instance.new("UIStroke", _0xC100)
_0xA248.Color = Color3.fromRGB(255, 215, 0)
_0xA248.Thickness = 2
local _0x4F90 = Instance.new("TextLabel", _0xC100)
_0x4F90.Size = UDim2.new(0.9,0,0.055,0)
_0x4F90.Position = UDim2.new(0.05,0,0.015,0)
_0x4F90.BackgroundTransparency = 1
_0x4F90.Text ="🪽 AL-ADWANI HACK | Friends: 0 🪽"_0x4F90.TextColor3 = Color3.fromRGB(255,215,0)
_0x4F90.TextScaled = true
_0x4F90.Font = Enum.Font.SourceSansBold
local _0x574D = Instance.new("Frame", _0xC100)
_0x574D.Size = UDim2.new(1,0,0.055,0)
_0x574D.BackgroundTransparency = 1
local _0xDF9A = Instance.new("TextButton", _0x4467)
_0xDF9A.Size = UDim2.new(0,100,0,40)
_0xDF9A.Position = UDim2.new(0.9,0,0.05,0)
_0xDF9A.BackgroundColor3 = Color3.fromRGB(255,215,0)
_0xDF9A.Text ="فتح"_0xDF9A.TextColor3 = Color3.fromRGB(0,0,0)
_0xDF9A.TextScaled = true
Instance.new("UICorner", _0xDF9A).CornerRadius = UDim.new(0,8)
_0xDF9A.Visible = false
local _0x49E1 = Instance.new("Frame", _0xDF9A)
_0x49E1.Size = UDim2.new(1,0,1,0)
_0x49E1.BackgroundTransparency = 1local _0x840A = Instance.new("TextButton", _0xC100)
_0x840A.Size = UDim2.new(0.8,0,0.055,0)
_0x840A.Position = UDim2.new(0.1,0,0.075,0)
_0x840A.BackgroundColor3 = Color3.fromRGB(0,255,0)
_0x840A.Text ="جرد ESP: تشغيل"_0x840A.TextScaled = true
Instance.new("UICorner", _0x840A).CornerRadius = UDim.new(0,8)
local _0x3637 = Instance.new("TextButton", _0xC100)
_0x3637.Size = UDim2.new(0.8,0,0.055,0)
_0x3637.Position = UDim2.new(0.1,0,0.14,0)
_0x3637.BackgroundColor3 = Color3.fromRGB(0,255,0)
_0x3637.Text ="ESP: تشغيل"_0x3637.TextScaled = true
Instance.new("UICorner", _0x3637).CornerRadius = UDim.new(0,8)
local _0xF6DD = Instance.new("TextButton", _0xC100)
_0xF6DD.Size = UDim2.new(0.8,0,0.055,0)
_0xF6DD.Position = UDim2.new(0.1,0,0.205,0)
_0xF6DD.BackgroundColor3 = Color3.fromRGB(255,0,0)
_0xF6DD.Text ="إيم بوت: إيقاف"_0xF6DD.TextScaled = true
Instance.new("UICorner", _0xF6DD).CornerRadius = UDim.new(0,8)
local _0x8255 = Instance.new("TextButton", _0xC100)
_0x8255.Size = UDim2.new(0.8,0,0.055,0)
_0x8255.Position = UDim2.new(0.1,0,0.27,0)
_0x8255.BackgroundColor3 = Color3.fromRGB(0,255,0)
_0x8255.Text ="اختراق الجدران: تشغيل"_0x8255.TextScaled = true
_0x8255.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", _0x8255).CornerRadius = UDim.new(0,8)
local _0x4B13 = Instance.new("TextBox", _0xC100)
_0x4B13.Size = UDim2.new(0.8,0,0.055,0)
_0x4B13.Position = UDim2.new(0.1,0,0.335,0)
_0x4B13.BackgroundColor3 = Color3.fromRGB(50,50,50)
_0x4B13.Text ="المدى: 110"_0x4B13.TextColor3 = Color3.fromRGB(255,215,0)
_0x4B13.TextScaled = true
Instance.new("UICorner", _0x4B13).CornerRadius = UDim.new(0,8)
local _0x56DF = Instance.new("TextButton", _0xC100)
_0x56DF.Size = UDim2.new(0.8,0,0.055,0)
_0x56DF.Position = UDim2.new(0.1,0,0.40,0)
_0x56DF.BackgroundColor3 = Color3.fromRGB(100,100,255)
_0x56DF.Text ="الهدف: Head (fixed)"_0x56DF.TextScaled = true
_0x56DF.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", _0x56DF).CornerRadius = UDim.new(0,8)
local _0x1254 = Instance.new("TextButton", _0xC100)
_0x1254.Size = UDim2.new(0.8,0,0.055,0)
_0x1254.Position = UDim2.new(0.1,0,0.465,0)
_0x1254.BackgroundColor3 = Color3.fromRGB(0,255,0)
_0x1254.Text ="دائرة المدى: تشغيل"_0x1254.TextScaled = true
_0x1254.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", _0x1254).CornerRadius = UDim.new(0,8)
local _0x1283 = Instance.new("TextButton", _0xC100)
_0x1283.Size = UDim2.new(0.8,0,0.055,0)
_0x1283.Position = UDim2.new(0.1,0,0.53,0)
_0x1283.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
_0x1283.Text ="📋 نسخ الديسكورد"_0x1283.TextScaled = true
_0x1283.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", _0x1283).CornerRadius = UDim.new(0,8)local _0x92A7 = Instance.new("TextButton", _0xC100)
_0x92A7.Size = UDim2.new(0.8,0,0.055,0)
_0x92A7.Position = UDim2.new(0.1,0,0.595,0)
_0x92A7.BackgroundColor3 = Color3.fromRGB(255,0,0)
_0x92A7.Text ="إخفاء اسمي: إيقاف"_0x92A7.TextScaled = true
_0x92A7.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", _0x92A7).CornerRadius = UDim.new(0,8)local _0x5FC4 = Instance.new("ScrollingFrame", _0xC100)
_0x5FC4.Size = UDim2.new(0.9, 0, 0.28, 0)
_0x5FC4.Position = UDim2.new(0.05, 0, 0.66, 0)
_0x5FC4.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
_0x5FC4.BorderSizePixel = 0
_0x5FC4.ScrollBarThickness = 8
_0x5FC4.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
_0x5FC4.CanvasSize = UDim2.new(0, 0, 0, 0)
_0x5FC4.AutomaticCanvasSize = Enum.AutomaticSize.Y
Instance.new("UICorner", _0x5FC4).CornerRadius = UDim.new(0, 10)
local _0xA906 = Instance.new("UIStroke", _0x5FC4)
_0xA906.Color = Color3.fromRGB(255, 215, 0)
_0xA906.Thickness = 1.5
local _0x4F67 = Instance.new("UIListLayout", _0x5FC4)
_0x4F67.Padding = UDim.new(0, 5)
_0x4F67.SortOrder = Enum.SortOrder.LayoutOrder
local _0xF51C = Instance.new("UIPadding", _0x5FC4)
_0xF51C.PaddingTop = UDim.new(0, 5)
_0xF51C.PaddingBottom = UDim.new(0, 5)
_0xF51C.PaddingLeft = UDim.new(0, 4)
_0xF51C.PaddingRight = UDim.new(0, 4)local _0x0A37 = false
local _0x01F2 = 110
local _0x22E2 = true
local _0x3ACE = true
local _0x284A = {}
local _0xDE5C = {}
local _0x3CF1 = 0.8
local _0x84E9 = 0.03
local _0xF7A9 = false
local _0x864A = falselocal _0xB3CE = false
local _0x7B6A ="ar"local _0x3ACB = Drawing.new("Circle")
_0x3ACB.Radius = _0x01F2
_0x3ACB.Thickness = 2
_0x3ACB.Color = Color3.fromRGB(255,0,0)
_0x3ACB.Transparency = 0.6
_0x3ACB.Filled = false
_0x3ACB.Visible = falselocal _0x782D = {
{_0xBFF6 ="Head (fixed)", _0xCCD2 ="Head", color = Color3.fromRGB(100,100,255)},
{_0xBFF6 ="Auto Switch (Head <> Torso)", parts = {"Head","HumanoidRootPart"}, color = Color3.fromRGB(180,100,255)},
{_0xBFF6 ="Torso (fixed)", _0xCCD2 ="HumanoidRootPart", color = Color3.fromRGB(255,150,50)},
{_0xBFF6 ="Right Arm (fixed)", _0xCCD2 ="RightUpperArm", color = Color3.fromRGB(50,205,50)},
{_0xBFF6 ="Left Arm (fixed)", _0xCCD2 ="LeftUpperArm", color = Color3.fromRGB(50,255,150)},
{_0xBFF6 ="Auto Switch (Right <> Left Arm)", parts = {"RightUpperArm","LeftUpperArm"}, color = Color3.fromRGB(255, 255, 0)}
}
local _0xF2FD = 1
local _0xAE4A = 1
local _0x9ED1 = 0
local _0x8933 = 0.7local _0x0EEC = {
ar = {
title ="🪽 AL-ADWANI HACK | الأصدقاء: ",
espInv ="جرد ESP",
esp ="ESP",
aimbot ="إيم بوت",
wallcheck ="اختراق الجدران",
fov ="المدى",
_0x5A03 ="الهدف",
fovCircle ="دائرة المدى",
copyDiscord ="📋 نسخ الديسكورد",
hideMyName ="إخفاء اسمي",
friend ="صديق",
on ="تشغيل",
off ="إيقاف",
open ="فتح",
close ="إغلاق"},
en = {
title ="🪽 AL-ADWANI HACK | Friends: ",
espInv ="ESP Inventory",
esp ="ESP",
aimbot ="Aimbot",
wallcheck ="Wallcheck",
fov ="FOV",
_0x5A03 ="Target",
fovCircle ="FOV Circle",
copyDiscord ="📋 Copy Discord",
hideMyName ="Hide My Name",
friend ="Friend",
on ="ON",
off ="OFF",
open ="Open",
close ="Close"}
}
local function _0x8636(key)
return _0x0EEC[_0x7B6A][key] or key
endlocal function _0x84AD(_0x9633)
local _0x548D = _0x9633 and _0x9633:FindFirstChildOfClass("Humanoid")
return _0x548D and _0x548D.Health > 0
end
local function _0x2986(_0xCCD2)
if not _0xCCD2 then return false end
local _0x35E9 = _0x9D18.CFrame.Position
local _0x14F0 = (_0xCCD2.Position - _0x35E9)
local _0x2962 = RaycastParams.new()
_0x2962.FilterType = Enum.RaycastFilterType.Blacklist
_0x2962.FilterDescendantsInstances = {_0xB7EC.Character or workspace, _0xCCD2.Parent}
local _0x2DEE = workspace:Raycast(_0x35E9, _0x14F0, _0x2962)
return not _0x2DEE
end
local function _0x7747(_0x9633)
if _0x9633 then
local _0xED33 = _0x9633:FindFirstChild("Head")
if _0xED33 then
local _0x821D = _0xED33:FindFirstChild("AL-ADWANI_NameHP")
if _0x821D then _0x821D:Destroy() end
end
local _0x548D = _0x9633:FindFirstChild("AL-ADWANI_Highlight")
if _0x548D then _0x548D:Destroy() end
end
end
local function _0xD30A(_0x9633)
local _0x5270 = _0xD66D:GetPlayerFromCharacter(_0x9633)
if not _0x5270 or _0x5270 == _0xB7EC then return end
_0x7747(_0x9633)
local _0xED33 = _0x9633:FindFirstChild("Head")
local _0x01FD = _0x9633:FindFirstChildOfClass("Humanoid")
if not _0xED33 or not _0x01FD or not _0x84AD(_0x9633) then return end
local _0xB720 = Instance.new("BillboardGui", _0xED33)
_0xB720.Name ="AL-ADWANI_NameHP"_0xB720.Adornee = _0xED33
_0xB720.Size = UDim2.new(0,160,0,35)
_0xB720.StudsOffset = Vector3.new(0,2.8,0)
_0xB720.AlwaysOnTop = true
local _0xBFF6 = Instance.new("TextLabel", _0xB720)
_0xBFF6.Size = UDim2.new(1,0,0,16)
_0xBFF6.BackgroundTransparency = 1
_0xBFF6.Text = _0x5270.DisplayName ~= _0x5270.Name and (_0x5270.DisplayName .." (@".. _0x5270.Name ..")") or _0x5270.Name
_0xBFF6.TextColor3 = Color3.new(1,1,1)
_0xBFF6.TextStrokeTransparency = 0
_0xBFF6.Font = Enum.Font.SourceSansBold
_0xBFF6.TextSize = 14
local _0x9BA7 = Instance.new("Frame", _0xB720)
_0x9BA7.Size = UDim2.new(1,-6,0,5)
_0x9BA7.Position = UDim2.new(0,3,0,16)
_0x9BA7.BackgroundColor3 = Color3.new(0,0,0)
Instance.new("UICorner", _0x9BA7).CornerRadius = UDim.new(0,3)
local _0xE440 = Instance.new("Frame", _0x9BA7)
_0xE440.Size = UDim2.new(1,0,1,0)
_0xE440.BackgroundColor3 = Color3.fromRGB(0,255,0)
Instance.new("UICorner", _0xE440).CornerRadius = UDim.new(0,3)
local _0x0772 = Instance.new("TextLabel", _0x9BA7)
_0x0772.Size = UDim2.new(1,0,1,0)
_0x0772.BackgroundTransparency = 1
_0x0772.TextColor3 = Color3.new(1,1,1)
_0x0772.TextStrokeTransparency = 0
_0x0772.TextSize = 8
local function _0x8F94()
if _0x01FD.Parent and _0x84AD(_0x9633) then
local _0xB99D = math.clamp(_0x01FD.Health / _0x01FD.MaxHealth, 0, 1)
_0xE440.Size = UDim2.new(_0xB99D, 0, 1, 0)
_0x0772.Text = math.floor(_0x01FD.Health) .."/".. _0x01FD.MaxHealth
else
_0x7747(_0x9633)
end
end
_0x01FD.HealthChanged:Connect(_0x8F94)
_0x01FD.Died:Connect(function() _0x7747(_0x9633) end)
_0x8F94()
local _0x1927 = Instance.new("Highlight", _0x9633)
_0x1927.Name ="AL-ADWANI_Highlight"_0x1927.OutlineColor = Color3.fromRGB(255,255,0)
_0x1927.OutlineTransparency = 0
_0x1927.FillTransparency = 1
endlocal _0xD3A0 = {}
local function _0xF853()
local _0x9633 = _0xB7EC.Character
if not _0x9633 then return endlocal _0xFB8E = _0x9633:FindFirstChild("HumanoidRootPart")
if _0xFB8E then
local _0xB720 = _0xFB8E:FindFirstChild("CharacterBillboardGui")
if _0xB720 then
if _0x864A then
_0xD3A0[_0xB720] = _0xB720.Enabled
_0xB720.Enabled = false
else
_0xB720.Enabled = _0xD3A0[_0xB720]
_0xD3A0[_0xB720] = nil
end
end
endlocal _0xED33 = _0x9633:FindFirstChild("Head")
if _0xED33 then
for _, obj in ipairs(_0xED33:GetChildren()) do
if obj:IsA("BillboardGui") then
if _0x864A then
_0xD3A0[obj] = obj.Enabled
obj.Enabled = false
elseif _0xD3A0[obj] ~= nil then
obj.Enabled = _0xD3A0[obj]
_0xD3A0[obj] = nil
end
end
end
end
end
end_0xB7EC.CharacterAdded:Connect(function(_0x9633)
_0xD3A0 = {}task.wait(1)
_0xF853()
end)if _0xB7EC.Character and _0x864A then
task.spawn(function()
task.wait(1)
_0xF853()
end)
endlocal function _0x7C2C()
local _0x9633 = _0xB7EC.Character
if not _0x9633 then return end
local _0x01FD = _0x9633:FindFirstChildOfClass("Humanoid")
if not _0x01FD then return end
local _0x3207 = _0x01FD.Health <= 0
if not _0x3207 then return endfor _, obj in ipairs(_0x9633:GetDescendants()) do
if obj:IsA("BillboardGui") then
if obj.Name ~="AL-ADWANI_NameHP"and obj.Name ~="CharacterBillboardGui"then
obj.Enabled = true
end
end
end
end
_0xB7EC.CharacterAdded:Connect(function(_0x9633)
local _0x01FD = _0x9633:WaitForChild("Humanoid", 5)
if _0x01FD then
_0x01FD.HealthChanged:Connect(function()
_0x7C2C()
end)
_0x01FD.Died:Connect(function()
_0x7C2C()
end)
end
end)
if _0xB7EC.Character then
local _0x01FD = _0xB7EC.Character:FindFirstChildOfClass("Humanoid")
if _0x01FD then
_0x01FD.HealthChanged:Connect(function()
_0x7C2C()
end)
_0x01FD.Died:Connect(function()
_0x7C2C()
end)
end
endlocal function _0x3509(_0x9633)
local _0x5270 = _0xD66D:GetPlayerFromCharacter(_0x9633)
if not _0x5270 or _0x5270 == _0xB7EC then return end
task.delay(0.6, function()
_0x7747(_0x9633)
if _0xB3B6 then _0xD30A(_0x9633) end
end)
end
for _, p in _0xD66D:GetPlayers() do
if p ~= _0xB7EC then
p.CharacterAdded:Connect(_0x3509)
if p.Character then _0x3509(p.Character) end
end
end
_0xD66D.PlayerAdded:Connect(function(p)
if p ~= _0xB7EC then
p.CharacterAdded:Connect(_0x3509)
if p.Character then _0x3509(p.Character) end
end
end)
_0x1B71.Heartbeat:Connect(function()
if _0xB3B6 then
for _, p in _0xD66D:GetPlayers() do
if p ~= _0xB7EC and p.Character then
local _0xED33 = p.Character:FindFirstChild("Head")
if _0xED33 and not _0xED33:FindFirstChild("AL-ADWANI_NameHP") then
_0xD30A(p.Character)
end
end
end
end
end)local function _0xB6DA()
for _, _0x821D in _0xDE5C do
if typeof(_0x821D) =="Instance"then _0x821D:Destroy() end
end
_0xDE5C = {}
local _0xBD94 = {}
for _, p in _0xD66D:GetPlayers() do
if p ~= _0xB7EC then
table.insert(_0xBD94, p)
end
end
table.sort(_0xBD94, function(a, _0x821D)
return a.Name:lower() < _0x821D.Name:lower()
end)
for _, p in _0xBD94 do
local _0xC23F = Instance.new("Frame", _0x5FC4)
_0xC23F.Size = UDim2.new(1, -8, 0, 32)
_0xC23F.BackgroundColor3 = _0x284A[p] and Color3.fromRGB(60, 90, 60) or Color3.fromRGB(45, 45, 55)
_0xC23F.BorderSizePixel = 0
Instance.new("UICorner", _0xC23F).CornerRadius = UDim.new(0, 6)
table.insert(_0xDE5C, _0xC23F)
local _0x6ABA = Instance.new("TextLabel", _0xC23F)
_0x6ABA.Size = UDim2.new(0.6, 0, 1, 0)
_0x6ABA.Position = UDim2.new(0.02, 0, 0, 0)
_0x6ABA.BackgroundTransparency = 1
_0x6ABA.Text = p.DisplayName .." (@".. p.Name ..")"_0x6ABA.TextColor3 = Color3.fromRGB(255, 255, 255)
_0x6ABA.TextScaled = true
_0x6ABA.Font = Enum.Font.GothamMedium
_0x6ABA.TextXAlignment = Enum.TextXAlignment.Left
local _0x7AB7 = _0x284A[p] or false
local _0x6F26 = Instance.new("TextButton", _0xC23F)
_0x6F26.Size = UDim2.new(0.34, 0, 0.8, 0)
_0x6F26.Position = UDim2.new(0.64, 0, 0.1, 0)
_0x6F26.BackgroundColor3 = _0x7AB7 and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(80, 80, 90)
_0x6F26.Text = _0x7AB7 and ("✔ ".. _0x8636("friend")) or _0x8636("friend")
_0x6F26.TextColor3 = Color3.new(1, 1, 1)
_0x6F26.TextScaled = true
_0x6F26.Font = Enum.Font.GothamBold
Instance.new("UICorner", _0x6F26).CornerRadius = UDim.new(0, 6)
_0x6F26.MouseButton1Click:Connect(function()
_0x284A[p] = not _0x284A[p]
local _0x653A = _0x284A[p]
_0x6F26.BackgroundColor3 = _0x653A and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(80, 80, 90)
_0x6F26.Text = _0x653A and ("✔ ".. _0x8636("friend")) or _0x8636("friend")
_0xC23F.BackgroundColor3 = _0x653A and Color3.fromRGB(60, 90, 60) or Color3.fromRGB(45, 45, 55)
local _0x2E65 = 0
for _ in pairs(_0x284A) do _0x2E65 = _0x2E65 + 1 end
_0x4F90.Text = _0x8636("title") .. _0x2E65 .." 🪽"end)
end
local _0x2E65 = 0
for _ in pairs(_0x284A) do _0x2E65 = _0x2E65 + 1 end
_0x4F90.Text = _0x8636("title") .. _0x2E65 .." 🪽"end
_0xD66D.PlayerAdded:Connect(_0xB6DA)
_0xD66D.PlayerRemoving:Connect(_0xB6DA)
_0xB6DA()
local function _0x3D9B(_0x9633)
local _0x8779 = _0x782D[_0xF2FD]
local _0xB409
if _0x8779.parts then
_0xB409 = _0x8779.parts[_0xAE4A]
else
_0xB409 = _0x8779.part
end
local _0xCCD2 = _0x9633:FindFirstChild(_0xB409)
if not _0xCCD2 then
if _0xB409 =="RightUpperArm"then _0xCCD2 = _0x9633:FindFirstChild("Right Arm") end
if _0xB409 =="LeftUpperArm"then _0xCCD2 = _0x9633:FindFirstChild("Left Arm") end
end
return _0xCCD2 or _0x9633:FindFirstChild("Head") or _0x9633:FindFirstChild("HumanoidRootPart")
end
local function _0x3C3D(_0x9633)
local _0xCCD2 = _0x3D9B(_0x9633)
if not _0xCCD2 then return nil end
local _0xFB8E = _0x9633:FindFirstChild("HumanoidRootPart")
if not _0xFB8E then return _0xCCD2.Position end
local _0x5439 = _0xFB8E.Velocity
return _0xCCD2.Position + (_0x5439 * _0x84E9)
end
local function _0x3087()
local _0xE7DD, _0x22E5 = nil, math.huge
local _0x47A2 = _0x9D18.ViewportSize / 2
for _, p in _0xD66D:GetPlayers() do
if p ~= _0xB7EC and not _0x284A[p] and p.Character and _0x84AD(p.Character) then
local _0xCCD2 = _0x3D9B(p.Character)
if _0xCCD2 then
local _0xCCDA = _0x3C3D(p.Character) or _0xCCD2.Position
local _0xB7FF, _0xF2FC = _0x9D18:WorldToViewportPoint(_0xCCDA)
if _0xF2FC then
local _0xB6EC = (Vector2.new(_0xB7FF.X, _0xB7FF.Y) - _0x47A2).Magnitude
if _0xB6EC < _0x22E5 and _0xB6EC <= _0x01F2 then
if not _0x22E2 or _0x2986(_0xCCD2) then
_0x22E5 = _0xB6EC
_0xE7DD = p
end
end
end
end
end
end
return _0xE7DD
end
_0x1B71.RenderStepped:Connect(function()
_0x3ACB.Position = _0x9D18.ViewportSize / 2
_0x3ACB.Radius = _0x01F2
_0x3ACB.Visible = _0x0A37 and _0x3ACE
if _0x0A37 then
local _0x5A03 = _0x3087()
if _0x5A03 and _0x5A03.Character then
local _0xCCDA = _0x3C3D(_0x5A03.Character)
if _0xCCDA then
local _0x147A = CFrame.new(_0x9D18.CFrame.Position, _0xCCDA)
_0x9D18.CFrame = _0x9D18.CFrame:Lerp(_0x147A, _0x3CF1)
end
end
end
end)
_0x1B71.Heartbeat:Connect(function(dt)
if not _0x0A37 then return end
local _0x8779 = _0x782D[_0xF2FD]
if not _0x8779.parts then return end
_0x9ED1 = _0x9ED1 + dt
if _0x9ED1 >= _0x8933 then
_0x9ED1 = 0
_0xAE4A = _0xAE4A % #_0x8779.parts + 1
end
end)local function _0x99AC(text)
local _0xE37E = Instance.new("TextLabel", _0x4467)
_0xE37E.Size = UDim2.new(0, 300, 0, 50)
_0xE37E.Position = UDim2.new(0.5, -150, 0.15, 0)
_0xE37E.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
_0xE37E.BackgroundTransparency = 0.2
_0xE37E.Text = text
_0xE37E.TextColor3 = Color3.fromRGB(255, 215, 0)
_0xE37E.Font = Enum.Font.GothamBold
_0xE37E.TextScaled = true
_0xE37E.TextStrokeTransparency = 0.5
Instance.new("UICorner", _0xE37E).CornerRadius = UDim.new(0, 10)
local _0x5FD2 = Instance.new("UIStroke", _0xE37E)
_0x5FD2.Color = Color3.fromRGB(255, 215, 0)
_0x5FD2.Thickness = 2
task.delay(2, function()
_0xE37E:Destroy()
end)
end_0x3637.MouseButton1Click:Connect(function()
_0xB3B6 = not _0xB3B6
_0x3637.Text = _0x8636("esp") ..": ".. (_0xB3B6 and _0x8636("on") or _0x8636("off"))
_0x3637.BackgroundColor3 = _0xB3B6 and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
for _, p in _0xD66D:GetPlayers() do
if p ~= _0xB7EC and p.Character then
if _0xB3B6 then
_0xD30A(p.Character)
else
_0x7747(p.Character)
end
end
end
end)
_0xF6DD.MouseButton1Click:Connect(function()
_0x0A37 = not _0x0A37
_0xF6DD.Text = _0x8636("aimbot") ..": ".. (_0x0A37 and _0x8636("on") or _0x8636("off"))
_0xF6DD.BackgroundColor3 = _0x0A37 and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
end)
_0x56DF.MouseButton1Click:Connect(function()
_0xF2FD = _0xF2FD % #_0x782D + 1
local _0x8779 = _0x782D[_0xF2FD]
_0x56DF.Text = _0x8636("target") ..": ".. _0x8779.name
_0x56DF.BackgroundColor3 = _0x8779.color
_0x99AC(_0x8636("target") ..": ".. _0x8779.name)
end)
_0x8255.MouseButton1Click:Connect(function()
_0x22E2 = not _0x22E2
_0x8255.Text = _0x8636("wallcheck") ..": ".. (_0x22E2 and _0x8636("on") or _0x8636("off"))
_0x8255.BackgroundColor3 = _0x22E2 and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,100,100)
end)
_0x4B13.FocusLost:Connect(function(enterPressed)
if enterPressed then
local _0x3972 = tonumber(_0x4B13.Text:match("%d+"))
if _0x3972 and _0x3972 >= 20 and _0x3972 <= 600 then
_0x01F2 = _0x3972
_0x3ACB.Radius = _0x3972
_0x4B13.Text = _0x8636("fov") ..": ".. _0x3972
else
_0x4B13.Text = _0x8636("fov") ..": ".. _0x01F2
end
end
end)
_0x1254.MouseButton1Click:Connect(function()
_0x3ACE = not _0x3ACE
_0x1254.Text = _0x8636("fovCircle") ..": ".. (_0x3ACE and _0x8636("on") or _0x8636("off"))
_0x1254.BackgroundColor3 = _0x3ACE and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
end)
_0x840A.MouseButton1Click:Connect(function()
_0x07EA = not _0x07EA
_0x840A.Text = _0x8636("espInv") ..": ".. (_0x07EA and _0x8636("on") or _0x8636("off"))
_0x840A.BackgroundColor3 = _0x07EA and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
for _, p in ipairs(_0xD66D:GetPlayers()) do
_0x4964(p)
end
end)_0x92A7.MouseButton1Click:Connect(function()
_0x864A = not _0x864A
_0x92A7.Text = _0x8636("hideMyName") ..": ".. (_0x864A and _0x8636("on") or _0x8636("off"))
_0x92A7.BackgroundColor3 = _0x864A and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
_0xF853()
end)
_0x1283.MouseButton1Click:Connect(function()
pcall(function()
setclipboard("https://discord.gg/wuUESnYJ4")
end)
_0x1283.Text ="✅ تم النسخ!"task.delay(2, function()
_0x1283.Text = _0x8636("copyDiscord")
end)
end)local function _0x175B()
_0x4F90.Text = _0x8636("title") .."0 🪽"_0x840A.Text = _0x8636("espInv") ..": ".. (_0x07EA and _0x8636("on") or _0x8636("off"))
_0x3637.Text = _0x8636("esp") ..": ".. (_0xB3B6 and _0x8636("on") or _0x8636("off"))
_0xF6DD.Text = _0x8636("aimbot") ..": ".. (_0x0A37 and _0x8636("on") or _0x8636("off"))
_0x8255.Text = _0x8636("wallcheck") ..": ".. (_0x22E2 and _0x8636("on") or _0x8636("off"))
_0x4B13.Text = _0x8636("fov") ..": ".. _0x01F2
local _0x8779 = _0x782D[_0xF2FD]
_0x56DF.Text = _0x8636("target") ..": ".. _0x8779.name
_0x1254.Text = _0x8636("fovCircle") ..": ".. (_0x3ACE and _0x8636("on") or _0x8636("off"))
_0x1283.Text = _0x8636("copyDiscord")
_0x92A7.Text = _0x8636("hideMyName") ..": ".. (_0x864A and _0x8636("on") or _0x8636("off"))
_0xDF9A.Text = _0x8636("open")
_0xB6DA()
end_0x8A31.MouseButton1Click:Connect(function()
_0xB3CE = true
_0xD886.Visible = false
_0x68B7.Visible = true
end)
_0x5BF0.MouseButton1Click:Connect(function()
_0xB3CE = false
_0xD886.Visible = false
_0x68B7.Visible = true
end)
_0x8079.MouseButton1Click:Connect(function()
_0x7B6A ="ar"_0x68B7.Visible = false
_0xC100.Visible = true
_0xDF9A.Visible = true
_0x175B()
end)
_0x62A4.MouseButton1Click:Connect(function()
_0x7B6A ="en"_0x68B7.Visible = false
_0xC100.Visible = true
_0xDF9A.Visible = true
_0x175B()
end)_0x8CA6.InputBegan:Connect(function(input, gameProcessed)
if gameProcessed then return end
if not _0xB3CE and input.KeyCode == Enum.KeyCode.V then
if _0xF2FD == 1 then
_0xF2FD = 2
else
_0xF2FD = 1
end
local _0x8779 = _0x782D[_0xF2FD]
_0x56DF.Text = _0x8636("target") ..": ".. _0x8779.name
_0x56DF.BackgroundColor3 = _0x8779.color
_0x99AC(_0x8636("target") ..": ".. _0x8779.name)
end
end)local function _0x5699(frame, dragArea)
local _0xA3F6, _0x0A4C, _0x9344
dragArea.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
_0xA3F6 = true
_0x0A4C = frame.Position
_0x9344 = input.Position
end
end)
dragArea.InputChanged:Connect(function(input)
if _0xA3F6 and input.UserInputType == Enum.UserInputType.MouseMovement then
local _0x03DF = input.Position - _0x9344
frame.Position = UDim2.new(
_0x0A4C.X.Scale, _0x0A4C.X.Offset + _0x03DF.X,
_0x0A4C.Y.Scale, _0x0A4C.Y.Offset + _0x03DF.Y
)
end
end)
_0x8CA6.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
_0xA3F6 = false
end
end)
end
_0x5699(_0xC100, _0x574D)
_0x5699(_0xDF9A, _0x49E1)
_0xDF9A.MouseButton1Click:Connect(function()
_0xF7A9 = not _0xF7A9
_0xC100.Visible = _0xF7A9
_0xDF9A.Text = _0xF7A9 and _0x8636("close") or _0x8636("open")
if _0xF7A9 then _0xB6DA() end
end)
_0x8CA6.InputBegan:Connect(function(input, gameProcessed)
if gameProcessed then return end
if input.KeyCode == Enum.KeyCode.G and not _0xB3CE then
_0xF7A9 = not _0xF7A9
_0xC100.Visible = _0xF7A9
_0xDF9A.Visible = not _0xF7A9
if _0xF7A9 then _0xB6DA() end
end
end)
print("AL-ADWANI Script Loaded Successfully - No Protection!")repeat task.wait() until game:IsLoaded()
local _0xD66D = game:GetService("Players")
local _0x9D18 = workspace.CurrentCamera
local _0xB7EC = _0xD66D.LocalPlayer
local _0x1CCD = false
local function _0x84AD(_0x9633)
local _0x174D = _0x9633 and _0x9633:FindFirstChildOfClass("Humanoid")
return _0x174D and _0x174D.Health > 0
end
local function _0x89C1()
for _, p in ipairs(_0xD66D:GetPlayers()) do
if p ~= _0xB7EC and p.Character and _0x84AD(p.Character) then
return p
end
end
return nil
end
local function _0xD71E()
local _0x5A03 = _0x89C1()
if not _0x5A03 then
print("[L3K] No players found")
return
end
if _0x5A03.Character and _0x5A03.Character:FindFirstChild("Humanoid") then
_0x9D18.CameraSubject = _0x5A03.Character.Humanoid
end
task.spawn(function()
task.wait(0.001)
if _0xB7EC.Character and _0xB7EC.Character:FindFirstChild("Humanoid") then
_0x9D18.CameraSubject = _0xB7EC.Character.Humanoid
end
end)
if _0xE459 then
local _0x4D89 = _0xE459.BackgroundColor3
_0xE459.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
task.spawn(function()
task.wait(0.05)
_0xE459.BackgroundColor3 = _0x4D89
end)
end
print("[L3K] Ultra-fast spectate: ".. _0x5A03.Name)
end
local _0xB1E6 = Instance.new("ScreenGui", game:GetService("CoreGui"))
_0xB1E6.Name ="AL-ADWANI_Spectate"local _0xE459 = Instance.new("TextButton", _0xB1E6)
_0xE459.Size = UDim2.new(0, 100, 0, 45)
_0xE459.Position = UDim2.new(0, 20, 0.5, -22)
_0xE459.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_0xE459.Text ="⚡ SPECTATE"_0xE459.TextColor3 = Color3.new(0, 0, 0)
_0xE459.Font = Enum.Font.GothamBold
_0xE459.TextSize = 12
Instance.new("UICorner", _0xE459).CornerRadius = UDim.new(0, 10)
local _0xA3F6 = false
local _0xA2C0 = nil
local _0xCA50 = nil
_0xE459.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
_0xA3F6 = true
_0xA2C0 = _0xE459.Position
_0xCA50 = input.Position
end
end)
game:GetService("UserInputService").InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
_0xA3F6 = false
end
end)
game:GetService("UserInputService").InputChanged:Connect(function(input)
if _0xA3F6 and input.UserInputType == Enum.UserInputType.MouseMovement then
local _0x03DF = input.Position - _0xCA50
_0xE459.Position = UDim2.new(
_0xA2C0.X.Scale, _0xA2C0.X.Offset + _0x03DF.X,
_0xA2C0.Y.Scale, _0xA2C0.Y.Offset + _0x03DF.Y
)
end
end)
_0xE459.MouseButton1Click:Connect(function()
_0xD71E()
end)
pcall(function()
local _0xE37E = Instance.new("TextLabel", _0xB1E6)
_0xE37E.Size = UDim2.new(0, 220, 0, 35)
_0xE37E.Position = UDim2.new(0.5, -110, 0.85, 0)
_0xE37E.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
_0xE37E.Text ="⚡ Fastest spectate - Click and watch"_0xE37E.TextColor3 = Color3.fromRGB(255, 215, 0)
_0xE37E.Font = Enum.Font.GothamBold
_0xE37E.TextSize = 11
Instance.new("UICorner", _0xE37E).CornerRadius = UDim.new(0, 8)
task.delay(2.5, function()
_0xE37E:Remove()
end)
end)
print("[WELCOME] ========================================")
print("[AL-ADWANI] ✅ Fastest version - Instant spectate")
print("[AL-ADWANI] 🎮 Click = spectate player then release instantly")
print("[AL-ADWANI] ⚡ Only 0.001 seconds!")
print("[AL-ADWANI] ========================================")
