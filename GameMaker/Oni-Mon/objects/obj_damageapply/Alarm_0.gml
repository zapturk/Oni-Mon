/// @description Do it!
if(instance_exists(my_mon)){
	//Apply damage
	global.active_monster_party[my_mon.amp_id,amp_HP] = clamp(global.active_monster_party[my_mon.amp_id,amp_HP] - my_dmg,0,monster_get_mhp(my_mon.amp_id))
	if(my_eff == 0){
		battle_message(tsprintf("But % is immune...",my_mon.name))
	}
	else if(my_eff > 1){
		battle_message(tsprintf("It's mega effective on %!",my_mon.name))
	}
	else if(my_eff < 1){
		battle_message(tsprintf("Not very effective on %...",my_mon.name))
	}
	
	//Display damage visually as well
	n = instance_create_depth(my_mon.x,my_mon.y,my_mon.depth - 1000,obj_damageshow)
	n.my_string = string(abs(my_dmg))//Don't add a minus sign on recovery
	if(my_dmg < 0){
		n.my_color = $50C020 //It's recovery, so let's color it green!
	}
	else{
		//Jiggle a bit to show the impact's weight
		with(my_mon){
			state = bmonsterstate_DAMAGE
		}
		
		//Play a damage sound, pitch based on effectiveness
		if(my_eff > 1){
			sfx_pitch(snd_damageapply,1.25)
		}
		else if(my_eff < 1){
			sfx_pitch(snd_damageapply,0.75)
		}
		else{
			sfx(snd_damageapply)
		}
	}
	
	//If target's held item activates on damage, activate it.
	if(this_is_an_attack && my_dmg >= 0){
		if(battle_item_might_affect_this(my_mon.amp_id,itemvalidflag_AUTO_TAKEDAMAGE)){
			var it = amp_read_var(my_mon.amp_id,amp_HELDITEM);
			script_execute(global.item_data[it,id_USESCRIPT],[my_mon.amp_id,my_user.amp_id,my_dmg,my_move],global.item_data[it,id_USEARG])
		}
	}
}

//I'm finished!
instance_destroy()