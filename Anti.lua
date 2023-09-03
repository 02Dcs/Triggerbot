local lp = game.Players.LocalPlayer
local hum = lp.Character:WaitForChild("Humanoid")

hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;

if (not checkcaller() and getfenv(2).Crash) then
        local fenv = getfenv(2)
        fenv.Crash = function() end
        setfenv(2, fenv)
    end
    return __namecall(...)
end)

local mt = getrawmetatable(game)
local backupindex = mt.__index
setreadonly(mt, false)

mt.__index = newcclosure(function(t, k)
    if (t:IsA("Camera") and (k == "Position")) then
         return (k == "Position")
    end
    return backupindex(t, k)
end)

local __newindex
__newindex = hookmetamethod(game, "__newindex", function(t, k, v)
    if (not checkcaller() and t:IsA("Humanoid") and (k == "Velocity")) then
        return
    end
    return __newindex(t, k, v)
end)

setreadonly(mt, true)
