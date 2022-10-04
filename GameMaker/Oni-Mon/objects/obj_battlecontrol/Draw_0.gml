/// @description Draw controlly things

//Reset alpha
draw_set_alpha(1)

//Draw messagebox and stuff at bottom
//A simple background. Feel free to replace with a sprite texture if it's too boring.
draw_rectangle_color(0,messagebox_top,room_width,room_height,c_blue,c_blue,c_black,c_black,false)
//Draw active message, if any.
message_draw()


if(DEBUG_MODE){
	draw_font_settings(font_debug,c_white,0,0)
	draw_text(0,0,tsprintf("State: %\nSubSt: %\nCntr:  %",state,substate,cntr))
}