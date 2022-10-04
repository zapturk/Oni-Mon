///barbs_mpdamage()
function barbs_mpdamage() {
	//a_targ[0]: move to lose MP for
	//a_targ[1]: damage to take
	//a_targ[2]: display string to use for the message

	//Damage
	amp_consume_MP(a_user.amp_id,a_targ[0],a_targ[1])

	//Message about it
	var mystring = a_targ[2];
	battle_message(tsprintf(mystring,a_user.name))


}
