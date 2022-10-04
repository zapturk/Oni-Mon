///cis_intro_part1()
function cis_intro_part1() {
	csc_init()
	csc_enqueue(cc_message,"Howdy, mate! Welcome to the world of monsters! Name's Professor Rosmerta Basalt, but just Baz is fine. |||That's 'Professor Baz' to you.")
	csc_enqueue(cc_message,"This might just be a short demo, but you'll see how our world has at least a couple dozens of the little buggers!")
	csc_enqueue(cc_message,"Some hide from them, some eat them, but I know you kids are all into CAPTURING monsters and have them duke it out with each other!")
	csc_enqueue(cc_message,"So that brings me to the point with this job. |||You know how this continent is new and unexplored? |That means there's tons of new unexplored monster species!")
	csc_enqueue(cc_message,"We gotta get every species properly classified n' stuff. Lots of paperwork and probing and stuff. That's my job.")
	csc_enqueue(cc_message,"What I want you to do is go out there and catch 'em all! Can't work if I don't get samples to work on, can I?")
	csc_enqueue(cc_message,"Just hoping you'll do a better job than my previous field assistant. Wasn't even enough corpse left of the poor bastard to bury properly.")
	csc_enqueue(cc_message,"Still interested? You're a brave one, huh.||| So what's your name? Gotta know what to put on your tombstone, I mean.")
	csc_enqueue(cc_intro_playernameentry)
	csc_enqueue(cis_intro_part2)


}
