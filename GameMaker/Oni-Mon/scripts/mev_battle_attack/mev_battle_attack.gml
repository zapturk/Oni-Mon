///mev_battle_attack()
function mev_battle_attack() {
	//Read skills from action_monster and create an attack menu.

	//Check if there's any moves to choose from
	var validmoves = 0;
	for(var c = 0; c < MONSTER_MAX_NUMBER_OF_MOVES; c++){
		if(
			amp_read_var(obj_battlecontrol.action_monster.amp_id,amp_MOVE1_MP + c) > 0 &&
			amp_read_var(obj_battlecontrol.action_monster.amp_id,amp_MOVE1    + c) != NONE
		){
			validmoves++
		}
	}

	if(validmoves > 0){
		//There are moves to pick from! Let player decide.
		with(instance_create_depth(x,y,depth,obj_gguimenu)){
			ggui_frame(0,y,room_width,other.ggui_frame_h[0],spr_messagebox)
			ggui_menu_preallocate(2,MONSTER_MAX_NUMBER_OF_MOVES div 2)
			ggui_frame_set_scrolling(false,false,1,MONSTER_MAX_NUMBER_OF_MOVES,false,true)
	
			//Main data
			ggui_element_text_settings(font_mainmsg,c_black,0,0)
			for(var c = 0; c < MONSTER_MAX_NUMBER_OF_MOVES; c++){
				var mv = amp_read_var(obj_battlecontrol.action_monster.amp_id,amp_MOVE1 + c)
				my_move[c] = mv
				if(mv == NONE){
					ggui_menu_add_option_text(NONE,"---","")
				}
				else{
					if(amp_read_var(obj_battlecontrol.action_monster.amp_id,amp_MOVE1_MP + c) > 0){
						var mev = mev_battle_attack_select;
					}
					else{
						var mev = mev_battle_attack_select_noMP;
					}
					ggui_menu_add_option_text(mev,global.move_data[mv,mvd_NAME],"")
				}
			}
	
			//Frame with type/MP info
			ggui_frame(ggui_frame_l[0] + ggui_frame_w[0]*0.5,ggui_frame_t[0] - ggui_frame_h[0]*0.7,ggui_frame_w[0]*0.5,ggui_frame_h[0]*0.7,spr_messagebox)
			ggui_element_text_settings(font_mainmsg,c_black,0,0)
			ggui_element_arbtext(0.1,0.15,0)
			ggui_element_text_settings(font_mainmsg,c_black,2,0)
			ggui_element_arbtext(0.9,0.50,1)
			for(var c = 0; c < MONSTER_MAX_NUMBER_OF_MOVES; c++){
				var dx = c mod 2, dy = c div 2;
				var mv = amp_read_var(obj_battlecontrol.action_monster.amp_id,amp_MOVE1 + c)
				if(mv == NONE){
					ggui_fill_arbtext(dx,dy,0,"TYPE: ---")
					ggui_fill_arbtext(dx,dy,1,"MP: --/--")
				}
				else{
					ggui_fill_arbtext(dx,dy,0,tsprintf("TYPE: %",global.type_name[global.move_data[mv,mvd_TYPE]]))
					ggui_fill_arbtext(dx,dy,1,tsprintf("MP: %/%",amp_read_var(obj_battlecontrol.action_monster.amp_id,amp_MOVE1_MP + c),global.move_data[mv,mvd_MP]))
				}
			}	
		}
	}
	else{
		//There's no valid moves! Enqueue the "no other option" move.
		action_slate(
			obj_battlecontrol.action_monster,
			battle_get_random_targets(obj_battlecontrol.action_monster,move_STRUGGLE),
			battleaction_ATTACK,
			move_STRUGGLE,
			monster_get_spd(obj_battlecontrol.action_monster.amp_id)
		)
		battle_menu_done_proceed()
	}


}
