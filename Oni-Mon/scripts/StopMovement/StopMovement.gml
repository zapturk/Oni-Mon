// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function StopMovement(obj){
	// Stop below
	if (input_move == directions.down) 
	{ 
		if (!place_meeting(x, y+2, obj)) 
		{ 
			hspeed = 0; 
			vspeed = 2; 
		} 
		else { 
			speed = 0; 
		} 
	}
	
    if (input_move == directions.left) { 
		if (!place_meeting(x-2, y, obj)) { 
			hspeed = -2; 
			vspeed = 0; 
		} 
		else { 
			speed = 0; 
		} 
	}
	
    if (input_move == directions.up) { 
		if (!place_meeting(x, y-2, obj)) { 
			hspeed = 0; 
			vspeed = -2;
		} 
		else { 
			speed = 0; 
		}
	}
    
	if (input_move == directions.right) { 
		if (!place_meeting(x+2, y, obj)) { 
			hspeed = 2; 
			vspeed = 0; 
		} 
		else { 
			speed = 0; 
		} 
	}
}