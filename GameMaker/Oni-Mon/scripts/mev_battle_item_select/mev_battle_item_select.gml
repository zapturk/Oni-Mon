///mev_battle_item_select()
function mev_battle_item_select() {
	my_item = my_item_id[menuvalue_y]
	if(global.item_data[my_item,id_VALIDFLAGS] & itemvalidflag_BATTLE){
		if(global.item_data[my_item,id_ITEMTYPE] == itemtype_CATCH){
			var targets = battle_get_valid_targets(obj_battlecontrol.action_monster,move_CATCH);//TODO: potentially add other item categories here if they also affect enemy targets.
			var numtargs = array_length_1d(targets);
			if(numtargs == 0){
				message_spawn("Can't use that right now!")
			}
			else if(numtargs == 1){
				//Just one monster, enqueue target directly!
				action_slate(obj_battlecontrol.action_monster,[targets[0].amp_id],battleaction_ITEM,my_item,monster_get_spd(obj_battlecontrol.action_monster.amp_id) + BATTLEACTION_SPEEDBONUS_ITEM)
				battle_menu_done_proceed()
			}
			else{
				//Multiple monsters, need to let the player pick...
				with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
					ggui_frame(VIEW_W*0.35,VIEW_H*0.5 - 18*numtargs,VIEW_W*0.30,36*numtargs,spr_messagebox)
					ggui_menu_preallocate(1,numtargs)
					ggui_element_text_settings(font_mainmsg,c_black,0,0)
					for(var c = 0;c < numtargs;c++){
						var d = (numtargs - 1) - c;//List in the opposite direction so topmost monster is on top of list (bottommost is actually first)
						ggui_menu_add_option_text(mev_battle_items_use_catch,monster_get_name(targets[d].amp_id),"")
						my_target[c] = targets[d]
					}
					my_item = other.my_item
				}
			}
		}
		else{
			with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
				daddy	= other.id
				my_item = other.my_item
				msh_spawn_monster_list(mev_battle_items_use_consumable)
			}
		}
	}
	else{
		message_spawn("Can't use that right now!")
	}


}
