///cis_npc_polyliner()
function cis_npc_polyliner() {
	csc_init()
	for(var c = 0;c < array_length_1d(my_messages);c++){
		csc_enqueue(cc_message,my_messages[c])
	}


}
