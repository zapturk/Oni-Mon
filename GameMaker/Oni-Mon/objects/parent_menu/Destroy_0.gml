/// @description Restore priority of former menus
with(parent_menu){
    active++
}
if(script_destroy != NONE){
    script_execute(script_destroy)
}
