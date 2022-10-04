/// @description State machine
switch(state){
	case 0://Fly into place
		t = 0
		tmax = 45
		state++
	break
	
	case 1://Actually fly
		t++
		s = t/tmax
		if(instance_exists(targmonobj)){
			x = qerp(ox,cx,targmonobj.x,s)
			y = qerp(oy,cy,targmonobj.y,s)
			image_angle -= 6
			if(t >= tmax){
				if(global.encounter_type == encountertype_TRAINER){
					battle_message("The ritual failed! The monster's soul is already bound to its trainer!")
					instance_destroy()
				}
				else{
					with(targmonobj){
						state = bmonsterstate_CATCH
						fx_sprite(spr_catchforcefield,0,x,y - sprite_height*0.5,0,0,0,0,0,0,9999)
					}
					state++
					sfx(snd_catch_start)
				}
			}
		}
		else{
			instance_destroy()
		}
	break
	
	case 2://Inertness
		ox			= x
		shufflang	= 90
		wiggang		= image_angle
		cntr		= 30
		delaycntr   = 0
	break
	
	#macro bballstate_WIGGLE_ENGAGE 3
	case 3://Wiggle
		if(delaycntr){
			delaycntr--
		}
		else{
			if(lengthdir_y(1,shufflang) < 0){
				wiggang	+= 6
			}
			else{
				wiggang -= 6
			}
			shufflang	+= 6
			x			 = ox + lengthdir_x(8,shufflang)
			image_angle  = wiggang
			cntr--
			if(!cntr){
				state = 2
				with(targmonobj){
					state = bmonsterstate_CATCHROLL
				}
				sfx(snd_catch_roll)
			}
		}
	break
}