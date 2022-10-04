///mev_intro_starterselect()
function mev_intro_starterselect() {
	n = msh_areyousure(mev_intro_starterselect_confirm,"Pick this monster as your starter.")
	n.my_monster = my_monster[menuvalue_x]
	n.daddy = id


}
