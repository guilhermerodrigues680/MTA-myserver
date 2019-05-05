function makeTrain(source)
	local myTrain = createVehicle(537,1995,-1949,13)  -- This will make a freight train just east of the LS train station
	setTrainDerailable(myTrain, false) -- myTrain can not be derailed now
	outputChatBox("A freight train has been created for you.", source, 255, 255, 0) -- Just a simple message for the player
    warpPedIntoVehicle(source, myTrain) -- This will warp you to inside the train
    setTrainSpeed(myTrain, -0.5) -- Set the train speed to 1 - 100mph, 160kmh
    setVehicleColor(myTrain,255,0,0)
    setTimer(
	    function()
		    trailer1 = createVehicle ( 569, 1995, -1949, 13)  -- create a trailer
            attachTrailerToVehicle ( myTrain, trailer1 )   -- attach them
            trailer2 = createVehicle ( 570, 1995, -1949, 13)  -- create a trailer
            attachTrailerToVehicle ( trailer1, trailer2 )   -- attach them
            trailer3 = createVehicle ( 569, 1995, -1949, 13)  -- create a trailer
            attachTrailerToVehicle ( trailer2, trailer3 )   -- attach them
            trailer4 = createVehicle ( 570, 1995, -1949, 13)  -- create a trailer
            attachTrailerToVehicle ( trailer3, trailer4 )   -- attach them
            trailer5 = createVehicle ( 569, 1995, -1949, 13)  -- create a trailer
            attachTrailerToVehicle ( trailer4, trailer5 )   -- attach them
            trailer6 = createVehicle ( 570, 1995, -1949, 13)  -- create a trailer
            attachTrailerToVehicle ( trailer5, trailer6 )   -- attach them
            trailer7 = createVehicle ( 569, 1995, -1949, 13)  -- create a trailer
            attachTrailerToVehicle ( trailer6, trailer7 )   -- attach them
            trailer8 = createVehicle ( 570, 1995, -1949, 13)  -- create a trailer
            attachTrailerToVehicle ( trailer7, trailer8 )   -- attach them
            trailer9 = createVehicle ( 569, 1995, -1949, 13)  -- create a trailer
            attachTrailerToVehicle ( trailer8, trailer9 )   -- attach them
            trailer10 = createVehicle ( 570, 1995, -1949, 13)  -- create a trailer
            attachTrailerToVehicle ( trailer9, trailer10 )   -- attach them
            trailer11 = createVehicle ( 569, 1995, -1949, 13)  -- create a trailer
            attachTrailerToVehicle ( trailer10, trailer11 )   -- attach them
        end, 50, 1)
        
end
addCommandHandler("criartrem", makeTrain)

function acelerarTrem(source, comando, vel)
    local meuTrem = getPedOccupiedVehicle(source)
    setTrainSpeed(meuTrem, -vel) -- Aumenta 150% a velocidade do trem
end
addCommandHandler("setvel", acelerarTrem)



myTrainAuto = createVehicle(537,1995,-1949,13)

function tremAuto(source)
    local x,y,z = 0,0,30
    local pessoa = createPed(1,x, y, z)
    local blip = createBlip(x,y,z)
    --local myTrainAuto = createVehicle(537,1995,-1949,13)

    setElementPosition (source, 1995, -1949, 16, false)

    attachElements(blip,pessoa)
	setTrainDerailable(myTrainAuto, false)
    outputChatBox("Trem automatico criado!", source, 255, 255, 0)
    
    warpPedIntoVehicle(pessoa, myTrainAuto) -- This will warp you to inside the train
    --setPedControlState(pessoa, "forwards", true)

    setTrainSpeed(myTrainAuto, -0.5) -- Set the train speed to 1 - 100mph, 160kmh
    setVehicleColor(myTrainAuto,255,0,0)
end
addCommandHandler("criartremauto", tremAuto)

function acelerarTremAuto(source, comando, vel)
    setTrainSpeed(myTrainAuto, -vel) -- Set the train speed to 1 - 100mph, 160kmh
end
addCommandHandler("acel", acelerarTremAuto)