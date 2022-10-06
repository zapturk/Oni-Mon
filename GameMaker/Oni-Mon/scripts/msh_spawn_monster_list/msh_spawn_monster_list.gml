///msh_spawn_monster_list(mev_selectmonster)
function msh_spawn_monster_list(argument0) {
	//Spawns a list showing the entire party's current status (covering the entire screen)
	//All monster notches will be given the indicated menu event, so it can be used for various different menus:
	//use item during battle, switch monsters during battle, use item in the field, get the context menu in the field...
	ggui_frame(0,0,VIEW_W,VIEW_H,spr_messagebox)
	ggui_menu_preallocate(1,PARTYSIZE_ACTIVE)
	var c, xx, yy, ww, hh, mev, mon;
	for(c = 0;c < PARTYSIZE_ACTIVE;c++){
		xx = 0.1
		yy = lerp(0.1,0.9,(c  )/PARTYSIZE_ACTIVE)
		hh = lerp(0.1,0.9,(c+1)/PARTYSIZE_ACTIVE) - yy
		ww = 0.8
		mon= AMP_FIRST_ACTIVE + c;
	
		if(global.active_monster_party[mon,amp_MONID] != NONE){
			//Set up monster's data
			mev = argument0
			//We've got approx 48 pixel's height, use them well
			var bland = merge_color(c_dkgray,c_white,amp_read_var(mon,amp_HP) > 0)
		
			//Sprite
			var spr = global.monster_data[global.active_monster_party[mon,amp_MONID],mond_SPRITE_BATTLE];
			var ssc = min(48/sprite_get_width(spr),48/sprite_get_height(spr))
			ggui_element_sprite_ext(
				xx + ggui_frame_get_coord_x(16 + ssc*sprite_get_xoffset(spr)),
				yy + ggui_frame_get_coord_y(     ssc*sprite_get_yoffset(spr)),
				spr,0,ssc,ssc,bland,1)
			if(global.active_monster_party[mon,amp_HELDITEM] != NONE){
				ggui_element_sprite(xx + ggui_frame_get_coord_x(56),yy + ggui_frame_get_coord_y(40),spr_helditemicon,0)
			}
			
			//Healthbar
			ggui_element_healthbar(xx + ggui_frame_get_coord_x(70),yy + ggui_frame_get_coord_y(20),ww*0.6,mon)
		
			//Name, level
			ggui_element_text_settings(font_mainmsg,c_black,0,0)
			ggui_element_text(xx + ggui_frame_get_coord_x(70),yy,amp_get_monster_name(mon))
			ggui_element_text_settings(font_nfat,c_black,0,0)
			ggui_element_text(xx + 0.65*ww,yy,tsprintf("Lv. %",amp_read_var(mon,amp_LEVEL)))
		
			//Ailment, if any
			if(global.active_monster_party[mon,amp_AILMENT] != NONE){
				var xxx = xx + ggui_frame_get_coord_x(80) + ww*0.6
				ggui_element_sprite(xxx,yy + ggui_frame_get_coord_y(20),spr_ailmenticons,global.active_monster_party[mon,amp_AILMENT])
				ggui_element_text_settings(font_nfat,c_black,0,0)
				ggui_element_text(xxx+ggui_frame_get_coord_x(18),yy + ggui_frame_get_coord_y(20),global.ailment_name[global.active_monster_party[mon,amp_AILMENT]])
			}
		}
		else{
			//Don't add any interaction for empty slots, and clamp menu bottom
			mev = NONE
			menu_h = min(menu_h,c)
		}
	
		ggui_menu_region(0,c,mev,xx,yy,xx + ww,yy + hh)
	}
	my_monster_list_menu_event = argument0


}
