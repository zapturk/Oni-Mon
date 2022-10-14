/// @description Insert description here
// You can write your code in this editor
if(page < pageCount - 1){
	page += 1;
}
else{
	textBox.choiceOpen = false;
	if(pointerYOffset == pointerOption1){
		textBox.page += 1;
	}
	else if(pointerYOffset == pointerOption2){
		textBox.page += 2;
	}
	
	instance_destroy(self);
}