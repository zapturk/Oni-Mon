// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FadeToRoom(tRoom, dur, col, px, py, pd){
	var inst = instance_create_depth(0, 0, -1000000, oFade);
	
	with(inst){
		targetRoom = tRoom;
		duration = dur;
		color = col;
		mPlayerX = px;
		mPlayerY = py;
		mPlayerDir = pd;
	}
}