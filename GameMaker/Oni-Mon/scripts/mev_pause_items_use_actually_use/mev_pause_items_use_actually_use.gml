///mev_pause_items_use_actually_use()
function mev_pause_items_use_actually_use() {
	var mon = AMP_FIRST_ACTIVE + menuvalue_y;
	script_execute(global.item_data[my_item,id_USESCRIPT],mon,global.item_data[my_item,id_USEARG])
	//Note that the item-use script is responsible for consuming the item! (So it can opt not to if the item cannot be used currently)

	with(daddy.daddy){
		var pmv = menuvalue_y;
		msh_spawn_inventory_fill_list_category(my_itemcategories[my_current_itemcategory],my_itemlist_event)
		menuvalue_y = clamp(pmv,0,menu_h - 1)
	}
	instance_destroy(daddy)
	instance_destroy()


}
