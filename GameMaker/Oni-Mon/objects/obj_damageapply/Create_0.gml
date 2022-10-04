/// @description Init
alarm[0] = 50
my_dmg = 0					//Raw damage to deal. If this is negative, HP is healed instead.
my_mul = 1					//Damage multiplier. Damage is already multiplied by this, but it's useful for bookkeeping and flavor text.
my_mon = NONE				//Monster to damage.
my_eff = 1					//Effectiveness multiplier. Affects flavor text.
my_user= NONE				//User that launches an attack. Mostly used when this_is_an_attack is true.
my_move= NONE				//Move that is being used. Only set when this_is_an_attack is true.
this_is_an_attack = false	//If true, does some extra stuff, like enabling counterattacks. Defaults to false for other sources of damage.