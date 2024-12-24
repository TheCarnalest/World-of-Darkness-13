/datum/job/vamp/camarilla/primogen_malkavian
	title = JOB_MALKAVIAN 
	department_head = list("Justicar")
	faction = "Vampire"
	total_positions = 1
	spawn_positions = 1
	supervisors = " the Traditions"
	selection_color = "#4f0404"

	outfit = /datum/outfit/job/malkav

	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	minimal_access = list(ACCESS_BAR, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_MALKAVIAN
	exp_type_department = EXP_TYPE_COUNCIL

	allowed_species = list("Vampire")
	allowed_bloodlines = list("Malkavian")
	minimal_generation = 7	//Uncomment when players get exp enough

	v_duty = "Offer your infinite knowledge to Prince of the City."
	experience_addition = 20
	minimal_masquerade = 5
	my_contact_is_important = TRUE
	known_contacts = list("Prince")

AddTimelock(/datum/job/vamp/camarilla/primogen_malkavian, list(
	JOB_CAMARILLA_AUTHORITIES_ROLES = 5 HOURS,
	JOB_LIVING_ROLES = 2 HOURS,
))

/datum/outfit/job/malkav
	name = JOB_MALKAVIAN
	jobtype = /datum/job/vamp/camarilla/primogen_malkavian

	id = /obj/item/card/id/primogen
	glasses = /obj/item/clothing/glasses/vampire/sun
	uniform = /obj/item/clothing/under/vampire/primogen_malkavian
	suit = /obj/item/clothing/suit/vampire/trench/malkav
	shoes = /obj/item/clothing/shoes/vampire/jackboots
	head = /obj/item/clothing/head/vampire/malkav
	l_pocket = /obj/item/vamp/phone/malkavian
	r_pocket = /obj/item/cockclock
	backpack_contents = list(/obj/item/vamp/keys/malkav/primogen=1, /obj/item/vamp/keys/clinic, /obj/item/passport=1, /obj/item/flashlight=1, /obj/item/vamp/creditcard/elder=1)

/datum/outfit/job/malkav/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == FEMALE)
		suit = null
		head = null
		uniform = /obj/item/clothing/under/vampire/primogen_malkavian/female
		shoes = /obj/item/clothing/shoes/vampire/heels

/datum/job/vamp/camarilla/primogen_nosferatu
	title = JOB_NOSFERATU 
	department_head = list("Justicar")
	faction = "Vampire"
	total_positions = 1
	spawn_positions = 1
	supervisors = " the Traditions"
	selection_color = "#4f0404"

	outfit = /datum/outfit/job/nosferatu

	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	minimal_access = list(ACCESS_BAR, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_NOSFERATU
	exp_type_department = EXP_TYPE_COUNCIL

	allowed_species = list("Vampire")
	allowed_bloodlines = list("Nosferatu")
	minimal_generation = 7	//Uncomment when players get exp enough

	v_duty = "Offer your infinite knowledge to Prince of the City."
	experience_addition = 20
	minimal_masquerade = 5
	my_contact_is_important = TRUE
	known_contacts = list("Prince")

AddTimelock(/datum/job/vamp/camarilla/primogen_nosferatu, list(
	JOB_CAMARILLA_AUTHORITIES_ROLES = 5 HOURS,
	JOB_LIVING_ROLES = 2 HOURS,
))

/datum/outfit/job/nosferatu
	name = JOB_NOSFERATU 
	jobtype = /datum/job/vamp/camarilla/primogen_nosferatu

	id = /obj/item/card/id/primogen
	mask = /obj/item/clothing/mask/vampire/shemagh
	glasses = /obj/item/clothing/glasses/vampire/sun
	uniform = /obj/item/clothing/under/vampire/suit
	suit = /obj/item/clothing/suit/vampire/trench
	shoes = /obj/item/clothing/shoes/vampire
	l_pocket = /obj/item/vamp/phone/nosferatu
	r_pocket = /obj/item/cockclock
	backpack_contents = list(/obj/item/vamp/keys/nosferatu/primogen=1, /obj/item/passport=1, /obj/item/flashlight=1, /obj/item/vamp/creditcard/elder=1)

/datum/outfit/job/nosferatu/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == FEMALE)
		shoes = /obj/item/clothing/shoes/vampire/heels

/datum/job/vamp/camarilla/primogen_ventrue
	title = JOB_VENTRUE
	department_head = list("Justicar")
	faction = "Vampire"
	total_positions = 1
	spawn_positions = 1
	supervisors = " the Traditions"
	selection_color = "#4f0404"

	outfit = /datum/outfit/job/ventrue

	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	minimal_access = list(ACCESS_BAR, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_VENTRUE
	exp_type_department = EXP_TYPE_COUNCIL

	allowed_species = list("Vampire")
	allowed_bloodlines = list("Ventrue")
	minimal_generation = 7	//Uncomment when players get exp enough

	v_duty = "Offer your infinite knowledge to Prince of the City."
	experience_addition = 20
	minimal_masquerade = 5
	my_contact_is_important = TRUE
	known_contacts = list("Prince")

/datum/outfit/job/ventrue
	name = JOB_VENTRUE
	jobtype = /datum/job/vamp/camarilla/primogen_ventrue

	id = /obj/item/card/id/primogen
	glasses = /obj/item/clothing/glasses/vampire/sun
	uniform = /obj/item/clothing/under/vampire/suit
	suit = /obj/item/clothing/suit/vampire/trench
	shoes = /obj/item/clothing/shoes/vampire
	l_pocket = /obj/item/vamp/phone/ventrue
	r_pocket = /obj/item/cockclock
	backpack_contents = list(/obj/item/vamp/keys/ventrue/primogen=1, /obj/item/passport=1, /obj/item/flashlight=1, /obj/item/vamp/creditcard/elder=1)

AddTimelock(/datum/job/vamp/camarilla/primogen_ventrue, list(
	JOB_CAMARILLA_AUTHORITIES_ROLES = 5 HOURS,
	JOB_LIVING_ROLES = 2 HOURS,
))

/datum/outfit/job/ventrue/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == FEMALE)
		shoes = /obj/item/clothing/shoes/vampire/heels

/datum/job/vamp/camarilla/primogen_toreador
	title = JOB_TOREADOR 
	department_head = list("Justicar")
	faction = "Vampire"
	total_positions = 1
	spawn_positions = 1
	supervisors = " the Traditions"
	selection_color = "#4f0404"

	outfit = /datum/outfit/job/toreador

	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	minimal_access = list(ACCESS_BAR, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_TOREADOR
	exp_type_department = EXP_TYPE_COUNCIL

	allowed_species = list("Vampire")
	allowed_bloodlines = list("Toreador")
	minimal_generation = 7	//Uncomment when players get exp enough

	v_duty = "Offer your infinite knowledge to Prince of the City."
	experience_addition = 20
	minimal_masquerade = 5
	my_contact_is_important = TRUE
	known_contacts = list("Prince")

AddTimelock(/datum/job/vamp/camarilla/primogen_toreador, list(
	JOB_CAMARILLA_AUTHORITIES_ROLES = 5 HOURS,
	JOB_LIVING_ROLES = 2 HOURS,
))

/datum/outfit/job/toreador
	name = JOB_TOREADOR 
	jobtype = /datum/job/vamp/camarilla/primogen_toreador

	id = /obj/item/card/id/primogen
	glasses = /obj/item/clothing/glasses/vampire/sun
	uniform = /obj/item/clothing/under/vampire/primogen_toreador
	suit = /obj/item/clothing/suit/vampire/trench/alt
	shoes = /obj/item/clothing/shoes/vampire
	l_pocket = /obj/item/vamp/phone/toreador
	r_pocket = /obj/item/cockclock
	backpack_contents = list(/obj/item/vamp/keys/toreador/primogen=1, /obj/item/passport=1, /obj/item/flashlight=1, /obj/item/vamp/creditcard/elder=1)

/datum/outfit/job/toreador/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/vampire/primogen_toreador/female
		shoes = /obj/item/clothing/shoes/vampire/heels/red


/datum/job/vamp/camarilla/primogen_brujah
	title = JOB_BRUJAH 
	department_head = list("Justicar")
	faction = "Vampire"
	total_positions = 1
	spawn_positions = 1
	supervisors = " the Traditions"
	selection_color = "#4f0404"

	outfit = /datum/outfit/job/brujah

	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	minimal_access = list(ACCESS_BAR, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_BRUJAH
	exp_type_department = EXP_TYPE_COUNCIL

	allowed_species = list("Vampire")
	allowed_bloodlines = list("Brujah")
	minimal_generation = 7	//Uncomment when players get exp enough

	v_duty = "Offer your infinite knowledge to Prince of the City."
	experience_addition = 20
	minimal_masquerade = 5
	my_contact_is_important = TRUE
	known_contacts = list("Prince")

AddTimelock(/datum/job/vamp/camarilla/primogen_brujah, list(
	JOB_CAMARILLA_AUTHORITIES_ROLES = 5 HOURS,
	JOB_LIVING_ROLES = 2 HOURS,
))


/datum/outfit/job/brujah
	name = JOB_BRUJAH 
	jobtype = /datum/job/vamp/camarilla/primogen_brujah

	id = /obj/item/card/id/primogen
	glasses = /obj/item/clothing/glasses/vampire/yellow
	uniform = /obj/item/clothing/under/vampire/punk
	suit = /obj/item/clothing/suit/vampire/jacket/punk
	shoes = /obj/item/clothing/shoes/vampire/jackboots
	l_pocket = /obj/item/vamp/phone/brujah
	r_pocket = /obj/item/cockclock
	backpack_contents = list(/obj/item/vamp/keys/brujah/primogen=1, /obj/item/melee/vampirearms/eguitar=1, /obj/item/passport=1, /obj/item/flashlight=1, /obj/item/vamp/creditcard/elder=1)
