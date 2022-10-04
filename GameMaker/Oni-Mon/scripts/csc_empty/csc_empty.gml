///csc_empty()
function csc_empty() {
	with(obj_cutscenecontrol){
		return cutscene_step_current >= cutscene_step_max;
	}


}
