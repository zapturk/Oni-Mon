///mev_pause_monsters_switch_confirm()
function mev_pause_monsters_switch_confirm() {
	if(menuvalue_y == original_mon){
		instance_destroy()
		instance_destroy(daddy)
		sfx(snd_menu_buzzer)
	}
	else{
		var tmp, mon1 = AMP_FIRST_ACTIVE + menuvalue_y, mon2 = AMP_FIRST_ACTIVE + original_mon;
		for(var c = 0; c < AMP_MAX; c++){
			//Switch the individual things
			tmp									= global.active_monster_party[mon1,c]
			global.active_monster_party[mon1,c] = global.active_monster_party[mon2,c]
			global.active_monster_party[mon2,c] = tmp
		}
	
	
		sfx(snd_reorganizepop)
		with(daddy.daddy){
			msh_spawn_monster_list(mev_pause_monsters_select)
		}
		instance_destroy()
		instance_destroy(daddy)
	}


}
