///mev_intro_starterselect_confirm()
function mev_intro_starterselect_confirm() {
	var amp = amp_get_new_party_id();
	amp_generate_monster(amp,my_monster,15)
	msh_recompute_seencaught()//Add the new monster to the list at once
	instance_destroy()
	instance_destroy(daddy)
	csc_proceed()


}
