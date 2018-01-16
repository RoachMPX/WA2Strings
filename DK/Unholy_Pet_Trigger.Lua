--Trigger
function()
    return not UnitExists("pet")
end

--Untrigger
function()
  return UnitExists("pet")
end
