///bfxis_leaf()
function bfxis_leaf() {
	with(target){
		repeat(15){
			fx_sprite(spr_fx_leaf,1,x,y - sprite_height*0.5,random(360),random_range(2,6),0,0,0.125,0.25,random_range(30,60))
		}
	}


}
