///init_constants()
function init_constants() {

	//Turn on debug mode to add a lot more debug printouts! (Also adds some extra HUD display elements)
#macro DEBUG_MODE false

#region Miscellaneous

#macro NONE -12341

#macro TILESIZE 16
#macro TILES_PER_ROW 20
#macro TILES_WALKABLE_COLUMNS 10
#macro TILES_SOLID_COLUMNS 10

#macro VIEW_W 640
#macro VIEW_H 360

	//Move sprites upwards a bit so they overlap with buildings even when their collision mask prevents it... makes them pop out more from the background.
#macro CHARACTER_FOOT_PROTRUSION 4


#macro SAVEFILES_MAX_ALLOWED 99

#endregion


#region Battle Control States
#macro ctst_SETUP 0
#macro ctst_ACTIONSELECT 1
#macro ctst_TURNQUEUE 2
#macro ctst_ANIMATION 3
#macro ctst_PLAYERWIN 4
#macro ctst_PLAYERLOSE 5
#macro ctst_ANNOUNCEENEMY 6
#macro ctst_REINFORCEMENTS 7



#macro battleaction_ATTACK 0
#macro battleaction_ITEM 1
#macro battleaction_SWITCH 2
#macro battleaction_ESCAPE 3
#macro battleaction_ARBSCRIPT 4

	//HACK: the array in action_enqueue() uses this order hardcoded to make the array inline, and doesn't use the values.
#macro battleaction_COMM_USER 0
#macro battleaction_COMM_TARGET 1
#macro battleaction_COMM_TYPE 2
#macro battleaction_COMM_COMMAND 3
#macro battleaction_COMM_SPEEDPRIO 4


#macro side_PLAYER 0
#macro side_ENEMY 1
#macro side_FRIENDNPC 2

	//HACK: Trainer name is just their given name in trainer-data blobs, but class name + given name in encounter-data
#macro trainer_NAME 0 
#macro trainer_PORTRAITSPRITE 1
#macro trainer_MAPSPRITE 2
#macro trainer_WINCASH 3
	//Note: Win Quote is the quote shown when you win against the trainer, not when they win against you.
#macro trainer_WINQUOTE 4
#macro trainer_FLAGCOORDS 5


	//Bonuses for when using special action types that always goes first
#macro BATTLEACTION_SPEEDBONUS_SWITCH 10000
#macro BATTLEACTION_SPEEDBONUS_ITEM 1000


	//Misc
#macro BATTLE_MAX_BUFF_LEVEL 6
#macro BATTLE_MAX_DEBUFF_LEVEL -6

#endregion

#region Local Stats
#macro stat_MHP 0 /*We never won't buff MHP or do anything particular with it, but it's good for completeness.*/
#macro stat_ATK 1
#macro stat_DEF 2
#macro stat_MAG 3
#macro stat_RES 4
#macro stat_SPD 5
#macro STAT_MAX_DATABASE 6
#macro stat_ACCURACY 6
#macro stat_EVASIVENESS 7
#macro STAT_MAX 8

	global.stat_name[stat_MHP]			= "Max HP"
	global.stat_name[stat_ATK]			= "Attack"
	global.stat_name[stat_DEF]			= "Defense"
	global.stat_name[stat_MAG]			= "Magic"
	global.stat_name[stat_RES]			= "Resistance"
	global.stat_name[stat_SPD]			= "Speed"
	global.stat_name[stat_ACCURACY]		= "Accuracy"
	global.stat_name[stat_EVASIVENESS]	= "Evasiveness"

	global.stat_name_tla[stat_MHP]			= "M.HP"
	global.stat_name_tla[stat_ATK]			= "ATK"
	global.stat_name_tla[stat_DEF]			= "DEF"
	global.stat_name_tla[stat_MAG]			= "MAG"
	global.stat_name_tla[stat_RES]			= "RES"
	global.stat_name_tla[stat_SPD]			= "SPD"
	global.stat_name_tla[stat_ACCURACY]		= "ACC%"
	global.stat_name_tla[stat_EVASIVENESS]	= "EVA%"
#endregion

#region Active Monster Party

#macro LEVEL_CAP 100

#macro PARTYSIZE_ACTIVE 6
#macro PARTYSIZE_MONSTERS_PER_BOXPAGE 40
#macro PARTYSIZE_BOXED 400
#macro PARTYSIZE_MAX_ENEMY 12

#macro AMP_FIRST_ACTIVE 0
#macro AMP_FIRST_BOX (PARTYSIZE_ACTIVE)
#macro AMP_FIRST_ENEMY (PARTYSIZE_ACTIVE + PARTYSIZE_BOXED)
#macro AMP_TOTAL_MONSTERS (PARTYSIZE_ACTIVE + PARTYSIZE_BOXED + PARTYSIZE_MAX_ENEMY)

#macro MONSTER_MAX_NUMBER_OF_MOVES 4

#macro MONSTER_MAX_EFFORT_VALUES 300

#macro amp_MONID 0
#macro amp_NICKNAME 1
#macro amp_LEVEL 2
#macro amp_EXP 3
#macro amp_IV_MHP 4
#macro amp_IV_ATK 5
#macro amp_IV_DEF 6
#macro amp_IV_MAG 7
#macro amp_IV_RES 8
#macro amp_IV_SPD 9
#macro amp_EV_MHP 10
#macro amp_EV_ATK 11
#macro amp_EV_DEF 12
#macro amp_EV_MAG 13
#macro amp_EV_RES 14
#macro amp_EV_SPD 15
#macro amp_HP 16
#macro amp_AILMENT 17
#macro AMP_FIRST_MOVE 18
#macro amp_MOVE1 18
#macro amp_MOVE2 19
#macro amp_MOVE3 20
#macro amp_MOVE4 21
#macro AMP_FIRST_MOVE_MP 22
#macro amp_MOVE1_MP 22
#macro amp_MOVE2_MP 23
#macro amp_MOVE3_MP 24
#macro amp_MOVE4_MP 25
#macro amp_HELDITEM 26

#macro AMP_MAX 27

#endregion



#region Type System
#macro type_NORMAL 0
#macro type_FIRE 1
#macro type_WATER 2
#macro type_PLANT 3
#macro type_AIR 4
#macro type_MAGIC 5
#macro type_GROUND 6
#macro type_GHOST 7
#macro TYPE_MAX 8

#macro typefactor_NORMAL 1.0
#macro typefactor_SUPEREFFECTIVE 1.5
#macro typefactor_INEFFECTIVE 0.5
#macro typefactor_USELESS 0.0
#endregion


#region Monster Data
#macro mond_NAME 0
#macro mond_SPRITE_BATTLE 1
#macro mond_SPRITE_SMALL 2
#macro mond_TYPE1 3
#macro mond_TYPE2 4
#macro mond_BASESTAT_HP 5
#macro mond_BASESTAT_ATK 6
#macro mond_BASESTAT_DEF 7
#macro mond_BASESTAT_MAG 8
#macro mond_BASESTAT_RES 9
#macro mond_BASESTAT_SPD 10
#macro mond_EXPGROUP 11
#macro mond_TOTALINNATEMOVES 12
#macro mond_TOTALEVOLUTIONS 13
#macro mond_DESC 14
#macro mond_EVBONUS_STAT 15
#macro MONSTER_DATA_MAX 16

#macro monexpgroup_FAST 0
#macro monexpgroup_MID 1
#macro monexpgroup_SLOW 2
#macro monexpgroup_LEGENDARY 3

#macro evotype_LEVEL 0
#macro evotype_ITEM 1
#endregion

#region Monster IDs

	//Starters
#macro monster_DRACHNID 0
#macro monster_CHARACHNE 1
	//<insert cool final evolution here>
#macro monster_PLAUGSPOUT 3
#macro monster_FLOWRATH 4
	//<insert cool final evolution here>
#macro monster_DRAQUATIC 6
#macro monster_LEVIOCEAN 7
	//<insert cool final evolution here>

	//Com Mons in the first forest zone
#macro monster_GRODENT 9
#macro monster_RATSSIVE 10
#macro monster_DUVAN 11
#macro monster_PIDGREAT 12
#macro monster_JESTAR 13
#macro monster_CARDEMON 14
#macro monster_MOLDOLE 15
#macro monster_SHROOMOLE 16
#macro monster_SPOOKSHROOM 17
#macro monster_WRAITHMANITA 18


	//Gotta enslave them all!
#macro MONSTER_MAX 300
#endregion


#region Move Data
#macro mvd_NAME 0
#macro mvd_TYPE 1
#macro mvd_CATEGORY 2
#macro mvd_DESC 3
#macro mvd_ACCURACY 4
#macro mvd_POWER 5
#macro mvd_MP 6
#macro mvd_TARGET 7
#macro mvd_SIDEEFFECT_CHANCE 8
#macro mvd_SIDEEFFECT_TYPE 9
#macro mvd_SIDEEFFECT_SUBTYPE 10
#macro mvd_SIDEEFFECT_SEVERITY 11
#macro mvd_ANIMATIONOBJECT 12
#macro mvd_USABLEFLAGS 13
#macro MOVEDATA_MAX 14

#macro movecat_MELEE 0
#macro movecat_MAGIC 1
#macro movecat_SUPPORT 2
	global.category_name[movecat_MELEE]		= "Physical"
	global.category_name[movecat_MAGIC]		= "Magic"
	global.category_name[movecat_SUPPORT]	= "Support"

#macro movetarg_USER 0
#macro movetarg_1ENE 1
#macro movetarg_ALLENE 2
#macro movetarg_1ALLY 3
#macro movetarg_ALLALLY 4
#macro movetarg_EVERYONE 5
#macro movetarg_EVERYONEEXCEPTUSER 6

#macro movespfx_AILMENT 0
#macro movespfx_BUFF 1
#macro movespfx_RECOIL 2
#macro movespfx_DEBUFF 3

#endregion

#region Move IDs
#macro move_STRUGGLE 0
#macro move_TACKLE 1
#macro move_TAILWAG 2
#macro move_DIVERGE 3
#macro move_POISONSPORE 4
#macro move_BITE 5
#macro move_FIREBALL 6
#macro move_FIREWEB 7
#macro move_LEAFSHOT 8
#macro move_LEAFEXPLOSION 9
#macro move_BOOMBUBBLE 10
#macro move_WHIRLCUTTER 11
#macro move_GUSTOFWIND 12
#macro move_BLINDINGSAND 13
#macro move_MAGICSTAR 14
#macro move_MAGICTRANCE 15
#macro move_MAGICCARD 16
#macro move_MOLECLAW 17
#macro move_EARTHQUAKE 18
#macro move_ECTOPLASM 19
#macro move_HAUNT 20
#macro move_MUSHROOMMISSILE 21
#macro move_UNNERVE 22

#macro move_CATCH 498 //Dummy move used to check for valid targets when catching.
#macro move_DEBUGNUKE 499 //Dummy move used for debug testing. Deals a lot of damage to all enemies.

	//Some room to grow
#macro MOVE_MAX 500
#endregion



#region Ailments
#macro ailment_POISON 0
#macro ailment_BLEED 1
#macro ailment_BLIND 2
#macro ailment_BURN 3
#macro ailment_STRAIN 4
#macro ailment_STUN 5
#macro ailment_PARALYZ 6


	global.ailment_name[ailment_POISON]		= "Poison"
	global.ailment_name[ailment_BLEED]		= "Bleeding"
	global.ailment_name[ailment_BLIND]		= "Blindness"
	global.ailment_name[ailment_BURN]		= "Immolation"
	global.ailment_name[ailment_STRAIN]		= "Strain"
	global.ailment_name[ailment_STUN]		= "Flinching"
	global.ailment_name[ailment_PARALYZ]	= "Paralysis"
#endregion



#region Item Data
#macro id_ITEMTYPE 0
#macro id_NAME 1
#macro id_DESC 2
#macro id_VALIDFLAGS 3
#macro id_USESCRIPT 4
#macro id_USEARG 5
	//Item with a price of zero cannot be thrown away or sold.
#macro id_PRICE 6
#macro ITEMDATA_MAX 7

#macro itemtype_CONSUMABLE 0
#macro itemtype_CATCH 1
#macro itemtype_KEY 2
#macro itemtype_MOVETEACHER 3
#macro itemtype_HELD 4

	//Not fully clear, but these are supposed to be flags.
	//bit 0 --> battle
	//bit 1 --> field
#macro itemvalidflag_BATTLE 1
#macro itemvalidflag_FIELD 2
#macro itemvalidflag_DEADTARGET 4
#macro itemvalidflag_AUTO_TAKEDAMAGE 8
#macro itemvalidflag_AUTO_ATTACKING 16
#macro itemvalidflag_AUTO_EACHTURN 32
#macro itemvalidflag_AUTO_SLATEENQUEUE 64
	//Notes on item-use scripts:
	// - Normal item-use scripts take two arguments:
	//			- an AMP_ID (row in the active monster party database), i.e., who to use it on
	//			- the defined item argument (this has a script-defined use, such as how much HP to heal, or what ailment to cure)
	// - Auto-use scripts take different arguments depending on context.
	//			- Each Turn just gets an AMP_ID and its argument, and is meant to cause side effects (or do nothing)
	//			- Take Damage gets hit [monster's AMP_ID, user's AMP_ID, total damage incurred, and move ID] in an array (in that order) + its argument, and is meant to cause side effects (or do nothing)
	//			- Attacking gets [user's AMP_ID, target's AMP_ID, and move ID] in an array (in that order) + its argument, and is meant to return a damage multiplier. If the effectiveness is unchanged, return 1, otherwise another value.
	//			- Slate Enqueue gets the slated action [user,target,actiontype,actionarg,speedprio] as an array + its argument, and is meant to return an array with possibly altered contents.
	// - Note that auto-use scripts EXCEPT Take Damage are always run from obj_battlecontrol, and may use its local variables if needed. Take Damage is run from obj_damageapply.
	// - You're not meant to combine player-use and auto-use valid-flags. If you find an use for it, the use script might need to do argument checking to find out how it's being called.

#macro itemvalid_NEVER 0
#macro itemvalid_BATTLEONLY (itemvalidflag_BATTLE)
#macro itemvalid_FIELDONLY (itemvalidflag_FIELD)
#macro itemvalid_FIELDnBATTLE (itemvalidflag_BATTLE | itemvalidflag_FIELD)
#endregion


#region Item IDs
#macro item_POTION 0
#macro item_POTION2 1
#macro item_POTION3 2
#macro item_KEY_FIRSTTOWN 3
#macro item_MONSTERBALL 4
#macro item_MONSTERBALL2 5
#macro item_MONSTERBALL3 6
#macro item_ANTIPOISON 7
#macro item_ANTIBLEED 8
#macro item_ANTIPARALYZE 9
#macro item_ANTI_ALL 10
#macro item_H_HEALORB 11
#macro item_H_BERRY 12
#macro item_H_POW_FIRE 13
#macro item_H_POW_NORMAL 14
#macro item_H_RECOILARMOR 15
#macro item_H_SPEEDBOOSTER 16

#macro ITEM_MAX 300
#endregion



#region Trainer Types

#macro trd_NAME 0
#macro trd_SPRITE 1
#macro trd_MAPSPRITE 2

#macro trainertype_BUM 0
#macro trainertype_HIKER 1
#macro trainertype_SCHOOLGIRL 2
#macro trainertype_LEADER_1 3

	init_trainers()

#endregion



#region GGUI System
#macro gguielt_SPRITE 0
#macro gguielt_TEXT 1
#macro gguielt_SCSPRITE 2
#macro gguielt_SCTEXT 3
#macro gguielt_SCDESC 4
#macro gguielt_SCARBTEXT 5
#macro gguielt_ARBTEXT 6
#macro gguielt_CURRTEXT 7
#macro gguielt_CURRDESC 8
#macro gguielt_SCROLLBAR 9
#macro gguielt_PAGEDOTS 10
#macro gguielt_INPUTBUTTON 11
#macro gguielt_SCINPUTBUTTON 12
#macro gguielt_HEALTHBAR 13
#macro gguielt_SCHEALTHBAR 14
#macro gguielt_EXTSPRITE 15
#macro gguielt_CURRSPRITE 16

#macro ipdev_GAMEPAD 0
#macro ipdev_KEYBOARD 1
#endregion


}
