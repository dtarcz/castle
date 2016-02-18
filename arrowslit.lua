local arrowslit_types = {
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

for _, row in pairs(arrowslit_types) do

	minetest.register_node("castle:arrowslit_"..row[1], {
		drawtype = "nodebox",
		description = row[2].." Arrowslit",
		tiles = {row[3]..".png"},
		groups = grp,
		sounds = default.node_sound_defaults(),
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
		type = "fixed",
		fixed = {
			{-0.500000,-0.375000,-0.500000,-0.062500,0.375000,-0.312500},
			{0.062500,-0.375000,-0.500000,0.500000,0.375000,-0.312500},
			{-0.500000,0.375000,-0.500000,0.500000,0.500000,-0.312500}, 
			{-0.500000,-0.500000,-0.500000,0.500000,-0.375000,-0.312500}, 
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.500000,-0.500000,-0.500000,0.500000,0.500000,-0.312500},
			},
		},
	})

	minetest.register_craft({
		output = "castle:arrowslit_"..row[1].." 6",
		recipe = {
		{row[4],"", row[4]},
		{row[4],"", row[4]},
		{row[4],"", row[4]} },
	})

	minetest.register_alias("castle:arrowslit_"..row[1].."_cross", "castle:arrowslit_"..row[1])
	minetest.register_alias("castle:arrowslit_"..row[1].."_hole", "castle:arrowslit_"..row[1])

	grp = {cracky=3, not_in_craft_guide=1}

end
