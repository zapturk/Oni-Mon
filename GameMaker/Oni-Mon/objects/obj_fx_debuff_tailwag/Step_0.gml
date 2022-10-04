/// @description State machine
switch(state){
	case 0://Setup
		ox = x
		ang = 90
		cntr = 120
		with(user){
			other.ox = x
		}
		state++
		sfx(snd_brushing)
	break
	
	case 1://Tail
		ang += 6
		with(user){
			x = other.ox + lengthdir_x(10,other.ang)
		}
		cntr--
		if(!cntr){
			with(user){
				x = other.ox
			}
			instance_destroy()
		}
	break
}
