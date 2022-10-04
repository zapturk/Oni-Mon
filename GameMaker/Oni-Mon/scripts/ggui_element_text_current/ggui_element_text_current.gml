///ggui_element_text_current(dl,dt,arraydeltax,ady)
function ggui_element_text_current(argument0, argument1) {
	var gf = ggui_frames - 1;
	ggui_frame_element_type[    gf,ggui_frame_elements[gf]] = gguielt_CURRTEXT;
	ggui_frame_element_x[       gf,ggui_frame_elements[gf]] = argument0;
	ggui_frame_element_y[       gf,ggui_frame_elements[gf]] = argument1;
	ggui_frame_element_font[    gf,ggui_frame_elements[gf]] = ggui_font;
	ggui_frame_element_color[   gf,ggui_frame_elements[gf]] = ggui_color;
	ggui_frame_element_halign[  gf,ggui_frame_elements[gf]] = ggui_halign;
	ggui_frame_element_valign[  gf,ggui_frame_elements[gf]] = ggui_valign;
	ggui_frame_element_arrdx[   gf,ggui_frame_elements[gf]] = 0;
	ggui_frame_element_arrdy[   gf,ggui_frame_elements[gf]] = 0;
	ggui_frame_elements[gf]++;
	return ggui_frame_elements[gf] - 1;



}
