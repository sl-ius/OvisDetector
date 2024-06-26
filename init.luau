--[[

    Ovis Script Detector
    Sius - Programming + Designing

    discord: discord.gg/d3fKHPTafg

--]]

-- services

local coreGui = game:GetService('CoreGui');
local players = game:GetService('Players');
local httpService = game:GetService('HttpService')
local tweenService = game:GetService('TweenService');
local marketPlaceService = game:GetService('MarketplaceService');

-- global variables

local placeId = game.PlaceId;
local localPlayer = game.Players.LocalPlayer;


local data = {
    HorrificHousing = {
        placeId = {263761432},
        keySystem = true,
        loadString = "https://raw.githubusercontent.com/SiusGIF/Silox-Boost-Up-Hub/main/SourceCode",
    },
    Bedwars = {
        placeId = {6872265039},
        loadString = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua",
    },
    PrisonLife = {
        placeId = {155615604},
        loadString = "https://raw.githubusercontent.com/H17S32/Tiger_Admin/main/Script",
    },
    NaturalDisasterSurvival = {
        placeId = {189707},
        loadString = "https://gist.githubusercontent.com/TurkOyuncu99/7c75386107937fa006304efd24543ad4/raw/8d759dfcd95d39949c692735cfdf62baec0bf835/cafwetweg",
    },
    JailBreak = {
        placeId = {606849621},
        KeySys = true,
        loadString = "https://projectevo.xyz/v4/script.lua",
    },
    NinjaLegend = {
        placeId = {3956818381},
        loadString = "https://raw.githubusercontent.com/TrixAde/Proxima-Hub/main/Main.lua",
    },
    MegaEasyObby = {
        placeId = {3587619225},
		loadString = "https://pastebin.com/raw/X361rzKq",
	},
    TowerOfHell = {
        placeId = {1962086868},
		loadString = "https://raw.githubusercontent.com/sl-ius/Ovis/main/Scripts/Tower%20Of%20Hell.lua",
	},
}

-- interface 

local interface = game:GetObjects('rbxassetid://18159045236')[1];
interface.Parent = coreGui:FindFirstChild('RobloxGui');
interface.Name = 'Ovis'

-- interface variables

local main = interface.Main;
local closeButton = main.Close;
local runButton = main.Run;
local thumbnail = main.Thumbnail;
local detectText = main.Detect;
local nameText = main.Experience;
local creatorText = main.Creator;

local notices = main.Notices;
local keySys = notices.KeySys;
local trusted = notices.Trusted;
local patched = notices.Patched;
local offical = notices.Official;

-- setting up interface initial state

main.Position = UDim2.new(0.5, 0, -1, 0);
main.Size = UDim2.new(0, 200, 0, 50);

for _, interfaces in pairs(main:GetChildren()) do
    if interfaces.Name ~= 'Notices' then
        if interfaces.ClassName == 'TextButton' then
            interfaces.BackgroundTransparency = 1
            interfaces.TextTransparency = 1
        elseif interfaces.ClassName == 'ImageLabel' then
            interfaces.ImageTransparency = 1
        elseif interfaces.ClassName == 'TextLabel' then
            interfaces.TextTransparency = 1
        end
    end
end;

for _, interfaces in pairs(notices:GetChildren()) do
    if interfaces.ClassName == 'CanvasGroup' then
        interfaces.GroupTransparency = 1
    end
end;

function startUpAnimation()
    nameText.Text = marketPlaceService:GetProductInfo(placeId).Name
    creatorText.Text = 'by ' .. players:GetNameFromUserIdAsync(game.CreatorId)
    thumbnail.Image = "https://assetgame.roblox.com/Game/Tools/ThumbnailAsset.ashx?aid=".. placeId .."&fmt=png&wd=420&ht=420"

    tweenService:Create(main, TweenInfo.new(0.9, Enum.EasingStyle.Exponential), {Position = UDim2.new(0.5, 0, 0.1, 0)}):Play()
    tweenService:Create(main, TweenInfo.new(0.9, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 400, 0, 100)}):Play()
    tweenService:Create(thumbnail, TweenInfo.new(1, Enum.EasingStyle.Quint), {ImageTransparency = 0.2}):Play()

    wait(0.7)

    tweenService:Create(detectText, TweenInfo.new(1, Enum.EasingStyle.Quint), {TextTransparency = 0.1}):Play()

    wait(0.8)

    tweenService:Create(detectText, TweenInfo.new(1, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
    tweenService:Create(thumbnail, TweenInfo.new(1, Enum.EasingStyle.Quint), {ImageTransparency = 0.4}):Play()
    tweenService:Create(main, TweenInfo.new(0.9, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 500, 0, 160)}):Play()
    for _, texts in ipairs(main:GetChildren()) do
        if texts.ClassName == 'TextLabel' and texts.Name ~= 'Detect' then
            tweenService:Create(texts, TweenInfo.new(0.9, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
            wait(0.2)
        end
    end

    wait(0.3)

    for _, btns in ipairs(main:GetChildren()) do
        if btns.ClassName == 'TextButton' then
            tweenService:Create(btns, TweenInfo.new(0.9, Enum.EasingStyle.Quint), {BackgroundTransparency = 0.5}):Play()
            tweenService:Create(btns, TweenInfo.new(0.9, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
            wait(0.2)
        end
    end
end;

for _, data in pairs(data) do
    for _, placeId in pairs(data.placeId) do
        if placeId == game.PlaceId then
            startUpAnimation();
        elseif not placeId == game.PlaceId then
            warn('Ovis currently does not have any script for this experience!')
        end
    end
end

wait(20);

interface:Destroy();
