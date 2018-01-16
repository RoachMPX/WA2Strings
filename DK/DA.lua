--Dark Arbiter
function(arg1, arg2, _,_,_, arg6)
    if arg1 == "UNIT_SPELLCAST_SUCCEEDED"
    and arg2 == "player"
    and arg6 == 207349 then
        aura_env.power = nil
        return true
        
        -- Death Coil
    elseif arg1 == "UNIT_SPELLCAST_SUCCEEDED"
    and arg2 == "player"
    and arg6 == 47541
    and aura_env.power == nil then
        aura_env.power = 45
    elseif arg1 == "UNIT_SPELLCAST_SUCCEEDED"
    and arg2 == "player"
    and arg6 == 47541
    and aura_env.power ~= nil then
        aura_env.power = aura_env.power + 45
        
        -- Death Strike (49998)
    elseif arg1 == "UNIT_SPELLCAST_SUCCEEDED"
    and arg2 == "player"
    and arg6 == 49998
    and aura_env.power == nil then
        aura_env.power = 45
    elseif arg1 == "UNIT_SPELLCAST_SUCCEEDED"
    and arg2 == "player"
    and arg6 == 49998
    and aura_env.power ~= nil then
        aura_env.power = aura_env.power + 45
    end
end
