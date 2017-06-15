--Blood Shield
function()
    local i = 1
    local cur = GetTime()
    local total = 0
    
    while aura_env.table[i] do
        local time = aura_env.table[i][1]
        local dmg = aura_env.table[i][2]
        
        if cur > time + aura_env.lastSec then
            table.remove(aura_env.table, i)
        else
            total = total + dmg
            i = i + 1
        end
    end
    
    --Vampiric Blood
    --check artifact traits
    local currentRank = 0
    local loaded = IsAddOnLoaded("LibArtifactData-1.0") or LoadAddOn("LibArtifactData-1.0")
    if loaded then
        aura_env.LAD = aura_env.LAD or LibStub("LibArtifactData-1.0")
        if not aura_env.LAD:GetActiveArtifactID() then
            aura_env.LAD:ForceUpdate()            
        end
        local _, traits = aura_env.LAD:GetArtifactTraits()
        if traits then
            for _,v in ipairs(traits) do
                if v.spellID == 192544 then
                    currentRank = v.currentRank
                    break
                end
            end
        end
    end
    local trait = 1.3 + 0.05 * currentRank
    local vamp = UnitBuff("player", GetSpellInfo(55233)) and trait or 1
    
    --Versatility
    local vers = 1 + ((GetCombatRatingBonus(29) + GetVersatilityBonus(30)) / 100)
    
    --Guardian Spirit
    local gs = UnitBuff("player", GetSpellInfo(47788)) and 1.4 or 1
    
    --Divine Hymn
    local dh = UnitBuff("player", GetSpellInfo(64844)) and 1.1 or 1
    
    local perc = total * aura_env.percDmg / UnitHealthMax("player")
    perc = math.max(aura_env.minHealthPerc, perc)
    perc = perc * vamp * vers * gs * dh
    
    return string.format("%d", perc*100)
end
