--// MEOW HUB SCRIPT - PINK NEON FULL
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Stats = game:GetService("Stats")
local GuiService = game:GetService("GuiService")

local DISCORD_URL = "https://discord.gg/sWtCuDf6zw"
local player = Players.LocalPlayer

-- Clear old UI
if player.PlayerGui:FindFirstChild("MeowHubUI") then
    player.PlayerGui.MeowHubUI:Destroy()
end

------------------------------------------------
-- SCREEN GUI
------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "MeowHubUI"
gui.ResetOnSpawn = false
gui.Parent = player.PlayerGui

------------------------------------------------
-- DRAG SYSTEM (PC + MOBILE)
------------------------------------------------
local function MakeDraggable(frame)
    local dragging = false
    local dragStart, startPos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (
            input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch
        ) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

------------------------------------------------
-- TOGGLE LOGO
------------------------------------------------
local logoBtn = Instance.new("ImageButton")
logoBtn.Size = UDim2.new(0,46,0,46)
logoBtn.Position = UDim2.new(0,14,0,14)
logoBtn.BackgroundColor3 = Color3.fromRGB(40,20,30)
logoBtn.Image = "rbxassetid://70987077158231"
logoBtn.AutoButtonColor = false
logoBtn.Parent = gui

Instance.new("UICorner", logoBtn).CornerRadius = UDim.new(1,0)

local logoStroke = Instance.new("UIStroke", logoBtn)
logoStroke.Color = Color3.fromRGB(255,105,180)
logoStroke.Thickness = 2

task.spawn(function()
    while task.wait(0.03) do
        logoStroke.Transparency = 0.2 + math.abs(math.sin(tick()*1.5))*0.35
    end
end)

------------------------------------------------
-- MAIN UI
------------------------------------------------
local main = Instance.new("Frame")
main.Size = UDim2.new(0,430,0,230)
main.Position = UDim2.new(0.5,-215,0.5,-115)
main.BackgroundColor3 = Color3.fromRGB(30,15,25)
main.BorderSizePixel = 0
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0,22)

local neon = Instance.new("UIStroke", main)
neon.Color = Color3.fromRGB(255,105,180)
neon.Thickness = 2

task.spawn(function()
    while task.wait(0.03) do
        neon.Transparency = 0.15 + math.abs(math.sin(tick()*1.4))*0.3
    end
end)

-- Background
local bg = Instance.new("ImageLabel")
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundTransparency = 1
bg.Image = "rbxassetid://72442227731655"
bg.ImageTransparency = 0.1
bg.ScaleType = Enum.ScaleType.Crop
bg.Parent = main
Instance.new("UICorner", bg).CornerRadius = UDim.new(0,22)

------------------------------------------------
-- APPLY DRAG
------------------------------------------------
MakeDraggable(main)
MakeDraggable(logoBtn)

------------------------------------------------
-- AVATAR
------------------------------------------------
local avatar = Instance.new("ImageLabel")
avatar.Size = UDim2.new(0,64,0,64)
avatar.Position = UDim2.new(0,18,0,18)
avatar.BackgroundTransparency = 1
avatar.Image = Players:GetUserThumbnailAsync(
    player.UserId,
    Enum.ThumbnailType.HeadShot,
    Enum.ThumbnailSize.Size150x150
)
avatar.Parent = main
Instance.new("UICorner", avatar).CornerRadius = UDim.new(1,0)

local avatarStroke = Instance.new("UIStroke", avatar)
avatarStroke.Color = Color3.fromRGB(255,140,200)
avatarStroke.Thickness = 2

------------------------------------------------
-- TITLE
------------------------------------------------
local title = Instance.new("TextLabel")
title.Text = "MEOW HUB SCRIPT"
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(255,160,210)
title.BackgroundTransparency = 1
title.Position = UDim2.new(0,98,0,22)
title.Size = UDim2.new(1,-110,0,26)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

-- WHITE STROKE TITLE
local titleStroke = Instance.new("UIStroke", title)
titleStroke.Color = Color3.fromRGB(255,255,255)
titleStroke.Thickness = 1.5
titleStroke.Transparency = 0.15

local sub = Instance.new("TextLabel")
sub.Text = "Auto Bounty Blox Fruit"
sub.Font = Enum.Font.GothamBold
sub.TextSize = 14
sub.TextColor3 = Color3.fromRGB(255,190,225)
sub.BackgroundTransparency = 1
sub.Position = UDim2.new(0,98,0,50)
sub.Size = UDim2.new(1,-110,0,20)
sub.TextXAlignment = Enum.TextXAlignment.Left
sub.Parent = main

-- WHITE STROKE SUBTITLE
local subStroke = Instance.new("UIStroke", sub)
subStroke.Color = Color3.fromRGB(255,255,255)
subStroke.Thickness = 1.2
subStroke.Transparency = 0.25

------------------------------------------------
-- INFO
------------------------------------------------
local info = Instance.new("Frame")
info.Size = UDim2.new(1,-36,0,90)
info.Position = UDim2.new(0,18,0,92)
info.BackgroundTransparency = 1
info.Parent = main

local function label(y)
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1,0,0,20)
    l.Position = UDim2.new(0,0,0,y)
    l.BackgroundTransparency = 1
    l.Font = Enum.Font.GothamBold
    l.TextSize = 16
    l.TextColor3 = Color3.fromRGB(255,230,240)
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = info

    local stroke = Instance.new("UIStroke", l)
    stroke.Color = Color3.fromRGB(255,120,190)
    stroke.Thickness = 1
    return l
end

local fpsL = label(0)
local pingL = label(22)
local playerL = label(44)
local statusL = label(66)
statusL.Text = "Status: ON 💖"

------------------------------------------------
-- DISCORD BUTTON
------------------------------------------------
local discordBtn = Instance.new("TextButton")
discordBtn.Size = UDim2.new(0,150,0,36)
discordBtn.Position = UDim2.new(0,18,1,-46)
discordBtn.BackgroundColor3 = Color3.fromRGB(255,105,180)
discordBtn.Text = "DISCORD"
discordBtn.Font = Enum.Font.GothamBold
discordBtn.TextSize = 16
discordBtn.TextColor3 = Color3.fromRGB(255,255,255)
discordBtn.AutoButtonColor = false
discordBtn.Parent = main

Instance.new("UICorner", discordBtn).CornerRadius = UDim.new(0,10)

local btnStroke = Instance.new("UIStroke", discordBtn)
btnStroke.Color = Color3.fromRGB(255,170,220)
btnStroke.Thickness = 1.5
btnStroke.Transparency = 0.2

discordBtn.MouseButton1Click:Connect(function()
    pcall(function()
        if setclipboard then
            setclipboard(DISCORD_URL)
        end
    end)
    pcall(function()
        GuiService:OpenBrowserWindow(DISCORD_URL)
    end)
end)

------------------------------------------------
-- STATS UPDATE
------------------------------------------------
local frames, last, fps = 0, tick(), 0
RunService.RenderStepped:Connect(function()
    frames += 1
    if tick() - last >= 1 then
        fps = frames
        frames = 0
        last = tick()
    end

    fpsL.Text = "FPS: "..fps
    playerL.Text = "Players: "..#Players:GetPlayers()

    local ok, ping = pcall(function()
        return Stats.Network.ServerStatsItem["Data Ping"]:GetValueString()
    end)
    pingL.Text = "Ping: "..(ok and ping or "N/A")
end)

------------------------------------------------
-- TOGGLE MAIN UI
------------------------------------------------
local uiOpen = true
logoBtn.MouseButton1Click:Connect(function()
    uiOpen = not uiOpen
    main.Visible = uiOpen
end)
