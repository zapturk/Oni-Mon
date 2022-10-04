///ggui_element_sprite(dl,dt,sprite,image)
function ggui_element_sprite(argument0, argument1, argument2, argument3) {
	//Add a non-animated sprite element to the last added GUI frame.
	//Aligned to a side, delta L and T are in percent of frame's size.
	var gf = ggui_frames - 1;
	ggui_frame_element_type[    gf,ggui_frame_elements[gf]] = gguielt_SPRITE;
	ggui_frame_element_x[       gf,ggui_frame_elements[gf]] = argument0;
	ggui_frame_element_y[       gf,ggui_frame_elements[gf]] = argument1;
	ggui_frame_element_sprite[  gf,ggui_frame_elements[gf]] = argument2;
	ggui_frame_element_image[   gf,ggui_frame_elements[gf]] = argument3;
	ggui_frame_elements[gf]++;
	return ggui_frame_elements[gf] - 1;



}
