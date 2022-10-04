///init_encounter_data()
function init_encounter_data() {

	//Random encounter data
#macro encountertype_WILD 0
#macro encountertype_TRAINER 1
#macro encountertype_HORDE 2
	global.encounter_level_range    = [1, 5]
	global.encounter_valid_monsters = [NONE]
	global.encounter_step_range     = [9999, 9999]
	global.steps_to_next_encounter  = 9999
	global.encounter_type           = encountertype_WILD
	global.horde_chance             = 0.00

	global.encounter_zone_setup_id  = NONE

	//Trainer encounter data: array of trainers
	global.encounter_trainer_data   = []

	//Misc
	global.player_side_monsters		= 1
	global.enemy_side_monsters		= 1


}
