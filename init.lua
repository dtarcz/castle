dofile(minetest.get_modpath("castle").."/pillars.lua")
dofile(minetest.get_modpath("castle").."/arrowslit.lua")
dofile(minetest.get_modpath("castle").."/tapestry.lua")
dofile(minetest.get_modpath("castle").."/town_item.lua")
dofile(minetest.get_modpath("castle").."/shields_decor.lua")
dofile(minetest.get_modpath("castle").."/murder_hole.lua")
--dofile(minetest.get_modpath("castle").."/orbs.lua")
dofile(minetest.get_modpath("castle").."/rope.lua")
dofile(minetest.get_modpath("castle").."/autocraft.lua") -- from buildcraft

minetest.register_node("castle:stonewall", {
	description = "Castle Wall",
	drawtype = "normal",
	tiles = {"castle_stonewall.png"},
	paramtype = "light",
	drop = "castle:stonewall",
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("castle:rubble", {
	description = "Castle Rubble",
	drawtype = "normal",
	tiles = {"castle_rubble.png"},
	paramtype = "light",
	groups = {crumbly=3,falling_node=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "castle:stonewall",
	recipe = {
		{"default:cobble"},
		{"default:desert_stone"},
	}
})

minetest.register_craft({
	output = "castle:rubble",
	recipe = {
		{"castle:stonewall"},
	}
})

minetest.register_craft({
	output = "castle:rubble 2",
	recipe = {
		{"default:gravel"},
		{"default:desert_stone"},
	}
})

minetest.register_node("castle:stonewall_corner", {
	drawtype = "normal",
	paramtype = "light",
	paramtype2 = "facedir",
	description = "Castle Corner",
	tiles = {"castle_stonewall.png",
			"castle_stonewall.png",
			"castle_corner_stonewall1.png",
			"castle_stonewall.png",
			"castle_stonewall.png",
			"castle_corner_stonewall2.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "castle:stonewall_corner",
	recipe = {
		{"", "castle:stonewall"},
		{"castle:stonewall", "default:sandstone"},
	}
})

minetest.register_node("castle:roofslate", {
	drawtype = "raillike",
	description = "Roof Slates",
	inventory_image = "castle_slate.png",
	paramtype = "light",
	walkable = false,
	tiles = {'castle_slate.png'},
	climbable = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	groups = {cracky=3,attached_node=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("castle:hides", {
	drawtype = "signlike",
	description = "Hides",
	inventory_image = "castle_hide.png",
	paramtype = "light",
	walkable = false,
	tiles = {'castle_hide.png'},
	climbable = false,
	paramtype2 = "wallmounted",
	legacy_wallmounted = true,
	groups = {dig_immediate=2},
	selection_box = {
		type = "wallmounted",
	},
})

minetest.register_craft( {
	type = "shapeless",
	output = "castle:hides 6",
	recipe = { "wool:white" , "bucket:bucket_water" },
	replacements = {
		{'bucket:bucket_water', 'bucket:bucket_empty'}
	}
})

minetest.register_craft({
	type = "cooking",
	output = "castle:roofslate",
	recipe = "default:gravel",
})
--[[
doors.register_door("castle:oak_door", {
	description = "Oak Door",
	inventory_image = "castle_oak_door_inv.png",
	groups = {choppy=2,door=1},
	tiles_bottom = {"castle_oak_door_bottom.png", "door_oak.png"},
	tiles_top = {"castle_oak_door_top.png", "door_oak.png"},
	only_placer_can_open = true,
	sounds = default.node_sound_wood_defaults(),
	sunlight = false,
})

minetest.register_craft({
	output = "castle:oak_door",
	recipe = {
		{"group:tree", "group:tree"},
		{"group:tree", "group:tree"},
		{"group:tree", "group:tree"}
	}
})
]]

doors.register("door_oak", {
		tiles = {{ name = "doors_door_oak.png", backface_culling = true }},
		description = "Oak Door",
		inventory_image = "doors_item_oak.png",
		protected = true,
		groups = { door = 1, choppy = 2, flammable = 2 },
		material = "default:tree",
})

function default.get_ironbound_chest_formspec(pos)
	local spos = pos.x .. "," .. pos.y .. "," ..pos.z
	local formspec =
		"size[8,9]"
		.. default.gui_bg..default.gui_bg_img..default.gui_slots
		.. "list[nodemeta:".. spos .. ";main;0,0;8,4;]"
		.. "list[current_player;main;0,5;8,4;]"
		.. "listring[nodemeta:" .. spos .. ";main]"
		.. "listring[current_player;main]"
	return formspec
end

local function has_ironbound_chest_privilege(meta, player)
	if player:get_player_name() ~= meta:get_string("owner") then
		return false
	end
	return true
end

minetest.register_node("castle:ironbound_chest",{
	drawtype = "nodebox",
	description = "Ironbound Chest",
	tiles = {"castle_ironbound_chest_top.png",
		"castle_ironbound_chest_top.png",
		"castle_ironbound_chest_side.png",
		"castle_ironbound_chest_side.png",
		"castle_ironbound_chest_back.png",
		"castle_ironbound_chest_front.png",
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.500000,-0.312500,0.500000,-0.062500,0.312500},
			{-0.500000,-0.062500,-0.250000,0.500000,0.000000,0.250000}, 
			{-0.500000,0.000000,-0.187500,0.500000,0.062500,0.187500},
			{-0.500000,0.062500,-0.062500,0.500000,0.125000,0.062500}, 
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.500000,-0.400000,0.5,0.200000,0.4},

		},
	},
	sounds = default.node_sound_wood_defaults(),
	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "Ironbound Chest (owned by "..
		meta:get_string("owner")..")")
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Ironbound Chest")
		meta:set_string("owner", "")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main") and has_ironbound_chest_privilege(meta, player)
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		if not has_ironbound_chest_privilege(meta, player) then
			minetest.log("action", player:get_player_name()..
				" tried to access a locked chest belonging to "..
				meta:get_string("owner").." at "..
				minetest.pos_to_string(pos))
			return 0
		end
		return count
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not has_ironbound_chest_privilege(meta, player) then
			minetest.log("action", player:get_player_name()..
				" tried to access a locked chest belonging to "..
				meta:get_string("owner").." at "..
				minetest.pos_to_string(pos))
			return 0
		end
		return stack:get_count()
	end,
	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not has_ironbound_chest_privilege(meta, player) then
			minetest.log("action", player:get_player_name()..
				" tried to access a locked chest belonging to "..
				meta:get_string("owner").." at "..
				minetest.pos_to_string(pos))
			return 0
		end
		return stack:get_count()
	end,

	on_rightclick = function(pos, node, clicker)
		local meta = minetest.get_meta(pos)
		if has_ironbound_chest_privilege(meta, clicker) then
			minetest.show_formspec(
				clicker:get_player_name(),
				"castle:ironbound_chest",
				default.get_ironbound_chest_formspec(pos)
			)
		end
	end,
})

minetest.register_craft({
	output = "castle:ironbound_chest",
	recipe = {
		{"group:wood", "default:steel_ingot","group:wood"},
		{"group:wood", "default:steel_ingot","group:wood"}
	}
})
