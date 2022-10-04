///msh_inventory_page_control()
function msh_inventory_page_control() {
	if(k_l && !p_l){
		my_current_itemcategory--
		if(my_current_itemcategory < 0){
			my_current_itemcategory = my_itemcategories_max
		}
		sfx(snd_menu_move)
		msh_spawn_inventory_fill_list_category(my_itemcategories[my_current_itemcategory],my_itemlist_event)
	}

	if(k_r && !p_r){
		my_current_itemcategory++
		if(my_current_itemcategory > my_itemcategories_max){
			my_current_itemcategory = 0
		}
		sfx(snd_menu_move)
		msh_spawn_inventory_fill_list_category(my_itemcategories[my_current_itemcategory],my_itemlist_event)
	}




}
