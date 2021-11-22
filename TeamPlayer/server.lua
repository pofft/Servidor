<<<<<<< HEAD
teams = {"team 1 ","team 2"}
teamsColor = {{255,0,0},{0,0,255}}
addEventHandler("onResourceStart",resourceRoot,function()
  for i= 1, 2,1 do 
  createTeam( teams[i],teamsColor[i][1],teamsColor[i][2],teamsColor[i][3])
  end
end)

addEvent("changerPlayerTeam",true)
addEventHandler("changerPlayerTeam",root,function (teamPlayer)
    if getPlayerTeam(source) then 
      namePlayerTeam = getTeamName(getPlayerTeam(source)) 
      if namePlayerTeam ~= teams[teamPlayer] then 
        selectedPlayerTeam = getTeamFromName(teams[teamPlayer])
        setPlayerTeam(source,selectedPlayerTeam)  
      end 
    else  
      selectedPlayerTeam = getTeamFromName(teams[teamPlayer])
        setPlayerTeam(source,selectedPlayerTeam)    
    end
end)
=======
teams = {"team 1 ","team 2"}
teamsColor = {{255,0,0},{0,0,255}}
addEventHandler("onResourceStart",resourceRoot,function()
  for i= 1, 2,1 do 
  createTeam( teams[i],teamsColor[i][1],teamsColor[i][2],teamsColor[i][3])
  end
end)

addEvent("changerPlayerTeam",true)
addEventHandler("changerPlayerTeam",root,function (teamPlayer)
    if getPlayerTeam(source) then 
      namePlayerTeam = getTeamName(getPlayerTeam(source)) 
      if namePlayerTeam ~= teams[teamPlayer] then 
        selectedPlayerTeam = getTeamFromName(teams[teamPlayer])
        setPlayerTeam(source,selectedPlayerTeam)  
      end 
    else  
      selectedPlayerTeam = getTeamFromName(teams[teamPlayer])
        setPlayerTeam(source,selectedPlayerTeam)    
    end
end)
>>>>>>> 35e5882026fc092c12bf75afcd6f6f52dd67ed9a
