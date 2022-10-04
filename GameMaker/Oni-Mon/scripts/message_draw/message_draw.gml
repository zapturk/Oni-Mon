///message_draw()
function message_draw() {
	if(message_active){
		draw_9tile(messagebox_left,messagebox_top,messagebox_left + messagebox_width,messagebox_top + messagebox_height,spr_messagebox,0)
		draw_font_settings(font_mainmsg,c_white,0,0)
		draw_text(messagebox_left+16,messagebox_top+16,drawstring)
		if(message_done){
			draw_sprite(spr_messagecontinuearrow,0,messagebox_left + messagebox_width*0.5,messagebox_top + messagebox_height - 4 + lengthdir_x(4,current_time*0.5))
		}
	}


}
