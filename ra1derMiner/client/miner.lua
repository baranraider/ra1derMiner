local QBCore = exports['qb-core']:GetCoreObject()
local miner = PolyZone:Create({
    vector2(2955.273, 2768.700),
    vector2(2941.150, 2761.797),
    vector2(2917.542, 2791.934),
    vector2(2926.708, 2800.845),
},{
    name = "Miner",
    minZ = 38.0,
    maxZ = 45.0,
    debugPoly = Config.DebugPoly
})

Citizen.CreateThread(function()
    if Config.UseBlips then
    local miners = AddBlipForCoord(Config.BlipCoord.x, Config.BlipCoord.y, Config.BlipCoord.z)
    SetBlipSprite(miners, 671) -- Blip ID
    SetBlipDisplay(miners, 4) 
    SetBlipScale (miners, 0.8) --Blip Scale
    SetBlipColour(miners, 1) -- Blip Color
    SetBlipAsShortRange(miners, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.MinerBlipText)
    EndTextCommandSetBlipName(miners)

    local ped = AddBlipForCoord(Config.PedCoord.x, Config.PedCoord.y, Config.PedCoord.z)
    SetBlipSprite(ped, 233) -- Blip ID
    SetBlipDisplay(ped, 4) 
    SetBlipScale (ped, 0.8) --Blip Scale
    SetBlipColour(ped, 4) -- Blip Color
    SetBlipAsShortRange(ped, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.SellBlipText)
    EndTextCommandSetBlipName(ped)
    end
end)


RegisterNetEvent("ra1derMiner:serverStartMine")
AddEventHandler("ra1derMiner:serverStartMine", function()
    local playerCoords = GetEntityCoords(PlayerPedId())
    local coords = GetEntityCoords(PlayerPedId())
    local ped = PlayerPedId()
    MinerZone = miner:isPointInside(coords)
    if MinerZone then 
        TriggerServerEvent('InteractSound_SV:PlayOnSource', Config.MinerSoundName, Config.MinerSoundVolume)
        TriggerEvent("Give:Pickaxe")
        QBCore.Functions.Progressbar('Miner', Config.ProgressbarText, Config.ProgressbarTime, false, true, { -- Name | Label | Time | useWhileDead | canCancel
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'melee@large_wpn@streamed_core',
            anim = 'ground_attack_on_spot',
            flags = 16,
        }, {}, {}, function()
            TriggerEvent("Delete:Pickaxe")
        local finished = exports[Config.SkillbarName]:taskBar(Config.SkillbarTime, 50)
              if finished then
                local deger = math.random(0, 100)
                if deger >= 0 and deger < 30 then
                    TriggerServerEvent("stone:add")
                elseif deger >= 31 and deger < 45 then
                    TriggerServerEvent("scrapmetal:add")
                elseif deger >= 46 and deger < 60 then
                    TriggerServerEvent("scrapcopper:add") 	
                elseif deger >= 61 and deger < 80 then
                    TriggerServerEvent("scrapiron:add") 
                elseif deger >= 81 and deger < 90 then
                    TriggerServerEvent("scrapgold:add") 	
                elseif deger >= 91 and deger < 96 then
                    TriggerServerEvent("diamond:add") 
                elseif deger >= 97 and deger < 100 then	
                    TriggerServerEvent("case:add")
                end
            end
            end, function()
                QBCore.Functions.Notify(Config.Text["cancel"], 'error', 3500) 
            TriggerEvent("Delete:Pickaxe")
        end)
    else
        QBCore.Functions.Notify(Config.Text["not_minerzone"], 'error', 3500) 
        TriggerEvent("Delete:Pickaxe")
    end
end)

RegisterNetEvent("Give:Pickaxe")
AddEventHandler("Give:Pickaxe", function()
    pickaxe = CreateObject(GetHashKey(Config.PickaxeProp), 0, 0, 0, true, true, true) 
    AttachEntityToEntity(pickaxe, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), -0.04, -0.04, -0.04, 350.0, 100.00, 140.0, true, true, false, true, 1, true)
end)

RegisterNetEvent("Delete:Pickaxe")
AddEventHandler("Delete:Pickaxe", function()
    DetachEntity(pickaxe, 1, true)
    DeleteEntity(pickaxe)
    DeleteObject(pickaxe, 1, true)
    DeleteObject(pickaxe)
    ClearPedTasks(PlayerPedId())
end)


RegisterNetEvent("ra1derMiner:client:SellMenu") 
AddEventHandler("ra1derMiner:client:SellMenu", function()
    exports['qb-menu']:openMenu({
		{
            header = "💲Miner Sell Zone",
            isMenuHeader = true
        },
        {
            header = "💲Sell Stone",
            txt = "Piece Price: $"..Config.MetalPrice.."",
            params = {
				isServer = true,
                event = "ra1derMiner:server:Sell",
				args = 2
            }
        },
        {
            header = "💲Sell Scrap Metal",
            txt = "Piece Price: $"..Config.MetalPrice.."",
            params = {
				isServer = true,
                event = "ra1derMiner:server:Sell",
				args = 2
            }
        },
        {
            header = "💲Sell Scrap Copper",
            txt = "Piece Price: $"..Config.CopperPrice.."",
            params = {
				isServer = true,
                event = "ra1derMiner:server:Sell",
				args = 3
            }
        },
        {
            header = "💲Sell Scrap Iron",
            txt = "Piece Price: $"..Config.IronPrice.."",
            params = {
				isServer = true,
                event = "ra1derMiner:server:Sell",
				args = 4
            }
        },
        {
            header = "💲Sell Scrap Gold",
            txt = "Piece Price: $"..Config.GoldPrice.."",
            params = {
				isServer = true,
                event = "ra1derMiner:server:Sell",
				args = 5
            }
        },
        {
            header = "💲Sell Diamond",
            txt = "Piece Price: $"..Config.DiamondPrice.."",
            params = {
				isServer = true,
                event = "ra1derMiner:server:Sell",
				args = 6
            }
        },
        {
            header = "❌ Close Menu",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end)

RegisterNetEvent("ra1derMiner:client:Interactions") 
AddEventHandler("ra1derMiner:client:Interactions", function()
    exports['qb-menu']:openMenu({
		{
            header = "Miner Interactions",
            isMenuHeader = true
        },
        {
            header = "💲Buy Pickaxe",
            txt = "Piece Pickaxe $" .. Config.PickaxePrice.. "",
			isServer = true,
            params = {
                event = "ra1derMiner:client:BuyPickaxe"
            }
        },
        {
            header = "🚛 Rent a Miner Car",
            txt = "Take Price $" .. Config.MinerCarPrice.. "",
			isServer = true,
            params = {
                event = "ra1derMiner:client:RentMinerCar"
            }
        },
        {
            header = "🔴 Return the Miner Car",
            txt = "Take Price $250",
			isServer = true,
            params = {
                event = "ra1derMiner:client:DeleteCar"
            }
        },
        {
            header = "❌ Close Menu",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end)

RegisterNetEvent("ra1derMiner:client:BuyPickaxe", function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    TriggerServerEvent("ra1derMiner:server:BuyPickaxe")
end)

exports["qb-target"]:AddTargetModel(Config.PedModels, {
    options = {
        {
            event = "ra1derMiner:client:SellMenu",
            icon = "bi bi-currency-dollar",
            label = "Sell Menu",
        },
        {
            event = "ra1derMiner:client:Interactions",
            icon = "bi bi-currency-dollar",
            label = "Miner Interactions",
        },
    },
    distance = 4.0
})



RegisterNetEvent("ra1derMiner:client:RentMinerCar", function()
    PlayerData = QBCore.Functions.GetPlayerData()
    TriggerServerEvent("ra1derMiner:server:RentMinerCar")
end)

RegisterNetEvent("ra1derMiner:client:GiveCar")
AddEventHandler("ra1derMiner:client:GiveCar", function()
    if vehicle == nil then
        local modelHash = GetHashKey("Rebel2")
        local ped = PlayerPedId()
        RequestModel(modelHash)
        local isLoaded = HasModelLoaded(modelHash)
        while isLoaded == false do
            Citizen.Wait(100)
        end
        local platetextrandom = math.random(111, 999)
            vehicle = CreateVehicle(modelHash, Config.MinerCarCoords, Config.MinerCarCoordHeading, 1, 0)
            local id = NetworkGetNetworkIdFromEntity(vehicle)
            SetNetworkIdCanMigrate(id, true)
            SetVehicleDirtLevel(vehicle, 0)
            exports[Config.FuelScript]:SetFuel(vehicle, 100.0)
            SetVehicleNumberPlateText(vehicle, "Miner" .. platetextrandom .. "")
            SetPedIntoVehicle(GetPlayerPed(-1), vehicle,-1) -- put player inside
            SetVehicleColours(vehicle, 135, 135)
            SetVehicleEngineOn(vehicle, true)
            SetVehicleMaxSpeed(vehicle, Config.MaxSpeed)
            TriggerEvent("x-hotwire:give-keys", vehicle) --Your need change this with your vehiclekeys script events
            SetNewWaypoint(2937.587, 2786.557)
    else
        QBCore.Functions.Notify(Config.Text["already_car"], "error", 5000)
    end
end)


RegisterNetEvent("ra1derMiner:client:DeleteCar")
AddEventHandler("ra1derMiner:client:DeleteCar", function()
    if vehicle ~= nil then
            DeleteEntity(vehicle)
            DeleteVehicle(vehicle)
            QBCore.Functions.DeleteVehicle(vehicle)
            vehicle = nil
            QBCore.Functions.Notify(Config.Text["return_car"], "success")
            Wait(600)
            TriggerServerEvent('ra1derMiner:server:AddMoney')
        else
            QBCore.Functions.Notify(Config.Text["error_car_message"], "error", 5000)
        end
end)


Citizen.CreateThread(function()
    RequestModel(GetHashKey(Config.PedModels))
    while not HasModelLoaded(GetHashKey(Config.PedModels)) do
        Wait(1)
    end
    npc = CreatePed(1, GetHashKey(Config.PedModels), Config.PedCoord.x, Config.PedCoord.y, Config.PedCoord.z, Config.PedHeading, false, true)
    SetPedCombatAttributes(npc, 46, true)               
    SetPedFleeAttributes(npc, 0, 0)               
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityAsMissionEntity(npc, true, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
end)
