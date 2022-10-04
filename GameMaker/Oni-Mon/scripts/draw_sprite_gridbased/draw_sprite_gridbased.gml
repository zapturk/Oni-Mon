///draw_sprite_gridbased(sprite_index,subimage,centx,botty,direction)
function draw_sprite_gridbased(argument0, argument1, argument2, argument3, argument4) {
	//Draw a 4x4 sprite atlas
	var ww = sprite_get_width(argument0)*0.25, hh = sprite_get_height(argument0)*0.25;
	var drr = 0;
	for(c = 0;c < 4;c++){
		if(abs(angle_difference(c*90,argument4)) <= 45){
			drr = c
			break
		}
	}
	draw_sprite_part(argument0,0,(ww*floor(argument1 mod 4)),drr*hh,ww,hh,argument2-TILESIZE*0.5,argument3-TILESIZE)


}
