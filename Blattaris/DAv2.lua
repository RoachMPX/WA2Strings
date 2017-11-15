--DA updated for 7.2.5 (timer starts after 1st hit)
function(event, timeSt, message, _, sourceGUID, _, _, _, destGUID, _, _, _, spellID, spellName, _, spellDamage,_,_,_,_,_,crit)
    aura_env.valkyrOn = aura_env.valkyrOn or false 
    aura_env.valkyrId = aura_env.valkyrId or (" ")
    aura_env.valkyrPwr = aura_env.valkyrPwr or 0
    aura_env.totalDamage = aura_env.totalDamage or 0
    aura_env.castsNumber = aura_env.castsNumber or 0
    aura_env.summonTime = aura_env.summonTime or 0
    aura_env.valCritNum = aura_env.valCritNum or 0
    aura_env.maxCrit=aura_env.maxCrit or 0
    aura_env.haveTotem = GetTotemInfo(3)
    aura_env.firstHit = aura_env.firstHit or false
    aura_env.castTime = aura_env.castTime or 0
    
    
    
    -- Check DA Summon
    
    if event == "COMBAT_LOG_EVENT_UNFILTERED" and message == "SPELL_SUMMON" and sourceGUID == UnitGUID("player") and spellID == 207349 then 
        aura_env.firstHit = false
        aura_env.summonTime = GetTime()
        aura_env.valkyrOn = true
        aura_env.valkyrId = destGUID
        aura_env.valkyrPwr=0
        aura_env.valCritNum = 0
        aura_env.castsNumber=0
        aura_env.totalDamage=0
        aura_env.maxCrit = 0
        
        
    end
    
    --Check if Shadow empowered removed
    
    if (event == "COMBAT_LOG_EVENT_UNFILTERED" and message == "SPELL_AURA_REMOVED" and sourceGUID == UnitGUID("player") and spellID == 211947) then 
        aura_env.valkyrOn = false
        aura_env.firstHit = false
        
    end
    
    
    -- Death Coil damage    
    if aura_env.valkyrOn == true then
        if event == "COMBAT_LOG_EVENT_UNFILTERED" and message == "SPELL_DAMAGE" and sourceGUID == UnitGUID("player") and spellID == 47632 then 
            aura_env.valkyrPwr = aura_env.valkyrPwr + 45 --Death coil = 45 rp
        end
    end
    
    -- Death Strike damage     
    if aura_env.valkyrOn == true then
        if event == "COMBAT_LOG_EVENT_UNFILTERED" and message == "SPELL_DAMAGE" and sourceGUID == UnitGUID("player") and spellID == 49998 then 
            aura_env.valkyrPwr = aura_env.valkyrPwr + 45
        end
    end
    
    --valkyr damage
    if event == "COMBAT_LOG_EVENT_UNFILTERED" and message == "SPELL_DAMAGE" and sourceGUID == aura_env.valkyrId then 
        
        if aura_env.firstHit==false then
            aura_env.castTime=GetTime()
            aura_env.firstHit=true
        end
        
        aura_env.totalDamage=aura_env.totalDamage+spellDamage
        --crit check
        if crit == false then
            aura_env.castsNumber=aura_env.castsNumber+1
        else
            aura_env.valCritNum=aura_env.valCritNum+1
            if spellDamage>aura_env.maxCrit then
                aura_env.maxCrit=spellDamage
            end            
        end
    end 
    
    
    aura_env.timeTrig=GetTime()-aura_env.summonTime
    if aura_env.timeTrig>0 and aura_env.timeTrig<=30 then
        return true
    end
    
end

--DA Duration Trigger
function(event, timeSt, message, _, sourceGUID, _, _, _, destGUID, _, _, _, spellID, spellName, _, spellDamage,_,_,_,_,_,crit)
    
    aura_env.valkyrId = aura_env.valkyrId or (" ")
    aura_env.firstHit = aura_env.firstHit or false
    aura_env.castTime = aura_env.castTime or 0
    aura_env.summonTime = aura_env.summonTime or 0
    
    
    -- Check DA Summon
    
    if event == "COMBAT_LOG_EVENT_UNFILTERED" and message == "SPELL_SUMMON" and sourceGUID == UnitGUID("player") and spellID == 207349 then 
        aura_env.firstHit = false
        aura_env.summonTime = GetTime()
        aura_env.valkyrId = destGUID
        
    end
    
    
    --valkyr damage
    if event == "COMBAT_LOG_EVENT_UNFILTERED" and message == "SPELL_DAMAGE" and sourceGUID == aura_env.valkyrId then 
        
        if aura_env.firstHit==false then
            aura_env.castTime=GetTime()
            aura_env.firstHit=true
        end
        
    end 
    
    
    aura_env.timeTrig=GetTime()-aura_env.summonTime
    if aura_env.timeTrig>0 and aura_env.timeTrig<=30 then
        return true
    end
    
end

--DA Duration info
function()
    aura_env.castTime = aura_env.castTime or 0
    local duration = 20
    local expirationTime = aura_env.castTime+duration
    
    return duration, expirationTime
end

--Display (Original)
function()
    aura_env.totalDamage=aura_env.totalDamage or 0
    aura_env.castsNumber=aura_env.castsNumber or 0
    aura_env.valkyrPwr = aura_env.valkyrPwr or 0
    aura_env.valCritNum = aura_env.valCritNum or 0
    aura_env.maxCrit=aura_env.maxCrit or 0
    aura_env.crit=string.format("%.2f", (aura_env.maxCrit / 1000000)).." M" or 0
    aura_env.valDamage= string.format("%.2f", (aura_env.totalDamage / 1000000)).." M" or 0
    
    return ("Damage: ")..aura_env.valDamage..("\nMax Crit: ")..aura_env.crit..("\nRP: ")..aura_env.valkyrPwr..("\nHit/Crit: ")..aura_env.castsNumber..("/")..aura_env.valCritNum
    
end

--Display (New)
function()
    aura_env.totalDamage=aura_env.totalDamage or 0
    aura_env.castsNumber=aura_env.castsNumber or 0
    aura_env.valCritNum = aura_env.valCritNum or 0
    aura_env.maxCrit=aura_env.maxCrit or 0
    aura_env.crit=string.format("%.2f", (aura_env.maxCrit / 1000000)).." M" or 0
    aura_env.valDamage= string.format("%.2f", (aura_env.totalDamage / 1000000)).." M" or 0
    
    return ("Dmg: ")..aura_env.valDamage..("\nMax: ")..aura_env.crit..("\nHit/Crit(s): ")..aura_env.castsNumber..("/")..aura_env.valCritNum
    
end