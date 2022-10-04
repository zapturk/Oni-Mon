///savefile_save(fn)
function savefile_save(argument0) {
	var f = file_text_open_write(argument0);
	file_protection_init()


	save_string_protected(f,global.player_name)
	save_real_protected(f,global.player_money)
	for(var c = 0; c < NUMBER_OF_BADGES; c++){
		save_real_protected(f,global.player_badges[c])
	}

	for(var c = 0;c < MONSTER_MAX; c++){
		save_real_protected(f,global.monsters_caught[c])
		save_real_protected(f,global.monsters_seen[c])
	}
	save_real_protected(f,global.monsters_max_level)
	save_real_protected(f,global.playtime_steps)
	save_real_protected(f,global.monsters_seen_total)
	save_real_protected(f,global.monsters_caught_total)

	//Remembering where you were
	save_string_protected(f,room_get_name(global.load_room))
	save_real_protected(f,global.load_x)
	save_real_protected(f,global.load_y)

	save_string_protected(f,room_get_name(global.last_saved_shrine_room))
	save_real_protected(f,global.last_saved_shrine_x)
	save_real_protected(f,global.last_saved_shrine_y)




	//Flags (story)
	for(var c = 0; c < STORYFLAGS_MAX; c++){
		save_real_protected(f,global.storyflags[c])
	}

	//Flags (auto)
	save_real_protected(f,ds_map_size(global.autoflags))
	var k = ds_map_find_first(global.autoflags);
	while(!is_undefined(k)){
		save_string_protected(f,k)
		var v = global.autoflags[? k];
		if(is_numberical(v)){
			save_real_protected(f,v)
		}
		else{
			show_debug_message(tsprintf("Saving autoflag has non-numerical value. Type of value for key % is %. Will use TRUE in the savefile (so flag counts as set).",k,typeof(v)))
			save_real_protected(f,true)
		}
	
		k=ds_map_find_next(global.autoflags,k)
	}

	//Monsters
	save_real_protected(f,global.selected_monster_box)
	save_real_protected(f,global.total_monster_boxes)
	for(var c = 0; c <= global.total_monster_boxes; c++){
		save_string_protected(f,global.monster_box_name[c])
	}

	for(var c = PARTYSIZE_ACTIVE + PARTYSIZE_BOXED + PARTYSIZE_MAX_ENEMY; c >= 0; c--){
		for(var d = 0; d < AMP_MAX; d++){
			if(d == amp_NICKNAME){
				save_string_protected(f,global.active_monster_party[c,d])
			}
			else{
				save_real_protected(f,global.active_monster_party[c,d])
			}
		}
	}

	//Items
	save_real_protected(f,global.inventory_items)
	for(var c = 0;c < global.inventory_items; c++){
		save_real_protected(f,global.inventory_item[c])
		save_real_protected(f,global.inventory_qty[c])
	}


	file_text_close(f)


}
