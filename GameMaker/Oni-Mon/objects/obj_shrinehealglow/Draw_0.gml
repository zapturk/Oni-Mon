/// @description Special drawing
gpu_set_blendmode(bm_add)
for(var c = 0; c < 5; c++){
	draw_sprite_ext(sprite_index,image_index,x,y,1 + c*0.1,1 + c*0.1,image_angle*(1 + c*0.083),c_white,image_alpha*0.2)
}
gpu_set_blendmode(bm_normal)