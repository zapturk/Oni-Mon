///mev_nothing()
function mev_nothing() {
	//Completely inert menu event, doesn't even play the "menu event triggered" sound.
	audio_stop_sound(snd_menu_ok)//...because we stop it immediately.


}
