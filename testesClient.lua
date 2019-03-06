-- Client 
local x,y,z = 0,0,30

local pessoa = createPed(1,x, y, z)
local blip = createBlip(x,y,z)
attachElements(blip,pessoa)

local hydra = createVehicle(520,x, y, z + 200)
warpPedIntoVehicle(pessoa, hydra)
setPedControlState(pessoa, "accelerate", true)
setPedControlState(pessoa, "steer_back", true)

createVehicle(520,0, 5, 10)

--setPedAimTarget ( pessoa, 10, 10, 5 ) -- set the ped's target to a point in North-East

--function cancelPedDamage()
--	cancelEvent() -- Cancels the onClientPedDamage event
--end
--addEventHandler("onClientPedDamage", pessoa, cancelPedDamage) -- When thePed is damaged, cancelPedDamage is called