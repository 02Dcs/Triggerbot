local supports = {};

local games = {
    ["621129760"] = "Kat",
    ["6514923093"] = "Realistic-Guns",
    ["12355337193"] = "Murderers-VS-Sheriffs-Duels",
}

function supports:CheckGm()
local x = tostring(game.PlaceId)
if games[x] then
    print(games);
else
   game.Players.LocalPlayer:Kick('Trigger-Bot Does not support that game!')
end; end

return supports

