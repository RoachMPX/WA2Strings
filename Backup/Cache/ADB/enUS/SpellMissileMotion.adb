WCH8          
   |  yvq7�#�A@[  ��X�  0            O   r       Mage - Ebonbolt speedAbs = math.min(60, math.pow(0.3+progress * 3, 3) * 20)  Hunter - Sentinel - Missile Script local revolutions = 360*3
local radius = 10
local rotationtime = 18  -- amount of time you spend after the "sweep in" phase

local sweepIn 
local sweepCenter
if (time>1.2) then
	sweepIn = 0
	--sweepCenter = 1
else 
	sweepIn = -math.pow(1.2-time,2)*startDistance
	--sweepCenter = sin(time*110)
end	

transUp = 5
transFront = (startDistance-(startDistance*progress))+sin(time*revolutions/rotationtime)*radius+sweepIn
transRight = cos(time/rotationtime*revolutions)*radius--*sweepCenter

modelRoll = 30

 �  0  