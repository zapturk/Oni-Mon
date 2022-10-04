///mev_pause_monsters_item_select_give()
function mev_pause_monsters_item_select_give() {
	var my_item = my_item_id[menuvalue_y];
	if(global.item_data[my_item,id_PRICE] <= 0){
		message_spawn("No! It's too important to entrust to a monster!")
	}
	else{
		//It's OK to hold!
		if(global.active_monster_party[my_monster,amp_HELDITEM] != NONE){
			//Get previous item
			inventory_obtain_item(global.active_monster_party[my_monster,amp_HELDITEM],1)
			message_spawn(tsprintf(
				"Took %'s % and gave it the % instead.",
				amp_get_monster_name(my_monster),
				global.item_data[global.active_monster_party[my_monster,amp_HELDITEM],	id_NAME],
				global.item_data[my_item,												id_NAME]))
		}
		else{
			message_spawn(tsprintf(
				"Gave % the %.",
				amp_get_monster_name(my_monster),
				global.item_data[my_item,												id_NAME]))
		}
	
	
		global.active_monster_party[my_monster,amp_HELDITEM] = my_item
		inventory_lose_item(my_item,1)
		//Update display
		with(granddad.daddy){
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
		instance_destroy(granddad)
	}


}
