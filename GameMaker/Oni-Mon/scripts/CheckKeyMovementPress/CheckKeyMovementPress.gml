// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckKeyMovementPress(){
	if (input_move == directions.idle) { 
		if (keyboard_check(vk_down)) { 
			input_move = directions.down; 
		} 
		
		if (keyboard_check(vk_left)) { 
			input_move = directions.left; 
		} 
		
		if (keyboard_check(vk_up)) { 
			input_move = directions.up; 
		}
		
		if (keyboard_check(vk_right)) { 
			input_move = directions.right; 
		}
	}
}