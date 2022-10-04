///player_step_fill()
function player_step_fill() {
	if(stepdelta >= TILESIZE){
		//Pop counter
		stepdelta -= TILESIZE
	
	
		//Encounter countdown
		if(position_meeting(x,y,parent_encounterzone)){
			encounter_steps++
			if(encounter_steps >= global.steps_to_next_encounter){
				//Time for a random battle!
			
				//Recompute steps for next battle (so we won't infinite-loop battles)
				global.steps_to_next_encounter = irandom_range(global.encounter_step_range[0],global.encounter_step_range[1])
			
				//Generate a random monster and go to the battle
				var mon = global.encounter_valid_monsters[irandom(array_length_1d(global.encounter_valid_monsters)-1)];
				if(mon != NONE){
					//This area has monsters in it!
				
					//Stop the music!
					bgm(NONE)
					sfx(jingle_battle_intro)
				
					//Buffer previous position
					global.load_x			= x
					global.load_y			= y
					global.load_room		= room
					global.load_direction	= drawdir
				
					if(random(1) < global.horde_chance){
						//This battle is a horde encounter!
						global.player_side_monsters		= 2
						global.enemy_side_monsters		= irandom_range(3,5)
						global.encounter_type			= encountertype_HORDE
					
						repeat(global.enemy_side_monsters){
							var mon = global.encounter_valid_monsters[irandom(array_length_1d(global.encounter_valid_monsters)-1)];
							var wmi = amp_get_new_enemy_id();
							amp_generate_monster(wmi,mon,irandom_range(global.encounter_level_range[0],global.encounter_level_range[1]))
						}
					}
					else{
						//This is a single monster!
						global.enemy_side_monsters		= 1
						global.player_side_monsters		= 1
						global.encounter_type			= encountertype_WILD
				
						var wmi = amp_get_new_enemy_id();
						amp_generate_monster(wmi,mon,irandom_range(global.encounter_level_range[0],global.encounter_level_range[1]))
					
					}
				}
				//Things are set up, now change rooms!
				instance_create_depth(x,y,-15500,obj_battletransitioneffect)
			
				room_goto_fade(rm_battle,30)
			}
		}
	}


}
