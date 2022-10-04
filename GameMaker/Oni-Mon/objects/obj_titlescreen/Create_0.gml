/// @description Spawn menu
with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
	ggui_frame(VIEW_W*0.35,VIEW_H*0.7,VIEW_W*0.3,VIEW_H*0.28,spr_messagebox)
	ggui_menu_preallocate(1,3)
	ggui_element_text_settings(font_mainmsg,c_white,0,0)
	ggui_menu_add_option_text(mev_title_newgame,	"New Game",	"")
	ggui_menu_add_option_text(mev_title_continue,	"Continue",	"")
	ggui_menu_add_option_text(mev_title_quit,		"Quit",		"")
	menu_can_destroy = false
	
	//Start at "CONTINUE" if there's any savefiles
	if(file_exists(filenameify_savefile(0))){
		menuvalue_y = 1
	}
}

bgm(bgm_titlescreen)