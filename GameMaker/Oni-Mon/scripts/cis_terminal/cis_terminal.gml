///cis_terminal()
function cis_terminal() {
	sfx(snd_terminal)
	image_speed = 1
	csc_init()
	csc_enqueue(cc_delay,60)//Wait for effect to end
	csc_enqueue(cc_terminal)


}
