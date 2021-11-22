<<<<<<< HEAD
teams = {"team 1 ","team 2"}
addEventHandler("onClientResourceStart", resourceRoot,
  function()
      Window = guiCreateWindow(524, 235, 401, 221, "", false)
      guiWindowSetSizable(Window, false)

     button1 = guiCreateButton(30, 85, 118, 50, teams[1], false, Window)
     button2 = guiCreateButton(258, 85, 118, 50,teams[2], false, Window) 
     addEventHandler("onClientGUIClick",button1,clickButton)
     addEventHandler("onClientGUIClick",button2,clickButton)
  end
)

function clickButton (button,state)
  if button == "left" then 
    if source == button1 then 
      triggerServerEvent ("changerPlayerTeam",localPlayer,1)
    elseif source == button2 then 
      triggerServerEvent ("changerPlayerTeam",localPlayer,2)
    else 
      return 
    end   
  end
=======
teams = {"team 1 ","team 2"}
addEventHandler("onClientResourceStart", resourceRoot,
  function()
      Window = guiCreateWindow(524, 235, 401, 221, "", false)
      guiWindowSetSizable(Window, false)

     button1 = guiCreateButton(30, 85, 118, 50, teams[1], false, Window)
     button2 = guiCreateButton(258, 85, 118, 50,teams[2], false, Window) 
     addEventHandler("onClientGUIClick",button1,clickButton)
     addEventHandler("onClientGUIClick",button2,clickButton)
  end
)

function clickButton (button,state)
  if button == "left" then 
    if source == button1 then 
      triggerServerEvent ("changerPlayerTeam",localPlayer,1)
    elseif source == button2 then 
      triggerServerEvent ("changerPlayerTeam",localPlayer,2)
    else 
      return 
    end   
  end
>>>>>>> 35e5882026fc092c12bf75afcd6f6f52dd67ed9a
end