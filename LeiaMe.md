# natal_rewards


# adicionar no arquivo vrp_inventory na parte server


if itemName == "presente" then
					active[parseInt(user_id)] = 5
					vCLIENT.closeInventory(source)
					vCLIENT.blockButtons(source,true)
					TriggerClientEvent("progress",source,5000,"desembrulhando")

					repeat
						if active[parseInt(user_id)] == 0 then
							active[parseInt(user_id)] = -1
							if vRP.tryGetInventoryItem(user_id,itemName,1) then
								vRP.giveMoney(source,parseInt(valor))
								TriggerClientEvent("Notify",source,"sucesso","Você ganhou "..valor.." reais/dolares na caixinha de presente.", 8000)
								vCLIENT.blockButtons(source,false)
							end
						end
						Citizen.Wait(0)
					until active[parseInt(user_id)] == -1
				end
