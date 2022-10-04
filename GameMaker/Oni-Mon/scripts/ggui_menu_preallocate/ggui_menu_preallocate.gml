///ggui_menu_preallocate(w,h)
function ggui_menu_preallocate(argument0, argument1) {
	//Preallocates event array for a menu. Sets whether it's horizontal and/or vertical based on its sizes.
	menu_w = argument0;
	menu_h = argument1;
	for(var c = menu_w - 1;c >= 0;c--){
	    for(var d = menu_h - 1; d >= 0;d--){
	        menu_event [c,d] = NONE;
	        menu_frame [c,d] = NONE;
	        menu_reg_l [c,d] = 0;
	        menu_reg_r [c,d] = 0;
	        menu_reg_t [c,d] = 0;
	        menu_reg_b [c,d] = 0;
	        menu_sprite[c,d] = NONE;
	        menu_image [c,d] = 0;
	        menu_text  [c,d] = "";
	        menu_desc  [c,d] = "";
	        menu_arbtxt[0,c + d*menu_w] = "";
	    }
	}
	menu_horizontal = menu_w > 1;
	menu_vertical   = menu_h > 1;



}
