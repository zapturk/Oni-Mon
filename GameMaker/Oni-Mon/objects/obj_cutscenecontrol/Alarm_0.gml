/// @description Proceed!
cutscene_step_current++
if(cutscene_step_current >= cutscene_step_max){
	instance_destroy()
}
else{
	if(cutscene_script[cutscene_step_current] != NONE){
		if(array_equals([],cutscene_argument[cutscene_step_current])){
			script_execute(cutscene_script[cutscene_step_current])
		}
		else{
			script_execute(cutscene_script[cutscene_step_current],cutscene_argument[cutscene_step_current])
		}
	}
}