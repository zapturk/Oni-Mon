///draw_buttonicon(x,y,inputdevice,keyID)
function draw_buttonicon(argument0, argument1, argument2, argument3) {
	//Take care, may override font settings!
	if(argument3 == NONE){
	    draw_sprite(spr_buttonicons_gamepad,sprite_get_number(spr_buttonicons_gamepad) - 1,argument0,argument1)
	}
	else{
	    switch(argument2){
	        case ipdev_GAMEPAD:
	            //Check gamepad
	            draw_sprite(spr_buttonicons_gamepad,gamepad_button_get_icon(argument3),argument0,argument1)
	        break
    
	        case ipdev_KEYBOARD:
	            //Alternate between printed text and icons depending on button
	            draw_sprite(spr_buttonicons_keyboard,0,argument0,argument1)
	            var n = keyboard_key_get_name(argument3);
	            if(is_string(n)){
	                draw_font_settings(font_nfat,c_black,1,1)
	                draw_text(argument0+8,argument1+6,n)
	            }
	            else{
	                draw_sprite(spr_buttoniconsymbols_keyboard,n,argument0,argument1)
	            }
	        break
	    }
	}



}
