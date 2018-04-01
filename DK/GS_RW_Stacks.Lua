--GS stacks (Used in conjunction with Remorseless Winter)
function()
    local stacks = select(4, UnitBuff("player","Gathering Storm"))
    return stacks
end