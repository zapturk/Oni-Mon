/// @description Spores!
with(other){
	repeat(30){
		fx_sprite(spr_fx_spore,0,x,y - sprite_height*0.5,random(360),random_range(0.5,3),0,random_range(-4,4),0.15,0.1,random_range(30,90))
	}
}
sfx(snd_sporewind)