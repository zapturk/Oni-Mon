/// @description Setup global data

//Setup macros
init_constants()

//Database
init_types()
init_monsters()
init_moves()
init_items()

//Player, inventory, flag, and Active Monster Party data
init_player_data()
init_party()

//Overworld data
init_encounter_data()

//Misc systems
bgm_init()
init_input()
display_set_gui_size(room_width,room_height)


//Final setup stuff
init_default_finishing_touches()

//When done, proceed to title screen!
room_goto_next()