///cis_shrine_talk()
function cis_shrine_talk() {
	csc_init()
	switch(room){
		case rm_town1_indoors:
			csc_enqueue(cc_message,"This settlement isn't even a year old yet. Hard to believe, isn't it? But with the power of monsters, we can achieve great things!")
			csc_enqueue(cc_message,"We've got the professor to thank for a lot. Her team finds new species of monsters every day on this continent.")
			csc_enqueue(cc_message,"It's gonna be interesting to see what you'll uncover, new guy. No pressure. We're all rooting for you! Except Wally, I guess.")
		break
	
		default:
			csc_enqueue(cc_message,"This town? I'm new here, I don't know anything interesting about it. That's the drawback of being a pilgrim, I suppose.")
		break
	}


}
