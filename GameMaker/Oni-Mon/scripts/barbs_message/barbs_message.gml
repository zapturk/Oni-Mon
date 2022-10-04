///barbs_message()
function barbs_message() {
	//a_targ: display string to use for the message

	//Message about it
	var mystring = a_targ;
	battle_message(tsprintf(mystring,a_user.name))


}
