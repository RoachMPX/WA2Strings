--Mistress raid mark call (ID 2037)
--Trigger
function()
    local raid_mark = GetRaidTargetIndex("player")
    if raid_mark ~= nil then 
        return true
    end
end

--Untrigger
function()
    return true
end

--Icon info
function()
    local mark = GetRaidTargetIndex("player")
    if UnitExists("player") == true and mark ~= nil then
        return    [[Interface\TARGETINGFRAME\UI-RaidTargetingIcon_]].. mark ..[[.blp]]
    end
end