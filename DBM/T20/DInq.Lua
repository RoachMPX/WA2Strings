--Torment Tracker
--Trigger
function(allstates)
    for _, v in pairs(allstates) do
        v.show = false;
        v.changed = true;
    end
    for unit in aura_env.GroupMembers() do
        if UnitIsVisible(unit) then
            local name = string.sub(UnitName(unit),1,4)
            local _, class = UnitClass(unit)
            local _,_,_,str = GetClassColor(class)
            name = string.format("|c%s%s|r", str, name)
            local inside = UnitDebuff(unit, GetSpellInfo(236283)) and "inside"
            local dead = UnitIsDeadOrGhost(unit) and "DEAD"
            local flag = inside or ""
            local torment = UnitPower(unit, 10)
            
            allstates[unit] = allstates[unit] or {};
            local state = allstates[unit];
            state.index = inside and -1 or 100 - torment
            state.resort = true
            state.ID = unit
            state.show = true;
            state.changed = true;
            state.name = dead or name;
            state.progressType = "static";
            state.value = torment
            state.total = 100
            state.flag = flag
        end
    end
    return true
end
