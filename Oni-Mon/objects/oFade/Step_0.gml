/// @description Insert description here
// You can write your code in this editor


switch(curState){
	case state.out:
		timer++;
		if(timer >= duration){
			room_goto(targetRoom);
		
			curState = state.delay;
		}
	break;
	
	case state.delay:
		timer++;
		if(timer >= duration + 4){
			curState = state.in;
			oPlayer.x = mPlayerX;
			oPlayer.y = mPlayerY;
			face = mPlayerDir;
			global.playerLastDir = mPlayerDir;
		}
	break;
	
	case state.in:
		timer--;
		if(timer <= 0){
			instance_destroy();
		}
	break;
	
	default:
		break;
}

alpha = timer/duration;
