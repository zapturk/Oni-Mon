///mev_monster_learnmove_spawnmenu()
function mev_monster_learnmove_spawnmenu() {
	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
		my_monster = other.my_monster
		my_newmove = other.my_newmove
		menu_can_destroy = false//Don't allow accidentally cancelling out of it
		ggui_frame(VIEW_W*0.25,VIEW_H*0.4,VIEW_W*0.5,VIEW_H*0.45,spr_messagebox)
		ggui_menu_preallocate(1,MONSTER_MAX_NUMBER_OF_MOVES + 1)
		ggui_frame_set_scrolling(false,false,1,MONSTER_MAX_NUMBER_OF_MOVES + 1,false,true)
	
		ggui_element_text_settings(font_mainmsg,c_black,0,0)
		draw_set_font(font_n)//To wrap the description with string_wrap
		for(var c = 0;c < MONSTER_MAX_NUMBER_OF_MOVES;c++){
			//HACK: Since this menu only is spawned when the monster has a full set of moves, I'll just assume every slot has a valid move.
			ggui_menu_add_option_text(
				mev_monster_learnmove_confirm,
				global.move_data[global.active_monster_party[my_monster,amp_MOVE1 + c],mvd_NAME],
				string_wrap(global.move_data[global.active_monster_party[my_monster,amp_MOVE1 + c],mvd_DESC],VIEW_W*0.8-32)
			)
		}
		ggui_element_text_settings(font_mainmsg,c_gray,0,0)
		ggui_menu_add_option_text(
			mev_monster_learnmove_cancel,
			global.move_data[my_newmove,mvd_NAME],
			string_wrap(global.move_data[my_newmove,mvd_DESC],VIEW_W*0.8-32)
		)
	
		ggui_frame(VIEW_W*0.10,VIEW_H*0.85,VIEW_W*0.8,VIEW_H*0.15,spr_messagebox)
		ggui_element_text_settings(font_n,c_black,0,0)
		ggui_element_desc_current(0.025,0.2)
	}


}
