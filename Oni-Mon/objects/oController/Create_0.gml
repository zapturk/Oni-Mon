/// @description Insert description here
// You can write your code in this editor

// at the start of the game start in the middle
if (global.gameStart){
	instance_create_depth(6 * 16, 4 * 16, -1, oPlayer);	
	global.gameStart = false;
}
else{
	instance_create_depth(global.nextRoomX, global.nextRoomY, -1, oPlayer);	
}