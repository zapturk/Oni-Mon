///message_init()
function message_init() {
	//Sets up message system's necessary variables.
	drawstring  = ""
	drawchars   = 0
	fullstring  = ""
	message_active = false
	message_done   = false
	message_cooldown = 0

	messagebox_width =  VIEW_W*0.75
	if(object_index == obj_battlecontrol){
		//HACK: battlecontrol needs smaller messages, or too much screen estate is wasted. Let's hardcode this difference for now.
		messagebox_height=  VIEW_H*0.25
	}
	else{
		messagebox_height=  VIEW_H*0.35
	}
	messagebox_left  = (VIEW_W- messagebox_width)*0.5
	messagebox_top   =  VIEW_H- messagebox_height


}
