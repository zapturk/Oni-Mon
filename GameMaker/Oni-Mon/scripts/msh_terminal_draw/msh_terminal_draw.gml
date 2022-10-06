///msh_terminal_draw()
function msh_terminal_draw() {

	//Draw menu
	ggui_draw()

	//Draw the terminal info
	var monamp = cell_amp[menuvalue_x,menuvalue_y];
	if(monamp != NONE){
		var monmon = amp_read_var(monamp,amp_MONID)
		if(monmon != NONE){
			//Only do stuff if data exists at this point AND isn't empty
			var		ll = ggui_frame_l[frame_statuswindow],
					tt = ggui_frame_t[frame_statuswindow];
			var		rr = ggui_frame_w[frame_statuswindow] + ll,
					bb = ggui_frame_h[frame_statuswindow] + tt,
					xx, yy;
			xx = lerp(ll,rr,0.1)
			yy = lerp(tt,bb,0.1)
			draw_font_settings(font_mainmsg,c_black,0,0)
			draw_text(xx,yy,amp_get_monster_name(monamp))
	
			var spr = global.monster_data[monmon,mond_SPRITE_BATTLE];
			var ssc = min(96/sprite_get_width(spr),(bb-tt-28)/sprite_get_height(spr))
			draw_sprite_ext(spr,0,ll + 48,bb-8,ssc,ssc,0,c_white,1)
	
			xx = lerp(ll,rr,0.20)
			yy = tt + 40
			draw_font_settings(font_nfat,c_black,0,0)
			draw_text(xx,   yy,tsprintf("Level %\n\nMHP: %\nATK: %\nDEF: %",	amp_read_var(monamp,amp_LEVEL),monster_get_mhp(monamp),monster_get_atk(monamp),monster_get_def(monamp)))
			draw_text(xx+64,yy,tsprintf("\n\nMAG: %\nRES: %\nSPD: %",		monster_get_mag(monamp),monster_get_res(monamp),monster_get_spd(monamp)))
	
			yy = tt + 24
			xx = lerp(ll,rr,0.5)
			draw_font_settings(font_mainmsg,c_black,0,0)
			for(var c = 0; c < MONSTER_MAX_NUMBER_OF_MOVES; c++){
				var mv = amp_read_var(monamp,AMP_FIRST_MOVE + c)
				if(mv != NONE){
					draw_text(xx,yy,string_repeat("\n",c) + global.move_data[mv,mvd_NAME])
				}
			}
		}
	}

	//Draw grabby hand
	if(grabbing){
		var monid = amp_read_var(AMP_CLIPBOARD,amp_MONID);
		if(monid != NONE){
			var spr = global.monster_data[monid,mond_SPRITE_BATTLE];
			if(spr >= 0){
				var ssc = min(32/sprite_get_width(spr),32/sprite_get_height(spr))
				draw_sprite_ext(spr,0,dghx,dghy+28,ssc,ssc,0,c_white,1)
			}
		}
	}
	draw_sprite(spr_terminalgrabbyhand,grabbing,dghx,dghy + 8)


}
