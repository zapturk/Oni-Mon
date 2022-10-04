/// @description Start appropriate battle music
//Check if it's a boss battle here or not and play appropriate music
if(global.battle_is_boss){
	bgm(bgm_battle_boss)
}
else{
	bgm(bgm_battle)
}