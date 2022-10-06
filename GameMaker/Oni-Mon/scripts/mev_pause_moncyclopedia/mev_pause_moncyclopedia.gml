function mev_pause_moncyclopedia() {
	//mev_pause_moncyclopedia()
	//Spawn a list of all encountered monsters, with their battle sprite as sprite element and their description in a box
	//Events are inert, you need to use B to cancel.

	//Make sure statistics are up-to-date
	msh_recompute_seencaught()

	//Find max monster
	var maxmon = 0, c;
	for(c = MONSTER_MAX-1; c >= 0; c--){
		if(global.monsters_seen[c]){
			maxmon = c
			break
		}
	}

	with(instance_create_depth(x,y,depth - 1,obj_gguimenu)){
		ggui_menu_preallocate(1,maxmon+1)
	
		//Left pane: monster list (scrollable)
		ggui_frame(0,0,VIEW_W*0.4,VIEW_H,spr_messagebox)
		ggui_frame_set_scrolling(false,true,1,10,false,true)
		var cmax = 10, yy, hh, mev;
		ggui_element_text_settings(font_mainmsg,c_black,0,1)
		for(c = 0;c < cmax;c++){
			mev= c
			yy = lerp(0.05,0.95,c/cmax)
			hh = lerp(0.05,0.95,(c+1)/cmax) - yy
			ggui_element_text_scrollable(0.1,yy+hh*0.5,0,mev)
		
		}
	
		//Add meta data as well, based on how much info the player has about the monster.
		draw_set_font(font_n)//Needed by string_wrap
		for(c = 0; c <= maxmon; c++){
			mev= c
			yy = lerp(0.05,0.95,c/cmax)
			hh = lerp(0.05,0.95,(c+1)/cmax) - yy
			ggui_menu_region(0,mev,NONE,0.05,yy,0.95,yy+hh)
		
			if(global.monsters_caught[c]){
				//Wrap flavor text so it fits the box we add below
				ggui_fill_meta(0,c,global.monster_data[c,mond_SPRITE_BATTLE],0,global.monster_data[c,mond_NAME],string_wrap(global.monster_data[c,mond_DESC],VIEW_W*0.6*0.8))
			}
			else if(global.monsters_seen[c]){
				ggui_fill_meta(0,c,global.monster_data[c,mond_SPRITE_BATTLE],0,global.monster_data[c,mond_NAME],"???")
			}
			else{
				ggui_fill_meta(0,c,spr_unknownmonster,0,"???","???")
			}
		}
	
		//Upper right pane: monster sprite + name
		ggui_frame(VIEW_W*0.4,0,VIEW_W*0.6,VIEW_H*0.5,spr_messagebox)
		ggui_element_sprite_current(0.5,0.8)
		ggui_element_text_settings(font_mainmsg,c_black,1,0)
		ggui_element_text_current(0.5,0.8)
	
		//Lower right pane: flavor text
		ggui_frame(VIEW_W*0.4,VIEW_H*0.5,VIEW_W*0.6,VIEW_H*0.4,spr_messagebox)
		ggui_element_text_settings(font_n,c_black,0,0)
		ggui_element_desc_current(0.1,0.1)
	
		//Lowest right pane: total statistics
		ggui_frame(VIEW_W*0.4,VIEW_H*0.9,VIEW_W*0.6,VIEW_H*0.1,spr_messagebox)
		ggui_element_text_settings(font_nfat,c_black,1,1)
		ggui_element_text(0.5,0.5,tsprintf("Species Witnessed: %          Species Possessed: %",global.monsters_seen_total,global.monsters_caught_total))
	}


}
