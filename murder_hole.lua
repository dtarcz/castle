local hole_types = {
	{"cobble", "Cobble", "default_cobble", "default:cobble"},
	{"stonewall", "Stonewall", "castle_stonewall", "castle:stonewall"},
	{"stonebrick", "Stonebrick", "default_stone_brick", "default:stonebrick"},
	{"sandstonebrick", "Sandstone Brick", "default_sandstone_brick", "default:sandstonebrick"},
	{"desertstonebrick", "Desert Stone Brick", "default_desert_stone_brick", "default:desert_stonebrick"},
	{"stone", "Stone", "default_stone", "default:stone"},
	{"sandstone", "Sandstone", "default_sandstone", "default:sandstone"},
	{"desertstone", "Desert Stone", "default_desert_stone", "default:desert_stone"},
	{"dungeonstone", "Dungeon Stone", "castle_dungeon_stone", "castle:dungeon_stone"},
}

local grp = {cracky=3}

for _, row in ipairs(hole_types) do

	minetest.register_node("castle:hole_"..row[1], {
		drawtype = "nodebox",
		description = row[2].." Murder Hole",
		tiles = {row[3]..".png"},
		groups = grp,
		sounds = default.node_sound_defaults(),
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
				fixed = {
					{-8/16,-8/16,-8/16,-4/16,8/16,8/16}, 
					{4/16,-8/16,-8/16,8/16,8/16,8/16}, 
					{-4/16,-8/16,-8/16,4/16,8/16,-4/16}, 
					{-4/16,-8/16,8/16,4/16,8/16,4/16}, 
				},
			},
	})

	minetest.register_craft({
		output = "castle:hole_"..row[1].." 4",
		recipe = {
		{"",row[4], "" },
		{row[4],"", row[4]},
		{"",row[4], ""} },
	})

	grp = {cracky=3, not_in_craft_guide=1}
end
