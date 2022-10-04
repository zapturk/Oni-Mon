///mev_pause_items_discard_actually_discard()
function mev_pause_items_discard_actually_discard() {
	inventory_lose_item(my_item,menuvalue_x)
	message_spawn(tsprintf("Threw away the % %%.",menuvalue_x,global.item_data[my_item,id_NAME],string_repeat("s",menuvalue_x > 1)))
	//Rebuild original menu
	with(daddy.daddy){
		//msh_spawn_inventory(mev_pause_items_select)
		bmv = menuvalue_y
		msh_spawn_inventory_fill_list_category(my_itemcategories[my_current_itemcategory],my_itemlist_event)
		menuvalue_y = clamp(bmv,0,menu_h-1)
	}
	//Remove the two menues prior
	instance_destroy(daddy)
	instance_destroy()



}
