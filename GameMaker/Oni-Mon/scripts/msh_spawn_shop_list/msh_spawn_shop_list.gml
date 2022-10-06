///msh_spawn_shop_list(itemsarray,mev)
function msh_spawn_shop_list(argument0, argument1) {
	//Helper for msh_spawn_inventory, that creates an item list (resizing the menu contents to match) using the items of that category.
	//Adds a "cancel" node at the end of the list so it physically can't be empty.
	var c, it;
	var arl = array_length_1d(argument0);

	var mensz = 7;

	ggui_frame(0,0,VIEW_W,VIEW_H*0.70,spr_messagebox)
	ggui_menu_preallocate(1,arl + 1)
	ggui_frame_set_scrolling(false,true,1,mensz,false,true)

	var hh = ggui_frame_get_coord_y((VIEW_H*0.8)/mensz) - ggui_frame_get_coord_y(16)
	for(c = 0; c < mensz; c++){
		var yy = lerp(0.1,0.9,c/mensz);
		ggui_element_text_settings(font_mainmsg,c_black,0,0)
		ggui_element_arbtext_scrollable(0.1,yy + ggui_frame_get_coord_y(4),0,c,0)
		ggui_element_text_settings(font_mainmsg,c_black,2,0)
		ggui_element_arbtext_scrollable(0.9,yy + ggui_frame_get_coord_y(4),0,c,1)
	}

	var mev;
	for(c = 0; c < arl + 1; c++){
		var yy = lerp(0.1,0.9,c/mensz);
		if(c >= arl){
			mev = mev_cancel
			ggui_fill_arbtext(0,c,0,"Cancel")
			ggui_fill_arbtext(0,c,1,"")
			ggui_fill_meta(0,c,NONE,NONE,"","Closes this menu.")
		
			shop_item[c] = NONE
			shop_cost[c] = 0
		}
		else{
			mev = argument1
			it  = argument0[c]
			draw_set_font(font_n)//Needed for string_wrap()
			ggui_fill_arbtext(0,c,0,					global.item_data[it,id_NAME])
			ggui_fill_arbtext(0,c,1,"¤" +	string(		global.item_data[it,id_PRICE]))
			ggui_fill_meta(0,c,NONE,NONE,"",string_wrap(global.item_data[it,id_DESC],VIEW_W*0.8))
		
			shop_item[c] = it
			shop_cost[c] = global.item_data[it,id_PRICE]
		}
		ggui_menu_region(0,c,mev,0.05,yy,0.95,yy + hh)
	}

	//Finally, add a description box at the bottom
	ggui_frame(0,VIEW_H*0.70,VIEW_W,VIEW_H*0.15,spr_messagebox)
	ggui_element_text_settings(font_n,c_black,0,0)
	ggui_element_desc_current(0.1,0.2)

	//Also another at the top
	ggui_frame(0,VIEW_H*0.85,VIEW_W,VIEW_H*0.15,spr_messagebox)
	ggui_element_text_settings(font_mainmsg,c_black,0,1)
	//Memorize money frame so we can overwrite it later (a bit of a hack...)
	my_money_element = ggui_element_text(0.5,0.5,tsprintf("Money: ¤%",global.player_money))
	my_money_frame   = ggui_frames - 1


}
