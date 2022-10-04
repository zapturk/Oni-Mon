///cis_leader1_beat()
function cis_leader1_beat() {
	csc_init()
	csc_enqueue(cc_message,"Geez, I suppose I've slacked off in my training lately. Fighting you was quite an eye-opener. That style... you've got talent, kid.")
	csc_enqueue(cc_message,"Well, I suppose you want the official League Emblem as proof you beat me, right? Well, here you go! Wear it with pride, buddy!")
	csc_enqueue(cc_obtainbadge,0)
	csc_enqueue(cc_message,tsprintf("% obtained the Mushroom Emblem!",global.player_name))
	csc_enqueue(cc_message,"The Mushroom Emblem is proof you managed to get through Driftwood Forest in one piece! Starting at the bottom, you can only go up from here!")
	csc_enqueue(cc_message,"Well, except this is the end of the demo, so there's nowhere else to go. Good job at beating me, though!")


}
