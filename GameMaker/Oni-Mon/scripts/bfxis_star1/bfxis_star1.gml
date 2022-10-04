///bfxis_star1()
function bfxis_star1() {
	var n;
	with(target){
		repeat(15){
			n = fx_sprite(spr_fx_star,1,x,y - sprite_height*0.5,random(360),random_range(2,6),0,0,0.125,0.25,random_range(30,60))
			n.image_xscale = 0.25
			n.image_yscale = 0.25
		}
	}


}
