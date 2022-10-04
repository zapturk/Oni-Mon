///ggui_element_inputbutton_scrollable(l,t,arraydx,ady,arbindex,device)
function ggui_element_inputbutton_scrollable(argument0, argument1, argument2, argument3, argument4, argument5) {
	//Will use the text value in arbindex as the key. It's stringed when added and real'd when read.
	var gf = ggui_frames - 1;
	ggui_frame_element_type[    gf,ggui_frame_elements[gf]] = gguielt_SCINPUTBUTTON;
	ggui_frame_element_x[       gf,ggui_frame_elements[gf]] = argument0;
	ggui_frame_element_y[       gf,ggui_frame_elements[gf]] = argument1;
	ggui_frame_element_arrdx[   gf,ggui_frame_elements[gf]] = argument2;
	ggui_frame_element_arrdy[   gf,ggui_frame_elements[gf]] = argument3;
	ggui_frame_element_arbind[  gf,ggui_frame_elements[gf]] = argument4;
	ggui_frame_element_valign[  gf,ggui_frame_elements[gf]] = argument5;//Hack: reuse variable for different purpose (input index)
	ggui_frame_elements[gf]++;
	return ggui_frame_elements[gf] - 1;



}
