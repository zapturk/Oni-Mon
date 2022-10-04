/// @description Reset encounter-counter
encounter_steps = 0
global.steps_to_next_encounter = irandom_range(global.encounter_step_range[0],global.encounter_step_range[1])
global.encounter_zone_setup_id = NONE