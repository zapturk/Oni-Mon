///csc_enqueue(script,[argray])
function csc_enqueue() {
	with(obj_cutscenecontrol){
		if(argument_count > 0){
			cutscene_script[cutscene_step_max]		= argument[0]
		}
		else{
			cutscene_script[cutscene_step_max]		= NONE
		}
		if(argument_count > 1){
			if(is_array(argument[1])){
				cutscene_argument[cutscene_step_max]	= argument[1]
			}
			else{
				cutscene_argument[cutscene_step_max]	= [argument[1]]
			}
		
		}
		else{
			cutscene_argument[cutscene_step_max]	= []
		}
		cutscene_step_max++
	}


}
