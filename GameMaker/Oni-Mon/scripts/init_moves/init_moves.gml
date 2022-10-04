///init_moves()
function init_moves() {

	//Preallocate
	for(c = MOVE_MAX; c >= 0; c--){
		for(d = MOVEDATA_MAX; d >= 0; d--){
			global.move_data[c,d] = NONE
		}
		global.move_data[c,mvd_NAME] = ""
		global.move_data[c,mvd_DESC] = ""
	}


	//Fill in move data explicitly
	//			id,								name,						type,						category,			power,	acc%,	mp,		target,					spfx[chance,type,					detail,			severity]			aniobject,									usableflags,										flavor)
	init_move(move_CATCH,						"",							type_NORMAL,				movecat_SUPPORT,	0,		0,		0,		movetarg_1ENE,				[],																	NONE,										0,													"")
	init_move(move_STRUGGLE,					"Desperation",				type_NORMAL,				movecat_MELEE,		40,		100,	99,		movetarg_1ENE,				[100,	movespfx_RECOIL,		NONE,			50],				obj_fx_phys_tackle,							0,													"A desperation attack used when the user is out of Move Points. Hurts the user quite a bit!")
	init_move(move_DEBUGNUKE,					"Debug Nuke",				type_MAGIC,					movecat_MAGIC,		999,	300,	99,		movetarg_ALLENE,			[],																	NONE,										0,													"Strikes the entire enemy party with way too much power. For debug purposes only.")
	init_move(move_TACKLE,						"Dive",						type_NORMAL,				movecat_MELEE,		60,		95,		40,		movetarg_1ENE,				[],																	obj_fx_phys_tackle,							0,													"The user dives into the target with their entire body. The tackle isn't very strong, but easy to use and has high MP.")
	init_move(move_DIVERGE,						"Diverge",					type_NORMAL,				movecat_SUPPORT,	0,		999,	20,		movetarg_USER,				[100,	movespfx_BUFF,			stat_ATK,		1],					obj_fx_buff_diverge,						0,													"The user extends and spreads its sharp scales or spines. More spiky bits to drive into soft skin means stronger attack power.")
	init_move(move_TAILWAG,						"Tail Wag",					type_NORMAL,				movecat_SUPPORT,	0,		100,	20,		movetarg_ALLENE,			[100,	movespfx_DEBUFF,		stat_DEF,		1],					obj_fx_debuff_tailwag,						0,													"The user acts cute, wagging its tail to signal its peaceful intentions. This clever ruse makes enemies lower their guard.")
	init_move(move_POISONSPORE,					"Poison Spores",			type_PLANT,					movecat_SUPPORT,	0,		90,		20,		movetarg_1ENE,				[100,	movespfx_AILMENT,		ailment_POISON,	8],					obj_fx_debuff_spores,						0,													"Emit a large cloud of rotted spores that eat their way into the target's lungs, causing chemical poisoning.")
	init_move(move_BITE,						"Bite",						type_NORMAL,				movecat_MELEE,		60,		100,	15,		movetarg_1ENE,				[10,	movespfx_AILMENT,		ailment_STUN,	1],					obj_fx_phys_bite,							0,													"A vicious bite attack that might stun the target. Playing fair is just a waste of potential.")
	init_move(move_FIREBALL,					"Fireball",					type_FIRE,					movecat_MAGIC,		75,		100,	15,		movetarg_1ENE,				[25,	movespfx_AILMENT,		ailment_BURN,	8],					obj_fx_mag_fireball,						0,													"Spit out a fireball that hits the target with immense force. Might set the target on fire.")
	init_move(move_FIREWEB,						"Flaming Spiderweb",		type_FIRE,					movecat_MAGIC,		30,		85,		25,		movetarg_1ENE,				[100,	movespfx_DEBUFF,		stat_SPD,		1],					obj_fx_mag_fireball,						0,													"Launch a web made from fire. Not particularly strong, but it restricts the target, lowering their speed.")
	init_move(move_LEAFSHOT,					"Leaf Shot",				type_PLANT,					movecat_MAGIC,		60,		100,	15,		movetarg_1ENE,				[50,	movespfx_DEBUFF,		stat_RES,		1],					obj_fx_mag_leafshot,						0,													"Launch a razor-sharp leaf at a very high velocity, tearing its way through the enemy's defenses.")
	init_move(move_LEAFEXPLOSION,				"Leaf Explosion",			type_PLANT,					movecat_MAGIC,		120,	90,		5,		movetarg_EVERYONEEXCEPTUSER,[50,	movespfx_AILMENT,		ailment_STUN,	1],					obj_fx_mag_leafexplosion,					0,													"Send off an explosion of leaves in every direction. So powerful, it might stun its targets.")
	init_move(move_BOOMBUBBLE,					"Boom Bubble",				type_WATER,					movecat_MAGIC,		60,		100,	30,		movetarg_1ENE,				[],																	obj_fx_mag_bubble,							0,													"Launch a single large bubble that explodes in a torrential shower of water.")
	init_move(move_WHIRLCUTTER,					"Whirlpool Cutter",			type_WATER,					movecat_MELEE,		60,		95,		20,		movetarg_1ENE,				[30,	movespfx_AILMENT,		ailment_BLEED,	5],					obj_fx_phys_watercut,						0,													"Turn a whirlpool into a sword, and strike the target down in one fell swoop. Might cause bleeding.")
	init_move(move_GUSTOFWIND,					"Gust of Wind",				type_AIR,					movecat_MAGIC,		40,		100,	30,		movetarg_ALLENE,			[],																	obj_fx_mag_wind,							0,													"Charge up a gust of wind and pummel the enemy party with it. Hits every enemy.")
	init_move(move_BLINDINGSAND,				"Blinding Sand",			type_GROUND,				movecat_SUPPORT,	0,		100,	30,		movetarg_1ENE,				[100,	movespfx_DEBUFF,		stat_ACCURACY,	1],					obj_fx_mag_sand,							0,													"Throw sand into the target's eyes, blinding them. Lowers enemy's accuracy.")
	init_move(move_MAGICSTAR,					"Magic Star",				type_MAGIC,					movecat_MAGIC,		60,		100,	20,		movetarg_1ENE,				[10,	movespfx_DEBUFF,		stat_RES,		1],					obj_fx_mag_star,							0,													"Shoot a star of pure magic energy to strike the enemy. Might lower magic defense.")
	init_move(move_MAGICTRANCE,					"Magic Trance",				type_MAGIC,					movecat_SUPPORT,	0,		100,	30,		movetarg_USER,				[100,	movespfx_BUFF,			stat_MAG,		2],					obj_fx_buff_trance,							0,													"Fall into a meditative trance that reattunes you with the elements. Increases magic attack power.")
	init_move(move_MAGICCARD,					"Magic Card",				type_MAGIC,					movecat_MELEE,		60,		100,	15,		movetarg_1ENE,				[30,	movespfx_AILMENT,		ailment_STRAIN,	1],					obj_fx_mag_star,							0,													"Form an ethereal card of magic energy and slice the target with its sharp paper edges. May cause strain, bleeding the target's magic energy.")
	init_move(move_MOLECLAW,					"Mole Claw",				type_GROUND,				movecat_MELEE,		60,		80,		20,		movetarg_1ENE,				[100,	movespfx_DEBUFF,		stat_DEF,		1],					obj_fx_phys_sandcut,						0,													"Slash with massive claws made for digging through rock and earth. Works just as fine on flesh, too. Lowers the target's defenses.")
	init_move(move_EARTHQUAKE,					"Earthquake",				type_GROUND,				movecat_MELEE,		100,	100,	5,		movetarg_EVERYONEEXCEPTUSER,[],																	obj_fx_phys_earthquake,						0,													"Cause a massive earthquake that strikes everyone involved in the battle without mercy.")
	init_move(move_ECTOPLASM,					"Ectoplasm",				type_GHOST,					movecat_MAGIC,		20,		100,	40,		movetarg_1ENE,				[30,	movespfx_AILMENT,		ailment_PARALYZ,1],					obj_fx_mag_ghostflash,						0,													"Slather the target in ectoplasm. The chill of death physically hurts, and might paralyze targets of weak willpower.")
	init_move(move_HAUNT,						"Haunt",					type_GHOST,					movecat_SUPPORT,	33,		100,	25,		movetarg_1ENE,				[],																	obj_fx_mag_ghostflash,						0,													"Use your ghostly presence to damage the target's consciousness directly. Always deals 33 damage.")
	init_move(move_MUSHROOMMISSILE,				"Mushroom Missile",			type_PLANT,					movecat_MELEE,		120,	75,		10,		movetarg_1ENE,				[],																	obj_fx_mag_mushroomshot,					0,													"Launch a giant mushroom at the target with immense force. Inaccurate, but powerful.")
	init_move(move_UNNERVE,						"Unnerve",					type_NORMAL,				movecat_SUPPORT,	0,		100,	30,		movetarg_1ENE,				[100,	movespfx_DEBUFF,		stat_ATK,		1],					obj_fx_mag_ghostflash,						0,													"Glare unnervingly at the target, causing them to lose focus and lower attack power.")


}
