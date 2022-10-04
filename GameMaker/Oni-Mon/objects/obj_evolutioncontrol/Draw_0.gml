/// @description Sorta special drawing
if(sprite_index >= 0){
	draw_sprite_ext(sprite_index,image_index,x,y - (sprite_get_bbox_bottom(sprite_index) - sprite_get_bbox_top(sprite_index))*(0-0.5*monscale),monscale,monscale,0,c_white,1)
	if(fogfade > 0){
		gpu_set_fog(true,c_white,0,0)
		draw_sprite_ext(sprite_index,image_index,x,y - (sprite_get_bbox_bottom(sprite_index) - sprite_get_bbox_top(sprite_index))*(0-0.5*monscale),monscale,monscale,0,c_white,fogfade)
		gpu_set_fog(false,0,0,0)
	}
}