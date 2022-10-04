/// @description State machine
switch(state){
	case 0:
		state++
		cntr = 2;
	break
	
	case 1://Lunge forward
		with(user){
			x += drawscale*8
		}
		cntr--
		if(!cntr){
			state++
			cntr = 10
			sfx(snd_tackle)
		}
	break
	
	case 2://Wait
		cntr--
		if(!cntr){
			state++
			cntr = 16
		}
	break
	
	case 3://Pull back
		with(user){
			x -= drawscale*1
		}
		cntr--
		if(!cntr){
			instance_destroy()
		}
	break
}
