/// @description Draw the texture
var tex = spr_tallgrasstexture;var sz = sprite_get_width(tex);
for(var c = 0;c < sprite_width; c+= sz){
	for(var d = 0;d < sprite_height; d+= sz){
		draw_sprite(tex,image_index,x+c,y+d)
	}
}

//If player is on top of me, they'll actually be BELOW me...
//draw the top part again using dynamic rendering masks so it looks like it's partially submerged!
with(obj_player){
	if(
		x + TILESIZE*0.5						 > other.x							&&
		x - TILESIZE*0.5						 < other.x + other.sprite_width		&&
		y - CHARACTER_FOOT_PROTRUSION 			 > other.y							&&
		y - CHARACTER_FOOT_PROTRUSION - TILESIZE < other.y + other.sprite_height
	){
		//Mask out entire screen
		gpu_set_blendenable(false)
		gpu_set_colorwriteenable(false,false,false,true)
		draw_set_alpha(0)
		draw_rectangle(0,0,room_width,room_height,false)
		//Add a rectangle where we want the sprite to be drawn
		draw_set_alpha(1)
		draw_rectangle(x - TILESIZE*0.5,y - TILESIZE - CHARACTER_FOOT_PROTRUSION,x + TILESIZE*0.5,y - TILESIZE*0.5 - CHARACTER_FOOT_PROTRUSION,false)
		gpu_set_blendenable(true)
		gpu_set_colorwriteenable(true,true,true,true)
		gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
		gpu_set_alphatestenable(true);
		event_perform(ev_draw,0)
		gpu_set_alphatestenable(false);
		gpu_set_blendmode(bm_normal);
	}
}