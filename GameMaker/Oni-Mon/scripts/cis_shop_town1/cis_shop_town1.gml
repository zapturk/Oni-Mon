///cis_shop_town1()
function cis_shop_town1() {
	csc_init()
	csc_enqueue(cc_message,"Welcome! What can I help you with?")
	csc_enqueue(cc_shop,[item_POTION,item_POTION2,item_ANTIPOISON,item_ANTIBLEED,item_ANTIPARALYZE,item_MONSTERBALL,item_MONSTERBALL2,item_H_HEALORB,item_H_RECOILARMOR])
	csc_enqueue(cc_message,"Thanks for your business! Come again soon!")


}
