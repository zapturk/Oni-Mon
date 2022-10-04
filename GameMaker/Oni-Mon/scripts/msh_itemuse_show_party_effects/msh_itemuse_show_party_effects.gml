///msh_itemuse_show_party_effects(msgstring)
function msh_itemuse_show_party_effects(argument0) {
	if(room == rm_battle){
		battle_message(argument0)
	}
	else{
		var displaymenu = NONE;
		with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
			msh_spawn_monster_list(mev_cancel)
			displaymenu = id
			//Hide menu rectangles
			for(var c = 0; c < menu_h; c++){
				menu_reg_l[0,c] = NONE
				menu_reg_t[0,c] = NONE
				menu_reg_r[0,c] = NONE
				menu_reg_b[0,c] = NONE
			}
		}
		var n = message_spawn_script(argument0,mev_pause_item_use_aftereffects);
		n.target = displaymenu
	}


}
