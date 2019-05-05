
--[[ Skills to upgrade: Maximo tudo - /maxvida
24 = Max Player Health
69 = Weapon Type Pistol Skill
70 = Weapon Type Pistol Silenced Skill
71 = Weapon Type Desert Eagle Skill
72 = Weapon Type Shotgun Skill
73 = Weapon Type Sawn off Shotgun Skill
74 = Weapon Type Spas 12 Shotgun Skill
76 = Weapon Type MP5 Skill
77 = Weapon Type AK47 Skill
78 = Weapon Type M4 Skill
79 = Weapon Type Sniper Rifle Skill --]]

function maxVida(thePlayer)
    -- Set every stat to 1000 (the maximum value)
    for i, stat in ipairs({ 24, 69, 70, 71, 72, 73, 74, 76, 77, 78, 79 }) do
       setPedStat(thePlayer, stat, 1000)
       --outputChatBox("Status " .. stat .. " configurado no maximo!", thePlayer, 0, 0, 255, false)
    end
    --Imprimir Status Configurados
    Text = {}   
    Text[1] = "24 = Max Player Health"
    Text[2] = "69 = Weapon Type Pistol Skill"
    Text[3] = "70 = Weapon Type Pistol Silenced Skill"
    Text[4] = "71 = Weapon Type Desert Eagle Skill"
    Text[5] = "72 = Weapon Type Shotgun Skill"
    Text[6] = "73 = Weapon Type Sawn off Shotgun Skill"
    Text[7] = "74 = Weapon Type Spas 12 Shotgun Skill"
    Text[8] = "76 = Weapon Type MP5 Skill"
    Text[9] = "77 = Weapon Type AK47 Skill"
    Text[10] = "78 = Weapon Type M4 Skill"
    Text[11] = "79 = Weapon Type Sniper Rifle Skill"
 
    --outputChatBox("Status configurados no maximo:", thePlayer, 0, 0, 255, false)
    outputDebugString(getPlayerName("O Player --> "..thePlayer) .. " <-- configurou no maximo:")
    for i=1,#Text do  
         --outputChatBox(Text[i], thePlayer, 0, 0, 255, false)
         outputDebugString(Text[i])
    end
 
     setElementHealth ( thePlayer, 1000) --Vida no maximo
     setPedArmor (thePlayer, 100 )    -- Set player's armor to 100
     outputChatBox("Vida e colete configurados no maximo!", thePlayer, 0, 255, 0, false)
 end
 addCommandHandler("maxvida", maxVida)