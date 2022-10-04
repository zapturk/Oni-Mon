///keyboard_key_get_name(key)
function keyboard_key_get_name(argument0) {
	//Can return a string (for writeable keys) or a number (for symbol-only like tab/shift; subimage in symbol sprite)
	if(argument0 >= ord("A") && argument0 <= ord("Z")){
	    return chr(argument0)
	}
	else if(argument0 >= ord("0") && argument0 <= ord("9")){
	    return chr(argument0)
	}
	else{
	    switch(argument0){
	        case ord("."):      return "."
	        case ord(","):      return ","
	        case ord("-"):      return "-"
	        case vk_shift:      return 6
	        case vk_lshift:     return 9
	        case vk_rshift:     return 10
	        case vk_control:    return 13
	        case vk_lcontrol:   return 13
	        case vk_rcontrol:   return 13
	        case vk_space:      return 8
	        case vk_alt:        return 14
	        case vk_lalt:       return 14
	        case vk_ralt:       return 14
	        case vk_tab:        return 7
	        case vk_up:         return 1
	        case vk_down:       return 2
	        case vk_left:       return 3
	        case vk_right:      return 4
	        case vk_enter:      return 5
	        case vk_backspace:  return 11
	        case vk_escape:     return 12
	        default:            return " "
	    }
	}



}
