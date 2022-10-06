///mev_pause_items_select()
function mev_pause_items_select() {
	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
		my_item = other.my_item_id[other.menuvalue_y]
		daddy   = other.id
		ggui_frame(VIEW_W*0.25,other.ggui_frame_t[0] + lerp(0,other.ggui_frame_h[0],(other.menuvalue_y-other.drawmenuy)/other.menu_scrollysz),VIEW_W*0.35,110,spr_messagebox)
		ggui_menu_preallocate(1,3)
		ggui_element_text_settings(font_mainmsg,c_black,0,0)
		ggui_menu_add_option_text(mev_pause_items_use,		"Use",			"")
		ggui_menu_add_option_text(mev_pause_items_discard,	"Throw Away",	"")
		ggui_menu_add_option_text(mev_pause_items_hold,		"Hold",			"")
	}


}
