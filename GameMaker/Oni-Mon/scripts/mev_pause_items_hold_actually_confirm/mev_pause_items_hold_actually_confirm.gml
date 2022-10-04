///mev_pause_items_hold_actually_confirm()
function mev_pause_items_hold_actually_confirm() {

	var my_monster = AMP_FIRST_ACTIVE + menuvalue_y;
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

	instance_destroy()
	instance_destroy(daddy)
	with(granddad){
		msh_spawn_inventory_fill_list_category(my_itemcategories[my_current_itemcategory],my_itemlist_event)
	}


}
