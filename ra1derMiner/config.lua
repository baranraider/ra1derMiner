Config = {}
Config.targetExport = "qb-target"                               -- The name of the Target export you are using ["qb-target", "qtarget", "bt-target"]
Config.UseBlips = true   
Config.BlipCoord = vector3(2929.832, 2797.154, 40.913)
Config.MinerBlipText = "Miner Zone"
Config.SellBlipText = "Mine Sell and Rent Miner Car"
Config.DebugPoly = false

Config.SkillbarName = "tgiann-skillbar"                             	-- Must choose one of the avalible skillbars ["reload-skillbar","np-skillbar","qb-skillbar"]
Config.SkillbarTime = 40000
Config.ProgressbarTime = 18500
Config.ProgressbarText = "Mining..."

Config.MinerSoundName = "pick-axe" -- Interact-Sound Sound File Name
Config.MinerSoundVolume = 0.3 -- Interact-Sound Volume Value

Config.PickaxeProp = "prop_tool_pickaxe" -- Mining Progress and Animation Prop

Config.Cashvalue = math.random(1500, 2400)
Config.Metalvalue = math.random(1,5)
Config.Coppervalue = math.random(1,4)
Config.Ironvalue = math.random(1,2)

Config.StonePrice = math.random(3, 30)
Config.MetalPrice = math.random(6, 45)
Config.CopperPrice = math.random(85, 175)
Config.IronPrice = math.random(225, 315)
Config.GoldPrice = math.random(450, 600)
Config.DiamondPrice = math.random(850, 1350)

Config.PickaxePrice = 50

Config.CaseItem = "case"
Config.MinerItem = "pickaxe"

Config.PedCoord = vector3(1078.622, -1970.94, 30.014)
Config.PedHeading = 325.8
Config.PedModels = "cs_orleans"

Config.MinerCarCoords = vector3(1074.120, -1949.16, 30.600)
Config.MinerCarCoordHeading = 326.1
Config.MinerCarPrice = 500
Config.FuelScript = "LegacyFuel" -- or ps-fuel or lj-fuel - what ever you use
Config.MaxSpeed = 35.0 -- = 79MP/H

Config.Text = {
    ['cancel'] = 'Cancelled.',
	['not_found'] = "Nothing Found",
	['you_failed'] = "You Failed",
	['not_minerzone'] = "You are not in the mining zone",
	["already_car"] = "You already have a miner car.",
	["not_enought_money"] = "Not Enought Money",
	["return_car"] = "Vehicle succesfully returned to mining garage. Your deposit is given to you",
	["error_car_message"] = "Your vehicle has not rented or you need try again",
	["rent_car_message"] = "You rented rebel two for " .. Config.MinerCarPrice .. "$ you can get $250 by returning the vehicle",
	["found_stone"] = "You found 1 Stone",
	["found_metal"] = "You found " .. Config.Metalvalue .. " scrap metal",
	["found_copper"] = "You found " .. Config.Coppervalue .. " scrap copper",
	["found_iron"] = "You found " ..Config.Ironvalue.. " scrap iron",
	["found_gold"] = "You found 1 gold",
	["found_diamond"] = "You found 1 diamond", 
	["found_case"] = "You found 1 case", 
	["case_open"] = "Case Opening...",
	["found_rolex"] = "You found 1 rolex from the case",
	["found_necklace"] = "You found 1 gold necklace from the case",
	["found_cash"] = "The case was opened, you found " ..Config.Cashvalue .. "$ in it.",
	["sell_stone"] = "You Sold Stone",
	["sell_metal"] = "You Sold Scrap Metal",
	["sell_copper"] = "You Sold Scrap Copper",
	["sell_iron"] = "You Sold Scrap Iron",
	["sell_gold"] = "You Sold Gold",
	["sell_diamond"] = "You Sold Diamond",
	["buy_pickaxe"] = "You Bought Pickaxe",
	["any_stone"] = "Minimum 5 required to sell stone",
	["any_metal"] = "Minimum 5 required to sell metal",
	["any_copper"] = "Minimum 5 required to sell copper",
	["any_iron"] = "Minimum 5 required to sell iron",
	["any_gold"] = "Minimum 3 required to sell gold",
	["any_diamond"] = "Minimum 1 required to sell diamonds",
}


