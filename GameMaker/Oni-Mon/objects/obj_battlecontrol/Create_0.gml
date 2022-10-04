/// @description Init

//Setup
depth = -14000
init_keys()

//Setup music alarm (battle intro is 3.5s long, transition took half a second so far)
alarm[0] = 3*60


//State machine stuff
state		= ctst_SETUP
substate	= 0
cntr        = 0

//Turn action queue
action_order_queue = []
selected_actions = []
action_order_current = 0
action_order_max = 0
action_monster = NONE
action_proceed = true

aq_normal = ds_priority_create()
aq_hiprio = ds_queue_create()
//Confusingly, the "priority action queue" is not a priority queue.
//This is because it's meant to inject special actions before the next turn, and those should resolve
//in the order they were added. Since they're done before the next turn, hence this is the "PRIORITY queue".

//Loot
total_cashloot = 0
total_exploot  = 0

//Message
message_init()

//Queue of future messages
message_queue = ds_queue_create()