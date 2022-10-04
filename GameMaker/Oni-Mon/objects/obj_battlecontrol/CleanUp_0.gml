/// @description Remove DSes
ds_queue_destroy(message_queue);
ds_queue_destroy(aq_hiprio);
ds_priority_destroy(aq_normal);