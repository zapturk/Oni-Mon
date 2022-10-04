/// @description Move Around
global.playtime_steps++

//Read input
get_keys()

if(instance_exists(parent_menu) || instance_exists(obj_cutscenecontrol)){
	exit;//We're paused or interacting with something, stop movement
}

//Pause menu
if(k_st && !p_st){
	with(instance_create_depth(x,y,-14000,obj_gguimenu)){
		ggui_element_text_settings(font_mainmsg,c_white,0,0)
		ggui_frame(0,0,VIEW_W*0.35,VIEW_H*0.75,spr_messagebox)
		ggui_menu_preallocate(1,6)
		ggui_frame_set_scrolling(false,false,1,6,false,true)
		ggui_menu_add_option_text(mev_pause_moncyclopedia,	"MonCyclopedia",	"See the list of all monsters you've encountered during your travels.")
		ggui_menu_add_option_text(mev_pause_monsters,		"Party",			"Arrange your monster party members.")
		ggui_menu_add_option_text(mev_pause_items,			"Inventory",		"Use items.")
		ggui_menu_add_option_text(mev_pause_player,			global.player_name,	"See your status.")
		ggui_menu_add_option_text(mev_pause_save,			"Save",				"Save the game.")
		ggui_menu_add_option_text(mev_cancel,				"Close",			"Close this menu.")
		
		ggui_frame(0,VIEW_H*0.75,VIEW_W*0.35,VIEW_H*0.25,spr_messagebox)
		ggui_element_text_settings(font_n,c_white,0,0)
		ggui_element_desc_current(0.1,0.15)
		
		for(var c = 0;c < menu_h; c++){
			menu_desc[0,c] = string_wrap(menu_desc[0,c],VIEW_W*0.35*0.8)
		}
	}
	exit;//Abort event early to override other actions when pausing
}

//Move around
if(k_u){
	if(character_walkable(x,y - mvspd)){
		y -= mvspd
		stepdelta += mvspd
	}
	drawdir = 90
}
if(k_d){
	if(character_walkable(x,y + mvspd)){
		y += mvspd
		stepdelta += mvspd
	}
	drawdir = 270
}

if(k_l){
	if(character_walkable(x - mvspd,y)){
		x -= mvspd
		stepdelta += mvspd
	}
	drawdir = 180
}
if(k_r){
	if(character_walkable(x + mvspd,y)){
		x += mvspd
		stepdelta += mvspd
	}
	drawdir = 0
}

//Animate, but only when moving
if(x == xprevious && y == yprevious){
	drawimage = 0
}
else{
	drawimage = (drawimage + 0.15) mod 4
}


//Trigger "after a whole step" events when has taken a whole step
player_step_fill()


//Interacting
if(k_a && !p_a){
	var o = collision_circle(
		x + lengthdir_x(TILESIZE,drawdir) - TILESIZE*0.5,
		y + lengthdir_y(TILESIZE,drawdir),
		12,
		parent_interactible,false,true
	)
	if(o > 0 && instance_exists(o)){
		with(o){
			if(object_index == obj_npc || object_is_ancestor(object_index,obj_npc)){
				drawdir = (other.drawdir + 180) mod 360
			}
			if(interact_script != NONE){
				script_execute(interact_script)
			}
		}
	}
}

//Have trainers look for me
with(obj_npc_trainer){
	if(trainer_active){
		event_user(2)
	}
}