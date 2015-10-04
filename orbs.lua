
-- ADDED TenPlus1 (Only has 10 uses)
minetest.register_tool("castle:orb_day", {
	description = "Orb of Midday",
	inventory_image = "castle_day.png",
	stack_max = 1,

	on_use = function(itemstack, user, pointed_thing)
		itemstack:add_wear(65535/10)
		minetest.set_timeofday(0.5)
	return itemstack
	end
})

-- ADDED TenPlus1 (Only has 10 uses)
minetest.register_tool("castle:orb_night", {
	description = "Orb of Night",
	inventory_image = "castle_night.png",
	stack_max = 1,

	on_use = function(itemstack, user, pointed_thing)
		itemstack:add_wear(65535/10)
		minetest.set_timeofday(0)
	return itemstack
	end
})

minetest.register_craft( {
	output = "castle:orb_day",
	recipe = { 
		{"", "default:glass",""},
		{"default:glass", "default:diamondblock","default:glass"},
		{"", "default:glass",""}
	},
})

minetest.register_craft({
	output = "castle:orb_night",
	recipe = {
		{"", "default:obsidian_glass",""},
		{"default:obsidian_glass", "default:mese","default:obsidian_glass"},
		{"", "default:obsidian_glass",""}
	}
})
