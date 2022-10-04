///msh_spawn_inventory(mev_selectitem)
function msh_spawn_inventory(argument0) {
	//Spawns an inventory list with multiple tabs for different item categories.
	//Can be assigned different menu-events on item selection depending on when the item is being used.
	my_itemcategories[0] = itemtype_CONSUMABLE;		my_itemcatname[0] = "Healing"
	my_itemcategories[1] = itemtype_CATCH;			my_itemcatname[1] = "Monster Stones"
	my_itemcategories[2] = itemtype_HELD;			my_itemcatname[2] = "Equipment"
	my_itemcategories[3] = itemtype_MOVETEACHER;	my_itemcatname[3] = "Books"
	my_itemcategories[4] = itemtype_KEY;			my_itemcatname[4] = "Key Items"
	my_itemlist_event	 = argument0
	my_itemcategories_max   = 4
	my_current_itemcategory = 0

	script_step = msh_inventory_page_control

	msh_spawn_inventory_fill_list_category(my_itemcategories[0],my_itemlist_event)


}
