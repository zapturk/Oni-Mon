/// @description Init
ggui_init()
init_keys()
get_keys()//Get once so that held keys won't instantly trigger press-but-not-held

script_draw    = NONE
script_drawgui = NONE
script_destroy = NONE
script_step    = NONE
script_change  = NONE

//Priority system so only 1 menu may be active at once
active = 2
with(parent_menu){
	active--
}