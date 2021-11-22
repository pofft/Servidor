<<<<<<< HEAD


function updataTablePlayer (table) 
  playersData = table
end
addEvent("updatePlayersData",true)
addEventHandler("updatePlayersData",root,updataTablePlayer)
addEventHandler("onClientRender", root,
function()
    if playersData[localPlayer] then
  dxDrawRectangle(0, 227, 455, 232, tocolor(42, 41, 41, 128), false)


  dxDrawText("Kills :"..playersData[localPlayer]["kills"].."\nDeath :"..playersData[localPlayer]["death"], 15, 258, 391, 408, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)
  end
end
)
function checkDataPlayerc ()
  outputDebugString(inspect(playersData))
end
addCommandHandler("checkdata2",checkDataPlayerc,false,false)


=======


function updataTablePlayer (table) 
  playersData = table
end
addEvent("updatePlayersData",true)
addEventHandler("updatePlayersData",root,updataTablePlayer)
addEventHandler("onClientRender", root,
function()
    if playersData[localPlayer] then
  dxDrawRectangle(0, 227, 455, 232, tocolor(42, 41, 41, 128), false)


  dxDrawText("Kills :"..playersData[localPlayer]["kills"].."\nDeath :"..playersData[localPlayer]["death"], 15, 258, 391, 408, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)
  end
end
)
function checkDataPlayerc ()
  outputDebugString(inspect(playersData))
end
addCommandHandler("checkdata2",checkDataPlayerc,false,false)


>>>>>>> 35e5882026fc092c12bf75afcd6f6f52dd67ed9a
