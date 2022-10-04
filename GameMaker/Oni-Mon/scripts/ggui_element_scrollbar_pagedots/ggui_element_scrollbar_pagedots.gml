///ggui_element_scrollbar_pagedots(l,t,l2,total,curr)
function ggui_element_scrollbar_pagedots(argument0, argument1, argument2, argument3, argument4) {
	var gf = ggui_frames - 1;
	ggui_frame_element_type[    gf,ggui_frame_elements[gf]] = gguielt_PAGEDOTS;
	ggui_frame_element_x[       gf,ggui_frame_elements[gf]] = argument0;
	ggui_frame_element_y[       gf,ggui_frame_elements[gf]] = argument1;
	ggui_frame_element_arrdx[   gf,ggui_frame_elements[gf]] = argument2;
	ggui_frame_element_sprite[  gf,ggui_frame_elements[gf]] = argument3;//Hack: reuse variable for different purpose (curr)
	ggui_frame_element_image[   gf,ggui_frame_elements[gf]] = argument4;//Hack: reuse variable for different purpose (total)
	ggui_frame_elements[gf]++;
	return ggui_frame_elements[gf] - 1;



}
