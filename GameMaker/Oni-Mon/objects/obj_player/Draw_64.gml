/// @description Debug info
if(DEBUG_MODE){
	draw_font_settings(font_debug,c_white,0,0)
	draw_text(0,0,tsprintf("Next Encounter: %",global.steps_to_next_encounter-encounter_steps))
}