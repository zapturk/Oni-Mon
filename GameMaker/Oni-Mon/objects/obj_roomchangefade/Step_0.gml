/// @description State Machine
switch(state){
	case 0://Fade out
		alpha += 1/steps
		if(alpha >= 1){
			state = 1
			room_goto(my_room)
		}
	break
	
	case 1://Fade in in a different room
		alpha -= 1/steps
		if(alpha <= 0){
			instance_destroy()
		}
	break
}
