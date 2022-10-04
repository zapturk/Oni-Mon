///bgm(music)
function bgm(argument0) {
	var n;
	if(global.current_bgm != NONE){
	    if(audio_is_playing(global.current_bgm)){
	        if(global.current_bgm == argument0){
	            //Already playing, just retweak volume
	            audio_sound_gain(global.current_bgm,global.bgm_volume,0)
	            exit
	        }
	        audio_stop_sound(global.current_bgm)
	    }
	}

	//Music now is officially changed!
	global.current_bgm = argument0

	//If not NONE (stop), then play it with correct volume
	if(argument0 != NONE){
	    n = audio_play_sound(argument0,5000,true)
	    audio_sound_gain(n,global.bgm_volume,0)
	}



}
