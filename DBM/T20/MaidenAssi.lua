
--- Maiden Assignments (Credits to Mags-proudmoore)
function()
    local textColor = "ffffffff"
    local isOppositeColor = false
    if UnitGroupRolesAssigned(aura_env.playerName) == "TANK" then
        if UnitDebuff(aura_env.playerName, aura_env.felInfusion) then
            textColor = aura_env.felColor
        else
            textColor = aura_env.lightColor
        end
        return aura_env.getColoredText("Camp OUTER", isOppositeColor)
    end
    aura_env.holy = {}
    aura_env.fel = {}
    local j = GetNumGroupMembers()
    if j > 20 then j = 20 end
    for i=1,j do
        local name = GetRaidRosterInfo(i)
        local role = UnitGroupRolesAssigned(name)
        if UnitIsVisible(name) and role ~= "TANK" and not UnitIsDead(name) then
            if UnitDebuff(name, aura_env.lightInfusion) then
                aura_env.holy[#aura_env.holy+1] = name
            elseif UnitDebuff(name, aura_env.felInfusion) then
                aura_env.fel[#aura_env.fel+1]  = name
            end
        end
    end

local numHoly = #aura_env.holy
    local numFel = #aura_env.fel
    if aura_env.holy[1] == aura_env.playerName or aura_env.fel[1] == aura_env.playerName then
        return aura_env.getColoredText("Camp MIDDLE", isOppositeColor)
    elseif aura_env.holy[2] == aura_env.playerName or aura_env.fel[2] == aura_env.playerName then
        return aura_env.getColoredText("Camp INNER", isOppositeColor)
    else
        isOppositeColor = true
        if aura_env.holy[numHoly] == aura_env.playerName or aura_env.fel[numFel] == aura_env.playerName then
            return aura_env.getColoredText("Opposite OUTER", isOppositeColor)
        end
        if aura_env.holy[numHoly-1] == aura_env.playerName or aura_env.fel[numFel-1] == aura_env.playerName then
            return aura_env.getColoredText("Opposite MIDDLE", isOppositeColor)
        end
        if aura_env.holy[numHoly-2] == aura_env.playerName or aura_env.fel[numFel-2] == aura_env.playerName then
            return aura_env.getColoredText("Opposite INNER", isOppositeColor)
        end
        isOppositeColor = false
        return aura_env.getColoredText("CAMP", isOppositeColor)
    end
end