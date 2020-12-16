ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('oxydelivery:server')
AddEventHandler('oxydelivery:server', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.get('money') >= Config.StartOxyPayment then
		xPlayer.removeMoney(Config.StartOxyPayment)
		
		TriggerClientEvent("oxydelivery:startDealing", source)
	else
		TriggerClientEvent('notification', xPlayer, 'Yeterli paran yok.[$100]', 2)
	end
end)

RegisterServerEvent('oxydelivery:receiveBigRewarditem')
AddEventHandler('oxydelivery:receiveBigRewarditem', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addInventoryItem(Config.BigRewarditem, 1)
end)

RegisterServerEvent('oxydelivery:receiveoxy')
AddEventHandler('oxydelivery:receiveoxy', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local rolex = xPlayer.getInventoryItem('rolex').count
	if rolex > 0 then

	xPlayer.addMoney(Config.Payment)
	xPlayer.removeInventoryItem(Config.Item, Config.OxyAmount)
	else
	TriggerClientEvent('notification', source, 'Rolexin yok!', 2)
	end
end)

RegisterServerEvent('oxydelivery:receivemoneyyy')
AddEventHandler('oxydelivery:receivemoneyyy', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addMoney(Config.Payment)
end)