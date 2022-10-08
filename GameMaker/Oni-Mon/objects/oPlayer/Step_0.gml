/// @description Insert description here
// You can write your code in this editor

if(state == states.walking){
	walkAnimTime += delta_time / 1000000;
	
	var t = walkAnimTime / walkAnimLen;
	
	if(t >= 1){
		walkAnimTime = 0;
		t = 1;
		state = states.idle;
	}
	
	x = lerp(xFrom, xTo, t) * TILE_SIZE;
	y = lerp(yFrom, yTo, t) * TILE_SIZE;
	
	image_speed = 1;
}

if(state == states.idle){
	if(floor(image_index) = 1 || floor(image_index) = 3) {
            image_speed = 0;
        }
}