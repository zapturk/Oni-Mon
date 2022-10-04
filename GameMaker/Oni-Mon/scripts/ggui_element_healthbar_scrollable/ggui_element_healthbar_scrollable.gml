///ggui_element_healthbar_scrollable(x,y,arraydx,ady,w)
function ggui_element_healthbar_scrollable(argument0, argument1, argument2, argument3, argument4) {
	//Requires menu_first_monster variable to be present, draws healthbar of currently selected monster.
	var gf = ggui_frames - 1;
	ggui_frame_element_type[    gf,ggui_frame_elements[gf]] = gguielt_SCHEALTHBAR;
	ggui_frame_element_x[       gf,ggui_frame_elements[gf]] = argument0;
	ggui_frame_element_y[       gf,ggui_frame_elements[gf]] = argument1;
	ggui_frame_element_arrdx[   gf,ggui_frame_elements[gf]] = argument2;
	ggui_frame_element_arrdy[   gf,ggui_frame_elements[gf]] = argument3;
	ggui_frame_element_halign[  gf,ggui_frame_elements[gf]] = argument4;//Hack: reuse variable for different purpose (totalwidth)
	ggui_frame_elements[gf]++;
	return ggui_frame_elements[gf] - 1;



}
