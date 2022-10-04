///mev_pause_save()
function mev_pause_save() {
	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
		ggui_frame(VIEW_W*0.35,VIEW_H*0.5 - 32,VIEW_W*0.45,VIEW_H*0.5 + 32,spr_messagebox)
		ggui_menu_preallocate(1,3)
		ggui_element_text_settings(font_mainmsg,c_white,0,0)
		ggui_menu_add_option_text(mev_pause_save_and_continue,	"Save and Continue",	"")
		ggui_menu_add_option_text(mev_pause_save_and_quit,		"Save and Quit",		"")
		ggui_menu_add_option_text(mev_cancel,					"Cancel",				"")
	
	}


}
