-- Me no racist :3

local engine = loadstring(game:HttpGet('https://raw.githubusercontent.com/Singularity5490/rbimgui-2/main/rbimgui-2.lua'))()
local g = loadstring(game:HttpGet(("https://raw.githubusercontent.com/02Dcs/Triggerbot/main/Supports.lua"), true))()
g.CheckGm();

local filename = "TriggerBot02.txt"
local Settings = {
    start = true,
    lightorblacktheme = nil, 
    costumnameconfig = 'OP Config Real',
    speed = 70,
    timenow = 0.35,
    timefurther = 0.45,
}

function loadSettings()
    local HttpService = game:GetService("HttpService")
    if readfile and isfile(filename) then
        local fileContents = readfile(filename)
        if fileContents then
            local decodedSettings = HttpService:JSONDecode(fileContents)
            for key, value in pairs(decodedSettings) do
                Settings[key] = value
            end
        end
    end
end

function save()
    local HttpService = game:GetService("HttpService")
    if writefile then
        local json = HttpService:JSONEncode(Settings)
        writefile(filename, json)
    end
end

loadSettings();

local color;
if Settings.lightorblacktheme == nil then
else
    color = Settings.lightorblacktheme and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 0, 0)
end
local window1 = engine.new({
    text = Settings.costumnameconfig .. " - 02 Hub X",
    size = Vector2.new(400, 300),
    color = color,
    shadow = 6,
    rounding = 3,
})

save()

local finish = {}
local x = ('🔗'):byte();

function randomnigga()
    for i = 1, math.random(21, 70/3) do 
        finish[i] = string.char(math.random(x))
    end
    return table.concat(finish)
end

game:GetService('CoreGui').imgui2.Name = randomnigga()

local function av()
    local x = game.Workspace:GetChildren()
    for _, z in ipairs(x) do
        if z:IsA'Camera' then
            return z
        end
    end
    return nil
end

local tab1 = window1.new({
    text = 'Settings',
})

local slider1 = tab1.new('slider', {
    text = 'Magnitude',
    color = Color3.new(0.219608, 0.219608, 0.219608),
    min = 0,
    max = 500,
    value = 0,
    rounding = 1,
})

local slider2 = tab1.new('slider', {
    text = 'Camera Offset',
    color = Color3.new(0.219608, 0.219608, 0.219608),
    min = 0,
    max = 20,
    value = 0,
    rounding = 1,
})

local slider3 = tab1.new('slider', {
    text = 'FOV',
    color = Color3.new(0.219608, 0.219608, 0.219608),
    min = 70,
    max = 120,
    value = 70,
    rounding = 1,
})

local slider4 = tab1.new('slider', {
    text = 'Delay Switching',
    color = Color3.new(0.219608, 0.219608, 0.219608),
    min = 0,
    max = 4,
    value = 0,
    rounding = 1,
})

local switch1 = tab1.new('switch', {
    text = 'Team',
})

local switch2 = tab1.new('switch', {
    text = 'Wallcheck',
})

local switch3 = tab1.new('switch', {
    text = 'WalkSpeed',
})

local switch4 = tab1.new('switch', {
    text = 'X-Ray',
})

local switch5 = tab1.new('switch', {
    text = 'Esp',
})

getgenv().fastracker = 100;

local debounce = false
local horny = {}

local function uhm(en)
    if debounce then
        return
    end

    debounce = true

    local nigga = {}

    if en then
        for _, z in pairs(workspace:GetDescendants()) do
            if z:IsA('BasePart') and not z.Parent:FindFirstChild'Humanoid' and not z.Parent:IsA'Accessory' then
                if z.Transparency ~= 1 then
                    horny[z] = z.Transparency
                    table.insert(nigga, z)
                end
            end
        end

        for i = 1, #nigga, fastracker do
            local r = math.min(i + 400 - 1, #nigga)
            for j = i, r do
                nigga[j].Transparency = 0.65
            end
            task.wait()
        end
    else
        for x, r in pairs(horny) do
            x.Transparency = r
        end
        horny = {}
    end

    debounce = false
end

getgenv().xray = false
getgenv().enwhendied = nil;

switch4.event:Connect(function(x)
    getgenv().xray = x;
    uhm(x);
end)

local lp = game.Players.LocalPlayer

local function espr()
    for _, x in ipairs(game.Players:GetPlayers()) do
        local h = x.Character and x.Character:FindFirstChild("Esp")
        if h then
            h:Destroy();
        end
    end
end

local function esp(en)
    enwhendied = en; 
    if not en then
        espr();
    else
        for _, z in ipairs(game.Players:GetPlayers()) do
            if lp.Name ~= z.Name and z.Character and z.Character:FindFirstChild("Humanoid") and z.Character.Humanoid.Health > 0 then
                local highlight = Instance.new("Highlight")
                highlight.Name = 'Esp'
                highlight.FillTransparency = 1
                highlight.OutlineTransparency = 0
                highlight.FillColor = Color3.fromRGB(0, 0, 0)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = z.Character
            end
        end
    end
end

game:GetService("Players").PlayerAdded:Connect(function(player)
player.CharacterAdded:Connect(function(character)
esp(enwhendied);
end)
end)   

switch5.event:Connect(function(x)
esp(x);
end)

local function raycast(startPos, endPos, ignoreList)
    if not getgenv().array then
        return
    end

    local ray = Ray.new(startPos, endPos - startPos)
    local ignoreFilter = function(obj)
        for _, r in ipairs(game.Players:GetPlayers()) do
            local ch = r.Character
            if ch and (ch:IsDescendantOf(obj) or obj:IsDescendantOf(ch)) then
                return true
            end
        end
    end
    
    local ray = Ray.new(startPos, endPos - startPos)
    local part, hitPos = workspace:FindPartOnRayWithIgnoreList(ray, ignoreList, false, true)
    return part and part:IsDescendantOf(game.Workspace) and hitPos ~= endPos
end

getgenv().teamcheck = false;
switch1.event:Connect(function(x)
    getgenv().teamcheck = x
end)

getgenv().array = false;
switch2.event:Connect(function(x)
    getgenv().array = x
end)

local lp = game.Players.LocalPlayer
local ch = lp.Character

local enc = nil; getgenv().isc = false

local function enaw()
    while isc do
        getgenv().wl = true
        local r = tick()
        local i = false

        while isc do 
            task.wait()
            if not getgenv().wl or not ch or not ch.Parent then
                ch.Humanoid.JumpPower = 50; workspace.Gravity = 197.5
            end

            ch.Humanoid.JumpPower = 0; workspace.Gravity = math.huge
            local Tick = tick(); local mi = ch.Humanoid.MoveDirection; local da = 0.5 ^ (tick() - Tick)

            if i then
                task.wait(Settings.timenow); i = false
            else
                local cu = ch.HumanoidRootPart.Velocity.Y; local ry = cu * da; ch.HumanoidRootPart.Velocity = ch.HumanoidRootPart.Velocity:Lerp(mi * Settings.speed, da)

                if (tick() - r) >= Settings.timefurther and mi.magnitude > 0 then
                    r = tick()
                    ch.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0);  i = true
                end
            end
        end
        task.wait(); save();
    end
end

local function speed(cha)
    ch = cha
    if getgenv().wal then
        if not enc then
            isc = true; enc = coroutine.wrap(enaw); enaw() 
        end
    end
end

lp.CharacterAdded:Connect(speed);

getgenv().wal = false
local function xas(en)
    if en then
        getgenv().wl = true
        if not enc then
            isc = true; enc = coroutine.wrap(enaw); enaw()
        end
    else
        getgenv().wl = false
        if enc then
            isc = false; enc = nil 
        end
        ch.Humanoid.WalkSpeed = 16 
    end
end

switch3.event:Connect(function(e)
    wal = e
    xas(e)
end)

local function fov(x)
    local c = game.Workspace.CurrentCamera
    if c then
        c.FieldOfView = x
    end
end
slider3.event:Connect(fov)

getgenv().delay = nil;
local function delayf(x)
    getgenv().delay = x;
end

slider4.event:Connect(delayf)
local notifications = loadstring(game:HttpGet(("https://raw.githubusercontent.com/AbstractPoo/Main/main/Notifications.lua"), true))()

local function msg(x)
    notifications:notify{
        Title = 'Notifications showcase',
        Description = tostring(x),
        Length = 10
    }
end

getgenv().Keybind = 'Q'; getgenv().enabled = false; 
local user = game:GetService'UserInputService'

local function t()
    enabled = not enabled
    if enabled then
        msg('TriggerBot | is enabled')
    else
        msg('TriggerBot | is disabled')
    end
end

user.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then
        return
    end
    if input.KeyCode == Enum.KeyCode[Keybind] then
        t()
    end
end)

repeat game:IsLoaded() until task.wait()
getgenv().maxdc = nil;
getgenv().maxab = 4; 
getgenv().cameraof = nil;
getgenv().cameren = false; 

slider1.event:Connect(function(x)
    maxdc = x
end)

slider2.event:Connect(function(x)
    cameraof = Vector3.new(0, 2, -x)
end)

local function re()
    focusedPlayer = nil
    if orb then
        orb:Destroy()
        orb = nil
    end
end

local function crob(focusedPlayer)
    if not focusedPlayer then
        return;
    end

    local ch = focusedPlayer.Character
    if not ch then
        return;
    end

    local hd = ch:FindFirstChild'Head'
    if not hd then
        return;
    end
    
     local highlight = Instance.new("Highlight")
        highlight.Name = 'Esp'
        highlight.FillTransparency = 1
        highlight.OutlineTransparency = 0
        highlight.FillColor = Color3.fromRGB(0, 0, 0)
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Parent = ch
        orb = highlight
end


local function updateo()
    if focusedPlayer and orb then
        local ch = focusedPlayer.Character; local hd = ch and ch:FindFirstChild'Head'
        if hd then
           
            local lo = game.Players.LocalPlayer; local loc = localPlayer.Character; local loh = lo and loc:FindFirstChild'Head'
            if hd and crob(hd.Position, hd.Position, {localc, ch}) then     
                re();
            else  
                orb.Position = hd.Position + Vector3.new(0, maxDistanceAbove, 0)
            end
        else      
            orb:Destroy(); orb = nil;
        end
    end
end


local db = false;
local function tr()
    if focusedPlayer and not db then
        db = true
        mouse1press()
        task.delay(0.05, function()
            mouse1release(); db = false;
        end)
    end
end

local function focus(y)
    if focusedPlayer == y then
        return
    end
    if debounce then
        return
    end
    focusedPlayer = y
    if orb then
        orb:Destroy()
        orb = nil
    end
    debounce = true
    task.wait(getgenv().delay)
    debounce = false
    crob(focusedPlayer)
end

local function nearly()
    if not enabled then
        return
    end
    local plrs = game.Players:GetPlayers()
    local localpl = game.Players.LocalPlayer
    local localch = localpl.Character
    if not localch then
        return
    end
    local localhd = localch:FindFirstChild'Head'
    if not localhd then
        return
    end
    local ca = game.Workspace.CurrentCamera
    local nearestdis = maxdc + 1
    local nearestpl = nil
    local success, err = pcall(function()
        if not ca then
            return
        end
    end)

    if not success then
        game.Players.LocalPlayer:Kick('Trigger-Bot Does not work on that script because of wrong functions')
    end

    debounce = false
    for _, x in ipairs(plrs) do
        local cha = x.Character
        if x ~= localpl and ca and cha:FindFirstChild'Humanoid'.Health > 0 and not cha:FindFirstChild'ForceField' then
            local tahd = cha:FindFirstChild'Head'
            if tahd then
                local dnt = (tahd.Position - localhd.Position).Magnitude
                if dnt <= maxdc then
                    if teamcheck then
                        if x.Team ~= localpl.Team and cha.Humanoid.Health > 0 then
                            local obs = raycast(localhd.Position, tahd.Position, {localhd, cha})
                            if not obs and dnt < nearestdis then
                                nearestdis = dnt
                                nearestpl = x
                            end
                        end
                    else
                        local obs = raycast(localhd.Position, tahd.Position, {localch, cha})
                        if not obs and dnt < nearestdis then
                            nearestdi = dnt
                            nearestpl = x
                        end
                    end
                end
            end
        end
    end

    if nearestpl then
        focus(nearestpl)
    else
        re()
    end
    if focusedPlayer then
        local ch = focusedPlayer.Character
        local tahd = ch and ch:FindFirstChild'Head'
        if tahd then
            local dir = (tahd.Position - localhd.Position).Unit

            if cameren then
                local cu  = av()
                if cu then
                    ca = cu
                end
            end
            ca.CFrame = CFrame.new(localhd.Position + dir * cameraof.Z, tahd.Position) 

            for _, v in ipairs(localch:GetDescendants()) do
                if v:IsA'BasePart' then
                    v.Transparency = 1
                elseif v:IsA'Decal' then
                    v.Transparency = 1
                end
            end
            tr();
        end
    end
    updateo();
end

OldNameCall = hookmetamethod(game, "__namecall", function(Self, ...)
    local NameCallMethod = getnamecallmethod()
    local Arguments = {...}

    if not checkcaller() and tostring(Self) == "HitPart" and tostring(NameCallMethod) == "FireServer" then
        checkNearbyPlayers()
    end
    return OldNameCall(Self, ...)
end)

game:GetService("RunService").Heartbeat:Connect(function()
    nearly()
end)

local plr = game.Players.LocalPlayer
local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
if hum then
    hum.StateChanged:Connect(onHumanoidStateChanged)
end

if hum then
    hum.Died:Connect(function()
        re()
    end)
end

if Settings.start == true then 
	save()
end
