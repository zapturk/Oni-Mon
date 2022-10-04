/// @description State machine
get_keys()
switch(state){
	case 0://Setup
		var md = ds_queue_dequeue(global.pending_evolutions_queue)
		my_monster = md[0]
		targevo    = md[1]
		orgname    = amp_get_monster_name(my_monster)
		sprite_index = global.monster_data[global.active_monster_party[my_monster,amp_MONID],mond_SPRITE_BATTLE]
		message_spawn(tsprintf("Wow! % is transcending!",orgname))
		state++
	break
	
	case 1://Wait for message
		if(instance_number(parent_menu) == 0){
			state++
			sfx(jingle_evolution)
		}
	break
	
	case 2://Evolution effect (fade out)
		fogfade += 0.005
		if(fogfade >= 1){
			state++
			cntr = 360
			evoset = false
		}
		
		if(k_b && !p_b){
			state = 10
		}
	break
	
	case 3://Evolution effect (pulse)
		if(abs(cntr - 180) < 90){
			ang += 12
		}
		else{
			ang += 6
		}
		monscale = lengthdir_x(1,ang)
		cntr--
		if(!cntr){
			state++
		}
		else if(cntr < 180 && !evoset){
			evoset = true
			global.active_monster_party[my_monster,amp_MONID] = targevo
			global.monsters_seen[targevo]	= true
			global.monsters_caught[targevo] = true
			msh_recompute_seencaught()
			sprite_index = global.monster_data[targevo,mond_SPRITE_BATTLE]
			effect_create_above(ef_firework,x,y - sprite_height*0.5,2,c_white)
			effect_create_above(ef_ring,x,y - sprite_height*0.5,2,c_white)
			effect_create_above(ef_ellipse,x,y - sprite_height*0.5,2,c_white)
		}
		
		if(k_b && !p_b && !evoset){
			state = 10
		}
	break
	
	case 4://Evolution effect (fade in)
		monscale = 1
		fogfade -= 0.0025
		if(fogfade <= 0){
			state++
		}
	break
	
	case 5://Success message
		sfx(jingle_monupgrade)
		message_spawn(tsprintf("Congratulations! Your % transcended into %!",orgname,global.monster_data[targevo,mond_NAME]))
		state = 20
	break
	
	case 10://Failure message
		audio_stop_all()
		sfx(snd_catch_fail)
		message_spawn(tsprintf("You interrupted %'s transcendence.",orgname))
		state = 20
	break
	
	case 20://Done
		monscale = lerp(monscale,1,0.1)
		fogfade  = lerp(fogfade,0,0.1)
		if(instance_number(parent_menu) == 0){
			if(ds_queue_empty(global.pending_evolutions_queue)){
				room_goto_fade_dontdestroy(global.load_room,60)
			}
			else{
				room_goto_fade_dontdestroy(room,60)
			}
			state++
		}
	break
	
	case 21://Fadeout
		//Nothing
	break
}
