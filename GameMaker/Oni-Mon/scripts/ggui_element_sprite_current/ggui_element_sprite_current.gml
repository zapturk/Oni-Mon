///ggui_element_sprite_current(dl,dt)
function ggui_element_sprite_current(argument0, argument1) {
	var gf = ggui_frames - 1;
	ggui_frame_element_type[    gf,ggui_frame_elements[gf]] = gguielt_CURRSPRITE;
	ggui_frame_element_x[       gf,ggui_frame_elements[gf]] = argument0;
	ggui_frame_element_y[       gf,ggui_frame_elements[gf]] = argument1;
	ggui_frame_element_arrdx[   gf,ggui_frame_elements[gf]] = 0;
	ggui_frame_element_arrdy[   gf,ggui_frame_elements[gf]] = 0;
	ggui_frame_elements[gf]++;
	return ggui_frame_elements[gf] - 1;



}
