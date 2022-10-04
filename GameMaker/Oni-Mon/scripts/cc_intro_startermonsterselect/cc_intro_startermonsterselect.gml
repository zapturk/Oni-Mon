///cc_intro_startermonsterselect()
function cc_intro_startermonsterselect() {
	var mon, mons, xx, ww;
	mons = 3
	mon[0] = monster_DRACHNID
	mon[1] = monster_DRAQUATIC
	mon[2] = monster_PLAUGSPOUT

	ww = 1/mons
	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
		ggui_frame(VIEW_W*0.1,VIEW_W*0.35,VIEW_W*0.8,VIEW_H*0.25,NONE)//Yeah, we can do invisible frames!
		ggui_menu_preallocate(mons,1)
		ggui_element_text_settings(font_mainmsg,c_white,1,0)
		for(var c = 0; c < mons; c++){
			my_monster[c] = mon[c]
			xx = (c + 0.5)*ww
		
			ggui_element_sprite(xx,1.00,global.monster_data[mon[c],mond_SPRITE_BATTLE],0)
			ggui_element_text(  xx,1.05,global.monster_data[mon[c],mond_NAME])
			ggui_menu_region(c,0,mev_intro_starterselect,xx - 0.5*ww,1 - ggui_frame_get_coord_y(128),xx + 0.5*ww,1)
		}
		menu_can_destroy = false
	}


}
