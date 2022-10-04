///draw_9tile(x1,y1,x2,y2,sprite,image)
function draw_9tile(argument0, argument1, argument2, argument3, argument4, argument5) {
	//Draw pieces of a sprite using 9-tiling.
	var w = sprite_get_width(argument4), h = sprite_get_height(argument4);
	var ww = floor(w/3), hh = floor(h/3);
	var xsc = (argument2-argument0-2*ww)/ww, ysc = (argument3-argument1-2*hh)/hh;
	draw_sprite_part_ext(argument4,argument5,0,   0,    ww,hh,argument0    ,argument1    ,  1,  1,c_white,1);
	draw_sprite_part_ext(argument4,argument5,w-ww,0,    ww,hh,argument2-ww, argument1    ,  1,  1,c_white,1);
	draw_sprite_part_ext(argument4,argument5,0,   h-hh, ww,hh,argument0    ,argument3-hh ,  1,  1,c_white,1);
	draw_sprite_part_ext(argument4,argument5,w-ww,h-hh, ww,hh,argument2-ww ,argument3-hh ,  1,  1,c_white,1);
	draw_sprite_part_ext(argument4,argument5,ww,  0,    ww,hh,argument0+ww ,argument1    ,xsc,  1,c_white,1);
	draw_sprite_part_ext(argument4,argument5,ww,  h-hh, ww,hh,argument0+ww ,argument3-hh ,xsc,  1,c_white,1);
	draw_sprite_part_ext(argument4,argument5,0,   hh,   ww,hh,argument0    ,argument1+hh ,  1,ysc,c_white,1);
	draw_sprite_part_ext(argument4,argument5,w-ww,hh,   ww,hh,argument2-ww ,argument1+hh ,  1,ysc,c_white,1);
	draw_sprite_part_ext(argument4,argument5,ww,  hh,   ww,hh,argument0+ww ,argument1+hh ,xsc,ysc,c_white,1);


}
