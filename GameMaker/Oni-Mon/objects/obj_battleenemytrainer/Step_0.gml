/// @description State Machine
switch(state){
	case 0://Linger ominously
		//Do nothing, in other words.
	break
	
	#macro btrainerstate_LEAVESCREEN 1
	case 1://Zoom offscreen
		var tx = room_width + sprite_width, mvspd = 8;
		cntr--
		if(!cntr){
			x = min(tx,x + mvspd)
			if(x >= tx){
				state = 2
			}
		}
	break
	
	case 2://Linger offscreen
		//Do nothing AGAIN, in other words.
	break
	
	#macro btrainerstate_ENTERSCREEN 3
	case 3://Zoom in-screen again
		var tx = xstart, mvspd = 8;
		cntr--
		if(!cntr){
			x = max(tx,x - mvspd)
			if(x <= tx){
				state = 4
			}
		}
	break
	
	case 4://Deliver dialogue
		//Handled by battle controller, so ALSO do nothing. Geez, lazy object.
	break
}
