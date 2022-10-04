///ggui_element_sprite_ext(dl,dt,sprite,image,xscale,yscale,col,alpha)
function ggui_element_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {
	//Add a non-animated sprite element to the last added GUI frame.
	//Allows to alter scale, blend and alpha.
	//Aligned to a side, delta L and T are in percent of frame's size.
	var gf = ggui_frames - 1;
	ggui_frame_element_type[    gf,ggui_frame_elements[gf]] = gguielt_EXTSPRITE;
	ggui_frame_element_x[       gf,ggui_frame_elements[gf]] = argument0;
	ggui_frame_element_y[       gf,ggui_frame_elements[gf]] = argument1;
	ggui_frame_element_sprite[  gf,ggui_frame_elements[gf]] = argument2;
	ggui_frame_element_image[   gf,ggui_frame_elements[gf]] = argument3;
	ggui_frame_element_arrdx[	gf,ggui_frame_elements[gf]] = argument4;
	ggui_frame_element_arrdy[	gf,ggui_frame_elements[gf]] = argument5;
	ggui_frame_element_halign[  gf,ggui_frame_elements[gf]] = argument6;
	ggui_frame_element_valign[  gf,ggui_frame_elements[gf]] = argument7;
	ggui_frame_elements[gf]++;
	return ggui_frame_elements[gf] - 1;



}
