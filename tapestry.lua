-- Wooden tapestry top
minetest.register_node("castle:tapestry_top", {
	drawtype = "nodebox",
	description = "Tapestry Top",
	tiles = {"default_wood.png"},
	sunlight_propagates = true,
	groups = {flammable=3,choppy=2,oddly_breakable_by_hand=1},
	sounds = default.node_sound_defaults(),
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {-0.6,-0.5,0.375,0.6,-0.375,0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.6,-0.5,0.375,0.6,-0.375,0.5},
	},
})

minetest.register_craft({
	type = "shapeless",
	output = "castle:tapestry_top",
	recipe = {"default:stick"},
})

-- Create normal, long and very long tapestry
function tapestry_create(name, desc, groups)

	-- Tapestry
	minetest.register_node("castle:tapestry_"..name, {
		drawtype = "nodebox",
		description = desc.." Tapestry",
		tiles = {"wool_"..name..".png"},
		groups = groups,
		sounds = default.node_sound_defaults(),
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.3125,-0.5,0.4375,-0.1875,-0.375,0.5}, 
				{0.1875,-0.5,0.4375,0.3125,-0.375,0.5}, 
				{-0.375,-0.375,0.4375,-0.125,-0.25,0.5}, 
				{0.125,-0.375,0.4375,0.375,-0.25,0.5}, 
				{-0.4375,-0.25,0.4375,-0.0625,-0.125,0.5}, 
				{0.0625,-0.25,0.4375,0.4375,-0.125,0.5}, 
				{-0.5,-0.125,0.4375,0,0,0.5}, 
				{0,-0.125,0.4375,0.5,0,0.5}, 
				{-0.5,0,0.4375,0.5,1.5,0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5,-0.5,0.4375,0.5,1.5,0.5},
		},
	})

	minetest.register_craft({
		type = "shapeless",
		output = "castle:tapestry_"..name,
		recipe = {"wool:"..name, "default:stick"},
	})

	-- Long Tapestry
	minetest.register_node("castle:long_tapestry_"..name, {
		drawtype = "nodebox",
		description = desc.." Tapestry (Long)",
		tiles = {"wool_"..name..".png"},
		groups = groups,
		sounds = default.node_sound_defaults(),
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.3125,-0.5,0.4375,-0.1875,-0.375,0.5}, 
				{0.1875,-0.5,0.4375,0.3125,-0.375,0.5}, 
				{-0.375,-0.375,0.4375,-0.125,-0.25,0.5}, 
				{0.125,-0.375,0.4375,0.375,-0.25,0.5}, 
				{-0.4375,-0.25,0.4375,-0.0625,-0.125,0.5}, 
				{0.0625,-0.25,0.4375,0.4375,-0.125,0.5}, 
				{-0.5,-0.125,0.4375,0,0,0.5}, 
				{0,-0.125,0.4375,0.5,0,0.5}, 
				{-0.5,0,0.4375,0.5,2.5,0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5,-0.5,0.4375,0.5,2.5,0.5},
		},
	})

	minetest.register_craft({
		type = "shapeless",
		output = "castle:long_tapestry_"..name,
		recipe = {"wool:"..name, "castle:tapestry_"..name},
	})

	-- Very Long Tapestry
	minetest.register_node("castle:very_long_tapestry_"..name, {
		drawtype = "nodebox",
		description = desc.." Tapestry (Very Long)",
		tiles = {"wool_"..name..".png"},
		groups = groups,
		sounds = default.node_sound_defaults(),
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.3125,-0.5,0.4375,-0.1875,-0.375,0.5}, 
				{0.1875,-0.5,0.4375,0.3125,-0.375,0.5}, 
				{-0.375,-0.375,0.4375,-0.125,-0.25,0.5}, 
				{0.125,-0.375,0.4375,0.375,-0.25,0.5}, 
				{-0.4375,-0.25,0.4375,-0.0625,-0.125,0.5}, 
				{0.0625,-0.25,0.4375,0.4375,-0.125,0.5}, 
				{-0.5,-0.125,0.4375,0,0,0.5}, 
				{0,-0.125,0.4375,0.5,0,0.5}, 
				{-0.5,0,0.4375,0.5,3.5,0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5,-0.5,0.4375,0.5,3.5,0.5},
		},
	})

	minetest.register_craft({
		type = "shapeless",
		output = "castle:very_long_tapestry_"..name,
		recipe = {"wool:"..name, "castle:long_tapestry_"..name},
	})

end

tapestry_create("white", "White",		{oddly_breakable_by_hand=2,flammable=3})
tapestry_create("grey", "Grey",			{oddly_breakable_by_hand=2,flammable=3,not_in_craft_guide=1})
tapestry_create("black", "Black",		{oddly_breakable_by_hand=2,flammable=3,not_in_craft_guide=1})
tapestry_create("red", "Red",			{oddly_breakable_by_hand=2,flammable=3,not_in_craft_guide=1})
tapestry_create("yellow", "Yellow",		{oddly_breakable_by_hand=2,flammable=3,not_in_craft_guide=1})
tapestry_create("green", "Green",		{oddly_breakable_by_hand=2,flammable=3,not_in_craft_guide=1})
tapestry_create("cyan", "Cyan",			{oddly_breakable_by_hand=2,flammable=3,not_in_craft_guide=1})
tapestry_create("blue", "Blue",			{oddly_breakable_by_hand=2,flammable=3,not_in_craft_guide=1})
tapestry_create("magenta", "Magenta",		{oddly_breakable_by_hand=2,flammable=3,not_in_craft_guide=1})
tapestry_create("orange", "Orange",		{oddly_breakable_by_hand=2,flammable=3,not_in_craft_guide=1})
tapestry_create("violet", "Violet",		{oddly_breakable_by_hand=2,flammable=3,not_in_craft_guide=1})
tapestry_create("dark_grey", "Dark Grey",	{oddly_breakable_by_hand=2,flammable=3,not_in_craft_guide=1})
tapestry_create("dark_green", "Dark Green",	{oddly_breakable_by_hand=2,flammable=3,not_in_craft_guide=1})
tapestry_create("pink", "Pink",			{oddly_breakable_by_hand=2,flammable=3,not_in_craft_guide=1})
tapestry_create("brown", "Brown",		{oddly_breakable_by_hand=2,flammable=3,not_in_craft_guide=1})
