/// @description Draw teh black rectangle
if(alpha > 0){
	draw_set_alpha(alpha)
	draw_set_color(my_color)
	draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false)
	draw_set_alpha(1)
}