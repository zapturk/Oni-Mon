/// @description Massive leaf explosion!
with(other){
	repeat(45){
		fx_sprite(spr_fx_leaf,1,x,y - sprite_height*0.5,random(360),random_range(2,6),0,0,0.125,0.25,random_range(30,60))
	}
}
sfx(snd_leafexplode)