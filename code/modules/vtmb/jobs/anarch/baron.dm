
/datum/job/vamp/anarch/barkeeper
	title = JOB_BARKEEPER
	department_head = list("Justicar")
	faction = "Vampire"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Anarchs and the Traditions"
	selection_color = "#434343"

	outfit = /datum/outfit/job/barkeeper

	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	minimal_access = list(ACCESS_BAR, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_BARKEEPER
	bounty_types = CIV_JOB_DRINK

//	minimal_generation = 11	//Uncomment when players get exp enough

	my_contact_is_important = TRUE
	known_contacts = list(
		"Prince",
		"Dealer"
	)

	v_duty = "You lead the Anarchs in the City. A Camarilla faction that values freedom and individuality. While not a fan of the traditions, you still respect the Masquerade."
	minimal_masquerade = 3
	allowed_species = list("Vampire")
	allowed_bloodlines = list("Daughters of Cacophony", "True Brujah", "Brujah", "Nosferatu", "Gangrel", "Toreador", "Malkavian", "Ventrue", "Lasombra", "Gargoyle")
	experience_addition = 20

AddTimelock(/datum/job/vamp/anarch/barkeeper, list(
	JOB_ANARCH_ROLES = 10 HOURS,
	JOB_LIVING_ROLES = 2 HOURS,
))

/datum/outfit/job/barkeeper
	name = "Baron"
	jobtype = /datum/job/vamp/anarch/barkeeper

	id = /obj/item/card/id/anarch
	glasses = /obj/item/clothing/glasses/vampire/sun
	uniform = /obj/item/clothing/under/vampire/bar
	suit = /obj/item/clothing/suit/vampire/jacket/better
	shoes = /obj/item/clothing/shoes/vampire
	gloves = /obj/item/clothing/gloves/vampire/work
	l_pocket = /obj/item/vamp/phone/barkeeper
	r_pocket = /obj/item/vamp/keys/bar
	backpack_contents = list(/obj/item/passport=1, /obj/item/phone_book=1, /obj/item/cockclock=1, /obj/item/flashlight=1, /obj/item/vamp/creditcard=1)

/datum/outfit/job/barkeeper/pre_equip(mob/living/carbon/human/H)
	..()
	H.vampire_faction = "Anarch"
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/vampire/bar/female
		shoes = /obj/item/clothing/shoes/vampire/heels

/obj/effect/landmark/start/barkeeper
	name = "Baron"
	icon_state = "Barkeeper"
