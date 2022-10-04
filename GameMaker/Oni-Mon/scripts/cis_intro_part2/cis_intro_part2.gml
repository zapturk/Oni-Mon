///cis_intro_part2()
function cis_intro_part2() {
	//This is a separate script since we can't use the player name until they've entered it.
	//(so we can't enqueue messages using it until the player-naming event finishes)
	with(obj_cutscenecontrol){
		instance_destroy()
	}
	csc_init()
	csc_enqueue(cc_message,tsprintf("All right, %! Looking forward to working with you!",global.player_name))
	csc_enqueue(cc_message,"Oh yeah, you should bring a monster for protection. Just a formality, really. Or more of a good luck charm. So which one it'll be?")
	csc_enqueue(cc_intro_startermonsterselect)
	csc_enqueue(cc_intro_startermonsternickname)
	csc_enqueue(cc_message,"You sure about that? Well, I'm sure you'll become good friends. Or a good meal for the local fauna.")
	csc_enqueue(cc_message,"Well, that takes care about the formalities! You go on out there and get your hands on every monster you can find now, mate!")
	csc_enqueue(cc_intro_startgame)


}
