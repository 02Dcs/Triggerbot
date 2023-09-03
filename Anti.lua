local Services = setmetatable({}, {__index = function(Self, Index)
    local NewService = game.GetService(game, Index)
    if NewService then
        Self[Index] = NewService
    end
    return NewService
end})

local mt = getrawmetatable(game)
local backupindex = mt.__index
setreadonly(mt, false)

mt.__index = newcclosure(function(t, k)
    if (t:IsA("Camera") and (k == "Position")) then
         return (k == "Position")
    end
    return backupindex(t, k)
end)

setreadonly(mt, true)
