///mev_pause_monsters_switch()
function mev_pause_monsters_switch() {
	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
		msh_spawn_monster_list(mev_pause_monsters_switch_confirm)
		menuvalue_y  = other.daddy.menuvalue_y
		original_mon = other.daddy.menuvalue_y
		daddy		 = other.id
	
		//Add currently selected thing using an outlined rectangle made from separators
		ggui_separator_box(
			menu_reg_l[0,menuvalue_y],
			menu_reg_t[0,menuvalue_y],
			menu_reg_r[0,menuvalue_y],
			menu_reg_b[0,menuvalue_y],
		)
	}


}
