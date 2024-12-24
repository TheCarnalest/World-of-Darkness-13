
/datum/job/vamp/national_security/fbi
	title = JOB_FBI
	department_head = list("Federal Bureau of Investigation")
	faction = "Vampire"
	total_positions = 2
	spawn_positions = 2
	supervisors = " the FBI"
	selection_color = "#1a1d8a"

	outfit = /datum/outfit/job/fbi

	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	minimal_access = list(ACCESS_BAR, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_FBI
	exp_type_department = EXP_TYPE_NATIONAL_SECURITY

	allowed_species = list("Human")
	minimal_generation = 13

	duty = "Enforce the Law."
	minimal_masquerade = 0
	my_contact_is_important = FALSE
	known_contacts = list("Police Chief")

AddTimelock(/datum/job/vamp/national_security/fbi, list(
	JOB_POLICE_ROLES = 15 HOURS,
	JOB_LIVING_ROLES = 2 HOURS,
))


/datum/outfit/job/fbi
	name = "Federal Investigator"
	jobtype = /datum/job/vamp/national_security/fbi

	uniform = /obj/item/clothing/under/vampire/office
	shoes = /obj/item/clothing/shoes/vampire
	suit = /obj/item/clothing/suit/vampire/jacket/fbi
	belt = /obj/item/storage/belt/holster/detective/vampire/fbi
	id = /obj/item/card/id/police/fbi
	gloves = /obj/item/clothing/gloves/vampire/investigator
	l_pocket = /obj/item/vamp/phone
	r_pocket = /obj/item/radio/cop
	l_hand = /obj/item/vamp/keys/police
	r_hand = /obj/item/police_radio
	backpack_contents = list(/obj/item/card/id/police/sergeant=1, /obj/item/passport=1, /obj/item/implant/radio=1, /obj/item/camera/detective=1, /obj/item/camera_film=1, /obj/item/taperecorder=1, /obj/item/tape=1, /obj/item/vamp/creditcard=1, /obj/item/ammo_box/vampire/c45acp=1, /obj/item/storage/firstaid/ifak=1)
