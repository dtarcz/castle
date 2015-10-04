
minetest.register_node("castle:anvil",{
	drawtype = "nodebox",
	description = "Anvil",
	tiles = {"castle_steel.png"},
	groups = {cracky=2,falling_node=1},
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.500000,0.500000,-0.250000,0.500000},
			{-0.187500,-0.500000,-0.375000,0.187500,0.312500,0.375000}, 
			{-0.375000,-0.500000,-0.437500,0.375000,-0.125000,0.437500}, 
			{-0.500000,0.312500,-0.500000,0.500000,0.500000,0.500000}, 
			{-0.375000,0.187500,-0.437500,0.375000,0.425000,0.437500}, 
		},
	},
})

minetest.register_craft({
	output = "castle:anvil",
	recipe = {
		{"default:steel_ingot","default:steel_ingot","default:steel_ingot"},
		{"","default:steel_ingot", ""},
		{"default:steel_ingot", "default:steel_ingot","default:steel_ingot"},
	}
})

minetest.register_node("castle:workbench",{
	description = "Workbench",
	tiles = {"castle_workbench_top.png", "default_wood.png", "castle_workbench_1.png", "castle_workbench_1.png", "castle_workbench_2.png", "castle_workbench_2.png"},
	paramtype2 = "facedir",
	paramtype = "light",
	groups = {oddly_breakable_by_hand=2, flammable=2},
	drawtype = "normal",
	sounds = default.node_sound_wood_defaults(),
	drop = "castle:autocraft",
	on_construct = function ( pos )
		local meta = minetest.get_meta( pos )
		meta:set_string( 'formspec', 'size[10,10;]' ..
			'label[1,0;Source Material]' ..
			'list[context;src;1,1;2,4;]' ..
			'label[4,0;Recipe to Use]' ..
			'list[context;rec;4,1;3,3;]' ..
			'label[7.5,0;Craft Output]' ..
			'list[context;dst;8,1;1,4;]' ..
			'list[current_player;main;1,6;8,4;]' )
		meta:set_string( 'infotext', 'Workbench' )
		local inv = meta:get_inventory()
		inv:set_size( 'src', 2 * 4 )
		inv:set_size( 'rec', 3 * 3 )
		inv:set_size( 'dst', 1 * 4 )
	end,

	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		if minetest.is_protected(pos, player:get_player_name()) then
			return 0
		end
		return stack:get_count()
	end,

	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
})

minetest.register_node("castle:dungeon_stone", {
	description = "Dungeon Stone",
	drawtype = "normal",
	tiles = {"castle_dungeon_stone.png"},
	groups = {cracky=2},
	paramtype = "light",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "castle:dungeon_stone",
	recipe = {"default:stonebrick", "default:obsidian"},
})

minetest.register_node("castle:crate", {
	description = "Crate",
	drawtype = "normal",
	tiles = {"castle_crate_top.png","castle_crate_top.png","castle_crate.png","castle_crate.png","castle_crate.png","castle_crate.png"},
	groups = {choppy=3},
	paramtype = "light",
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"
				.. default.gui_bg..default.gui_bg_img..default.gui_slots
				.. "list[current_name;main;0,1;8,4;]"
				.. "list[current_player;main;0,5;8,4;]"
				.. "listring[]")
		meta:set_string("infotext", "Crate")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*3)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
})

minetest.register_craft({
	output = "castle:crate",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"group:wood", "default:steel_ingot", "group:wood"},
	}
})

-- straw is in default farming mod now, so remove castle straw and set alias'
minetest.register_alias("castle:straw", "farming:straw")
minetest.register_alias("castle:bound_straw", "farming:straw")

minetest.register_node("castle:pavement", {
	description = "Paving Stone",
	drawtype = "normal",
	tiles = {"castle_pavement_brick.png"},
	groups = {cracky=2},
	paramtype = "light",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "castle:pavement 4",
	recipe = {
		{"default:stone", "default:cobble"},
		{"default:cobble", "default:stone"},
	}
})

minetest.register_node("castle:light",{
	drawtype = "glasslike",
	description = "Light Block",
	sunlight_propagates = true,
	light_source = 14,
	tiles = {"castle_street_light.png"},
	inventory_image = "castle_street_light.png",
	groups = {cracky=2},
	paramtype = "light",
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "castle:light",
	recipe = {
		{"default:stick", "default:glass", "default:stick"},
		{"default:glass", "default:torch", "default:glass"},
		{"default:stick", "default:glass", "default:stick"},
	}
})
