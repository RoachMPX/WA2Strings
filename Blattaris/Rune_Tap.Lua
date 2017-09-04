--Rune Tap

--Trigger
function()
    local spell_name = "Rune Tap"
    local charges_are_good = function(c)
        return c >= 1
    end
    
    local current_charges = select(1, GetSpellCharges(spell_name))
    return charges_are_good(current_charges)
end

--Untrigger
function()
    local spell_name = "Rune Tap"
    local charges_are_good = function(c)
        return c < 1
    end
    
    local current_charges = select(1, GetSpellCharges(spell_name))
    return charges_are_good(current_charges)
end

--Duration
function()
    local spell_name = "Rune Tap"
    local charges_are_good = function(c)
        return c >= 0
    end
    
    local return_duration, return_expiration_time = 0, 0
    local time_right_now = GetTime()
    local current_charges, max_charges, last_cast_time, cooldown_duration = GetSpellCharges(spell_name)
    
    if (((last_cast_time - cooldown_duration) <= time_right_now) and
        ((last_cast_time + cooldown_duration) >= time_right_now) and
        charges_are_good(current_charges)) then
        return_duration = cooldown_duration
        return_expiration_time = last_cast_time + cooldown_duration
    end
    return return_duration, return_expiration_time
end

--Name
function()
    local spell_name = "Rune Tap"
    return spell_name
end

--Icon
function()
    local spell_name = "Rune Tap"
    return GetSpellTexture(spell_name)
end
