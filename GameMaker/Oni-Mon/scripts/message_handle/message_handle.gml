///message_handle()
function message_handle() {
	//Note that it relies on get_keys(), but doesn't call it directly.
	if(message_done){
		//Fully typed out, wait for closing it
		if(k_a && !p_a && message_active){
			//Player pressed a key to close the message
			message_active = false
		}
	}
	else if(message_cooldown){
		//Do nothing, just cool down a bit.
		message_cooldown--
	}
	else{
		//Copy next char and see if it's a control character
		for(var c = 0; c < 2 + 2*k_a; c++){
			drawchars++
			var s = string_char_at(fullstring,drawchars);
			switch(s){
				case "|":
					//Pipe character: temporary pause (useful for dramatic effect)
					message_cooldown += 10;
					c = 99999;//Break the outer loop instantly (to prevent bug where next letter was read before the pause took effect)
				break
				
				default:
					//It wasn't a special character: just pass it on to the draw string.
					drawstring += s;
				break
			}
		
			//Check for message completion
			if(drawchars >= string_length(fullstring)){
				message_done = true
				break//No point in looping further
			}
		}
	}


}
