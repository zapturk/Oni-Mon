/// @description Insert description here
// You can write your code in this editor
if(page < pageCount - 1 && !choiceOpen){
	page += 1;
}
else if(!choiceOpen){
	npc.alarm[0] = .25 * room_speed;
	instance_destroy(self);
}