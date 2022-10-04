///msh_menu_terminal_handle()
function msh_menu_terminal_handle() {
	get_keys()
	menu_creation_cooldown--;
	if(!menu_creation_cooldown && active){
		switch(terminalpage){
			case terminalpage_BOX:
			case terminalpage_PARTY:
		#region Normal Marker
		
			    //Move around marker
				var ll, tt = 0, bb, rr; //TLC inclusive, BRC exclusive
				if(terminalpage == terminalpage_BOX){
					ll = columns_party + columns_boxsel
					rr = columns_party + columns_boxsel + columns_box
					bb = menu_h
				}
				else if(terminalpage == terminalpage_PARTY){
					ll = 0
					rr = columns_party
					bb = PARTYSIZE_ACTIVE div columns_party
				}

		        if(k_l && !p_l){
		            if(menuvalue_x > ll){
		                menuvalue_x--;
		                sfx(snd_menu_move)
		            }
		            else{
						if(terminalpage == terminalpage_BOX){
							//Move from box's LHS to RHS of party
							terminalpage = terminalpage_PARTY
							menuvalue_x  = columns_party - 1
							menuvalue_y  = min(menuvalue_y,(PARTYSIZE_ACTIVE div columns_party) - 1)
							sfx(snd_menu_move)
						}
		            }
		        }
		        if(k_r && !p_r){
		            if(menuvalue_x < rr - 1){
		                menuvalue_x++;
		                sfx(snd_menu_move)
		            }
		            else{
						if(terminalpage == terminalpage_PARTY){
							//Move from party's RHS to LHS of box
							terminalpage = terminalpage_BOX
							menuvalue_x  = columns_party + columns_boxsel
							sfx(snd_menu_move)
						}
		            }
		        }

		        if(k_u && !p_u){
		            if(menuvalue_y > tt){
		                menuvalue_y--;
		                sfx(snd_menu_move)
		            }
		            else{
						if(terminalpage == terminalpage_BOX){
							//Move from box's top to BoxSelect
							terminalpage = terminalpage_BOXSELECT
							menuvalue_x  = columns_party
							menuvalue_y  = 0
							sfx(snd_menu_move)
						}
		            }
		        }
		        if(k_d && !p_d){
		            if(menuvalue_y < bb - 1){
		                menuvalue_y++;
		                sfx(snd_menu_move)
		            }
		        }
		
		#endregion
			break
		
			case terminalpage_BOXSELECT:
				if(k_l && !p_l){
					//Shift left
					if(global.selected_monster_box > 0){
						global.selected_monster_box--
					}
					else{
						global.selected_monster_box = global.total_monster_boxes - 1
					}
					sfx(snd_menu_move)
				
					//Reload new page
					msh_terminal_update()
				}
				if(k_r && !p_r){
					//Shift right
					if(global.selected_monster_box < global.total_monster_boxes - 1){
						global.selected_monster_box++
					}
					else{
						global.selected_monster_box = 0 
					}
					sfx(snd_menu_move)
				
					//Update after change
					msh_terminal_update()
				}
				if(k_d && !p_d){
					//Move from BoxSelect to box's top
					terminalpage = terminalpage_BOX
					menuvalue_x  = columns_party + columns_boxsel
					menuvalue_y  = 0
					sfx(snd_menu_move)
				}
			break
		}
	    //Activate current event
	    if(k_a && !p_a){
	        if(menu_event[menuvalue_x,menuvalue_y] != NONE){
	            sfx(snd_menu_ok)
	            script_execute(menu_event[menuvalue_x,menuvalue_y])
	        }
	        else{
	            sfx(snd_menu_buzzer)
	        }
	    }
	    //Cancel
	    if(k_b && !p_b){
			if(grabbing){
				grabbing = false
				sfx(snd_menu_buzzer)
			
				//Paste clipboarded mon back
				if(grabbed_original_amp == terminal_AMP_GRABBED_FROM_PARTY){
					//Party was reshuffled, put it at the back
					var amp = amp_get_new_party_id();
					for(var c = 0; c < AMP_MAX; c++){
						global.active_monster_party[amp,c] = global.active_monster_party[AMP_CLIPBOARD,c]
					}
					amp_clear_monster(AMP_CLIPBOARD)
					grabbed_original_amp = NONE
				}
				else if(grabbed_original_amp != NONE){
					//Put it back where you took it
					for(var c = 0; c < AMP_MAX; c++){
						global.active_monster_party[grabbed_original_amp,c] = global.active_monster_party[AMP_CLIPBOARD,c]
					}
					amp_clear_monster(AMP_CLIPBOARD)
					grabbed_original_amp = NONE
				}
			
				//Update menu
				msh_terminal_update()
			}
			else{
		        if(menu_can_destroy){
		            sfx(snd_menu_buzzer)
		            instance_destroy();
            
		            //Stop other menus from instatriggering
		            with(parent_menu){
		                menu_creation_cooldown = 5
		            }
		        }
			}
	    }
	}

	//Control the grabby hand
	var mf = menu_frame[menuvalue_x,menuvalue_y]
	if(mf != NONE){
		ghx = ggui_frame_l[mf] + 0.5*(menu_reg_l[menuvalue_x,menuvalue_y]+menu_reg_r[menuvalue_x,menuvalue_y])*ggui_frame_w[mf]
		ghy = ggui_frame_t[mf] + menu_reg_t[menuvalue_x,menuvalue_y]*ggui_frame_h[mf]
	}
	dghx= lerp(dghx,ghx,0.15)
	dghy= lerp(dghy,ghy,0.15)



}
