///ggui_element_sprite_scrollable(dl,dt,arraydeltax,ady)
function ggui_element_sprite_scrollable(argument0, argument1, argument2, argument3) {
	var gf = ggui_frames - 1;
	ggui_frame_element_type[    gf,ggui_frame_elements[gf]] = gguielt_SCSPRITE;
	ggui_frame_element_x[       gf,ggui_frame_elements[gf]] = argument0;
	ggui_frame_element_y[       gf,ggui_frame_elements[gf]] = argument1;
	ggui_frame_element_arrdx[   gf,ggui_frame_elements[gf]] = argument2;
	ggui_frame_element_arrdy[   gf,ggui_frame_elements[gf]] = argument3;
	ggui_frame_elements[gf]++;
	return ggui_frame_elements[gf] - 1;



}
