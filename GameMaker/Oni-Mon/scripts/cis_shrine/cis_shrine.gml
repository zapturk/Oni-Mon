///cis_shrine()
function cis_shrine() {
	csc_init()
	csc_enqueue(cc_message,"Grace of the monster queen upon thee, traveler.")
	csc_enqueue(cc_question,["Heal monsters",cis_shrine_heal,"Rename monster",cis_shrine_rename,"Talk",cis_shrine_talk,"Cancel",mev_cancel])


}
