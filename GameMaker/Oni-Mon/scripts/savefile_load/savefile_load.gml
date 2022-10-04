///readfile_load(fn)
function savefile_load(argument0) {
	var f = file_text_open_read(argument0);
	file_protection_init()

	global.player_name  = read_string_protected(f)
	global.player_money  = read_real_protected(f)
	for(var c = 0; c < NUMBER_OF_BADGES; c++){
		global.player_badges[c]  = read_real_protected(f)
	}

	for(var c = 0;c < MONSTER_MAX; c++){
		global.monsters_caught[c] = read_real_protected(f)
		global.monsters_seen[c] = read_real_protected(f)
	}
	global.monsters_max_level = read_real_protected(f)
	global.playtime_steps = read_real_protected(f)
	global.monsters_seen_total = read_real_protected(f)
	global.monsters_caught_total = read_real_protected(f)

	//Remembering where you were
	global.load_room = asset_get_index(read_string_protected(f))
	global.load_x = read_real_protected(f)
	global.load_y = read_real_protected(f)

	global.last_saved_shrine_room = asset_get_index(read_string_protected(f))
	global.last_saved_shrine_x = read_real_protected(f)
	global.last_saved_shrine_y = read_real_protected(f)




	//Flags (story)
	for(var c = 0; c < STORYFLAGS_MAX; c++){
		global.storyflags[c] = read_real_protected(f)
	}

	//Flags (auto)
	ds_map_destroy(global.autoflags)
	global.autoflags = ds_map_create()
	var mapsize = read_real_protected(f)
	var k, v;
	repeat(mapsize){
		k = read_string_protected(f)
		v = read_real_protected(f)
		global.autoflags[? k] = v
	}


	//Monsters
	global.selected_monster_box = read_real_protected(f)
	global.total_monster_boxes = read_real_protected(f)
	for(var c = 0; c <= global.total_monster_boxes; c++){
		global.monster_box_name[c] = read_string_protected(f)
	}

	for(var c = PARTYSIZE_ACTIVE + PARTYSIZE_BOXED + PARTYSIZE_MAX_ENEMY; c >= 0; c--){
		for(var d = 0; d < AMP_MAX; d++){
			if(d == amp_NICKNAME){
				global.active_monster_party[c,d] = read_string_protected(f)
			}
			else{
				global.active_monster_party[c,d] = read_real_protected(f)
			}
		}
	}

	//Items
	global.inventory_items = read_real_protected(f)
	for(var c = 0;c < global.inventory_items; c++){
		global.inventory_item[c] = read_real_protected(f)
		global.inventory_qty[c] = read_real_protected(f)
	}


	file_text_close(f)


}
