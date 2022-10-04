///itemuse_catch(amp_id,catchpower)
function itemuse_catch(argument0, argument1) {
	var foundone = false;
	with(obj_battlemonster){
		if(amp_id == argument0){
			n = instance_create_depth(0,VIEW_H,depth-1,obj_battlecatchball)
			n.targmonobj = id
			n.ball_catch_rate = lerp(1,0.25,(global.active_monster_party[amp_id,amp_HP]/monster_get_mhp(amp_id)))*(	//Catch power is lowered if monster has full HP
				70 +																								//Base catch rate
				(global.active_monster_party[amp_id,amp_AILMENT] != NONE)*30 +										//Bonus if has an ailment
				max(0,lerp(30,0,global.active_monster_party[amp_id,amp_LEVEL]/20))									//Bonus if low level
			)*(
				argument1																							//Catch power of used catch item (final multiplier to everything)
			)*0.01																									//Turn from integer percentage to normalized probability
			foundone++
			if(DEBUG_MODE){
				show_debug_message(tsprintf("Catch chance = %%",100*n.ball_catch_rate))
			}
		}
	}
	if(foundone){
		inventory_lose_item(my_item,1)
	}


}
