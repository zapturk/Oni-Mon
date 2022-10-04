/// @description State Machine
switch(state){
	case NONE: //Do nothing
	break
	
	#macro bplayerstate_LINGERONSCREEN 0
	case 0://Linger ominously
		//Do nothing, in other words.
	break
	
	
	#macro bplayerstate_LEAVESCREEN 1
	case 1://Zoom offscreen
		var tx = -sprite_width, mvspd = 8;
		cntr--
		if(!cntr){
			x = max(tx,x - mvspd)
			if(x <= tx){
				state = 2
			}
		}
	break
	
	#macro bplayerstate_LINGEROFFSCREEN 2
	case 2://Linger offscreen
		//Do nothing AGAIN, in other words.
	break
	
	#macro bplayerstate_ENTERSCREEN 3
	case 3://Zoom in-screen again
		var tx = xstart, mvspd = 8;
		cntr--
		if(!cntr){
			x = min(tx,x + mvspd)
			if(x > tx){
				state = 0
				battle_message(tsprintf("%:\n%",name,winquote))
			}
		}
	break
}
