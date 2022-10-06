///mev_pause_player()
function mev_pause_player() {

	//Recompute statistics in case they changed
	msh_recompute_seencaught()
	for(var c = AMP_FIRST_ACTIVE; c < AMP_FIRST_ENEMY; c++){
		global.monsters_max_level = max(global.monsters_max_level,global.active_monster_party[c,amp_LEVEL])
	}

	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
		ggui_menu_preallocate(1,1)
	
		//Left frame: sprite
		ggui_frame(0,0,VIEW_W*0.4,VIEW_H,spr_messagebox)
		ggui_element_sprite(0.5,0.8,spr_player_portrait,0)
		ggui_element_text_settings(font_mainmsg,c_black,0,0);
		ggui_element_text(0.1,0.85,global.player_name)
	
		//Upper right frame: data
		ggui_frame(VIEW_W*0.4,0,VIEW_W*0.6,VIEW_H*0.5,spr_messagebox)
		ggui_element_text_settings(font_mainmsg,c_black,0,0); ggui_element_text(0.1,0.10,"Play Time");			ggui_element_text_settings(font_mainmsg,c_black,2,0);	ggui_element_text(0.9,0.10,string_fix_hhmmss(global.playtime_steps))
		ggui_element_text_settings(font_mainmsg,c_black,0,0); ggui_element_text(0.1,0.26,"Money");				ggui_element_text_settings(font_mainmsg,c_black,2,0);	ggui_element_text(0.9,0.26,string(global.player_money) + "¤")
		ggui_element_text_settings(font_mainmsg,c_black,0,0); ggui_element_text(0.1,0.42,"Species Seen");		ggui_element_text_settings(font_mainmsg,c_black,2,0);	ggui_element_text(0.9,0.42,string(global.monsters_seen_total))
		ggui_element_text_settings(font_mainmsg,c_black,0,0); ggui_element_text(0.1,0.58,"Species Caught");		ggui_element_text_settings(font_mainmsg,c_black,2,0);	ggui_element_text(0.9,0.58,string(global.monsters_caught_total))
		ggui_element_text_settings(font_mainmsg,c_black,0,0); ggui_element_text(0.1,0.74,"Max Level");			ggui_element_text_settings(font_mainmsg,c_black,2,0);	ggui_element_text(0.9,0.74,string(global.monsters_max_level))
	
		//Lower right frame: badges lineup
		ggui_frame(VIEW_W*0.4,VIEW_H*0.5,VIEW_W*0.6,VIEW_H*0.5,spr_messagebox)
		ggui_element_text_settings(font_mainmsg,c_black,0,0);
		ggui_element_text(0.1,0.1,"League Emblems")
		for(var c = 0;c < NUMBER_OF_BADGES; c++){
			var hh, vv, xx, yy, col, aph;
			var halfbadges = (NUMBER_OF_BADGES div 2)
			hh = c mod halfbadges
			vv = c div halfbadges
			xx = lerp(0.05,0.95,(hh+0.5)/halfbadges)
			yy = lerp(0.30,0.90,(vv+0.5)/2)
			if(global.player_badges[c]){
				col = c_white
				aph = 1
			}
			else{
				col = c_dkgray
				aph = 0.5
			}
			ggui_element_sprite_ext(xx,yy,spr_guibadges,c,1,1,col,aph)
		}

		ggui_menu_region(0,0,mev_cancel,NONE,NONE,NONE,NONE)
	}


}
