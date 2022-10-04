///msh_spawn_terminal()
function msh_spawn_terminal() {
	grabbing = false

#macro terminalpage_PARTY 0
#macro terminalpage_BOXSELECT 1
#macro terminalpage_BOX 2

	terminalpage = terminalpage_BOX

	msh_terminal_load_page(global.selected_monster_box)
	menuvalue_x = 3
	menuvalue_y = 0

	//Set up grabby-hand coordinates
	ghx = menu_reg_l[menuvalue_x,menuvalue_y]
	ghy = menu_reg_t[menuvalue_x,menuvalue_y]
	dghx= ghx
	dghy= ghy


	//HACK: since the enemy-party data is only used in battle and we aren't supposed to bring up a terminal in battle,
	//let's use the enemy-party data as a clipboard when we move monsters around.
#macro AMP_CLIPBOARD (AMP_FIRST_ENEMY)
	grabbed_original_amp = NONE
#macro terminal_AMP_GRABBED_FROM_PARTY -1


}
