-- Skybox

local sky = Instance.new("Sky")

sky.Name = "CustomSky"

sky.SkyboxBk = "rbxassetid://73484786349362"

sky.SkyboxDn = "rbxassetid://131912812460186"

sky.SkyboxFt = "rbxassetid://101977160732638"

sky.SkyboxLf = "rbxassetid://98903987496305"

sky.SkyboxRt = "rbxassetid://123852546791653"

sky.SkyboxUp = "rbxassetid://131912812460186"

sky.Parent = game.Lighting

-- Làm sáng 1 lần

local function MakeAlwaysBright()

    local Lighting = game.Lighting

    Lighting.ClockTime = 12

    Lighting.Brightness = 3

    Lighting.GlobalShadows = false

    Lighting.Ambient = Color3.fromRGB(255, 255, 255)

    Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)

end

MakeAlwaysBright()

-- Theo dõi, nếu Lighting bị đổi thì set lại

game.Lighting:GetPropertyChangedSignal("ClockTime"):Connect(function()

    if game.Lighting.ClockTime < 11 or game.Lighting.ClockTime > 13 then

        MakeAlwaysBright()

    end

end)


