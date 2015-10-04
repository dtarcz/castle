minetest.register_node("castle:autocraft", {
	tiles = { -- Thanks to Eld's workbench texture
		"castle_autocrafter_top.png", "default_wood.png",
		"castle_autocrafter_side1.png", "castle_autocrafter_side1.png",
		"castle_autocrafter_side2.png", "castle_autocrafter_side2.png"
	},
	description = "Automatic Crafting Table",
	groups = {choppy = 1, oddly_breakable_by_hand = 2},
	paramtype = "light",
	paramtype2 = "facedir",

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size("craft", 9)
		inv:set_size("in", 6 * 4) -- was 8 * 3

		meta:set_string("formspec",
--[[
				 "size[8,11]"
				..default.gui_bg..default.gui_bg_img..default.gui_slots
				.."list[context;craft;2.5,0;3,3]"
				.."list[context;in;0,3.5;8,3]"
				.."list[current_player;main;0,7;8,4]"
				.."label[0,0;AUTOCRAFTER]"
				.."label[0.5,1.2;Recipe ->]"
				.."label[0,3;Materials:")
--]]
				 "size[10,9]"
				..default.gui_bg..default.gui_bg_img..default.gui_slots
				.."list[context;craft;7,0.5;3,3]"
				.."list[context;in;0,0.5;6,4]"
				.."list[current_player;main;1,5;8,4]"
			.."listring[]"
				.."label[7,0;Recipe:]"
				.."label[0,0;Materials:")

	end,

	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("in") and inv:is_empty("craft")
	end,

	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		if minetest.is_protected(pos, player:get_player_name()) then
			return 0
		end
		return stack:get_count()
	end,
})

minetest.register_craft({
	output = "castle:autocraft",
	recipe = {
		{"default:steel_ingot","default:steel_ingot","default:steel_ingot"},
		{"group:wood", "group:wood","default:steel_ingot"},
		{"group:tree", "group:tree","default:steel_ingot"},
	}
})

minetest.register_abm({
	nodenames = {"castle:autocraft"},
	interval = 5,
	chance = 1,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local inventory = meta:get_inventory()
		local recipe = inventory:get_list("craft")
		local result
		local new

		for i = 1, 9 do
			recipe[i] = ItemStack({
				name = recipe[i]:get_name(),
				count = 1
			})
		end

		result, new = minetest.get_craft_result({
			method = "normal",
			width = 3,
			items = recipe
		})

		if result.item:is_empty() then return end
		result = result.item

		local input = inventory:get_list("in")
		if not inventory:room_for_item("in", result) then return end

		local to_use = {}
		for _,item in ipairs(recipe) do
			if item ~= nil and not item:is_empty() then
				if to_use[item:get_name()] == nil then
					to_use[item:get_name()] = 1
				else
					to_use[item:get_name()] = to_use[item:get_name()] + 1
				end
			end
		end

		local stack
		for itemname, number in pairs(to_use) do
			stack = ItemStack({
				name = itemname,
				count = number
			})
			if not inventory:contains_item("in", stack) then
				return
			end
		end

		for itemname, number in pairs(to_use) do
			stack = ItemStack({
				name = itemname,
				count = number
			})
			inventory:remove_item("in", stack)
		end

		inventory:add_item("in", result)

		for i = 1, 9 do
			inventory:add_item("in", new.items[i])
		end
	end,
})