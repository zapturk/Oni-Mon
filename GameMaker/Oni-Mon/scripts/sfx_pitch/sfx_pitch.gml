///sfx_pitch(sound,pitch)
function sfx_pitch(argument0, argument1) {
	var n = audio_play_sound(argument0,10,false);
	audio_sound_gain(n,global.sfx_volume,0)
	audio_sound_pitch(n,argument1)
	return n;



}
