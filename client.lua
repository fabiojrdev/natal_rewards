local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("natal_rewards")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local tempoespera = 0
local processo = false
local CoordenadaX = 177.57482910156
local CoordenadaY = -1005.0162963867
local CoordenadaZ = 29.332189559937
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROCESSO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if not processo then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
			local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)
			

		--	local source = source
		--	local user_id = func.getUserId(source)
		

		
		if distance <= 15 then
			DrawMarker(25,CoordenadaX,CoordenadaY,CoordenadaZ-0.43,0,0,0,0,180.0,130.0,1.0,1.0,1.0,255,0,0,100,1,0,0,1)
			if distance <= 1.2 then --and not processo then
				drawTxt("APERTE ~r~E~w~ PARA ABRIR UMA ~r~CAIXINHA DE PRESENTES",4,0.5,0.93,0.50,255,255,255,180)
				if IsControlJustPressed(0,38) then
					if tempoespera <= 0 then
					if func.checkPayment() then
						processo = true
						tempoespera = 1200
						TriggerEvent('cancelando',true)
						TriggerEvent("progress",3000,"Pegando Presente!")
						TriggerEvent("Notify","aviso","Você pegou uma caixinha aguarde <b>"..tempoespera.." segundos, para pegar a caixinha novamente.",5000)
						Citizen.Wait(5000)
						processo = false
						TriggerEvent('cancelando',false)
						--[[SetTimeout(5000,function()
						processo = false
						TriggerEvent('cancelando',false)
						end)]]
					else
						TriggerEvent("Notify","aviso","Espere <b>"..tempoespera.." segundos, para pegar a caixinha novamente.",8000)
						Citizen.Wait(1000)
					end
				end
			end
				end
					end
						end
							end
								end)

								

-----------------------------------------------------------------------------------------------------------------------------------------
-- TEMPO DE ESPERA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		if tempoespera > 0 then
			tempoespera = tempoespera - 1
		end
		if tempoespera == 0 then
			tempoespera = 0
		end
		Citizen.Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end