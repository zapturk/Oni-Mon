/// @description Insert description here
// You can write your code in this editor

if(myTextBox == noone){
	var vx = camera_get_view_x(view_camera[0]);
	var vy = camera_get_view_y(view_camera[0]) + 98;

	switch(global.playerLastDir){
		case directions.down:
			if (place_meeting(x, y-2, oPlayer)) { 
				myTextBox = instance_create_layer(vx, vy, "Menu", oTextBox);
				myTextBox.text = npcText;
				myTextBox.pageCount = array_length(npcText);
				myTextBox.npc = self;
				myTextBox.hasChoice = hasChoice;
				//oPlayer.input_move = directions.locked;
			} 
			break;
		case directions.left:
			if (place_meeting(x+2, y, oPlayer)) { 
				myTextBox = instance_create_layer(vx, vy, "Menu", oTextBox);
				myTextBox.text = npcText;
				myTextBox.pageCount = array_length(npcText);
				myTextBox.npc = self;
				myTextBox.hasChoice = hasChoice;
				//oPlayer.input_move = directions.locked;
			} 
			break;
		case directions.up:
			if (place_meeting(x, y+2, oPlayer)) { 
				myTextBox = instance_create_layer(vx, vy,"Menu", oTextBox);
				myTextBox.text = npcText;
				myTextBox.pageCount = array_length(npcText);
				myTextBox.npc = self;
				myTextBox.hasChoice = hasChoice;
				//oPlayer.input_move = directions.locked;
			} 
			break;
		case directions.right:
			if (place_meeting(x-2, y, oPlayer)) { 
				myTextBox = instance_create_layer(vx, vy, "Menu", oTextBox);
				myTextBox.text = npcText;
				myTextBox.pageCount = array_length(npcText);
				myTextBox.npc = self;
				myTextBox.hasChoice = hasChoice;
				//oPlayer.input_move = directions.locked;
			} 
			break;
		default:
			break;
	}
}