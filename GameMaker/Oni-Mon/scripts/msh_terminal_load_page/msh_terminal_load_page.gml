///msh_terminal_load_page(page)
function msh_terminal_load_page(argument0) {
	var leftcol, cols, xx, yy, amp, c, d, xcol, ycol;

	//Cleanup
	ggui_init()
	get_keys()//ggui_init() calls init_keys(), which breaks hold status

	var colsize = 40
	columns_party = 2
	columns_boxsel= 1
	columns_box   = ((VIEW_W*0.70 - 64) div colsize) + 1

	//HACK: defining the menu size with magic numbers
	//Naughty naughty, but this hyper-specific menu isn't gonna be particularly extensible anyway, so eff it.
	ggui_menu_preallocate(columns_party + columns_boxsel + columns_box,max(ceil(PARTYSIZE_MONSTERS_PER_BOXPAGE/columns_box),PARTYSIZE_ACTIVE div 2))

	for(c = menu_w; c >= 0; c--){
		for(d = menu_h; d >= 0; d--){
			cell_amp[c,d] = NONE
		}
	}

	//Left: party
	ggui_frame(0,0,VIEW_W*0.30,VIEW_H,spr_messagebox)
	leftcol = 0
	cols    = columns_party
	for(c = 0; c < PARTYSIZE_ACTIVE; c++){
		xcol = c mod cols
		ycol = c div cols
		xx = ggui_frame_get_coord_x(64*xcol + 24)
		yy = ggui_frame_get_coord_y(64*ycol) + 0.5 - ggui_frame_get_coord_y(64*(PARTYSIZE_ACTIVE div cols)*0.5)
		amp = c + AMP_FIRST_ACTIVE
		if(amp_read_var(amp,amp_MONID) != NONE){
			//Sprite
			var bland = merge_color(c_dkgray,c_white,amp_read_var(amp,amp_HP) > 0)
			var spr = global.monster_data[global.active_monster_party[amp,amp_MONID],mond_SPRITE_BATTLE];
			var ssc = min(64/sprite_get_width(spr),64/sprite_get_height(spr))
			ggui_element_sprite_ext(
				xx + ggui_frame_get_coord_x(ssc*sprite_get_xoffset(spr)),
				yy + ggui_frame_get_coord_y(ssc*sprite_get_yoffset(spr)),
				spr,0,ssc,ssc,bland,1)
			if(global.active_monster_party[amp,amp_HELDITEM] != NONE){
				ggui_element_sprite(xx + ggui_frame_get_coord_x(56),yy + ggui_frame_get_coord_y(56),spr_helditemicon,0)
			}
		}
	
		ggui_menu_region(leftcol + xcol,ycol,mev_terminal_interact,xx,yy,xx + ggui_frame_get_coord_x(64),yy + ggui_frame_get_coord_y(64))
		cell_amp[leftcol + xcol,ycol] = amp
	}
	ggui_element_text_settings(font_mainmsg,c_black,1,0)
	ggui_element_text(0.5,0.1,"Party")

	//Middle top: Box Selector
	ggui_frame(VIEW_W*0.30,0,VIEW_W*0.70,VIEW_H*0.15,spr_messagebox)
	ggui_element_text_settings(font_mainmsg,c_black,1,1)
	ggui_element_text(0.5,0.5,tsprintf("<  %  >",global.monster_box_name[argument0]))
	ggui_menu_region(columns_party,0,NONE,0.05,0.25,0.95,0.75)

	//Middle main: Box contents
	leftcol = columns_party + columns_boxsel
	cols	= columns_box
	ggui_frame(VIEW_W*0.30,VIEW_H*0.15,VIEW_W*0.70,VIEW_H*0.50,spr_messagebox)
	for(c = 0; c < PARTYSIZE_MONSTERS_PER_BOXPAGE; c++){
		amp = AMP_FIRST_BOX + argument0*PARTYSIZE_MONSTERS_PER_BOXPAGE + c;
		xcol = c mod cols
		ycol = c div cols
		xx  = ggui_frame_get_coord_x(16 + xcol*colsize)
		yy  = ggui_frame_get_coord_y(16 + (ycol)*32)
	
	
		if(amp_read_var(amp,amp_MONID) != NONE){
			//Sprite
			var bland = merge_color(c_dkgray,c_white,amp_read_var(amp,amp_HP) > 0)
			var spr = global.monster_data[global.active_monster_party[amp,amp_MONID],mond_SPRITE_BATTLE];
			var ssc = min(32/sprite_get_width(spr),32/sprite_get_height(spr))
			ggui_element_sprite_ext(
				xx + ggui_frame_get_coord_x(ssc*sprite_get_xoffset(spr)),
				yy + ggui_frame_get_coord_y(ssc*sprite_get_yoffset(spr)),
				spr,0,ssc,ssc,bland,1)
			if(global.active_monster_party[amp,amp_HELDITEM] != NONE){
				ggui_element_sprite_ext(xx + ggui_frame_get_coord_x(24),yy + ggui_frame_get_coord_y(24),spr_helditemicon,0,0.5,0.5,c_white,1)
			}
		}
	
		ggui_menu_region(leftcol + xcol,ycol,mev_terminal_interact,xx,yy,xx + ggui_frame_get_coord_x(32),yy + ggui_frame_get_coord_y(32))
		cell_amp[leftcol + xcol,ycol] = amp
	}

	//Bottom: status
	ggui_frame(VIEW_W*0.30,VIEW_H*0.65,VIEW_W*0.70,VIEW_H*0.35,spr_messagebox)
	frame_statuswindow = ggui_frames - 1


}
