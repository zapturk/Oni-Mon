///action_pop()
function action_pop() {
	//Gets the next action, if any. If no actions remain, returns "undefined".
	//Gets actions from the prio-queue first, and gets actions from the normal queue only if the prio queue is empty.
	if(!ds_queue_empty(aq_hiprio)){
		return ds_queue_dequeue(aq_hiprio)
	}
	else if(!ds_priority_empty(aq_normal)){
		return ds_priority_delete_max(aq_normal)
	}
	else{
		return undefined
	}


}
