/// @description Iniherit
event_inherited()
if(autoflags_get(room,x,y) == NONE){
	//Not fought yet! Override.
	trainer_active = true
	if(interact_script == cis_npc_polyliner){
		//Don't override if we've manually set the variable to a non-default value.
		//(This allows us to have boss trainers use special events with more pre-battle dialogue)
		//HACK: since there's no "variable_is_overridden" function we manually check if the value is the default.
		interact_script = cis_trainer_trigger
	}
	if(DEBUG_MODE){
		show_debug_message(tsprintf("Active trainer at %,%",x,y))
	}
}
else{
	//Fought already, be docile.
	trainer_active = false
	if(DEBUG_MODE){
		show_debug_message(tsprintf("Defeated trainer at %,%",x,y))
	}
}

//Automatically read sprite from trainer type
my_sprite = global.trainer_data[trainertype,trd_MAPSPRITE]