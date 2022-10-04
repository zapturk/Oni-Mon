///sfx(sound)
function sfx(argument0) {
	var n = audio_play_sound(argument0,10,false);
	audio_sound_gain(n,global.sfx_volume,0)
	return n;



}
