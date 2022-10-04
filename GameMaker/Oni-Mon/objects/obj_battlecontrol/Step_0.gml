/// @description Battle Control Flow

//Variables update
get_keys()
global.playtime_steps++

#region Message-handling logic
if(message_active){
	//Standard logic
	message_handle()
}
else{
	//Get a new message!
	if(!battle_messages_empty()){
		draw_font_settings(font_mainmsg,c_white,0,0)
		fullstring = string_wrap(battle_messages_pop(),messagebox_width*0.9)
		drawstring = ""
		drawchars  = 0
		message_active = true
		message_done   = false
	}
}
#endregion

#region Main state machine
switch(state){
	#region Set Up Objects
	case ctst_SETUP:
		//Create necessary objects
		var cx, cy, dx, dy, c,
		d_player = 1000, d_enemy = 2000,	//Player is closer to the top, so needs a lower depth.
		d_gui = -100,
		p_player = 1000, p_enemy = 0,		//Let enemies act first, so they won't cheat and use info about player's action for e.g. swaps.
		trainerblob;
		
		//Friendly
		cx = room_width*0.30
		cy = room_height*0.6
		dx = (room_width*0.25)/global.player_side_monsters
		dy = 16
		n = instance_create_depth(cx,cy,d_player + 100,obj_battlemonstercircle)
		n.image_xscale = global.player_side_monsters
		n.image_angle  = -10
		var frens = battle_get_valid_reinforcements(AMP_FIRST_ACTIVE,PARTYSIZE_ACTIVE)
		for(c = 0; c < global.player_side_monsters; c++){
			n = instance_create_depth(cx - dx*0.5*(global.player_side_monsters-1) + c*dx,cy - (global.player_side_monsters*0.5 - c)*dy,d_player-c,obj_battlemonster)
			n.side = side_PLAYER
			n.combat_turn_priority = p_player + c;
			if(c < array_length_1d(frens)){
				n.amp_id		= frens[c];
				n.name			= monster_get_name(n.amp_id)
				n.sprite_index	= monster_get_battlesprite(n.amp_id)
			}
			else{
				n.state = bmonsterstate_DEAD
			}
			n.drawscale = 1;
			n.ordering_number = c
			
			
			m = instance_create_depth(cx,cy,d_gui,obj_battlemonsterhud)
			m.monster = n
			m.fullhp  = true
			m.xscale  = -1
			m.deltax  = cx*0.65
			m.deltay  = (c - global.player_side_monsters)
		}
		instance_create_depth(cx,messagebox_top,d_player,obj_battleplayer)
		
		//Enemy
		cx = room_width*0.70
		cy = room_height*0.5
		dx = (room_width*0.35)/global.enemy_side_monsters
		dy = 10
		n = instance_create_depth(cx,cy,d_enemy + 100,obj_battlemonstercircle)
		n.image_xscale = global.enemy_side_monsters
		n.image_angle  = -10
		var foes = battle_get_valid_reinforcements(AMP_FIRST_ENEMY,PARTYSIZE_MAX_ENEMY)
		for(c = 0; c < global.enemy_side_monsters; c++){
			n = instance_create_depth(cx - dx*0.5*(global.enemy_side_monsters-1) + c*dx,cy - (global.enemy_side_monsters*0.5 - c)*dy,d_enemy-c,obj_battlemonster)
			n.side = side_ENEMY
			n.combat_turn_priority = p_enemy + c;
			if(c < array_length_1d(foes)){
				n.amp_id		= foes[c];
				n.name			= monster_get_name(n.amp_id)
				n.sprite_index	= monster_get_battlesprite(n.amp_id)
			}
			else{
				n.state = bmonsterstate_DEAD
			}
			n.drawscale = -1;
			n.ordering_number = c
			
			
			m = instance_create_depth(cx,cy,d_gui,obj_battlemonsterhud)
			m.monster = n
			m.fullhp  = false
			m.xscale  = 1
			m.deltax  = (room_width - cx)*0.65
			m.deltay  = (c - global.enemy_side_monsters)
			
			//If wild monster, have it be instantly summoned
			if(
				global.encounter_type == encountertype_WILD ||
				global.encounter_type == encountertype_HORDE
			){
				n.state = bmonsterstate_NORMAL
				
				//Manually register it as seen since it bypasses the normal emerge state
				var montype = global.active_monster_party[n.amp_id,amp_MONID];
				if(montype != NONE){
					global.monsters_seen[montype] = true
				}
			}
		}
		//Enemy trainers, too!
		if(global.encounter_type == encountertype_TRAINER){
			for(c = 0; c < array_length_1d(global.encounter_trainer_data); c++){
				trainerblob = global.encounter_trainer_data[c]
				n = instance_create_depth(cx + dx*0.5*(global.enemy_side_monsters-1) - c*dx,cy,d_enemy,obj_battleenemytrainer)
				n.trainer_prio	= c
				n.name			= trainerblob[trainer_NAME]
				n.winquote		= trainerblob[trainer_WINQUOTE]
				n.prizemoney    = trainerblob[trainer_WINCASH]
				n.sprite_index	= trainerblob[trainer_PORTRAITSPRITE]
			}
		}
		
		//Announce enemy
		state    = ctst_ANNOUNCEENEMY
		substate = 0
	break
	#endregion
	
	#region Announce Enemy
	case ctst_ANNOUNCEENEMY:
		switch(substate){
			case 0://Setup announcement
				switch(global.encounter_type){
					case encountertype_WILD:
						battle_message(tsprintf("A feral % attacks!",battle_get_monster_name(side_ENEMY,0)))
						substate = bcontrolstate_ANNOUNCE_MONSTER
					break
					
					case encountertype_TRAINER:
						var str = "% challenged you to a battle!";
						for(var c = 0; c < array_length_1d(global.encounter_trainer_data); c++){
							var tr = global.encounter_trainer_data[c];
							if(c == 0){
								//First!
								str = string_replace(str,"%",tr[trainer_NAME] + "%")
							}
							else if(c == array_length_1d(global.encounter_trainer_data) - 1){
								//Last!
								str = string_replace(str,"%"," and " + tr[trainer_NAME])
							}
							else{
								str = string_replace(str,"%",", " + tr[trainer_NAME] + "%")
							}
						}
						str = string_replace(str,"%","")
						battle_message(str);
						substate = bcontrolstate_ANNOUNCE_TRAINER
					break
					
					case encountertype_HORDE:
						battle_message(tsprintf("A horde of feral %s emerges!",battle_get_monster_name(side_ENEMY,0)))
						substate = bcontrolstate_ANNOUNCE_MONSTER
					break
				}
			break
			
			#macro bcontrolstate_ANNOUNCE_TRAINER 10
			case 10://Trainer: slide out of view, summon monsters
				if(!message_active){
					substate++
					
					with(obj_battleenemytrainer){
						state = btrainerstate_LEAVESCREEN;
						cntr  = (instance_number(obj_battleenemytrainer) - trainer_prio)*60
					}
				}
			break
			
			case 11://Trainer: engage summon monsters animation
				//Check that all trainers are offscreen
				var isdone = true;
				with(obj_battleenemytrainer){
					if(state == btrainerstate_LEAVESCREEN){
						isdone = false
					}
				}
				
				//If they are, summon monsters!
				if(isdone){
					var str = "";
					with(obj_battlemonster){
						if(side == side_ENEMY && state != bmonsterstate_DEAD){
							state = bmonsterstate_EMERGE
							cntr  = 30 + ordering_number*30
							str += tsprintf("% was summoned!\n",name)
						}
					}
					battle_message(str)
					substate = bcontrolstate_ANNOUNCE_MONSTER
				}
			break
			
			#macro bcontrolstate_ANNOUNCE_MONSTER 20
			case 20://Monster: pop up
				if(!message_active){
					//Check that monsters finished popping up!
					var isdone = true;
					with(obj_battlemonster){
						if(side == side_ENEMY && (state != bmonsterstate_NORMAL && state != bmonsterstate_DEAD)){
							isdone = false
						}
					}
					
					//If they are, it's the player's turn!
					if(isdone){
						substate = bcontrolstate_ANNOUNCE_PLAYER
					}
				}
			break
			
			
			#macro bcontrolstate_ANNOUNCE_PLAYER 100
			case 100://Setup slide
				with(obj_battleplayer){
					state = bplayerstate_LEAVESCREEN
				}
				substate++
			break
			
			case 101://Player: slide offscreen and summon monster
				var isdone = true;
				with(obj_battleplayer){
					if(state == bplayerstate_LEAVESCREEN){
						isdone = false
					}
				}
				
				if(isdone){
					substate++
				}
			break
			
			case 102://I choose you! Whoever you are!
				var str = "";
				var cheer = ["%, I choose you!","Go get'em, %!","%! You can do it!","Time to rock, %!","Go, %! I choose you!","Don't let me down, %!","Looks like a job for you, %!","Time to shine, %!","It's % time!"]
				with(obj_battlemonster){
					if(side == side_PLAYER && state != bmonsterstate_DEAD){
						var mycheer = cheer[irandom(array_length_1d(cheer)-1)];
						str += tsprintf(mycheer,name) + "\n"
						state = bmonsterstate_EMERGE
					}
				}
				battle_message(str)
				substate++
			break
			
			case 103://Wait for emerge-ncy.
				var isdone = true;
				//Make sure all monsters are summoned
				with(obj_battlemonster){
					if(side == side_PLAYER && state != bmonsterstate_DEAD){
						if(state == bmonsterstate_EMERGE){
							isdone = false
						}
					}
				}
				//Also make sure the message is closed
				if(message_active){
					isdone = false
				}
				
				if(isdone){
					//Proceed to the next major state!
					state    = ctst_ACTIONSELECT
					substate = 0
				}
			break
		}
	break
	#endregion
	
	#region Take Input On Actions
	case ctst_ACTIONSELECT:
		switch(substate){
			case 0://Setup
				var pq = ds_priority_create();
				action_order_queue = []
				selected_actions = []
				action_order_current = -1
				action_order_max = 0
				action_monster = NONE
				action_proceed = true
				with(obj_battlemonster){
					ds_priority_add(pq,id,combat_turn_priority)
				}
				while(!ds_priority_empty(pq)){
					var next = ds_priority_delete_min(pq);
					action_order_queue[action_order_max] = next
					action_order_max++
				}
				ds_priority_destroy(pq)
				
				substate++
			break
			
			#macro bcontrolstate_ACTIONSELECT_STEP 1
			case 1://Go through queue
				action_order_current++
				if(action_order_current >= action_order_max){
					substate = bcontrolstate_ACTIONSELECT_END
				}
				else{
					if(DEBUG_MODE){
						show_debug_message(tsprintf("Turn %: obj  %",action_order_current,action_order_queue[action_order_current]))
					}
					var next = action_order_queue[action_order_current]
					if(instance_exists(next)){
						if(next.state == bmonsterstate_NORMAL){
							action_monster = next
							//Check if inflicted by an ailment that bypasses action input altogether
							switch(amp_read_var(next.amp_id,amp_AILMENT)){
								case ailment_STUN:
									//Stunning makes you skip one turn and then auto-heals.
									action_slate(action_monster,"% is stunned! It can't move!",battleaction_ARBSCRIPT,barbs_healmessage,monster_get_spd(action_monster.amp_id))
								break
								
								default:
									//Most ailments don't bypass action input, so let's go do that.
									if(next.side == side_PLAYER){
										substate = bcontrolstate_ACTIONSELECT_PLAYER
									}
									else{
										substate = bcontrolstate_ACTIONSELECT_ENEMY
									}
								break
							}
						}
						else{
							//If there's nobody here that can add actions, add a null action.
							selected_actions[action_order_current] = NONE;
						}
					}
					else{
						//If there's nobody here that can add actions, add a null action.
						selected_actions[action_order_current] = NONE;
					}
				}
			break
			
			#macro bcontrolstate_ACTIONSELECT_PLAYER 10
			case 10://Player phase: setup menu for this monster
				action_proceed = true
				with(instance_create_depth(messagebox_left,messagebox_top,depth,obj_gguimenu)){
					var fw = room_width*0.5;
					ggui_frame(room_width-fw,other.messagebox_top,fw,other.messagebox_height,spr_messagebox)
					ggui_menu_preallocate(2,2)
					ggui_element_text_settings(font_mainmsg,c_white,0,0)
					ggui_menu_add_option_text(mev_battle_attack,	"Fight",	"Attack with one of your moves.")
					ggui_menu_add_option_text(mev_battle_mons,		"Oni",		"Switch Oni.")
					ggui_menu_add_option_text(mev_battle_item,		"Item",		"Use an item.")
					ggui_menu_add_option_text(mev_battle_escape,	"Run",		"Run away from battle.")
					ggui_element_text_settings(font_mainmsg,c_white,0,0)
					ggui_element_text(-ggui_frame_get_coord_x((room_width-fw)-24),0.15,string_wrap(tsprintf("What should % do?",other.action_monster.name),fw))
					script_destroy = mev_battle_canceltoprevious
				}
				substate++
			break
			
			case 11://Player phase: wait for menu
				if(instance_number(parent_menu) == 0){
					if(action_proceed){
						//Go to next action
						substate = bcontrolstate_ACTIONSELECT_STEP
					}
					else{
						//Back off towards previous monster, unless already at the start.
						if(action_order_current >= 0){
							action_order_current = max(-1,action_order_current - 2)//Since stepped up by 1, needs to reduce by 2 to actually go back once.
						}
						substate = bcontrolstate_ACTIONSELECT_STEP
					}
				}
			break
			
			
			
			#macro bcontrolstate_ACTIONSELECT_ENEMY 20
			case 20://Enemy phase: setup action for this monster
				
				var mvlist = ds_list_create(), mv;
				for(var c = 0; c < MONSTER_MAX_NUMBER_OF_MOVES; c++){
					mv = amp_read_var(obj_battlecontrol.action_monster.amp_id,amp_MOVE1 + c);
					if(mv != NONE){
						if(amp_read_var(obj_battlecontrol.action_monster.amp_id,amp_MOVE1_MP + c) > 0){
							ds_list_add(mvlist,mv)
						}
					}
				}
				
				if(!ds_list_empty(mvlist)){
					ds_list_shuffle(mvlist)
					mv = mvlist[| 0]
				}
				else{
					mv = move_STRUGGLE
				}
				
				action_slate(
					action_monster,
					battle_get_random_targets(action_monster,mv),
					battleaction_ATTACK,
					mv,
					monster_get_spd(action_monster.amp_id)
				)
				
				substate = bcontrolstate_ACTIONSELECT_STEP
			break
			
			
			
			#macro bcontrolstate_ACTIONSELECT_END 30
			case 30://Enemy phase end, proceed to turn queue
				for(var c = 0; c < array_length_1d(selected_actions); c++){
					var ac = selected_actions[c];
					if(is_array(ac)){
						
						//Check if item has an effect on the attack
						if(battle_item_might_affect_this(ac[battleaction_COMM_USER].amp_id,itemvalidflag_AUTO_SLATEENQUEUE)){
							var it = amp_read_var(ac[battleaction_COMM_USER].amp_id,amp_HELDITEM)
							ac = script_execute(
								global.item_data[it,id_USESCRIPT],
								[
								ac[battleaction_COMM_USER],
								ac[battleaction_COMM_TARGET],
								ac[battleaction_COMM_TYPE],
								ac[battleaction_COMM_COMMAND],
								ac[battleaction_COMM_SPEEDPRIO]
								],
								global.item_data[it,id_USEARG]
							)
						}
						
						//Check if ailment has an effect on the attack
						switch(amp_read_var(ac[battleaction_COMM_USER].amp_id,amp_AILMENT)){
							case ailment_PARALYZ:
								if(ac[battleaction_COMM_SPEEDPRIO] < BATTLEACTION_SPEEDBONUS_ITEM){
									//Only slow down / override attacks, not other actions
									ac[battleaction_COMM_SPEEDPRIO] = floor(ac[battleaction_COMM_SPEEDPRIO]*0.25)
									
									if(irandom(1) < 0.25){
										//Fully paralyzed! Skip action.
										ac[battleaction_COMM_TARGET]	= "% is fully paralyzed! It can't move!"
										ac[battleaction_COMM_TYPE]		= battleaction_ARBSCRIPT
										ac[battleaction_COMM_COMMAND]	= barbs_message
									}
								}
							break
						}
						
						//Finally, enqueue the action (which might have been changed on the way by items and ailments)
						action_enqueue(
							ac[battleaction_COMM_USER],
							ac[battleaction_COMM_TARGET],
							ac[battleaction_COMM_TYPE],
							ac[battleaction_COMM_COMMAND],
							ac[battleaction_COMM_SPEEDPRIO]
						)
					}
				}
				state    = ctst_TURNQUEUE
				substate = 0
			break
		}
	break
	#endregion
	
	#region Reinforcements When Monsters are Dead at Start of the Turn
	case ctst_REINFORCEMENTS:
		switch(substate){
			case 0://Setup
				rein_pq = ds_priority_create()
				action_monster = NONE
				with(obj_battlemonster){
					if(!battle_is_alive(id)){
						ds_priority_add(other.rein_pq,id,combat_turn_priority)
					}
				}
				substate++
			break
			
			#macro bcontrolstate_REIN_STEP 1
			case 1://Chew through queue
				if(ds_priority_empty(rein_pq)){
					substate = bcontrolstate_REIN_DONE
				}
				else{
					action_monster = ds_priority_delete_max(rein_pq)//Need to use action_monster specifically to be able to reuse mev_battle_mons_select's children
					if(action_monster.side == side_PLAYER){
						substate = bcontrolstate_REIN_HUMAN
					}
					else{
						substate = bcontrolstate_REIN_NPC
					}
				}
			break
			
			#macro bcontrolstate_REIN_HUMAN 10
			case 10://Human - spawn menu (if any monsters left)
				var rein = battle_get_valid_reinforcements(AMP_FIRST_ACTIVE,PARTYSIZE_ACTIVE);
				if(array_length_1d(rein) > 0){
					with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
						msh_spawn_monster_list(mev_battle_mons_select_reinforcement)
						menu_can_destroy = false
					}
					substate++
				}
				else{
					//Nothing to be done for this monster, there's nobody to send out in its place
					substate = bcontrolstate_REIN_STEP
				}
			break
			
			case 11://Wait for menu input
				if(!instance_exists(parent_menu)){
					//The menu engaged the switch on its own, we can just proceed.
					substate++
				}
			break
			
			case 12://Wait for monsters
				var rrok = true;
				with(obj_battlemonster){
					if(state != bmonsterstate_NORMAL && state != bmonsterstate_DEAD){
						rrok = false
						break
					}
				}
				if(!battle_messages_empty()){
					rrok = false
				}
				if(rrok){
					substate = bcontrolstate_REIN_STEP
				}
			break
			
			
			
			#macro bcontrolstate_REIN_NPC 20
			case 20://NPC - decide and spawn (if any monsters left)
				var rein = battle_get_valid_reinforcements(AMP_FIRST_ENEMY,PARTYSIZE_MAX_ENEMY);
				if(array_length_1d(rein) > 0){
					//Pick and instantly summon a random enemy
					action_monster.state = bmonsterstate_SWITCH
					action_monster.switch_mon = rein[irandom_range(0,array_length_1d(rein) - 1)]
								
					n = instance_create_depth(x,y,0,obj_battleswitcher)
					n.my_monobj = action_monster
					
					battle_message(tsprintf("Enemy % was summoned!",amp_get_monster_name(action_monster.switch_mon)))
					
					//Proceed to wait for effect to end
					substate++
				}
				else{
					//Nothing to be done for this monster, there's nobody to send out in its place
					substate = bcontrolstate_REIN_STEP
				}
			break
			
			case 21://Wait for monsters
				var rrok = true;
				with(obj_battlemonster){
					if(state != bmonsterstate_NORMAL && state != bmonsterstate_DEAD){
						rrok = false
						break
					}
				}
				if(!battle_messages_empty()){
					rrok = false
				}
				if(rrok){
					substate = bcontrolstate_REIN_STEP
				}
			break
			
			
			
			#macro bcontrolstate_REIN_DONE 30
			case 30://Cleanup Done
				ds_priority_destroy(rein_pq)
				state		= ctst_ACTIONSELECT
				substate	= 0
			break
		}
	break
	#endregion
	
	#region Main Action Queue
	case ctst_TURNQUEUE:
		//Try to read queue
		if(battle_messages_empty() && instance_number(parent_battleturn) == 0){
			//Okay, all text and effects is done... NOW we can proceed!
			
			//Setup defaults
			a_user = NONE
			a_targ = []
			a_type = NONE
			a_comm = NONE
			
			if(battle_player_defeated()){
				//Game over!
				state		= ctst_PLAYERLOSE
				substate	= 0
			}
			else if(battle_enemy_defeated()){
				//Victory!
				state		= ctst_PLAYERWIN
				substate	= 0
			}
			else{
				var ac = action_pop();
				if(is_undefined(ac)){
					//We ran out of actions! This turn is over.
					state		= ctst_REINFORCEMENTS
					substate	= 0
				}
				else{
					a_user = ac[battleaction_COMM_USER]
					a_targ = ac[battleaction_COMM_TARGET]
					a_type = ac[battleaction_COMM_TYPE]
					a_comm = ac[battleaction_COMM_COMMAND];

					if(battle_is_alive(a_user)){
						//User's still around, the action can be performed!
						switch(a_type){
							case battleaction_ATTACK:
								battle_message(tsprintf("% used %!",a_user.name,global.move_data[a_comm,mvd_NAME]))
								var pow = global.move_data[a_comm,mvd_POWER];
								var found_targets = 0, successful_hits = 0, missed_hits = 0;
								
								//User might suffer from an ailment that reduces attack effectiveness
								var ail_power_multiplier	= 1.00;
								var ail_acc_multiplier		= 1.00;
								switch(amp_read_var(a_user.amp_id,amp_AILMENT)){
									case ailment_BURN:
										//Burning halves physical power (and damages over time)
										if(global.move_data[a_comm,mvd_CATEGORY] == movecat_MELEE){
											ail_power_multiplier = 0.5
										}
									break
											
									case ailment_STRAIN:
										//Strain halves magical power (and drains MP over time)
										if(global.move_data[a_comm,mvd_CATEGORY] == movecat_MAGIC){
											ail_power_multiplier = 0.5
										}
									break
											
									case ailment_BLIND:
										//Blinding halves accuracy
										ail_acc_multiplier = 0.5
									break
								}

								//Apply to all target(s) individually
								for(var c = 0; c < array_length_1d(a_targ); c++){
									var trg = a_targ[c];

									if(battle_is_alive(trg)){
										found_targets++

										//Hit/miss roll (note that the stats are measured in integer percentage points, so 100% = 100, not 1.00)
										var acc =(global.move_data[a_comm,mvd_ACCURACY] + a_user.buff[stat_ACCURACY]*10)*ail_acc_multiplier;
										var eva = 0										+ trg.buff[stat_EVASIVENESS]*10;
										
										if(random(100) <= acc-eva){
											//It hit! Apply effects
											successful_hits++
											
											//Damage
											if(pow > 0){
												var dmgdata = compute_damage(a_user,trg,a_comm);

												n = instance_create_depth(trg.x,trg.y,depth,obj_damageapply)
												n.my_dmg = ceil(dmgdata[0]*ail_power_multiplier)
												n.my_mul =		dmgdata[1]
												n.my_eff =		dmgdata[2]
												n.my_mon			= trg
												n.my_user			= a_user
												n.my_move			= a_comm
												n.this_is_an_attack = true
												
												//User might hold an item that improves attack effectiveness
												if(battle_item_might_affect_this(a_user.amp_id,itemvalidflag_AUTO_ATTACKING)){
													var it = amp_read_var(a_user.amp_id,amp_HELDITEM)
													n.my_mul *= script_execute(global.item_data[it,id_USESCRIPT],[a_user.amp_id,trg.amp_id,a_comm],global.item_data[it,id_USEARG])
												}
												
												
											}
										
											//Side effects (target)
											if(random(100) < global.move_data[a_comm,mvd_SIDEEFFECT_CHANCE]){
												switch(global.move_data[a_comm,mvd_SIDEEFFECT_TYPE]){
													case movespfx_AILMENT:
														if(global.active_monster_party[trg.amp_id,amp_AILMENT] == NONE){
															global.active_monster_party[trg.amp_id,amp_AILMENT] = global.move_data[a_comm,mvd_SIDEEFFECT_SUBTYPE]
															battle_message(tsprintf("% got afflicted with %!",
																trg.name,global.ailment_name[global.move_data[a_comm,mvd_SIDEEFFECT_SUBTYPE]])
															)
														}
														else{
															battle_message(tsprintf("% already has an ailment, it can't be afflicted with %.",
																trg.name,global.ailment_name[global.move_data[a_comm,mvd_SIDEEFFECT_SUBTYPE]])
															)
														}
													break
													
													case movespfx_DEBUFF:
														var bb = trg.buff[global.move_data[a_comm,mvd_SIDEEFFECT_SUBTYPE]], stat = global.move_data[a_comm,mvd_SIDEEFFECT_SUBTYPE];
														//Hack: pass additional info in the target variable.
														trg.buff[stat] = clamp(trg.buff[stat] - global.move_data[a_comm,mvd_SIDEEFFECT_SEVERITY],BATTLE_MAX_DEBUFF_LEVEL,BATTLE_MAX_BUFF_LEVEL)
														action_enqueue_prio(
															trg,[stat,-global.move_data[a_comm,mvd_SIDEEFFECT_SEVERITY],bb == trg.buff[stat]],
															battleaction_ARBSCRIPT,barbs_statbuff
														)
													break
													
													case movespfx_BUFF:
														var bb = trg.buff[global.move_data[a_comm,mvd_SIDEEFFECT_SUBTYPE]], stat = global.move_data[a_comm,mvd_SIDEEFFECT_SUBTYPE];
														//Hack: pass additional info in the target variable.
														trg.buff[stat] = clamp(trg.buff[stat] + global.move_data[a_comm,mvd_SIDEEFFECT_SEVERITY],BATTLE_MAX_DEBUFF_LEVEL,BATTLE_MAX_BUFF_LEVEL)
														action_enqueue_prio(
															trg,[stat,global.move_data[a_comm,mvd_SIDEEFFECT_SEVERITY],bb == trg.buff[stat]],
															battleaction_ARBSCRIPT,barbs_statbuff
														)
													break
													
													default:
														//This side effect doesn't apply to target: do nothing.
													break
												}
											}
										
										}
										else{
											//It missed!
											with(trg){
												n = instance_create_depth(x,y,depth-1,obj_damageshow)
												n.my_string = "MISS"
											}
											missed_hits++
										}
									}
								}
								
								if(successful_hits > 0){
									//Visual effect object
									var obj = global.move_data[a_comm,mvd_ANIMATIONOBJECT];
									if(obj != NONE){
										n = instance_create_depth(x,y,depth-1,obj)
										n.user		= a_user
										n.target	= a_targ
									}
								}
								else{
									if(missed_hits == 0){
										battle_message("...but there isn't anyone to use it on, so it failed.")
									}
								}
								
								//Side effects (user)
								if(random(100) < global.move_data[a_comm,mvd_SIDEEFFECT_CHANCE]){
									switch(global.move_data[a_comm,mvd_SIDEEFFECT_TYPE]){
										case movespfx_RECOIL:
											//Hack: use 'target' variable to store the move ID.
											action_enqueue_prio(a_user,a_comm,battleaction_ARBSCRIPT,barbs_recoil)
										break
													
										default:
											//This side effect doesn't apply to user: do nothing.
										break
									}
								}
								
								//Subtract MP for using
								amp_consume_MP(a_user.amp_id,a_comm,1)
								
								//Use after-user's-turn items
								if(battle_item_might_affect_this(a_user.amp_id,itemvalidflag_AUTO_EACHTURN)){
									var it = amp_read_var(a_user.amp_id,amp_HELDITEM)
									script_execute(global.item_data[it,id_USESCRIPT],a_user.amp_id,global.item_data[it,id_USEARG])
								}
								
								//Take damage from damage ailments (you might be interested in putting this in a script and running after switch/item actions as well)
								switch(amp_read_var(a_user.amp_id,amp_AILMENT)){
									case ailment_POISON:
										var dmg = ceil(0.08*monster_get_mhp(a_user.amp_id))
										action_enqueue_prio(a_user,[dmg,"% is damaged by the poison!"],battleaction_ARBSCRIPT,barbs_setdamage)
									break
									
									case ailment_BLEED:
										var dmg = ceil(0.05*monster_get_mhp(a_user.amp_id))
										action_enqueue_prio(a_user,[dmg,"% is damaged by blood loss!"],battleaction_ARBSCRIPT,barbs_setdamage)
									break
									
									case ailment_BURN:
										var dmg = ceil(0.05*monster_get_mhp(a_user.amp_id))
										action_enqueue_prio(a_user,[dmg,"% is damaged by the burn!"],battleaction_ARBSCRIPT,barbs_setdamage)
									break
									
									case ailment_STRAIN:
										//Ailment MP damage
										action_enqueue_prio(a_user,[a_comm,irandom_range(2,5),"The strain is consuming %'s MP!"],battleaction_ARBSCRIPT,barbs_mpdamage)
									break
								}
							break
						
							case battleaction_ITEM:
								my_item = a_comm//Convenience assignment
								if(inventory_has_item(a_comm)){//Sanity check if player used an item with multiple monsters
									//Item still exists! Use it!
									battle_message(tsprintf("% used the %!",global.player_name,global.item_data[a_comm,id_NAME]))
							
									//Apply to all target(s)
									for(var c = 0; c < array_length_1d(a_targ); c++){
										var trg = a_targ[c];
									
										script_execute(global.item_data[a_comm,id_USESCRIPT],trg,global.item_data[a_comm,id_USEARG])
									}
								}
								else{
									battle_message(tsprintf("% tried using the %... but there's none left in the inventory!",global.player_name,global.item_data[a_comm,id_NAME]))
								}
							break
						
							case battleaction_SWITCH:
								//Trigger a switch!
								
								//Check that it's still valid, though.
								var ok = true;
								with(obj_battlemonster){
									if(amp_id == other.a_comm){
										ok = false
									}
								}
								if(ok){
									a_user.state = bmonsterstate_SWITCH
									a_user.switch_mon = a_comm
								
									n = instance_create_depth(x,y,0,obj_battleswitcher)
									n.my_monobj = a_user
									battle_message(tsprintf("%, come back! Go, %!",a_user.name,amp_get_monster_name(a_comm)))
								}
								else{
									//We can use a_user.name since we know it's not switched out - each monster only gets one turn.
									battle_message(tsprintf("% can't switch out, % was already summoned!",a_user.name,amp_get_monster_name(a_comm)))
								}
							break
						
							case battleaction_ESCAPE:
								//This is currently handled in the menu event directly (mev_battle_escape), and never actually enqueued as an action.
								//(either it ends battle directly, or proceeds to the action-execution phase without enqueueing actions for player monsters)
							break
							
							
							case battleaction_ARBSCRIPT:
								//Run an arbitrary script (this makes it easier to extend the engine for special cases)
								script_execute(a_comm)
							break
						}
					}
					else{
						//Well, nothing to do. Let's just continue with the next turn.
					}
				}
			}
		}
	break
	#endregion
	
	#region Animation
	case ctst_ANIMATION:
		if(!instance_exists(parent_battleturn)){
			//Okay, the animation is over!
			state    = ctst_TURNQUEUE
			substate = 0
		}
	break
	#endregion
	
	#region Player Victory
	case ctst_PLAYERWIN:
		switch(substate){
			case 0://Check type of victory
				bgm(NONE)//Stop all sounds, including SFX
				bgm(bgm_battlewin)
				battle_message("You emerge victorious!")
				evolutions_will_happen = false
				
				if(global.encounter_type == encountertype_TRAINER){
					substate = bcontrolstate_WIN_TRAINERSTUFF
					sfx(jingle_battlewin_trainer)
				}
				else{
					//Single wild / horde - skip to EXP right away
					substate = bcontrolstate_WIN_EXP
					sfx(jingle_battlewin_wild)
				}
			break
			
			#macro bcontrolstate_WIN_TRAINERSTUFF 20
			case 20://Trainer victory - talking and stuff
				with(obj_battleenemytrainer){
					state = btrainerstate_ENTERSCREEN;
					cntr  = (instance_number(obj_battleenemytrainer) - trainer_prio)*20
				}
				substate++
			break
			
			case 21://Slide trainer in
				var isdone = true;
				with(obj_battleenemytrainer){
					if(state == btrainerstate_ENTERSCREEN){
						isdone = false
					}
				}
				if(isdone){
					substate++
				}
			break
			
			case 22://Setup messages
				for(var c = 0; c < array_length_1d(global.encounter_trainer_data); c++){
					var tr = global.encounter_trainer_data[c];
					if(DEBUG_MODE){
						show_debug_message(tsprintf("Add win spoils for trainer %: %...",c,tr[trainer_NAME]))
					}
					//Show message
					battle_message(tsprintf("%:\n%",tr[trainer_NAME],tr[trainer_WINQUOTE]));
					
					//Set the trainer's flag so it's stored they've been beaten
					var flagdata = tr[trainer_FLAGCOORDS]
					autoflags_set(flagdata[0],flagdata[1],flagdata[2],true)
					
					//Get monies~
					total_cashloot += tr[trainer_WINCASH];
				}
				
				//Add money as well
				if(total_cashloot > 0){
					global.player_money += total_cashloot
					battle_message(tsprintf("Earned %¤ for winning!",total_cashloot))
				}
				substate++
			break
			
			case 23://Wait for messages to end
				if(battle_messages_empty()){
					substate = bcontrolstate_WIN_EXP
				}
			break
			
			
			#macro bcontrolstate_WIN_EXP 30
			case 30://Get EXP
				exp_monster = AMP_FIRST_ACTIVE
				movelearn   = ds_queue_create()
				potevo      = NONE
				newlevel    = 0
				if(total_exploot == 0){
					//Just skip this step if there's no EXP to be earned.
					substate = bcontrolstate_WIN_FADEOUT
				}
				else{
					battle_message(tsprintf("Your monsters earned % experience points!",total_exploot))
					substate++
				}
			break
			
			#macro bcontrolstate_WIN_STEP 31
			case 31://Step through monsters
				if(battle_messages_empty()){
					if(amp_has_monster(exp_monster)){
						var tehdata = amp_earn_exp(exp_monster,total_exploot);
						var levups  = tehdata[monexprewards_NUMLEVELS]
						newlevel	= tehdata[monexprewards_NEWLEVEL]
						potevo		= tehdata[monexprewards_EVOLUTION]
						
						var moves   = tehdata[monexprewards_NEWMOVES]
						for(c = 0;c < array_length_1d(moves); c++){
							ds_queue_enqueue(movelearn,moves[c])
						}
						
						if(levups > 0){
							sfx(jingle_monupgrade)
							battle_message(tsprintf("% reached Lv.%!",amp_get_monster_name(exp_monster),newlevel))
						}
					}
					substate++
				}
			break
			
			case 32://Wait for messages / menus to expire
				if(battle_messages_empty() && instance_number(parent_menu) == 0){
					if(!ds_queue_empty(movelearn)){
						var nm = ds_queue_dequeue(movelearn);
						if(amp_learn_move_instantly(exp_monster,nm)){
							battle_message(tsprintf("% learned %!",amp_get_monster_name(exp_monster),global.move_data[nm,mvd_NAME]))
						}
						else{
							//Needs player input, create a menu...
							n = message_spawn_script(
								tsprintf("% is trying to learn %, but it already knows % moves! Replace an existing move to make room?",
								amp_get_monster_name(exp_monster),global.move_data[nm,mvd_NAME],MONSTER_MAX_NUMBER_OF_MOVES),
								mev_monster_learnmove_spawnmenu)
							n.my_monster = exp_monster
							n.my_newmove = nm
						}
					}
					else if(potevo != NONE){
						//Schedule a pending evolution!
						evolutions_will_happen = true
						ds_queue_enqueue(global.pending_evolutions_queue,[exp_monster,potevo])
						potevo = NONE
					}
					else{
						exp_monster++
						if(exp_monster >= AMP_FIRST_ACTIVE + PARTYSIZE_ACTIVE){
							substate++
						}
						else{
							substate = bcontrolstate_WIN_STEP
						}
					}
				}
			break
			
			#macro bcontrolstate_WIN_FADEOUT 33
			case 33://Fadeout
				//Cleanup data
				ds_queue_destroy(movelearn)
				
				//Actually fadeout
				if(evolutions_will_happen){
					room_goto_fade_dontdestroy(rm_evolution,60)
				}
				else{
					room_goto_fade_dontdestroy(global.load_room,60)
				}
				substate++
			break
			
			case 34://Do nothing.
				//Here goes nothing! Literally.
			break
		}
	break
	#endregion
	
	#region Player Loss
	case ctst_PLAYERLOSE:
		switch(substate){
			case 0://Setup messages
				audio_stop_all()
				battle_message("You're out of usable monsters!")
				battle_message("Your vision becomes blurry, and everything slowly goes dark...")
				substate++
			break
			
			case 1://Messages
				if(battle_messages_empty()){
					substate++
				}
			break
			
			case 2://Fade to black
				global.load_x = global.last_saved_shrine_x
				global.load_y = global.last_saved_shrine_y
				global.load_room = global.last_saved_shrine_room
				
				//Abort post-battle event (only happens if you win)
				global.after_battle_event = NONE
				
				//Fully heal up your monsters so you don't need to MANUALLY do it
				for(var c = 0; c < PARTYSIZE_ACTIVE; c++){
					if(amp_read_var(AMP_FIRST_ACTIVE + c,amp_MONID) != NONE){
						amp_heal_HPMP(AMP_FIRST_ACTIVE + c)
					}
				}

				room_goto_fade_dontdestroy(global.last_saved_shrine_room,60)
				substate++
			break
			
			case 3://Actually fade
				//Do nothing
			break
		}
	break
	#endregion
}
#endregion
