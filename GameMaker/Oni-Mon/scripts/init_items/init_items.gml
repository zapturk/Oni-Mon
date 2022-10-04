///init_items()
function init_items() {

	//Preallocate
	for(var c = ITEM_MAX; c >= 0; c--){
		for(var d = ITEMDATA_MAX; d >= 0; d--){
			global.item_data[c,d] = NONE
		}
	}


	//Actually init
	//		  id,							name,									type,					validflags,							use_script,								use_arg,				price,			desc
	init_item(item_POTION,					"Potion",								itemtype_CONSUMABLE,	itemvalid_FIELDnBATTLE,				itemuse_healHP,							50,						400,			"Restores 50 HP. Medical tonic meant for spraying onto a monster's open wounds. Based off ancient herbal treatments researched by witches and alchemists.")
	init_item(item_POTION2,					"Hi-Potion",							itemtype_CONSUMABLE,	itemvalid_FIELDnBATTLE,				itemuse_healHP,							200,					1500,			"Restores 200 HP. Stronger version of the basic healing potion. The herbs are supplemented with powerful antibiotics to speed up recovery.")
	init_item(item_POTION3,					"X-Potion",								itemtype_CONSUMABLE,	itemvalid_FIELDnBATTLE,				itemuse_healHP,							999,					3200,			"Fully restores HP. Incredibly powerful potion using nanomachines to distribute the medicine in the target's body effectively, focusing on damaged tissue first.")
	init_item(item_MONSTERBALL,				"Pact Stone",							itemtype_CATCH,			itemvalid_BATTLEONLY,				itemuse_catch,							1.0,					200,			"Magical stone that traps a monster's soul, making it your ally. The spell is fairly weak and easily broken by a strong will, so make sure to weaken the monster first.")
	init_item(item_MONSTERBALL2,			"Polished Stone",						itemtype_CATCH,			itemvalid_BATTLEONLY,				itemuse_catch,							2.0,					1200,			"Pact stone that has been polished as smooth as a marble. Gives its target a harmonic feeling, weakening their will to resist.")
	init_item(item_MONSTERBALL3,			"Obsidian Stone",						itemtype_CATCH,			itemvalid_BATTLEONLY,				itemuse_catch,							4.0,					4400,			"Pact stone made from hardened obsidian, natural glass formed in volcanoes. Imbued with demonic power, it is the perfect vessel to trap souls. Few can resist its call.")
	init_item(item_KEY_FIRSTTOWN,			"Forest Key",							itemtype_KEY,			itemvalid_NEVER,					NONE,									NONE,					0,				"Large, rusted key with a tuft of moss growing from its head. A moldy leather tag with the word FOREST written with permanent marker is attached to the key.")
	init_item(item_ANTIPOISON,				"Antidote",								itemtype_CONSUMABLE,	itemvalid_FIELDnBATTLE,				itemuse_healailment,					ailment_POISON,			500,			"Quick-acting antidote that cures all common forms of poison.")
	init_item(item_ANTIBLEED,				"Bandage",								itemtype_CONSUMABLE,	itemvalid_FIELDnBATTLE,				itemuse_healailment,					ailment_BLEED,			500,			"White spray that coagulates into fully functional bandages when it comes in contact with monster blood.")
	init_item(item_ANTIPARALYZE,			"Muscle Stimulant",						itemtype_CONSUMABLE,	itemvalid_FIELDnBATTLE,				itemuse_healailment,					ailment_PARALYZ,		700,			"Syringe that releases muscle tension and discharges static electricity in a controlled fashion, curing paralysis.")
	init_item(item_ANTI_ALL,				"Cure-all",								itemtype_CONSUMABLE,	itemvalid_FIELDnBATTLE,				itemuse_healailment,					NONE,					3000,			"Mixture of all types of ailment medicine, discharged using nanomachines to prevent overdoses. Cures all ailments.")
	init_item(item_H_HEALORB,				"Healing Orb",							itemtype_HELD,			itemvalidflag_AUTO_EACHTURN,		itemuse_auto_healorb,					NONE,					20000,			"Mystical healing orb that glows with a warm light. Gradually heals a monster each turn as it is in battle.")
	init_item(item_H_BERRY,					"Monster Apple",						itemtype_HELD,			itemvalidflag_AUTO_TAKEDAMAGE,		itemuse_auto_healberry,					30,						50,				"Purple apple that's poisonous to humans, but a favorite of most monsters. If held by a monster, they will eat it to heal themselves when they fall to low HP.")
	init_item(item_H_POW_FIRE,				"Jar of Phlogiston",					itemtype_HELD,			itemvalidflag_AUTO_ATTACKING,		itemuse_auto_power,						type_FIRE,				10000,			"Jar of flammable substance that was central in the transition from alchemy to chemistry. Just holding this will power up a monster's fire moves.")
	init_item(item_H_POW_NORMAL,			"Vanilla Ice-Cream",					itemtype_HELD,			itemvalidflag_AUTO_ATTACKING,		itemuse_auto_power,						type_NORMAL,			10000,			"Ice-cream with no taste whatsoever, more useful as a decorative item than a snack. Powers up normal-type moves.")
	init_item(item_H_RECOILARMOR,			"Spiked Shell",							itemtype_HELD,			itemvalidflag_AUTO_TAKEDAMAGE,		itemuse_auto_recoilarmor,				movecat_MELEE,			10000,			"Spiked shell from a dead sea monster. If held by a monster, it will cause damage when they are attacked by a physical move.")
	init_item(item_H_SPEEDBOOSTER,			"Speed Booster",						itemtype_HELD,			itemvalidflag_AUTO_SLATEENQUEUE,	itemuse_auto_speedbooster,				movecat_MELEE,			10000,			"Portable jet engine, just the right size to be held by a monster. Will greatly increase the speed of their physical attacks, but not support or magical moves.")


}
