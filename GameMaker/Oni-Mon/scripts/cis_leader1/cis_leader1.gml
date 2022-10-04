///cis_example_leader1()
function cis_leader1() {
	if(global.player_badges[0]){
		csc_init()
		csc_enqueue(cc_message,"The Mushroom Emblem is proof you managed to get through Driftwood Forest in one piece! Starting at the bottom, you can only go up from here!")
		csc_enqueue(cc_message,"Well, except this is the end of the demo, so there's nowhere else to go. Good job at beating me, though!")
	}
	else{
		event_user(0)
		global.battle_is_boss = true
		global.after_battle_event = cis_leader1_beat
		csc_init()
		csc_enqueue(cc_message,"Welcome, challenger!")
		csc_enqueue(cc_message,"I'm the official league master, Fielder! Holder of the Mushroom Badge, the undisputed master of the Plant type!")
		csc_enqueue(cc_message,"We might not even have a building yet, but the forest is home to us hikers anyway! We're hardened by cold winds and uneven terrain! No one can stand up to our power!")
		csc_enqueue(cc_message,"Think you have what it takes to beat me? Well, you'll find out first-hand soon enough!")
		csc_enqueue(cc_battlestart_trainer)
	}


}
