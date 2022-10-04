/// @description State machine
switch(state){
	case 0://Spawn
		n = instance_create_depth(x,y,-1500,obj_fx_fog)
		if(instance_exists(user)){
			n.hspeed = user.drawscale*3.5
		}
		n.vspeed = n*hspeed*0.391
		n.alarm[0] = 95
		n.alarm[1] = 70
		n.image_blend = c_purple
		state++
		cntr = 90
		sfx(snd_unnerve)
	break
	
	case 1://Wait
		cntr--
		if(!cntr){
			instance_destroy()
		}
	break
}
