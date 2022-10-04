///mev_battle_mons_select_reinforcement()
function mev_battle_mons_select_reinforcement() {
	with(instance_create_depth(x,y,depth - 1,obj_gguimenu)){
		my_monster = AMP_FIRST_ACTIVE + other.menuvalue_y
		ggui_frame(VIEW_W*0.25,other.ggui_frame_t[0] + lerp(0,other.ggui_frame_h[0]*0.65,(other.menuvalue_y-other.drawmenuy)/other.menu_h),VIEW_W*0.35,110,spr_messagebox)
		ggui_menu_preallocate(1,3)
		ggui_element_text_settings(font_mainmsg,c_white,0,0)
		ggui_menu_add_option_text(mev_battle_mons_switch_reinforcement,		"Send Out",		"")
		ggui_menu_add_option_text(mev_pause_monsters_status,				"Status",		"")
		ggui_menu_add_option_text(mev_cancel,								"Cancel",		"")
	}


}
