///mev_battle_attack_select()
function mev_battle_attack_select() {
	var mv = my_move[menuvalue_x + menu_w*menuvalue_y];
	if(mv != NONE){
		var targets = battle_get_valid_targets(obj_battlecontrol.action_monster,mv);
		var numtargs= array_length_1d(targets);
	
		if(numtargs > 1){
			if(
				global.move_data[mv,mvd_TARGET] == movetarg_ALLALLY					||
				global.move_data[mv,mvd_TARGET] == movetarg_ALLENE					||
				global.move_data[mv,mvd_TARGET] == movetarg_EVERYONE				||
				global.move_data[mv,mvd_TARGET] == movetarg_EVERYONEEXCEPTUSER
			){
				//Multiple targets at once, enqueue them all!
				action_slate(obj_battlecontrol.action_monster,targets,battleaction_ATTACK,mv,monster_get_spd(obj_battlecontrol.action_monster.amp_id))
			
				//Done, let's go!
				battle_menu_done_proceed()
			}
			else{
				//Multiple targets but can only pick one, make menu to ask
				with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
					ggui_frame(other.ggui_frame_l[0]+0.5*other.ggui_frame_w[0],room_height - 36*numtargs,other.ggui_frame_w[0]*0.5,36*numtargs,spr_messagebox)
					ggui_menu_preallocate(1,numtargs)
					ggui_element_text_settings(font_mainmsg,c_black,0,0)
					for(var c = 0;c < numtargs;c++){
						var d = (numtargs - 1) - c;//List in the opposite direction so topmost monster is on top of list (bottommost is actually first)
						ggui_menu_add_option_text(mev_battle_attack_select_target,monster_get_name(targets[d].amp_id),"")
						my_target[c] = targets[d]
					}
					my_attack = mv
				}
			}
		}
		else{
			//Only one valid target, or no valid targets: proceed immediately
			action_slate(obj_battlecontrol.action_monster,targets,battleaction_ATTACK,mv,monster_get_spd(obj_battlecontrol.action_monster.amp_id))
		
			//Done, let's go!
			battle_menu_done_proceed()
		}
	}


}
