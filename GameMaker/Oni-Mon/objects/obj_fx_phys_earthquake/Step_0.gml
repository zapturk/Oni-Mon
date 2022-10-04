/// @description State machine
switch(state){
	case 0://Setup
		state++
		cntr = 60
		ang = 0
		sfx(snd_earthquake)
	break
	
	case 1://Shake shake
		ang += 6
		camera_set_view_pos(view_get_camera(0),random_range(-4,4) + lengthdir_y(8,ang),random_range(-4,4))
		cntr--
		if(!cntr){
			camera_set_view_pos(view_get_camera(0),0,0)
			instance_destroy()
		}
	break
}
