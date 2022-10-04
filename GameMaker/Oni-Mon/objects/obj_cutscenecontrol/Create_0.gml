/// @description Init
cutscene_step_current = -1//Current step of the cutscene
cutscene_step_max     = 0//How many steps there are in total
cutscene_script[0]    = NONE//Script to be called when proceeding into this step of the cutscene
cutscene_argument[0]  = []//Data for the script to work with, used for e.g. message text.
alarm[0] = 1//We need 1 step between creation and performing cutscene steps to ensure there's time to add events.
