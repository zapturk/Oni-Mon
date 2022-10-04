///msh_recompute_seencaught()
function msh_recompute_seencaught() {
	var totals = 0, totalc = 0, c;
	for(c = 0; c < MONSTER_MAX; c++){
		if(global.monsters_seen[c]){
			totals++
		}
		if(global.monsters_caught[c]){
			totalc++
		}
	}
	global.monsters_seen_total		= totals
	global.monsters_caught_total	= totalc


}
