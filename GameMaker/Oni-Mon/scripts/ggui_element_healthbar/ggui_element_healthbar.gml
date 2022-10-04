///ggui_element_healthbar(x,y,w,amp)
function ggui_element_healthbar(argument0, argument1, argument2, argument3) {
	var gf = ggui_frames - 1;
	ggui_frame_element_type[    gf,ggui_frame_elements[gf]] = gguielt_HEALTHBAR;
	ggui_frame_element_x[       gf,ggui_frame_elements[gf]] = argument0;
	ggui_frame_element_y[       gf,ggui_frame_elements[gf]] = argument1;
	ggui_frame_element_halign[  gf,ggui_frame_elements[gf]] = argument2;//Hack: reuse variable for different purpose (totalwidth)
	ggui_frame_element_valign[  gf,ggui_frame_elements[gf]] = argument3;//Hack: reuse variable for different purpose (monsterid)
	ggui_frame_elements[gf]++;
	return ggui_frame_elements[gf] - 1;



}
