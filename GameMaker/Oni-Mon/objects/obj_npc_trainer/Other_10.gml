/// @description Add trainer data for battle!
var mydata = [];
mydata[trainer_NAME]			= tsprintf("% %",global.trainer_data[trainertype,trd_NAME],name)
mydata[trainer_PORTRAITSPRITE]	= global.trainer_data[trainertype,trd_SPRITE]
mydata[trainer_MAPSPRITE]		= sprite_index
mydata[trainer_WINCASH]			= winmoney
mydata[trainer_WINQUOTE]		= my_message_battlewin
mydata[trainer_FLAGCOORDS]		= [room,x,y]
global.encounter_trainer_data[array_length_1d(global.encounter_trainer_data)] = mydata;

for(var c = 0; c < array_length_1d(monsters); c++){
	//Note: monster data is a tuple [monID, level, helditem, move1, move2, move3, move4]
	//The first two are mandatory, the rest are optional. Use NONE for empty values.
	var md  = monsters[c];
	if(array_length_1d(md) > 1){
		var wmi = amp_get_new_enemy_id();
		amp_generate_monster(wmi,md[0],md[1])
		if(array_length_1d(md) > 2){
			global.active_monster_party[wmi,amp_HELDITEM] = md[2]
		}
		if(array_length_1d(md) > 3){
			for(var d = 0; d < min(4,array_length_1d(md)-3); d++){
				amp_monster_override_move(wmi,d,md[3+d])
			}
		}
	}
}