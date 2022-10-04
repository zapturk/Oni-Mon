///init_party()
function init_party() {

	//Preallocate monster data
	var c;
	for(c = PARTYSIZE_ACTIVE + PARTYSIZE_BOXED + PARTYSIZE_MAX_ENEMY; c >= 0; c--){
		amp_clear_monster(c)
	}

	//Special data
	global.pending_evolutions_queue = ds_queue_create()


}
