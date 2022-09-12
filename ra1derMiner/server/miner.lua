local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.MinerItem, function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('ra1derMiner:serverStartMine', src)
end)

RegisterServerEvent('stone:add')
AddEventHandler('stone:add', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem("stone", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['stone'], "add", 1)
    TriggerClientEvent('QBCore:Notify', src,  Config.Text["found_stone"], 'primary')
end)

RegisterServerEvent('scrapmetal:add')
AddEventHandler('scrapmetal:add', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem("scrapmetal", Config.Metalvalue)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['scrapmetal'], "add", 1)
    TriggerClientEvent('QBCore:Notify', src, Config.Text["found_metal"], 'primary')
end)

RegisterServerEvent('scrapcopper:add')
AddEventHandler('scrapcopper:add', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem("scrapcopper", Config.Coppervalue)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['scrapcopper'], "add", 1)
    TriggerClientEvent('QBCore:Notify', src, Config.Text["found_copper"], 'primary')
end)

RegisterServerEvent('scrapiron:add')
AddEventHandler('scrapiron:add', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem("scrapiron", Config.Ironvalue)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['scrapiron'], "add", 1)
    TriggerClientEvent('QBCore:Notify', src, Config.Text["found_iron"], 'primary')
end)

RegisterServerEvent('scrapgold:add')
AddEventHandler('scrapgold:add', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem("scrapgold", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['scrapgold'], "add", 1)
    TriggerClientEvent('QBCore:Notify', src, Config.Text["found_gold"], 'primary')
end)

RegisterServerEvent('diamond:add')
AddEventHandler('diamond:add', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem("diamond", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['diamond'], "add")
    TriggerClientEvent('QBCore:Notify', src, Config.Text["diamond"], 'primary')
end)

RegisterServerEvent('case:add')
AddEventHandler('case:add', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem("case", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['case'], "add")
    TriggerClientEvent('QBCore:Notify', src, Config.Text["found_case"], 'primary')
end)


QBCore.Functions.CreateUseableItem("case", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local luck = math.random(1, 100)
    TriggerClientEvent('QBCore:Notify', src, Config.Text["case_open"], 'primary', 3000)
    Wait(3600)
    if luck >= 0 and luck < 35 then	
    Player.Functions.AddItem("rolex", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rolex'], "add", 1)
    Wait(100)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["case"], "remove", 1)
    Player.Functions.RemoveItem("case", 1)
    TriggerClientEvent('QBCore:Notify', src, Config.Text["found_rolex"], 'primary')
    elseif luck >= 36 and luck < 65 then	
    Player.Functions.AddItem("altinkolye", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['altinkolye'], "add", 1)
    Wait(100)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["case"], "remove", 1)
    Player.Functions.RemoveItem("case", 1)
    TriggerClientEvent('QBCore:Notify', src, Config.Text["found_necklace"], 'primary')
    elseif luck >= 66 and luck < 100 then	
    Player.Functions.AddMoney("cash", Config.Cashvalue)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["case"], "remove", 1)
    Player.Functions.RemoveItem("case", 1)
    TriggerClientEvent('QBCore:Notify', src, Config.Text["found_cash"], 'primary')
    end
end)

RegisterServerEvent('ra1derMiner:server:RentMinerCar')
AddEventHandler('ra1derMiner:server:RentMinerCar', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local bank = Player.PlayerData.money.bank
    if bank >= Config.MinerCarPrice then
        Player.Functions.RemoveMoney("bank", Config.MinerCarPrice)
        TriggerClientEvent('ra1derMiner:client:GiveCar', source, modelHash)
        TriggerClientEvent('QBCore:Notify', src,  Config.Text["rent_car_message"], "success", 10000)
    else
        TriggerClientEvent('QBCore:Notify', src,  Config.Text["not_enought_money"], "error", 4000)
    end
end)

RegisterServerEvent('ra1derMiner:server:BuyPickaxe')
AddEventHandler('ra1derMiner:server:BuyPickaxe', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local bank = Player.PlayerData.money.bank
    if bank >= Config.PickaxePrice then
        Player.Functions.RemoveMoney("bank", Config.PickaxePrice)
        Wait(500)
        Player.Functions.AddItem(Config.MinerItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.MinerItem], "add", 1)
        TriggerClientEvent('QBCore:Notify', src,  Config.Text["buy_pickaxe"], "success", 10000)
    else
        TriggerClientEvent('QBCore:Notify', src,  Config.Text["not_enought_money"], "error", 4000)
    end
end)

RegisterServerEvent('ra1derMiner:server:AddMoney')
AddEventHandler('ra1derMiner:server:AddMoney', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    
	Player.Functions.AddMoney("bank", 250)
end)

RegisterNetEvent('ra1derMiner:server:Sell', function(args) 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
	if args == 1 then 
		if Player.Functions.GetItemByName("stone").amount > 5 then
			local payment = Config.StonePrice
			Player.Functions.RemoveItem("stone", 1)
            Wait(500)
			Player.Functions.AddMoney('cash', payment)
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['stone'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, Config.Text["sell_stone"], "success")
		else
		    TriggerClientEvent('QBCore:Notify', src, Config.Text["any_stone"], "error")
		end
    elseif args == 2 then 
		if Player.Functions.GetItemByName("scrapmetal").amount > 5 then
			local payment = Config.MetalPrice
			Player.Functions.RemoveItem("scrapmetal", 1)
            Wait(500)
			Player.Functions.AddMoney('cash', payment)
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['scrapmetal'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, Config.Text["sell_metal"], "success")
		else
		    TriggerClientEvent('QBCore:Notify', src, Config.Text["any_metal"], "error")
		end
	elseif args == 3 then
        if Player.Functions.GetItemByName("scrapcopper").amount > 5 then
			local payment = Config.CopperPrice
			Player.Functions.RemoveItem("scrapcopper", 1)
            Wait(500)
			Player.Functions.AddMoney('cash', payment)
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['scrapcopper'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, Config.Text["sell_copper"], "success")
		else
		    TriggerClientEvent('QBCore:Notify', src, Config.Text["any_copper"], "error")
		end
    elseif args == 4 then
        if Player.Functions.GetItemByName("scrapiron").amount > 5 then
			local payment = Config.IronPrice
			Player.Functions.RemoveItem("scrapiron", 1)
            Wait(500)
			Player.Functions.AddMoney('cash', payment)
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['scrapiron'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, Config.Text["sell_iron"], "success")
		else
		    TriggerClientEvent('QBCore:Notify', src, Config.Text["any_iron"], "error")
		end
    elseif args == 5 then
        if Player.Functions.GetItemByName("scrapgold").amount > 3 then
			local payment = Config.GoldPrice
			Player.Functions.RemoveItem("scrapgold", 1)
            Wait(500)
			Player.Functions.AddMoney('cash', payment)
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['scrapgold'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, Config.Text["sell_gold"], "success")
		else
		    TriggerClientEvent('QBCore:Notify', src, Config.Text["any_gold"], "error")
		end
    elseif args == 6 then
        if Player.Functions.GetItemByName("diamond").amount > 0 then
			local payment = Config.DiamondPrice
			Player.Functions.RemoveItem("diamond", 1)
            Wait(500)
			Player.Functions.AddMoney('cash', payment)
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['diamond'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, Config.Text["sell_diamond"], "success")
		else
		    TriggerClientEvent('QBCore:Notify', src, Config.Text["any_diamond"], "error")
		end
	end
end)