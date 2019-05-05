--Comando criar veiculo tunado na marca
local vehMark = createMarker(2000, -1442.5, 13.0,"cylinder")

function vehicleSpawner(hitElement,matchingDimension)
	if getElementType(hitElement) == "player" then
		if getPedOccupiedVehicle(hitElement) == false then
		local x,y,z = getElementPosition(hitElement)
			local theVehicle = createVehicle(411, x,y,z) --Trem = 538, buggy= 568
			warpPedIntoVehicle(hitElement,theVehicle)
            -- add the requested upgrade to the vehicle
            local success = addVehicleUpgrade ( theVehicle, 1080 )
            -- inform the player of whether the upgrade was added successfully
            if ( success ) then
                outputConsole ( 1080 .. " upgrade added.", hitElement )
            else
                outputConsole ( "Failed to add upgrade.", hitElement )
            end
			
			if getElementModel(theVehicle) == 411 then -------------- vehicle Id 411 infernus
				setVehicleHandling (theVehicle, "mass", 300.0)
				setVehicleHandling(theVehicle, "turnMass", 200)
				setVehicleHandling(theVehicle, "dragCoeff", 4.0 )
				setVehicleHandling(theVehicle, "centerOfMass", { 0.0,0.08,-0.09 } )
				setVehicleHandling(theVehicle, "percentSubmerged", 103)
				setVehicleHandling(theVehicle, "tractionMultiplier", 1.8)
				setVehicleHandling(theVehicle, "tractionLoss", 1.0)
				setVehicleHandling(theVehicle, "tractionBias", 0.48)
				setVehicleHandling(theVehicle, "numberOfGears", 5)
				setVehicleHandling(theVehicle, "maxVelocity", 300.0)
				setVehicleHandling(theVehicle, "engineAcceleration", 90.0 )
				setVehicleHandling(theVehicle, "engineInertia", 5.0)
				setVehicleHandling(theVehicle, "driveType", "rwd")
				setVehicleHandling(theVehicle, "engineType", "petrol")
				setVehicleHandling(theVehicle, "brakeDeceleration", 20.0)
				setVehicleHandling(theVehicle, "brakeBias", 0.60)
				-----abs----
				setVehicleHandling(theVehicle, "steeringLock",  35.0 )
				setVehicleHandling(theVehicle, "suspensionForceLevel", 0.85)
				setVehicleHandling(theVehicle, "suspensionDamping", 0.15 )
				setVehicleHandling(theVehicle, "suspensionHighSpeedDamping", 0.0)
				setVehicleHandling(theVehicle, "suspensionUpperLimit", 0.15 ) -- 0.15
				setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.16) -- -0.16
				setVehicleHandling(theVehicle, "suspensionFrontRearBias", 0.5 )
				setVehicleHandling(theVehicle, "suspensionAntiDiveMultiplier", 0.0)
				setVehicleHandling(theVehicle, "seatOffsetDistance", 0.0)
				setVehicleHandling(theVehicle, "collisionDamageMultiplier", 0.00)
				setVehicleHandling(theVehicle, "monetary",  10000)
				setVehicleHandling(theVehicle, "modelFlags", 1002000)
				setVehicleHandling(theVehicle, "handlingFlags", 1000002)
				setVehicleHandling(theVehicle, "headLight", 3)
				setVehicleHandling(theVehicle, "tailLight", 2)
				setVehicleHandling(theVehicle, "animGroup", 4)
			end
			
		end
	end 
end 
addEventHandler("onMarkerHit",vehMark,vehicleSpawner)