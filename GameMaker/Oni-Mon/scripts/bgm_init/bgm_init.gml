///bgm_init()
function bgm_init() {
	global.current_bgm = NONE

	global.bgm_volume = 1.00
	global.sfx_volume = 1.00

	//This helps reducing loudness when multiple simultaneous identical SFX are stacked,
	//but may result in sounds not being played.
	audio_channel_num(24)



}
