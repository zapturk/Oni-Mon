///mev_pause_monsters_select()
function mev_pause_monsters_select() {
	with(instance_create_depth(x,y,depth - 1,obj_gguimenu)){
		my_monster = AMP_FIRST_ACTIVE + other.menuvalue_y
		daddy      = other.id
		ggui_frame(VIEW_W*0.25,other.ggui_frame_t[0] + lerp(0,other.ggui_frame_h[0]*0.5,(other.menuvalue_y-other.drawmenuy)/other.menu_h),VIEW_W*0.35,150,spr_messagebox)
		ggui_menu_preallocate(1,4)
		ggui_element_text_settings(font_mainmsg,c_black,0,0)
		ggui_menu_add_option_text(mev_pause_monsters_status,"Status",	"")
		ggui_menu_add_option_text(mev_pause_monsters_switch,"Switch",	"")
		ggui_menu_add_option_text(mev_pause_monsters_item,	"Held Item","")
		ggui_menu_add_option_text(mev_cancel,				"Cancel",	"")
	}


}
