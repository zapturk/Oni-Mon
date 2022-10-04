/// @description Setup
//This object mostly is here so that the battle-control can wait for it to be removed from the room,
//enabling the "look for battleturn objects and proceed when they're all gone" logic and reducing
//the number of states in the state machine.
my_monobj = NONE
