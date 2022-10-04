///mev_pause_monsters_item_take()
function mev_pause_monsters_item_take() {
	if(global.active_monster_party[my_monster,amp_HELDITEM] != NONE){
		//Get previous item
		inventory_obtain_item(global.active_monster_party[my_monster,amp_HELDITEM],1)
		message_spawn(tsprintf(
			"Took %'s %.",
			amp_get_monster_name(my_monster),
			global.item_data[global.active_monster_party[my_monster,amp_HELDITEM],	id_NAME]))
		global.active_monster_party[my_monster,amp_HELDITEM] = NONE
		//Update display
		with(daddy.daddy){
			if(object_index == obj_terminalmenu){
				msh_terminal_update()
			}
			else{
				var mv = menuvalue_y
				msh_spawn_monster_list(my_monster_list_menu_event)
				menuvalue_y = mv
			}
		}
		instance_destroy()
		instance_destroy(daddy)
	}
	else{
		message_spawn(tsprintf(
			"% doesn't hold any item.",
			amp_get_monster_name(my_monster)))
	}


}
