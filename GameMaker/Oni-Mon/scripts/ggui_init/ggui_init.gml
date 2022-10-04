///ggui_init()
function ggui_init() {
	//Set up all data for an empty gui system.
	init_keys()
	ggui_frames = 0;
	ggui_halign = fa_left;
	ggui_valign = fa_top;
	ggui_color  = c_white;
	ggui_font   = -1;
	menuvalue_x = 0;
	menuvalue_y = 0;
	drawmenux   = 0;
	drawmenuy   = 0;
	menu_w      = 0;
	menu_h      = 0;
	menu_horizontal = false;
	menu_vertical   = false;
	menu_event [0,0] = NONE;
	menu_sprite[0,0] = NONE;
	menu_image [0,0] = 0;
	menu_text  [0,0] = "";
	menu_desc  [0,0] = "";
	menu_arbtxt[0,0] = ""; //Arbitrary text. Grouped as [texttype,x + y*w] rather than [x,y] since GM doesn't have 3-dimensional arrays at the time of writing this.
	menu_scrollh = false
	menu_scrollv = false
	menu_scrollxsz = 0
	menu_scrollysz = 0
	menu_hwrap = false
	menu_vwrap = false
	menu_creation_cooldown = 5;//Used to prevent "holding button triggers all layers of menu at once" situations
	menu_can_destroy = true;
	menu_added_options_tail = 0;//Used by "menu_add_option" convenience family



}
