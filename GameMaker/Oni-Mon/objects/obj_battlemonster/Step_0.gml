/// @description State machine
switch(state){
	case NONE://Don't do anything, really.
		//Here goes nothing! Literally!
		image_alpha = 0
	break
	
	#macro bmonsterstate_NORMAL 0
	case 0://Normal battle state
		//Which also means we don't really do a lot.
		//Set everything to normal, in case we transition here from another state abruptly.
		image_xscale = 1
		image_yscale = 1
		image_alpha  = 1
		dx			 = 0
		dy			 = 0
	break
	
	
	#macro bmonsterstate_EMERGE 10
	case 10://Emerge when summoned (setup)
		cntr--
		if(!cntr){
			tto = 20
			t   = 0
			image_xscale = 0.01
			image_yscale = 0.01
			image_alpha  = 0
		
			oxsc = image_xscale
			oysc = image_yscale
			oalph= image_alpha
			state++
		}
	break
	
	case 11://Emerge real hard
		t++
		var s = t/tto;
		image_xscale = lerp(oxsc, 1,s)
		image_yscale = lerp(oysc, 1,s)
		image_alpha  = lerp(oalph,1,s)
		if(t >= tto){
			//Emerge complete!
			state = bmonsterstate_NORMAL
			
			//Monster's been seen in battle! Add to list.
			var montype = global.active_monster_party[amp_id,amp_MONID];
			if(montype != NONE){
				global.monsters_seen[montype] = true
			}
		}
	break
	
	#macro bmonsterstate_DAMAGE 20
	case 20://React to damage
		state++
		cntr = 20
	break
	
	case 21://Visibly react
		image_xscale = random_range(0.95,1.05)
		image_yscale = random_range(0.95,1.05)
		dx = random_range(-2,2)
		dy = random_range(-2,2)
		cntr--
		if(!cntr){
			if(global.active_monster_party[amp_id,amp_HP] > 0){
				state = bmonsterstate_NORMAL
			}
			else{
				state = bmonsterstate_DIE
			}
		}
	break
	
	#macro bmonsterstate_DIE 30
	case 30: //Die
		tto		= 30
		t		= 0
		oxsc	= image_xscale
		oysc	= image_yscale
		oalph	= image_alpha
		cntr    = 10
		if(side == side_PLAYER){
			battle_message(tsprintf("% got hurt and collapsed!",name))
		}
		else{
			battle_message(tsprintf("Enemy % was overthrown!",name))
		}
		
		//Grant EXP
		if(side == side_ENEMY){
			var exploot = 0.1*monster_get_next_level_exp(global.active_monster_party[other.amp_id,amp_MONID],global.active_monster_party[other.amp_id,amp_LEVEL])
			//Could multiply this figure with special values for boss status, etc
			if(global.encounter_type == encountertype_TRAINER){
				exploot *= 1.5//For instance, trained monsters are stronger, so grant more EXP.
			}			
			//Okay, it's ready! Grant it.
			with(obj_battlecontrol){
				total_exploot += ceil(exploot)
			}
			
			//Grant some EVs as well! We give those directly.
			var othermon = global.active_monster_party[amp_id,amp_MONID];
			var bonustat = clamp(amp_EV_MHP + global.monster_data[othermon,mond_EVBONUS_STAT],amp_EV_MHP,amp_EV_SPD);
			with(obj_battlemonster){
				if(side != other.side){
					if(battle_is_alive(id)){
						global.active_monster_party[amp_id,bonustat] = min(MONSTER_MAX_EFFORT_VALUES,global.active_monster_party[amp_id,bonustat]+choose(1,1,1,2,2,3,4))
					}
				}
			}
		}
		
		state++
	break
	
	case 31://Lerp
		cntr--
		if(!cntr){
			t++
			s = t/tto
			image_xscale = lerp(oxsc,oxsc,s)
			image_yscale = lerp(oysc,0.01,s)
			image_alpha  = lerp(oalph,0,s)
			if(t >= tto){
				state++
			}
		}
	break
	
	#macro bmonsterstate_DEAD 32
	case 32://DedS
		//Do nothing
		image_xscale = 0
		image_yscale = 0
		image_alpha  = 0
	break
	
	
	#macro bmonsterstate_SWITCH 40
	case 40://Switch out
		image_xscale = max(0,image_xscale - 0.05)
		image_yscale = image_xscale
		if(image_xscale <= 0){
			state++
			//Actually switch
			amp_id = switch_mon
			//Re-read buffered data now when we've switched
			sprite_index = monster_get_battlesprite(amp_id)
			name = amp_get_monster_name(amp_id)
		}
	break
	
	case 41://Switch in again
		image_xscale = min(1,image_xscale + 0.05)
		image_yscale = image_xscale
		image_alpha  = min(1,image_alpha + 0.05)
		if(image_xscale >= 1){
			state = bmonsterstate_NORMAL
			
			//Undo any temporary changes when switching in
			for(var c = 0; c < STAT_MAX; c++){
				buff[c] = 0
			}
			
			//Monster's been seen in battle! Add to list.
			var montype = global.active_monster_party[amp_id,amp_MONID];
			if(montype != NONE){
				global.monsters_seen[montype] = true
			}
		}
	break
	
	
	#macro bmonsterstate_CATCH 50
	case 50://Get sucked into ball
		image_xscale -= 0.05
		image_yscale = image_xscale
		if(image_xscale <= 0){
			image_xscale = 0
			state++
		}
	break
	
	case 51://Setup jiggling
		jiggles = 4
		state++
		with(obj_battlecatchball){
			state = bballstate_WIGGLE_ENGAGE
		}
	break
	
	case 52://Jiggling
		//Ball handles this
	break
	
	#macro bmonsterstate_CATCHROLL 53
	case 53:
		with(obj_battlecatchball){
			if(random(1) <= ball_catch_rate){
				with(other){
					jiggles--
					if(jiggles <= 0){
						//Caught!
						state = bmonsterstate_CATCH_SUCCESS
						sfx(snd_catch_success)
					}
					else{
						state = 52
						with(obj_battlecatchball){
							state		= bballstate_WIGGLE_ENGAGE
							cntr		= 30
							delaycntr	= 30
						}
					}
				}
			}
			else{
				instance_destroy()
				other.state = bmonsterstate_CATCHFAIL
				sfx(snd_catch_fail)
				other.t = 0
				other.tto = 30
				other.oxsc	= image_xscale
				other.oysc	= image_yscale
				other.oalph	= image_alpha
				instance_destroy(obj_spritefx)
				repeat(2){
					fx_sprite(spr_catchballfragment,0,x,y,90 + random_range(-30,30),random_range(4,6),random(360),random_range(-5,5),0.35,0,60)
				}
			}
		}
	break
	
	#macro bmonsterstate_CATCHFAIL 54
	case 54://Get expanded again
		t++
		var s = t/tto;
		image_xscale = lerp(oxsc, 1,s)
		image_yscale = lerp(oysc, 1,s)
		image_alpha  = lerp(oalph,1,s)
		if(t >= tto){
			//Emerge complete!
			state = bmonsterstate_NORMAL
			battle_message(tsprintf("Damnit! % broke free of the spell!",name))
		}
	break
	
	#macro bmonsterstate_CATCH_SUCCESS 60
	case 60://Display message
		battle_message(tsprintf("Gotcha! %'s soul was bound!",name))
		state++
	break
	
	case 61://Wait for messages to end, then offer naming it
		if(battle_messages_empty()){
			state++
			
			with(msh_areyousure(mev_battle_catch_nickname,"")){
				my_monster = other.amp_id
				//HACK: change the "are you sure" string directly
				ggui_frame_element_string[0,0] = tsprintf("Give % a nickname?",amp_get_monster_name(my_monster))
				ggui_frame_resize(0,400,100,VIEW_W*0.5-200,VIEW_H*0.5-50)
				ggui_frame_element_x[0,0] += 0.05
				ggui_frame_element_y[0,0] += 0.1
				ggui_frame_element_x[0,1] += 0.15
				ggui_frame_element_x[0,2] += 0.15
				menuvalue_x = 0
			}
		}
	break
	
	case 62://Wait for menus to end
		if(!instance_exists(parent_menu)){
			state++
		}
	break
	
	case 63://Wait for message to end, then copy monster over to party
		//Update name in case was nickname'd
		name = amp_get_monster_name(amp_id)
	
		//Grant bonus EXP for catching
		var exploot = 0.25*monster_get_next_level_exp(global.active_monster_party[other.amp_id,amp_MONID],global.active_monster_party[other.amp_id,amp_LEVEL])
		with(obj_battlecontrol){
			total_exploot += ceil(exploot)
		}
			
		//Register monster as caught
		//Monster's been seen in battle! Add to list.
		var montype = global.active_monster_party[amp_id,amp_MONID];
		if(montype != NONE){
			global.monsters_caught[montype] = true
		}
			
		//Move data over to player's monster data zone
		instance_destroy(obj_spritefx)
		instance_destroy(obj_battlecatchball)
		var namp;
		namp = amp_get_new_party_id()
		if(namp != NONE){
			//Try adding to party first
			for(var c = 0; c < AMP_MAX; c++){
				global.active_monster_party[namp,c] = global.active_monster_party[amp_id,c]
			}
			amp_clear_monster(amp_id)
			state = bmonsterstate_DEAD
			battle_message(tsprintf("% was added to your party.",name))
		}
		else{
			namp = amp_get_new_box_id()
			if(namp != NONE){
				//Try adding to boxes if that failed
				for(var c = 0; c < AMP_MAX; c++){
					global.active_monster_party[namp,c] = global.active_monster_party[amp_id,c]
				}
				amp_clear_monster(amp_id)
				state = bmonsterstate_DEAD
				battle_message(tsprintf("Your party is full! % was sent to the spirit shrine.",name))
			}
			else{
				amp_clear_monster(amp_id)
				state = bmonsterstate_DEAD
				battle_message(tsprintf("There's no room! % can't be taken!",name))
			}
		}
	break
}