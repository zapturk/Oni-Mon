///mev_terminal_interact()
function mev_terminal_interact() {
	if(cell_amp[menuvalue_x,menuvalue_y] == NONE){
		//Nothing here
		sfx(snd_menu_buzzer)
	}
	else{
		var amp = cell_amp[menuvalue_x,menuvalue_y];
		if(grabbing){
			if(amp_read_var(amp,amp_MONID) == NONE){
				//Empty, can just place the monster here.
				for(var c = 0; c < AMP_MAX; c++){
					global.active_monster_party[amp,c] = global.active_monster_party[AMP_CLIPBOARD,c]
				}
				amp_clear_monster(AMP_CLIPBOARD)
				grabbed_original_amp = NONE
				grabbing = false
			
				//If placed in an empty spot in the party, it MIGHT've been placed with a gap to the previous monster.
				//Try to move back as long as there's gaps in the party.
				if(menuvalue_x < columns_party){
					repeat(PARTYSIZE_ACTIVE - 1){
						for(var c = AMP_FIRST_ACTIVE; c < AMP_FIRST_ACTIVE + PARTYSIZE_ACTIVE; c++){
							if(amp_read_var(c,amp_MONID) == NONE){
								//Empty! Must move the others back a notch. 
								for(var d = c; d < AMP_FIRST_ACTIVE + PARTYSIZE_ACTIVE - 1; d++){
									for(var e = 0; e < AMP_MAX; e++){
										global.active_monster_party[d,e] = global.active_monster_party[d+1,e]
									}
								}
								amp_clear_monster(AMP_FIRST_ACTIVE + PARTYSIZE_ACTIVE - 1)
							}
						}
					}
				}
			
				//Update menu
				var pvx = menuvalue_x, pvy = menuvalue_y;
				msh_terminal_load_page(global.selected_monster_box)
				menuvalue_x = pvx
				menuvalue_y = pvy
			}
			else{
				//Not empty, switch places of monsters
				var tmp;
				for(var c = 0; c < AMP_MAX; c++){
					tmp												= global.active_monster_party[amp,c]
					global.active_monster_party[amp,c]				= global.active_monster_party[AMP_CLIPBOARD,c]
					global.active_monster_party[AMP_CLIPBOARD,c]	= tmp
				}
			
				//Update menu
				var pvx = menuvalue_x, pvy = menuvalue_y;
				msh_terminal_load_page(global.selected_monster_box)
				menuvalue_x = pvx
				menuvalue_y = pvy
			}
		}
		else{
			if(amp_read_var(amp,amp_MONID) == NONE){
				//Nothing here to grab
				audio_stop_sound(snd_menu_ok)
				sfx(snd_menu_buzzer)
			}
			else{
				with(instance_create_depth(x,y,depth - 1,obj_gguimenu)){
					my_monster = amp
					daddy      = other.id
					ggui_frame(min(other.ghx,VIEW_W*0.65),min(other.ghy,VIEW_H-150),VIEW_W*0.35,150,spr_messagebox)
					ggui_menu_preallocate(1,4)
					ggui_element_text_settings(font_mainmsg,c_black,0,0)
					ggui_menu_add_option_text(mev_terminal_grab,		"Grab",	    "")
					ggui_menu_add_option_text(mev_pause_monsters_status,"Status",	"")
					ggui_menu_add_option_text(mev_pause_monsters_item,	"Held Item","")
					ggui_menu_add_option_text(mev_cancel,				"Cancel",	"")
				}
			}
		}
	}


}
