/// @description Initiate combat!
event_user(0)
bgm(NONE)
sfx(snd_trainerdetected)
fx_sprite(spr_trainernoticeyou,0.5,x,y - TILESIZE - CHARACTER_FOOT_PROTRUSION - 2,0,0,0,0,0,0,60)
csc_init()
csc_enqueue(cc_message,my_message_battlestart)
csc_enqueue(cc_battlestart_trainer)