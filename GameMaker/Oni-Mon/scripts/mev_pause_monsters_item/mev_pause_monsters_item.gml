///mev_pause_monsters_item()
function mev_pause_monsters_item() {
	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
		daddy		= other.id
		my_monster	= other.my_monster
		ggui_frame(other.ggui_frame_l[0] + 96,other.ggui_frame_t[0] + 48,128,64,spr_messagebox)
		ggui_menu_preallocate(1,2)
		ggui_element_text_settings(font_mainmsg,c_white,0,0)
		ggui_menu_add_option_text(mev_pause_monsters_item_give,	"Give",	"")
		ggui_menu_add_option_text(mev_pause_monsters_item_take,	"Take",	"")
	}


}
