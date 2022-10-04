///mev_shrine_rename()
function mev_shrine_rename() {
	var amp = AMP_FIRST_ACTIVE + menuvalue_y;
	var monid = global.active_monster_party[amp,amp_MONID]

	//Won't need me anymore
	instance_destroy()

	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
		my_monster = amp
		msh_spawn_namingmenu(mev_nameentry_confirm_monster,global.monster_data[monid,mond_SPRITE_BATTLE],tsprintf("%'s nickname?",global.monster_data[monid,mond_NAME]))
	
		//Read old nickname as default string
		ggui_frame_element_string[name_entry_string_frame,name_entry_string_elm] = global.active_monster_party[amp,amp_NICKNAME]
	}


}
