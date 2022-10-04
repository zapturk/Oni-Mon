///mev_pause_monsters_status()
function mev_pause_monsters_status() {
	var monsamp = my_monster;
	var monid   = global.active_monster_party[monsamp,amp_MONID]
	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
		ggui_menu_preallocate(1,1)
	
		//Top left frame: sprite
		ggui_frame(0,			0,					VIEW_W*0.35,VIEW_H*0.45,spr_messagebox)
		ggui_element_sprite(0.5,0.9,global.monster_data[monid,mond_SPRITE_BATTLE],0)
	
		//Top right frame: Name, HP, type
		ggui_frame(VIEW_W*0.35,	0,					VIEW_W*0.65,VIEW_H*0.45,spr_messagebox)
		ggui_element_text_settings(font_mainmsg,c_white,0,0)
		ggui_element_text(0.1,0.1,amp_get_monster_name(monsamp))
		ggui_element_text_settings(font_nfat,c_white,0,0)
		ggui_element_text(0.1,0.25,tsprintf("Lv. % %",amp_read_var(monsamp,amp_LEVEL),global.monster_data[monid,mond_NAME]))
		ggui_element_healthbar(0.1,0.35,0.5,monsamp)
		ggui_element_text_settings(font_mainmsg,c_white,0,0)
		ggui_element_text(0.1,0.6,"Type:")
		if(global.monster_data[monid,mond_TYPE1] != NONE){ggui_element_text(0.5,0.60,global.type_name[global.monster_data[monid,mond_TYPE1]])}
		if(global.monster_data[monid,mond_TYPE2] != NONE){ggui_element_text(0.5,0.75,global.type_name[global.monster_data[monid,mond_TYPE2]])}
		ggui_element_text_settings(font_nfat,c_white,0,0)
		ggui_element_text(0.63,0.25,"EXP:\nNext Lv:")
		ggui_element_text_settings(font_nfat,c_white,2,0)
		ggui_element_text(0.95,0.25,tsprintf("%\n%",amp_read_var(monsamp,amp_EXP),monster_get_next_level_exp(monid,amp_read_var(monsamp,amp_LEVEL)) - amp_read_var(monsamp,amp_EXP) ))
		var item = global.active_monster_party[monsamp,amp_HELDITEM]
		if(item != NONE){
			ggui_element_sprite(0.60 - ggui_frame_get_coord_x(10),0.15,spr_helditemicon,0)
			ggui_element_text_settings(font_nfat,c_white,0,1)
			ggui_element_text(0.60,0.15,global.item_data[item,id_NAME])
		}
	
		if(global.active_monster_party[monsamp,amp_AILMENT] != NONE){
			ggui_element_sprite(0.63,0.45,spr_ailmenticons,global.active_monster_party[monsamp,amp_AILMENT])
			ggui_element_text_settings(font_nfat,c_white,0,0)
			ggui_element_text(0.63+ggui_frame_get_coord_x(18),0.45,global.ailment_name[global.active_monster_party[monsamp,amp_AILMENT]])
		}
	
		//Middle left frame: stats
		ggui_frame(0,			VIEW_H*0.45,		VIEW_W*0.5, VIEW_H*0.55,spr_messagebox)
	
		for(var c = 0; c < STAT_MAX_DATABASE; c++){
			var yy = lerp(0.1,0.9,c/STAT_MAX_DATABASE);
			ggui_element_text_settings(font_mainmsg,c_white,0,0)
			ggui_element_text(0.2,yy,global.stat_name[c])
			ggui_element_text_settings(font_mainmsg,c_white,2,0)
			ggui_element_text(0.8,yy,string(monster_get_stat(monsamp,c)))
		}
	
		//Middle right frame: moves
		ggui_frame(VIEW_W*0.5,	VIEW_H*0.45,		VIEW_W*0.5, VIEW_H*0.55,spr_messagebox)
		for(c = 0; c < MONSTER_MAX_NUMBER_OF_MOVES; c++){
			var yy = lerp(0.1,0.9,(c  )/MONSTER_MAX_NUMBER_OF_MOVES);
			var hh = lerp(0.1,0.9,(c+1)/MONSTER_MAX_NUMBER_OF_MOVES)-yy;
			var mv = amp_read_var(monsamp,amp_MOVE1 + c);
			if(mv != NONE){
				ggui_element_text_settings(font_mainmsg,c_white,0,0)
				ggui_element_text(0.1,yy,global.move_data[mv,mvd_NAME])
				ggui_element_text_settings(font_nfat,c_white,0,0)
				ggui_element_text(0.15,yy + hh*0.5,tsprintf("% (%)",global.type_name[global.move_data[mv,mvd_TYPE]],global.category_name[global.move_data[mv,mvd_CATEGORY]]))
				ggui_element_text(0.65,yy + hh*0.5,tsprintf("MP: % / %",global.active_monster_party[monsamp,amp_MOVE1_MP + c],global.move_data[mv,mvd_MP]))
			}
			else{
				ggui_element_text_settings(font_mainmsg,c_white,0,0)
				ggui_element_text(0.1,yy,"---")
				ggui_element_text_settings(font_nfat,c_white,0,0)
				ggui_element_text(0.35,yy + hh*0.5,"----")
				ggui_element_text(0.65,yy + hh*0.5,"MP: --/--")
			}
		}
	
		ggui_menu_region(0,0,mev_cancel,NONE,NONE,NONE,NONE)
	}


}
