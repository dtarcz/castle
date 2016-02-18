local pillar_types = {
	{"cobble", "Cobble", "default_cobble", "default:cobble"},
	{"stonewall", "Stonewall", "castle_stonewall", "castle:stonewall"},
	{"stonebrick", "Stonebrick", "default_stone_brick", "default:stonebrick"},
	{"sandstonebrick", "Sandstone Brick", "default_sandstone_brick", "default:sandstonebrick"},
	{"desertstonebrick", "Desert Stone Brick", "default_desert_stone_brick", "default:desert_stonebrick"},
	{"stone", "Stone", "default_stone", "default:stone"},
	{"sandstone", "Sandstone", "default_sandstone", "default:sandstone"},
	{"desertstone", "Desert Stone", "default_desert_stone", "default:desert_stone"},
	{"dungeonstone", "Dungeon Stone", "castle_dungeon_stone", "castle:dungeon_stone"},
	{"obsidianbrick", "Obsidian Brick", "default_obsidian_brick", "default:obsidianbrick"},
	{"mushroomtrunk", "Mushroom Trunk", "mushroom_trunk", "ethereal:mushroom_trunk"},
}

local grp = {cracky=3}

for _, row in pairs(pillar_types) do

	minetest.register_node("castle:pillars_"..row[1].."_bottom", {
		drawtype = "nodebox",
		description = row[2].." Pillar Base",
		tiles = {row[3]..".png"},
		groups = grp, -- {cracky=3},
		sounds = default.node_sound_defaults(),
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.500000,-0.500000,-0.500000,0.500000,-0.375000,0.500000},
				{-0.375000,-0.375000,-0.375000,0.375000,-0.125000,0.375000},
				{-0.250000,-0.125000,-0.250000,0.250000,0.500000,0.250000}, 
			},
		},
	})

	minetest.register_craft({
		output = "castle:pillars_"..row[1].."_bottom 4",
		recipe = {
		{"",row[4],""},
		{"",row[4],""},
		{row[4],row[4],row[4]} },
	})

	minetest.register_node("castle:pillars_"..row[1].."_top", {
		drawtype = "nodebox",
		description = row[2].." Pillar Top",
		tiles = {row[3]..".png"},
		groups = grp,
		sounds = default.node_sound_defaults(),
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.500000,0.312500,-0.500000,0.500000,0.500000,0.500000}, 
				{-0.375000,0.062500,-0.375000,0.375000,0.312500,0.375000}, 
				{-0.250000,-0.500000,-0.250000,0.250000,0.062500,0.250000},
			},
		},
	})

	minetest.register_craft({
		output = "castle:pillars_"..row[1].."_top 4",
		recipe = {
		{row[4],row[4],row[4]},
		{"",row[4],""},
		{"",row[4],""} },
	})

	minetest.register_node("castle:pillars_"..row[1].."_middle", {
		drawtype = "nodebox",
		description = row[2].." Pillar Middle",
		tiles = {row[3]..".png"},
		groups = grp,
		sounds = default.node_sound_defaults(),
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.250000,-0.500000,-0.250000,0.250000,0.500000,0.250000},
			},
		},
	})

	minetest.register_craft({
		output = "castle:pillars_"..row[1].."_middle 4",
		recipe = {
		{row[4],row[4]},
		{row[4],row[4]},
		{row[4],row[4]} },
	})

	grp = {cracky=3, not_in_craft_guide=1}
end
