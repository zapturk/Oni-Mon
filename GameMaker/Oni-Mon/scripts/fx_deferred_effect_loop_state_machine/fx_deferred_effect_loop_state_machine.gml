///fx_deferred_effect_loop_state_machine()
function fx_deferred_effect_loop_state_machine() {
	switch(state){
		case 0:
			current_target = 0;
			state++
			cntr = 0
		break
	
		case 1://Step
			cntr--
			if(!cntr){
				if(current_target >= array_length_1d(target)){
					instance_destroy()
				}
				else{
					cntr = 30
					with(target[current_target]){
						with(other){
							event_user(0)
						}
					}
					current_target++
				}
			}
		break
	}



}
