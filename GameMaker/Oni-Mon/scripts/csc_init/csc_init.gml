///csc_init()
function csc_init() {
	if(!instance_exists(obj_cutscenecontrol)){
		instance_create_depth(0,0,0,obj_cutscenecontrol)
	}
	return obj_cutscenecontrol


}
