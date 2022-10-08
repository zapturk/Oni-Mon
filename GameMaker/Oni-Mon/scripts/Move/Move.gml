// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Move(dir){
	var dx = global.componets[dir][0];
	var dy = global.componets[dir][1];
	
	
	if(oPlayer.state == states.idle){
		//Changes the dir if not moving
		sprite_index = sprite[dir];
		oPlayer.dir = dir;
		
		xFrom = xPos;
		yFrom = yPos;
	
		xTo = xPos + dx;
		yTo = yPos + dy;
	
		xPos = xTo;
		yPos = yTo;
	
		state = states.walking;
	}
}