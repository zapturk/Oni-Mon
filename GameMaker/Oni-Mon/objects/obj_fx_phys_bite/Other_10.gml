/// @description ACTUALLY chew
with(other){
	n = fx_sprite(spr_fx_teeth,0,x,y-64,270,4,0,0,0,0,16)
	n = fx_sprite(spr_fx_teeth,0,x,y+64, 90,4,0,0,0,0,16); n.image_yscale = -1
}
sfx(snd_bite)