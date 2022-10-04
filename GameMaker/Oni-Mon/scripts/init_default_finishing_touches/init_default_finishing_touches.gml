///init_default_finishing_touches()
function init_default_finishing_touches() {
	//Sets up stuff at the very end of initialization.
	//Used for things like starting party.
	//Also useful to quickly add things for debug purposes that can be wiped out easily later.



	//Starting items
	inventory_obtain_item(item_MONSTERBALL,20)
	inventory_obtain_item(item_POTION,10)
	inventory_obtain_item(item_POTION2,3)
	inventory_obtain_item(item_ANTIPOISON,3)
	inventory_obtain_item(item_ANTIBLEED,3)
	inventory_obtain_item(item_ANTIPARALYZE,3)
	inventory_obtain_item(item_ANTI_ALL,1)
	inventory_obtain_item(item_H_BERRY,3)


}
