///msh_spawn_inventory_fill_list_category(category,mev)
function msh_spawn_inventory_fill_list_category(argument0, argument1) {
	//Helper for msh_spawn_inventory, that creates an item list (resizing the menu contents to match) using the items of that category.
	//Adds a "cancel" node at the end of the list so it physically can't be empty.
	var c;
	//First, get the items
	var tlist = ds_list_create(), qlist = ds_list_create();
	for(c = 0; c < global.inventory_items; c++){
		var it = global.inventory_item[c];
		if(it != NONE && global.inventory_qty[c] > 0){
			if(global.item_data[it,id_ITEMTYPE] == argument0){
				ds_list_add(tlist,it)
				ds_list_add(qlist,global.inventory_qty[c])
			}
		}
	}

	//Second, build the list
	var mensz = 7;
	ggui_init()
	get_keys()//ggui_init() will reset key status, so we need to refresh it
	ggui_frame(0,VIEW_H*0.15,VIEW_W,VIEW_H*0.70,spr_messagebox)
	ggui_menu_preallocate(1,ds_list_size(tlist) + 1)
	ggui_frame_set_scrolling(false,true,1,mensz,false,true)

	var hh = ggui_frame_get_coord_y((VIEW_H*0.8)/mensz) - ggui_frame_get_coord_y(16)
	for(c = 0; c < mensz; c++){
		var yy = lerp(0.1,0.9,c/mensz);
		ggui_element_text_settings(font_mainmsg,c_black,0,0)
		ggui_element_arbtext_scrollable(0.1,yy + ggui_frame_get_coord_y(4),0,c,0)
		ggui_element_text_settings(font_mainmsg,c_black,2,0)
		ggui_element_arbtext_scrollable(0.9,yy + ggui_frame_get_coord_y(4),0,c,2)
	}

	//Second-and-a-halfth, fill the list with data
	var mev;
	for(c = 0; c < ds_list_size(tlist) + 1; c++){
		var yy = lerp(0.1,0.9,c/mensz);
		if(c >= ds_list_size(tlist)){
			mev = mev_cancel
			ggui_fill_arbtext(0,c,0,"Cancel")
			ggui_fill_arbtext(0,c,2,"")
			ggui_fill_meta(0,c,NONE,NONE,"","Closes this menu.")
		}
		else{
			mev = argument1
			draw_set_font(font_n)//Needed for string_wrap()
			ggui_fill_arbtext(0,c,0,					global.item_data[tlist[| c],id_NAME])
			ggui_fill_arbtext(0,c,2,"x" +	string(						 qlist[| c]))
			ggui_fill_meta(0,c,NONE,NONE,"",string_wrap(global.item_data[tlist[| c],id_DESC],VIEW_W*0.8))
		}
		ggui_menu_region(0,c,mev,0.05,yy,0.95,yy + hh)
	
		my_item_id[c] = tlist[| c]
		my_item_qty[c]= qlist[| c]
	}

	//Finally, add a description box at the bottom
	ggui_frame(0,VIEW_H*0.85,VIEW_W,VIEW_H*0.15,spr_messagebox)
	ggui_element_text_settings(font_n,c_black,0,0)
	ggui_element_desc_current(0.1,0.2)

	//Also another at the top
	ggui_frame(0,0,VIEW_W,VIEW_H*0.15,spr_messagebox)
	ggui_element_text_settings(font_mainmsg,c_black,1,1)
	ggui_element_text(0.5,0.5,"< " + my_itemcatname[my_current_itemcategory] + " >")

	//Done, clear the data!
	ds_list_destroy(tlist)
	ds_list_destroy(qlist)


}
