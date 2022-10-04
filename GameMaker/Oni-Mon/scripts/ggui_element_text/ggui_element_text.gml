///ggui_element_text(dl,dt,string)
function ggui_element_text(argument0, argument1, argument2) {
	//Add a text element to last added GUI frame.
	//Aligned to a side, delta L and T are in percent of frame's size.
	var gf = ggui_frames - 1;
	ggui_frame_element_type[    gf,ggui_frame_elements[gf]] = gguielt_TEXT;
	ggui_frame_element_x[       gf,ggui_frame_elements[gf]] = argument0;
	ggui_frame_element_y[       gf,ggui_frame_elements[gf]] = argument1;
	ggui_frame_element_string[  gf,ggui_frame_elements[gf]] = argument2;
	ggui_frame_element_font[    gf,ggui_frame_elements[gf]] = ggui_font;
	ggui_frame_element_color[   gf,ggui_frame_elements[gf]] = ggui_color;
	ggui_frame_element_halign[  gf,ggui_frame_elements[gf]] = ggui_halign;
	ggui_frame_element_valign[  gf,ggui_frame_elements[gf]] = ggui_valign;
	ggui_frame_elements[gf]++;
	return ggui_frame_elements[gf] - 1;



}
