///bfxis_bubble()
function bfxis_bubble() {
	with(target){
		repeat(15){
			fx_sprite(spr_fx_bubble1,1,x,y - sprite_height*0.5,random(360),random_range(2,6),0,0,0,0.25,random_range(10,60))
		}
	}


}
