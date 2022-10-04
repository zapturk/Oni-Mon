///gamepad_button_get_icon(gamepadbutton)
function gamepad_button_get_icon(argument0) {
	switch(argument0){
	    // N/A text for unset button
	    case NONE:          return sprite_get_number(spr_buttonicons_gamepad) - 1; 

	    case gp_face1:      return 0;//A
	    case gp_face2:      return 1;//B
	    case gp_face3:      return 2;//X
	    case gp_face4:      return 3;//Y
	    case gp_start:      return 4;
	    case gp_select:     return 5;
	    case gp_shoulderl:  return 6;
	    case gp_shoulderr:  return 7;
	    case gp_shoulderlb: return 8;
	    case gp_shoulderrb: return 9;
    
	    case gp_axislh:     return 10;
	    case gp_axisrh:     return 10;
	    case gp_axislv:     return 10;
	    case gp_axisrv:     return 10;
    
	    case gp_padu:       return 12;
	    case gp_padd:       return 13;
	    case gp_padl:       return 14;
	    case gp_padr:       return 15;
    
	    // Question mark for unrecognized button
	    default: return sprite_get_number(spr_buttonicons_gamepad) - 2;
	}



}
