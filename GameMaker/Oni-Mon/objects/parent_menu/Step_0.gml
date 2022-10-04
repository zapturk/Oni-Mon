/// @description Step
//Remember old values so can detect change
pvx = menuvalue_x
pvy = menuvalue_y
if(active){
    ggui_menu_handle()
}
//Step script: run every step
if(script_step != NONE){
    script_execute(script_step)
}
//Change script: run on menuvalue change only (used for expensive operations like reading a file based on selected savefile)
if((menuvalue_x != pvx) || (menuvalue_y != pvy)){
    if(script_change != NONE){
        script_execute(script_change)
    }
}
