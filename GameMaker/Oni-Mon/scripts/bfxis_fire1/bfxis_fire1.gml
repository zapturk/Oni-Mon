///bfxis_fire1()
function bfxis_fire1() {
	with(target){
		repeat(6){
			fx_sprite(spr_fx_fire1,1,x,y,choose(0,180),random_range(2,6),0,0,0,0.25,random_range(30,60))
		}
	}


}
