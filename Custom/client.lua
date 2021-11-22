

clothes = {}

SkinPlayer ={
}
function setApplyShader(roupa,numeroRoupa, texture )
	if roupa and texture then
		if not SkinPlayer[source] then 
			SkinPlayer[source] = {}
			if not SkinPlayer[source][roupa] then 
				SkinPlayer[source][roupa] ={}
			end
		end
		if not SkinPlayer[source][roupa] then 
			SkinPlayer[source][roupa] ={}
		end
		if SkinPlayer[source][roupa] and SkinPlayer[source][roupa][1] then	
			local skin = unpack(SkinPlayer[source][roupa])
			if skin and skin [1] then 
				engineRemoveShaderFromWorldTexture(skin[1],skin[2],source)
				destroyElement(skin[1])
				destroyElement(skin[3])
				table.remove(SkinPlayer[source][roupa],1)
			end	
		end
		if numeroRoupa == 0 then return  end
		if not Textures[getElementModel(source)][roupa][numeroRoupa][texture] then return outputDebugString( "Essa Textura não existe | Skin > "..getElementModel( source).." | Roupa > "..roupa.." | Numero da Roupa > "..numeroRoupa.." | Textura > "..texture.." !") end
			clothes[source]= {}
			clothes[source][1] = dxCreateTexture( Textures[getElementModel( source)][roupa][numeroRoupa][texture])
			clothes[source][2] = dxCreateShader( "arquivos/shaders/replace.fx", 1, 0, false, "ped" )
			dxSetShaderValue(clothes[source][2], "gTexture", clothes[source][1])
			engineApplyShaderToWorldTexture(clothes[source][2], roupas[getElementModel(source)][roupa][numeroRoupa],source)
			table.insert(SkinPlayer[source][roupa],{clothes[source][2], roupas[getElementModel(source)][roupa][numeroRoupa],clothes[source][1]})
	end
end

addEvent( "addChotheShader", true )
addEventHandler( "addChotheShader", getRootElement(), setApplyShader )

-
function RemoveShaderFromPlayer()
	if SkinPlayer[source] then 	
		for i,roupa in pairs(SkinPlayer[source]) do 
			if roupa[1] then 
					engineRemoveShaderFromWorldTexture(roupa[1][1],roupa[1][2],source)
					destroyElement(roupa[1][1])
					destroyElement(roupa[1][3])
				end
		end
		 SkinPlayer[source] = {}
	end
end
addEvent( "RemoverShaderPlayer", true )
addEventHandler( "RemoverShaderPlayer", getRootElement(), RemoveShaderFromPlayer )
