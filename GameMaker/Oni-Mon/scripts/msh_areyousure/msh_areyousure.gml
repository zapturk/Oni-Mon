///msh_areyousure(confirm_action,confirm_desc)
function msh_areyousure(argument0, argument1) {
	var n = instance_create_depth(x,y,depth-1,obj_gguimenu);
	with(n){
	    ggui_frame(VIEW_W*0.5 - 130,VIEW_H*0.5 - 40,260,80,spr_messagebox)
	    ggui_menu_preallocate(2,1)
	    ggui_element_text_settings(font_mainmsg,c_white,0,0)
	    ggui_element_text(0.08,0.15,"Are you sure?")
	    ggui_menu_add_option_text_dislocated(argument0,      "Yes",          argument1,             0, 0.5, 0.9, 0.35)
	    ggui_menu_add_option_text_dislocated(mev_cancel,     "No",           "Close this menu.",    0, 0.5, 0.9, 0.35)
	    menuvalue_x = 1
	}
	return n;


}
