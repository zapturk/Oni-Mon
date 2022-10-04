///msh_terminal_update()
function msh_terminal_update() {
	//Reload, but don't reset cursor
	var pvx = menuvalue_x, pvy = menuvalue_y;
	msh_terminal_load_page(global.selected_monster_box)
	menuvalue_x = pvx
	menuvalue_y = pvy


}
