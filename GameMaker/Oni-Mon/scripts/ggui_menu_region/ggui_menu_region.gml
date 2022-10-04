///ggui_menu_region(xID,yID,event,l,t,r,b)
function ggui_menu_region(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	//Add a selectable region in last added GUI frame. When selected, it is highlighted with a pulsating white rectangle.
	//Left, top, right, bottom are in percent of frame's size.
	menu_event[argument0,argument1] = argument2;
	menu_reg_l[argument0,argument1] = argument3;
	menu_reg_t[argument0,argument1] = argument4;
	menu_reg_r[argument0,argument1] = argument5;
	menu_reg_b[argument0,argument1] = argument6;
	menu_frame[argument0,argument1] = ggui_frames-1;



}
