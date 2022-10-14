/// @description movement
if (place_snapped(16,16)) {
    if (oMenu.menu == 0 && !instance_exists(oTextBox)) {
		CheckKeyMovementPress();
    }
    else {
        input_move = directions.idle;
    }
}

if(input_move != directions.idle && input_move != directions.locked) {
	global.playerLastDir = input_move;
}

if input_move == directions.down { if keyboard_check(vk_down) = 0 { input_move = directions.idle; } }
if input_move == 1 { if keyboard_check(vk_left) = 0 { input_move = directions.idle; } }
if input_move == 2 { if keyboard_check(vk_up) = 0 { input_move = directions.idle; } }
if input_move == 3 { if keyboard_check(vk_right) = 0 { input_move = directions.idle; } }
    
if(input_move != directions.idle) {
    face = input_move;
    image_speed = .2;
	
	
	// TODO: May need to switch this to a Swich block
	// Runs the first check to see if it is a wall
	StopMovement(oWall);
	
	// if not runs seccond check if npc
	if(speed != 0){
		StopMovement(oNPC);
	}
	else {
		// check if it is water
		StopMovement(oWallWater);	
	}
}
else {
    if(place_snapped(16,16)) {
        speed = 0;
        if floor(image_index) = 0 || floor(image_index) = 2 {
            image_speed = 0;
            }
        }
    }

