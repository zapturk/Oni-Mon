/// @description Set up the encounter!
if(global.encounter_zone_setup_id != other.id){
	global.encounter_zone_setup_id = other.id
	with(other){
		if(my_script != NONE){
			script_execute(my_script)
		}
	}
	//Update step counter to match region
	global.steps_to_next_encounter = irandom_range(global.encounter_step_range[0],global.encounter_step_range[1])
}