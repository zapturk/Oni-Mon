///ggui_element_inputbutton(l,t,input,device)
function ggui_element_inputbutton(argument0, argument1, argument2, argument3) {
	var gf = ggui_frames - 1;
	ggui_frame_element_type[    gf,ggui_frame_elements[gf]] = gguielt_INPUTBUTTON;
	ggui_frame_element_x[       gf,ggui_frame_elements[gf]] = argument0;
	ggui_frame_element_y[       gf,ggui_frame_elements[gf]] = argument1;
	ggui_frame_element_halign[  gf,ggui_frame_elements[gf]] = argument2;//Hack: reuse variable for different purpose (input index)
	ggui_frame_element_valign[  gf,ggui_frame_elements[gf]] = argument3;//Hack: reuse variable for different purpose (device)
	ggui_frame_elements[gf]++;
	return ggui_frame_elements[gf] - 1;



}
