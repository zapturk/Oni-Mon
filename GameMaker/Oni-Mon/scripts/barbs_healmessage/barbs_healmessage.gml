///barbs_healmessage()
function barbs_healmessage() {
	//a_targ: display string to use for the message
	//Heals the monster from ailments. Intended to be used as the action announcing them being healed naturally.

	//Message about it
	var mystring = a_targ;
	battle_message(tsprintf(mystring,a_user.name))
	global.active_monster_party[a_user.amp_id,amp_AILMENT] = NONE


}
