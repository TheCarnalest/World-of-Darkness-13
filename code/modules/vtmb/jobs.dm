/datum/job
	var/experience_addition = 5

/datum/outfit/job/post_equip(mob/living/carbon/human/H)
	. = ..()
	if(H.clane)
		if(H.clane.name == "Ventrue")
			var/obj/item/stack/dollar/hundred/HUN = new(H.loc)
			for(var/obj/item/storage/backpack/B in H)
				if(B)
					HUN.forceMove(B)

//CAMARILLA

/datum/job/vamp/prince
	title = "Prince"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	department_head = list("Justicar")
	faction = "Vampire"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Camarilla and the Traditions"
	selection_color = "#bd3327"
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 180
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_CAMARILLIA

	outfit = /datum/outfit/job/prince

	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC

	liver_traits = list(TRAIT_ROYAL_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_PRINCE

	minimal_generation = 10	//Uncomment when players get exp enough
	minimal_masquerade = 5
	kindred_only = TRUE
	allowed_bloodlines = list("Tremere", "Ventrue", "Nosferatu", "Toreador", "Malkavian", "Brujah", "Lasombra", "Gangrel")

	my_contact_is_important = TRUE
	known_contacts = list(						"Sheriff",
												"Seneschal",
												"Baron")

	duty = "Represent interests of Camarilla and maintain Masquerade."
	experience_addition = 25

/datum/job/vamp/prince/announce(mob/living/carbon/human/H)
	..()
	SSticker.OnRoundstart(CALLBACK(GLOBAL_PROC, .proc/minor_announce, "Prince [H.real_name] is in the city!"))

/datum/outfit/job/prince
	name = "Prince"
	jobtype = /datum/job/vamp/prince

	id = /obj/item/card/id/prince
	glasses = /obj/item/clothing/glasses/vampire/sun
	gloves = /obj/item/clothing/gloves/vampire/latex
	uniform =  /obj/item/clothing/under/vampire/prince
	suit = /obj/item/clothing/suit/vampire/trench/alt
	shoes = /obj/item/clothing/shoes/vampire
	l_pocket = /obj/item/vamp/phone/prince
	r_pocket = /obj/item/vamp/keys/prince
	backpack_contents = list(/obj/item/gun/ballistic/automatic/vampire/deagle=1, /obj/item/phone_book=1, /obj/item/passport=1, /obj/item/cockclock=1, /obj/item/flashlight=1, /obj/item/masquerade_contract=1, /obj/item/stack/dollar/hundred=3)


	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

	implants = list(/obj/item/implant/mindshield)
//	accessory = /obj/item/clothing/accessory/medal/gold/captain

/datum/outfit/job/prince/pre_equip(mob/living/carbon/human/H)
	..()
	H.frakcja = "Camarilla"
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/vampire/prince/female
		shoes = /obj/item/clothing/shoes/vampire/heels

/obj/effect/landmark/start/prince
	name = "Prince"
	icon_state = "Prince"

/datum/job/vamp/sheriff
	title = "Sheriff"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	department_head = list("Prince")
	head_announce = list(RADIO_CHANNEL_SECURITY)
	faction = "Vampire"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the prince"
	selection_color = "#bd3327"
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 300
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_SECURITY

	outfit = /datum/outfit/job/sheriff

	mind_traits = list(TRAIT_DONUT_LOVER)
	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM, TRAIT_ROYAL_METABOLISM)

	access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_ARMORY, ACCESS_COURT, ACCESS_WEAPONS, ACCESS_MECH_SECURITY,
					ACCESS_FORENSICS_LOCKERS, ACCESS_MORGUE, ACCESS_MAINT_TUNNELS, ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_AUX_BASE,
					ACCESS_RESEARCH, ACCESS_ENGINE, ACCESS_MINING, ACCESS_MEDICAL, ACCESS_CONSTRUCTION, ACCESS_MAILSORTING, ACCESS_EVA, ACCESS_TELEPORTER,
					ACCESS_HEADS, ACCESS_HOS, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MAINT_TUNNELS, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_ARMORY, ACCESS_COURT, ACCESS_WEAPONS, ACCESS_MECH_SECURITY,
					ACCESS_FORENSICS_LOCKERS, ACCESS_MORGUE, ACCESS_MAINT_TUNNELS, ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_AUX_BASE,
					ACCESS_RESEARCH, ACCESS_ENGINE, ACCESS_MINING, ACCESS_MEDICAL, ACCESS_CONSTRUCTION, ACCESS_MAILSORTING, ACCESS_EVA,
					ACCESS_HEADS, ACCESS_HOS, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MAINT_TUNNELS, ACCESS_MINERAL_STOREROOM)
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC

	display_order = JOB_DISPLAY_ORDER_SHERIFF
	bounty_types = CIV_JOB_SEC

	minimal_generation = 12	//Uncomment when players get exp enough
	minimal_masquerade = 5
	kindred_only = TRUE

	my_contact_is_important = TRUE
	known_contacts = list("Prince")

	duty = "Protect the Prince and his interests at any cost."
	experience_addition = 20

/datum/outfit/job/sheriff
	name = "Sheriff"
	jobtype = /datum/job/vamp/sheriff

	id = /obj/item/card/id/sheriff
	uniform = /obj/item/clothing/under/vampire/sheriff
	belt = /obj/item/melee/vampirearms/katana
	shoes = /obj/item/clothing/shoes/vampire/jackboots
	suit = /obj/item/clothing/suit/vampire/vest
	gloves = /obj/item/clothing/gloves/vampire/leather
//	head = /obj/item/clothing/head/hos/beret
	glasses = /obj/item/clothing/glasses/vampire/sun
	r_pocket = /obj/item/vamp/keys/sheriff
	l_pocket = /obj/item/vamp/phone/sheriff
	backpack_contents = list(/obj/item/gun/ballistic/automatic/vampire/deagle=1, /obj/item/vampire_stake=3, /obj/item/passport=1, /obj/item/cockclock=1, /obj/item/flashlight=1, /obj/item/masquerade_contract=1, /obj/item/stack/dollar/fifty=1)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

	implants = list(/obj/item/implant/mindshield)

/datum/outfit/job/sheriff/pre_equip(mob/living/carbon/human/H)
	..()
	H.frakcja = "Camarilla"
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/vampire/sheriff/female

/obj/effect/landmark/start/sheriff
	name = "Sheriff"
	icon_state = "Sheriff"

/datum/job/vamp/clerk
	title = "Seneschal"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list("Prince")
	head_announce = list(RADIO_CHANNEL_SUPPLY, RADIO_CHANNEL_SERVICE)
	faction = "Vampire"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the prince"
	selection_color = "#bd3327"
	req_admin_notify = 1
	minimal_player_age = 10
	exp_requirements = 180
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_NEUTRALS

	outfit = /datum/outfit/job/clerk

	access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_COURT, ACCESS_WEAPONS,
						ACCESS_MEDICAL, ACCESS_PSYCHOLOGY, ACCESS_ENGINE, ACCESS_CHANGE_IDS, ACCESS_AI_UPLOAD, ACCESS_EVA, ACCESS_HEADS,
						ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_MAINT_TUNNELS, ACCESS_BAR, ACCESS_JANITOR, ACCESS_CONSTRUCTION, ACCESS_MORGUE,
						ACCESS_CREMATORIUM, ACCESS_KITCHEN, ACCESS_CARGO, ACCESS_MAILSORTING, ACCESS_QM, ACCESS_HYDROPONICS, ACCESS_LAWYER,
						ACCESS_THEATRE, ACCESS_CHAPEL_OFFICE, ACCESS_LIBRARY, ACCESS_RESEARCH, ACCESS_MINING, ACCESS_VAULT, ACCESS_MINING_STATION,
						ACCESS_MECH_MINING, ACCESS_MECH_ENGINE, ACCESS_MECH_SCIENCE, ACCESS_MECH_SECURITY, ACCESS_MECH_MEDICAL,
						ACCESS_HOP, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM, ACCESS_AUX_BASE, ACCESS_TELEPORTER)
	minimal_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_COURT, ACCESS_WEAPONS,
						ACCESS_MEDICAL, ACCESS_PSYCHOLOGY, ACCESS_ENGINE, ACCESS_CHANGE_IDS, ACCESS_AI_UPLOAD, ACCESS_EVA, ACCESS_HEADS,
						ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_MAINT_TUNNELS, ACCESS_BAR, ACCESS_JANITOR, ACCESS_CONSTRUCTION, ACCESS_MORGUE,
						ACCESS_CREMATORIUM, ACCESS_KITCHEN, ACCESS_CARGO, ACCESS_MAILSORTING, ACCESS_QM, ACCESS_HYDROPONICS, ACCESS_LAWYER,
						ACCESS_MECH_MINING, ACCESS_MECH_ENGINE, ACCESS_MECH_SCIENCE, ACCESS_MECH_SECURITY, ACCESS_MECH_MEDICAL,
						ACCESS_THEATRE, ACCESS_CHAPEL_OFFICE, ACCESS_LIBRARY, ACCESS_RESEARCH, ACCESS_MINING, ACCESS_VAULT, ACCESS_MINING_STATION,
						ACCESS_HOP, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM, ACCESS_AUX_BASE, ACCESS_TELEPORTER)
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SRV
	bounty_types = CIV_JOB_RANDOM

	liver_traits = list(TRAIT_ROYAL_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_CLERK

//	minimal_generation = 12	//Uncomment when players get exp enough
	minimal_masquerade = 5

	my_contact_is_important = TRUE
	known_contacts = list("Prince")

	duty = "Represent interest of the Prince to other kindred."
	experience_addition = 15
	minimal_age = 12
	allowed_bloodlines = list("Daughters of Cacaphony", "Brujah", "Tremere", "Ventrue", "Nosferatu", "Gangrel", "Toreador", "Malkavian", "Banu Haqim", "Giovanni", "Ministry", "Lasombra")

/datum/outfit/job/clerk
	name = "Seneschal"
	jobtype = /datum/job/vamp/clerk

	id = /obj/item/card/id/clerk
	uniform = /obj/item/clothing/under/vampire/clerk
	shoes = /obj/item/clothing/shoes/vampire/brown
//	head = /obj/item/clothing/head/hopcap
	l_pocket = /obj/item/vamp/phone/clerk
	r_pocket = /obj/item/vamp/keys/clerk
	backpack_contents = list(/obj/item/passport=1, /obj/item/phone_book=1, /obj/item/cockclock=1, /obj/item/flashlight=1, /obj/item/stack/dollar/hundred=1)

/datum/outfit/job/clerk/pre_equip(mob/living/carbon/human/H)
	..()
	H.frakcja = "Camarilla"
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/vampire/clerk/female
		shoes = /obj/item/clothing/shoes/vampire/heels

/obj/effect/landmark/start/clerk
	name = "Seneschal"
	icon_state = "Clerk"

/datum/job/vamp/agent
	title = "Scourge"
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = list("Prince")
	faction = "Vampire"
	total_positions = 7
	spawn_positions = 7
	supervisors = "the prince"
	selection_color = "#bd3327"
	minimal_player_age = 7
	exp_requirements = 300
	exp_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/agent

	access = list(ACCESS_MAINT_TUNNELS, ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_COURT, ACCESS_MAINT_TUNNELS, ACCESS_MECH_SECURITY, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_FORENSICS_LOCKERS, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_COURT, ACCESS_WEAPONS, ACCESS_MECH_SECURITY, ACCESS_MINERAL_STOREROOM) // See /datum/job/officer/get_access()
	paycheck = PAYCHECK_HARD
	paycheck_department = ACCOUNT_SEC

	mind_traits = list(TRAIT_DONUT_LOVER)
	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_AGENT
	bounty_types = CIV_JOB_SEC
	known_contacts = list("Prince")

	duty = "Work for the Prince, protect the Masquerade."
	minimal_masquerade = 4
	experience_addition = 10
	allowed_bloodlines = list("Daughters of Cacaphony", "Brujah", "Tremere", "Ventrue", "Nosferatu", "Gangrel", "Toreador", "Malkavian", "Banu Haqim", "Giovanni", "Ministry", "Lasombra")

/datum/outfit/job/agent
	name = "Scourge"
	jobtype = /datum/job/vamp/agent

	id = /obj/item/card/id/camarilla
	uniform = /obj/item/clothing/under/vampire/agent
	gloves = /obj/item/clothing/gloves/vampire/work
	suit = /obj/item/clothing/suit/vampire/trench
	shoes = /obj/item/clothing/shoes/vampire
	r_pocket = /obj/item/vamp/keys/camarilla
	l_pocket = /obj/item/vamp/phone/camarilla
	backpack_contents = list(/obj/item/passport=1, /obj/item/cockclock=1, /obj/item/vampire_stake=3, /obj/item/flashlight=1, /obj/item/masquerade_contract=1, /obj/item/vamp/keys/hack=1, /obj/item/stack/dollar/fifty=1)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

	implants = list(/obj/item/implant/mindshield)

/datum/outfit/job/agent/pre_equip(mob/living/carbon/human/H)
	..()
	H.frakcja = "Camarilla"

/obj/effect/landmark/start/camarillaagent
	name = "Scourge"
	icon_state = "Camarilla Agent"

//NEUTRALS

/datum/job/vamp/graveyard
	title = "Graveyard Keeper"
	department_head = list("Seneschal")
	faction = "Vampire"
	total_positions = 6
	spawn_positions = 6
	supervisors = "the Camarilla or the Anarchs"
	selection_color = "#e3e3e3"

	outfit = /datum/outfit/job/graveyard

	access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_QM, ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM, ACCESS_AUX_BASE)
	minimal_access = list(ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MAILSORTING, ACCESS_MINERAL_STOREROOM, ACCESS_AUX_BASE)
	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_CAR

	display_order = JOB_DISPLAY_ORDER_GRAVEYARD
	bounty_types = CIV_JOB_MINE

	duty = "Protect the Graveyard Gates from the undead."
	minimal_masquerade = 0
	experience_addition = 25
	minimal_age = 12
	allowed_bloodlines = list("Daughters of Cacaphony", "Salubri", "Baali", "Brujah", "Tremere", "Ventrue", "Nosferatu", "Gangrel", "Toreador", "Malkavian", "Banu Haqim", "Giovanni", "Ministry", "Tzimisce", "Lasombra", "Caitiff")

/datum/outfit/job/graveyard
	name = "Graveyard Keeper"
	jobtype = /datum/job/vamp/graveyard

	id = /obj/item/card/id/graveyard
	shoes = /obj/item/clothing/shoes/vampire/jackboots
//	gloves = /obj/item/clothing/gloves/color/black
	uniform = /obj/item/clothing/under/vampire/graveyard
	suit = /obj/item/clothing/suit/vampire/trench
	glasses = /obj/item/clothing/glasses/vampire/yellow
	gloves = /obj/item/clothing/gloves/vampire/work
	l_pocket = /obj/item/vamp/phone
	r_pocket = /obj/item/vamp/keys/graveyard
	r_hand = /obj/item/melee/vampirearms/shovel
	backpack_contents = list(/obj/item/passport=1, /obj/item/cockclock=1, /obj/item/flashlight=1, /obj/item/stack/dollar/rand=1, /obj/item/melee/vampirearms/katana/kosa=1)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

/obj/effect/landmark/start/graveyardkeeper
	name = "Graveyard Keeper"
	icon_state = "Graveyard Keeper"

/datum/job/vamp/vdoctor
	title = "Doctor"
	department_head = list("Seneschal")
	faction = "Vampire"
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Camarilla or the Anarchs"
	selection_color = "#e3e3e3"

	outfit = /datum/outfit/job/vdoctor

	access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_PHARMACY, ACCESS_CHEMISTRY, ACCESS_VIROLOGY, ACCESS_MECH_MEDICAL, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_MECH_MEDICAL, ACCESS_MINERAL_STOREROOM, ACCESS_PHARMACY)
	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_MED

	liver_traits = list(TRAIT_MEDICAL_METABOLISM)

	humans_accessible = TRUE
	display_order = JOB_DISPLAY_ORDER_DOCTOR
	bounty_types = CIV_JOB_MED

	duty = "Collect blood by helping mortals at the Clinic."
	experience_addition = 15
	allowed_bloodlines = list("Daughters of Cacaphony", "Salubri", "Baali", "Brujah", "Tremere", "Ventrue", "Nosferatu", "Gangrel", "Toreador", "Malkavian", "Banu Haqim", "Giovanni", "Ministry", "Tzimisce", "Lasombra", "Caitiff")

/datum/outfit/job/vdoctor
	name = "Doctor"
	jobtype = /datum/job/vamp/vdoctor

	id = /obj/item/card/id/clinic
	uniform = /obj/item/clothing/under/vampire/nurse
	shoes = /obj/item/clothing/shoes/vampire/white
	suit =  /obj/item/clothing/suit/vampire/labcoat
	gloves = /obj/item/clothing/gloves/vampire/latex
	l_hand = /obj/item/storage/firstaid/medical
	l_pocket = /obj/item/vamp/phone
	r_pocket = /obj/item/vamp/keys/clinic
	backpack_contents = list(/obj/item/passport=1, /obj/item/cockclock=1, /obj/item/flashlight=1, /obj/item/stack/dollar/fifty=1)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

	skillchips = list(/obj/item/skillchip/entrails_reader, /obj/item/skillchip/quickcarry)

/obj/effect/landmark/start/vdoctor
	name = "Doctor"
	icon_state = "Doctor"

/datum/job/vamp/vjanitor
	title = "Street Janitor"
	department_head = list("Baron")
	faction = "Vampire"
	total_positions = 6
	spawn_positions = 6
	supervisors = "the Camarilla or the Anarchs"
	selection_color = "#e3e3e3"

	outfit = /datum/outfit/job/vjanitor

	access = list(ACCESS_JANITOR, ACCESS_MAINT_TUNNELS, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_JANITOR, ACCESS_MAINT_TUNNELS, ACCESS_MINERAL_STOREROOM)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV

	humans_accessible = TRUE

	display_order = JOB_DISPLAY_ORDER_STREETJAN
	allowed_bloodlines = list("Daughters of Cacaphony", "Salubri", "Baali", "Brujah", "Tremere", "Ventrue", "Nosferatu", "Gangrel", "Toreador", "Malkavian", "Banu Haqim", "Giovanni", "Ministry", "Tzimisce", "Lasombra", "Caitiff")

	duty = "Clean up all traces of Masquerade violations."
	minimal_masquerade = 0
	experience_addition = 25
	minimal_age = 12

/datum/outfit/job/vjanitor
	name = "Street Janitor"
	jobtype = /datum/job/vamp/vjanitor

	id = /obj/item/card/id/cleaning
	uniform = /obj/item/clothing/under/vampire/janitor
	l_pocket = /obj/item/vamp/phone
	r_pocket = /obj/item/vamp/keys/cleaning
	shoes = /obj/item/clothing/shoes/vampire/jackboots/work
	gloves = /obj/item/clothing/gloves/vampire/cleaning
	backpack_contents = list(/obj/item/passport=1, /obj/item/cockclock=1, /obj/item/flashlight=1, /obj/item/vamp/keys/hack=1, /obj/item/stack/dollar/rand=1)

/obj/effect/landmark/start/vjanitor
	name = "Street Janitor"
	icon_state = "Street Janitor"

/datum/job/vamp/regent
	title = "Chantry Regent"
	department_head = list("Prince")
	faction = "Vampire"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Traditions"
	selection_color = "#cb4aad"

	outfit = /datum/outfit/job/regent

	access = list(ACCESS_LIBRARY, ACCESS_AUX_BASE, ACCESS_MINING_STATION)
	minimal_access = list(ACCESS_LIBRARY, ACCESS_AUX_BASE, ACCESS_MINING_STATION)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	exp_type_department = EXP_TYPE_INDEPENDENT

	display_order = JOB_DISPLAY_ORDER_REGENT

	duty = "Keep a census of events and provide information to archivists. Lead the Chantry."
	minimal_masquerade = 4
	kindred_only = TRUE
	allowed_bloodlines = list("Tremere")
	experience_addition = 20

/datum/outfit/job/regent
	name = "Chantry Regent"
	jobtype = /datum/job/vamp/regent

	id = /obj/item/card/id/archive
	glasses = /obj/item/clothing/glasses/vampire/perception
	suit = /obj/item/clothing/suit/vampire/trench/archive
	shoes = /obj/item/clothing/shoes/vampire
	gloves = /obj/item/clothing/gloves/vampire/latex
	uniform = /obj/item/clothing/under/vampire/archivist
	r_pocket = /obj/item/vamp/keys/archive
	l_pocket = /obj/item/vamp/phone
	accessory = /obj/item/clothing/accessory/pocketprotector/full
	backpack_contents = list(/obj/item/passport=1, /obj/item/phone_book=1, /obj/item/cockclock=1, /obj/item/flashlight=1, /obj/item/arcane_tome=1, /obj/item/stack/dollar/rand=1, /obj/item/melee/vampirearms/katana/kosa=1)

/datum/outfit/job/regent/pre_equip(mob/living/carbon/human/H)
	..()
	H.frakcja = "Chantry"
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/vampire/archivist/female
		shoes = /obj/item/clothing/shoes/vampire/heels

/obj/effect/landmark/start/regent
	name = "Chantry Regent"
	icon_state = "Archivist"

/datum/job/vamp/archivist
	title = "Chantry Archivist"
	department_head = list("Prince")
	faction = "Vampire"
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Traditions and the Regent"
	selection_color = "#cb4aad"

	outfit = /datum/outfit/job/archivist

	access = list(ACCESS_LIBRARY, ACCESS_AUX_BASE, ACCESS_MINING_STATION)
	minimal_access = list(ACCESS_LIBRARY, ACCESS_AUX_BASE, ACCESS_MINING_STATION)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	exp_type_department = EXP_TYPE_INDEPENDENT

	display_order = JOB_DISPLAY_ORDER_ARCHIVIST

	duty = "Keep a census of events and provide information to neonates. Listen to the Regent Carefully."
	minimal_masquerade = 3
	kindred_only = TRUE
	allowed_bloodlines = list("Tremere")
	experience_addition = 15
	minimal_age = 12

/datum/outfit/job/archivist
	name = "Archivist"
	jobtype = /datum/job/vamp/archivist

	id = /obj/item/card/id/archive
	glasses = /obj/item/clothing/glasses/vampire/perception
	shoes = /obj/item/clothing/shoes/vampire
	gloves = /obj/item/clothing/gloves/vampire/latex
	uniform = /obj/item/clothing/under/vampire/archivist
	r_pocket = /obj/item/vamp/keys/archive
	l_pocket = /obj/item/vamp/phone
	accessory = /obj/item/clothing/accessory/pocketprotector/full
	backpack_contents = list(/obj/item/passport=1, /obj/item/cockclock=1, /obj/item/flashlight=1, /obj/item/arcane_tome=1, /obj/item/stack/dollar/rand=1, /obj/item/melee/vampirearms/katana/kosa=1)

/datum/outfit/job/archivist/pre_equip(mob/living/carbon/human/H)
	..()
	H.frakcja = "Chantry"
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/vampire/archivist/female
		shoes = /obj/item/clothing/shoes/vampire/heels

/obj/effect/landmark/start/archivist
	name = "Archivist"
	icon_state = "Archivist"

//ANARCHS

/datum/job/vamp/barkeeper
	title = "Baron"
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
	known_contacts = list(						"Prince",
												"Dealer")

	duty = "Lead the Anarchs in the City."
	minimal_masquerade = 3
	kindred_only = TRUE
	allowed_bloodlines = list("Brujah", "Nosferatu", "Gangrel", "Toreador", "Malkavian", "Ventrue", "Lasombra")
	experience_addition = 20

/datum/outfit/job/barkeeper
	name = "Baron"
	jobtype = /datum/job/vamp/barkeeper

	id = /obj/item/card/id/anarch
	glasses = /obj/item/clothing/glasses/vampire/sun
	uniform = /obj/item/clothing/under/vampire/bar
	suit = /obj/item/clothing/suit/vampire/jacket/better
	shoes = /obj/item/clothing/shoes/vampire
	gloves = /obj/item/clothing/gloves/vampire/work
	l_pocket = /obj/item/vamp/phone/barkeeper
	r_pocket = /obj/item/vamp/keys/bar
	backpack_contents = list(/obj/item/passport=1, /obj/item/phone_book=1, /obj/item/cockclock=1, /obj/item/flashlight=1, /obj/item/stack/dollar/hundred=3)

/datum/outfit/job/barkeeper/pre_equip(mob/living/carbon/human/H)
	..()
	H.frakcja = "Anarch"
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/vampire/bar/female
		shoes = /obj/item/clothing/shoes/vampire/heels

/obj/effect/landmark/start/barkeeper
	name = "Baron"
	icon_state = "Barkeeper"

/datum/job/vamp/bouncer
	title = "Bouncer"
	department_head = list("Baron")
	faction = "Vampire"
	total_positions = 7
	spawn_positions = 7
	supervisors = "the Baron"
	selection_color = "#434343"

	outfit = /datum/outfit/job/bouncer

	access = list(ACCESS_LAWYER, ACCESS_COURT, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_LAWYER, ACCESS_COURT, ACCESS_SEC_DOORS)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV

	mind_traits = list(TRAIT_DONUT_LOVER)
	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_BOUNCER
	known_contacts = list("Baron")
	allowed_bloodlines = list("Daughters of Cacaphony", "Brujah", "Nosferatu", "Gangrel", "Toreador", "Malkavian", "Banu Haqim", "Tzimisce", "Caitiff", "Lasombra")

	duty = "Work for the Baron."
	minimal_masquerade = 2
	experience_addition = 15

/datum/outfit/job/bouncer
	name = "Bouncer"
	jobtype = /datum/job/vamp/bouncer

	id = /obj/item/card/id/anarch
	uniform = /obj/item/clothing/under/vampire/bouncer
	suit = /obj/item/clothing/suit/vampire/jacket
	shoes = /obj/item/clothing/shoes/vampire/jackboots
	r_pocket = /obj/item/vamp/keys/anarch
	l_pocket = /obj/item/vamp/phone/anarch
	r_hand = /obj/item/melee/vampirearms/baseball
	backpack_contents = list(/obj/item/passport=1, /obj/item/cockclock=1, /obj/item/vampire_stake=3, /obj/item/flashlight=1, /obj/item/vamp/keys/hack=1, /obj/item/stack/dollar/rand=1)

/datum/outfit/job/bouncer/pre_equip(mob/living/carbon/human/H)
	..()
	H.frakcja = "Anarch"

/obj/effect/landmark/start/bouncer
	name = "Bouncer"
	icon_state = "Bouncer"

/datum/job/vamp/dealer
	title = "Dealer"
	department_head = list("Justicar")
	faction = "Vampire"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Anarchs and the Traditions"
	selection_color = "#434343"
	exp_type_department = EXP_TYPE_SUPPLY // This is so the jobs menu can work properly

	outfit = /datum/outfit/job/dealer

	access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_QM, ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM, ACCESS_VAULT, ACCESS_AUX_BASE)
	minimal_access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_QM, ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM, ACCESS_VAULT, ACCESS_AUX_BASE)
	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_CAR

	liver_traits = list(TRAIT_PRETENDER_ROYAL_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_DEALER
	bounty_types = CIV_JOB_RANDOM

//	minimal_generation = 12	//Uncomment when players get exp enough

	my_contact_is_important = TRUE
	known_contacts = list("Baron")
	allowed_bloodlines = list("Brujah", "Nosferatu", "Gangrel", "Toreador", "Malkavian", "Banu Haqim", "Tzimisce", "Caitiff")

	duty = "Provide weapons to other kindred in the city."
	minimal_masquerade = 3
	kindred_only = TRUE
	experience_addition = 20

/datum/outfit/job/dealer
	name = "Dealer"
	jobtype = /datum/job/vamp/dealer

	id = /obj/item/card/id/dealer
	uniform = /obj/item/clothing/under/vampire/suit
	shoes = /obj/item/clothing/shoes/vampire/brown
	glasses = /obj/item/clothing/glasses/vampire/sun
	l_pocket = /obj/item/vamp/phone/dealer
	r_pocket = /obj/item/vamp/keys/supply
	backpack_contents = list(/obj/item/passport=1, /obj/item/cockclock=1, /obj/item/flashlight=1, /obj/item/stack/dollar/hundred=1)

/datum/outfit/job/dealer/pre_equip(mob/living/carbon/human/H)
	..()
	H.frakcja = "Anarch"
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/vampire/suit/female
		shoes = /obj/item/clothing/shoes/vampire/heels/red

/obj/effect/landmark/start/dealer
	name = "Dealer"
	icon_state = "Dealer"

/datum/job/vamp/supply
	title = "Supply Technician"
	department_head = list("Dealer")
	faction = "Vampire"
	total_positions = 4
	spawn_positions = 4
	supervisors = "the dealer"
	selection_color = "#434343"

	outfit = /datum/outfit/job/supply

	access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_QM, ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_MAINT_TUNNELS, ACCESS_CARGO, ACCESS_MAILSORTING, ACCESS_MINERAL_STOREROOM, ACCESS_MECH_MINING)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_CAR
	display_order = JOB_DISPLAY_ORDER_SUPPLY
	bounty_types = CIV_JOB_RANDOM
	humans_accessible = TRUE
	known_contacts = list("Baron")
	allowed_bloodlines = list("Daughters of Cacaphony", "Brujah", "Nosferatu", "Gangrel", "Toreador", "Malkavian", "Banu Haqim", "Tzimisce", "Caitiff", "Lasombra")

	duty = "Manage deliveries and supplies for kindred in the City."
	minimal_masquerade = 2
	experience_addition = 15
	minimal_age = 12

/datum/outfit/job/supply
	name = "Supply Technician"
	jobtype = /datum/job/vamp/supply

	id = /obj/item/card/id/supplytech
	uniform = /obj/item/clothing/under/vampire/supply
	gloves = /obj/item/clothing/gloves/vampire/work
	l_pocket = /obj/item/vamp/phone/anarch
	r_pocket = /obj/item/vamp/keys/supply
	shoes = /obj/item/clothing/shoes/vampire/jackboots
	backpack_contents = list(/obj/item/passport=1, /obj/item/phone_book=1, /obj/item/cockclock=1, /obj/item/flashlight=1, /obj/item/stack/dollar/rand=1)

/datum/outfit/job/supply/pre_equip(mob/living/carbon/human/H)
	..()
	H.frakcja = "Anarch"

/obj/effect/landmark/start/supplytechnician
	name = "Supply Technician"
	icon_state = "Supply Technician"

//ASS ISTANTS

/datum/job/vamp/citizen
	title = "Citizen"
	faction = "Vampire"
	total_positions = -1
	spawn_positions = -1
	supervisors = "the Traditions"
	selection_color = "#7e7e7e"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	outfit = /datum/outfit/job/citizen
	antag_rep = 7
	paycheck = PAYCHECK_ASSISTANT // Get a job. Job reassignment changes your paycheck now. Get over it.

	access = list(ACCESS_MAINT_TUNNELS)
	liver_traits = list(TRAIT_GREYTIDE_METABOLISM)

	paycheck_department = ACCOUNT_CIV
	display_order = JOB_DISPLAY_ORDER_CITIZEN

	humans_accessible = TRUE
	garou_allowed = TRUE

	duty = "Follow the Traditions, or other laws provided by the current authority among your kind."
	minimal_masquerade = 0
	minimal_age = 12
	allowed_bloodlines = list("Daughters of Cacaphony", "Salubri", "Baali", "Brujah", "Tremere", "Ventrue", "Nosferatu", "Gangrel", "Toreador", "Malkavian", "Banu Haqim", "Giovanni", "Ministry", "Tzimisce", "Lasombra", "Caitiff")

/datum/outfit/job/citizen
	name = "Citizen"
	jobtype = /datum/job/vamp/citizen
	l_pocket = /obj/item/vamp/phone
	id = /obj/item/cockclock
	backpack_contents = list(/obj/item/passport=1, /obj/item/flashlight=1, /obj/item/stack/dollar/rand=1)

/datum/outfit/job/citizen/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.clane)
		if(H.gender == MALE)
			shoes = /obj/item/clothing/shoes/vampire
			if(H.clane.male_clothes)
				uniform = text2path(H.clane.male_clothes)
		else
			shoes = /obj/item/clothing/shoes/vampire/heels
			if(H.clane.female_clothes)
				uniform = text2path(H.clane.female_clothes)
	else
		uniform = /obj/item/clothing/under/vampire/emo
		if(H.gender == MALE)
			shoes = /obj/item/clothing/shoes/vampire
		else
			shoes = /obj/item/clothing/shoes/vampire/heels

/obj/effect/landmark/start/citizen
	name = "Citizen"
	icon_state = "Assistant"

/datum/job/vamp/strip
	title = "Stripper"
	faction = "Vampire"
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Camarilla or the Anarchs"
	selection_color = "#e3e3e3"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/strip
	antag_rep = 7
	paycheck = PAYCHECK_ASSISTANT // Get a job. Job reassignment changes your paycheck now. Get over it.
	exp_type_department = EXP_TYPE_NEUTRALS

	paycheck_department = ACCOUNT_CIV
	display_order = JOB_DISPLAY_ORDER_STRIP
	humans_accessible = TRUE

	duty = "Offer strip club services to humans or undead."
	minimal_masquerade = 3
	allowed_bloodlines = list("Daughters of Cacaphony", "Salubri", "Baali", "Brujah", "Tremere", "Ventrue", "Nosferatu", "Gangrel", "Toreador", "Malkavian", "Banu Haqim", "Giovanni", "Ministry", "Tzimisce", "Lasombra", "Caitiff")
	experience_addition = 10

/datum/outfit/job/strip
	name = "Stripper"
	jobtype = /datum/job/vamp/citizen
	l_pocket = /obj/item/vamp/phone
	r_pocket = /obj/item/vamp/keys/strip
	id = /obj/item/cockclock
	backpack_contents = list(/obj/item/passport=1, /obj/item/flashlight=1, /obj/item/stack/dollar/fifty=1)

/datum/outfit/job/strip/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == MALE)
		shoes = /obj/item/clothing/shoes/vampire/white
		uniform = /obj/item/clothing/under/vampire/pimp
	else
		shoes = /obj/item/clothing/shoes/vampire/heels
		uniform = /obj/item/clothing/under/vampire/whore

/obj/effect/landmark/start/strip
	name = "Strip"
	icon_state = "Assistant"

//ID

/obj/item/card/id/prince/AltClick(mob/user)
	return

/obj/item/card/id/sheriff/AltClick(mob/user)
	return

/obj/item/card/id/camarilla/AltClick(mob/user)
	return

/obj/item/card/id/clerk/AltClick(mob/user)
	return

/obj/item/card/id/anarch/AltClick(mob/user)
	return

/obj/item/card/id/clinic/AltClick(mob/user)
	return

/obj/item/card/id/archive/AltClick(mob/user)
	return

/obj/item/card/id/cleaning/AltClick(mob/user)
	return

/obj/item/card/id/dealer/AltClick(mob/user)
	return

/obj/item/card/id/supplytech/AltClick(mob/user)
	return

/obj/item/card/id/hunter/AltClick(mob/user)
	return

/obj/item/card/id/primogen/AltClick(mob/user)
	return

/obj/item/card/id/police/AltClick(mob/user)
	return

/obj/item/card/id/hunter
	var/last_detonated = 0

/obj/item/card/id/hunter/attack_self(mob/user)
	. = ..()
	if(last_detonated+300 > world.time)
		return
	if(!user.mind)
		return
	if(user.mind.holy_role != HOLY_ROLE_PRIEST)
		return
	last_detonated = world.time
	do_sparks(rand(5, 9), FALSE, user)
	playsound(user.loc, 'code/modules/ziggers/sounds/cross.ogg', 100, FALSE, 8, 0.9)
	for(var/mob/living/M in get_hearers_in_view(4, user.loc))
		bang(get_turf(M), M, user)

/obj/item/card/id/hunter/proc/bang(turf/T, mob/living/M, var/mob/living/user)
	if(M.stat == DEAD)	//They're dead!
		return
	var/mob/living/carbon/human/H
	if(ishuman(M))
		H = M
	if(H)
		for(var/obj/item/card/id/hunter/HUNT in H.contents)
			if(HUNT)
				if(H.mind)
					if(H.mind.holy_role == HOLY_ROLE_PRIEST)
						return
		if(iskindred(H))
			if(H.clane)
				if(H.clane.name == "Baali")
					H.emote("scream")
					H.pointed(user)
	M.show_message("<span class='warning'><b>GOD SEES YOU!</b></span>", MSG_AUDIBLE)
	var/distance = max(0,get_dist(get_turf(src),T))

	if(M.flash_act(affect_silicon = 1))
		M.Immobilize(max(10/max(1,distance), 5))

/obj/item/card/id/hunter/attack(mob/living/target, mob/living/user)
	. = ..()
	if(HAS_TRAIT(user, TRAIT_PACIFISM))
		return
	if(last_detonated+300 > world.time)
		return
	if(iskindred(target))
		var/mob/living/carbon/human/H = target
		if(H.clane)
			if(H.clane.name == "Baali")
				last_detonated = world.time
				var/turf/lightning_source = get_step(get_step(H, NORTH), NORTH)
				lightning_source.Beam(H, icon_state="lightning[rand(1,12)]", time = 5)
				H.adjustFireLoss(100)
				H.electrocution_animation(50)
				to_chat(H, "<span class='userdanger'>The God has punished you for your sins!</span>", confidential = TRUE)

/obj/item/card/id/prince
	name = "leader badge"
	id_type_name = "leader badge"
	desc = "King in the castle!"
	icon = 'code/modules/ziggers/items.dmi'
	icon_state = "id6"
	inhand_icon_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	onflooricon = 'code/modules/ziggers/onfloor.dmi'
	worn_icon = 'code/modules/ziggers/worn.dmi'
	worn_icon_state = "id6"

/obj/item/card/id/sheriff
	name = "head security badge"
	id_type_name = "head security badge"
	desc = "A badge which shows honour and dedication."
	icon = 'code/modules/ziggers/items.dmi'
	icon_state = "id4"
	inhand_icon_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	onflooricon = 'code/modules/ziggers/onfloor.dmi'
	worn_icon = 'code/modules/ziggers/worn.dmi'
	worn_icon_state = "id4"

/obj/item/card/id/camarilla
	name = "security badge"
	id_type_name = "security badge"
	desc = "A badge which shows honour and dedication."
	icon = 'code/modules/ziggers/items.dmi'
	icon_state = "id3"
	inhand_icon_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	onflooricon = 'code/modules/ziggers/onfloor.dmi'
	worn_icon = 'code/modules/ziggers/worn.dmi'
	worn_icon_state = "id3"

/obj/item/card/id/clerk
	name = "clerk badge"
	id_type_name = "clerk badge"
	desc = "A badge which shows buerocracy qualification."
	icon = 'code/modules/ziggers/items.dmi'
	icon_state = "id1"
	inhand_icon_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	onflooricon = 'code/modules/ziggers/onfloor.dmi'
	worn_icon = 'code/modules/ziggers/worn.dmi'
	worn_icon_state = "id1"

/obj/item/card/id/anarch
	name = "biker badge"
	id_type_name = "biker badge"
	desc = "A badge which shows protest and anarchy."
	icon = 'code/modules/ziggers/items.dmi'
	icon_state = "id5"
	inhand_icon_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	onflooricon = 'code/modules/ziggers/onfloor.dmi'
	worn_icon = 'code/modules/ziggers/worn.dmi'
	worn_icon_state = "id5"

/obj/item/card/id/clinic
	name = "medical badge"
	id_type_name = "medical badge"
	desc = "A badge which shows medical qualification."
	icon = 'code/modules/ziggers/items.dmi'
	icon_state = "id2"
	inhand_icon_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	onflooricon = 'code/modules/ziggers/onfloor.dmi'
	worn_icon = 'code/modules/ziggers/worn.dmi'
	worn_icon_state = "id2"

/obj/item/card/id/archive
	name = "librarian badge"
	id_type_name = "librarian badge"
	desc = "A badge which shows the love to books."
	icon = 'code/modules/ziggers/items.dmi'
	icon_state = "id7"
	inhand_icon_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	onflooricon = 'code/modules/ziggers/onfloor.dmi'
	worn_icon = 'code/modules/ziggers/worn.dmi'
	worn_icon_state = "id7"

/obj/item/card/id/cleaning
	name = "janitor badge"
	id_type_name = "janitor badge"
	desc = "A badge which shows cleaning employment."
	icon = 'code/modules/ziggers/items.dmi'
	icon_state = "id8"
	inhand_icon_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	onflooricon = 'code/modules/ziggers/onfloor.dmi'
	worn_icon = 'code/modules/ziggers/worn.dmi'
	worn_icon_state = "id8"

/obj/item/card/id/graveyard
	name = "keeper badge"
	id_type_name = "keeper badge"
	desc = "A badge which shows graveyard employment."
	icon = 'code/modules/ziggers/items.dmi'
	icon_state = "id8"
	inhand_icon_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	onflooricon = 'code/modules/ziggers/onfloor.dmi'
	worn_icon = 'code/modules/ziggers/worn.dmi'
	worn_icon_state = "id8"

/obj/item/card/id/dealer
	name = "business badge"
	id_type_name = "business badge"
	desc = "A badge which shows business."
	icon = 'code/modules/ziggers/items.dmi'
	icon_state = "id9"
	inhand_icon_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	onflooricon = 'code/modules/ziggers/onfloor.dmi'
	worn_icon = 'code/modules/ziggers/worn.dmi'
	worn_icon_state = "id9"

/obj/item/card/id/supplytech
	name = "technician badge"
	id_type_name = "technician badge"
	desc = "A badge which shows supply employment."
	icon = 'code/modules/ziggers/items.dmi'
	icon_state = "id10"
	inhand_icon_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	onflooricon = 'code/modules/ziggers/onfloor.dmi'
	worn_icon = 'code/modules/ziggers/worn.dmi'
	worn_icon_state = "id10"

/obj/item/card/id/hunter
	name = "cross"
	id_type_name = "cross"
	desc = "When you come into the land that the Lord your God is giving you, you must not learn to imitate the abhorrent practices of those nations. No one shall be found among you who makes a son or daughter pass through fire, or who practices divination, or is a soothsayer, or an augur, or a sorcerer, or one who casts spells, or who consults ghosts or spirits, or who seeks oracles from the dead. For whoever does these things is abhorrent to the Lord; it is because of such abhorrent practices that the Lord your God is driving them out before you (Deuteronomy 18:9-12)."
	icon = 'code/modules/ziggers/items.dmi'
	icon_state = "id11"
	inhand_icon_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	onflooricon = 'code/modules/ziggers/onfloor.dmi'
	worn_icon = 'code/modules/ziggers/worn.dmi'
	worn_icon_state = "id11"

/obj/item/card/id/primogen
	name = "mysterious primogen badge"
	id_type_name = "mysterious primogen badge"
	desc = "Sponsored by the Shadow Government."
	icon = 'code/modules/ziggers/items.dmi'
	icon_state = "id12"
	inhand_icon_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	onflooricon = 'code/modules/ziggers/onfloor.dmi'
	worn_icon = 'code/modules/ziggers/worn.dmi'
	worn_icon_state = "id12"

/obj/item/card/id/police
	name = "law department badge"
	id_type_name = "law department badge"
	desc = "Sponsored by the Government."
	icon = 'code/modules/ziggers/items.dmi'
	icon_state = "id13"
	inhand_icon_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	onflooricon = 'code/modules/ziggers/onfloor.dmi'
	worn_icon = 'code/modules/ziggers/worn.dmi'
	worn_icon_state = "id13"

/datum/outfit/job/caitiff
	name = "Caitiff"
	l_pocket = /obj/item/vamp/phone
	r_pocket = /obj/item/flashlight
	id = /obj/item/cockclock
	backpack_contents = list(/obj/item/passport=1, /obj/item/vampire_stake=1, /obj/item/vamp/keys/hack=1)

/datum/outfit/job/caitiff/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == MALE)
		shoes = /obj/item/clothing/shoes/vampire
		if(H.clane)
			if(H.clane.male_clothes)
				uniform = text2path(H.clane.male_clothes)
	else
		shoes = /obj/item/clothing/shoes/vampire/heels
		if(H.clane)
			if(H.clane.female_clothes)
				uniform = text2path(H.clane.female_clothes)

/datum/outfit/job/caitiff/post_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.add_antag_datum(/datum/antagonist/caitiff)

	var/list/landmarkslist = list()
	for(var/obj/effect/landmark/start/S in GLOB.start_landmarks_list)
		if(S.name == name)
			landmarkslist += S
	var/obj/effect/landmark/start/D = pick(landmarkslist)
	H.forceMove(D.loc)

/obj/effect/landmark/start/caitiff
	name = "Caitiff"
	delete_after_roundstart = FALSE

/datum/antagonist/caitiff
	name = "Caitiff"
	roundend_category = "caitiffs"
	antagpanel_category = "Caitiff"
	job_rank = ROLE_TRAITOR
	antag_moodlet = /datum/mood_event/focused
	antag_hud_type = ANTAG_HUD_TRAITOR
	antag_hud_name = "traitor"

/datum/antagonist/caitiff/on_gain()
	owner.special_role = src
	var/datum/objective/assassinate/kill_objective = new
	kill_objective.owner = owner
	kill_objective.find_target()
	objectives += kill_objective
	owner.current.playsound_local(get_turf(owner.current), 'code/modules/ziggers/sounds/sad_start.ogg', 100, FALSE, pressure_affected = FALSE, use_reverb = FALSE)
	return ..()

/datum/antagonist/caitiff/on_removal()
	..()
	to_chat(owner.current,"<span class='userdanger'>You are no longer the Caitiff!</span>")
	owner.special_role = null

/datum/antagonist/caitiff/greet()
	to_chat(owner.current, "<span class='alertsyndie'>You are the Caitiff.</span>")
	owner.announce_objectives()

/datum/outfit/job/hunter
	name = "Hunter"
	uniform = /obj/item/clothing/under/vampire/graveyard
	r_pocket = /obj/item/flashlight
	id = /obj/item/card/id/hunter
	shoes = /obj/item/clothing/shoes/vampire/jackboots
	l_pocket = /obj/item/vamp/keys/church
	backpack_contents = list(
		/obj/item/storage/book/bible = 1,
		/obj/item/vampire_stake = 3,
		/obj/item/molotov = 1,
		/obj/item/gas_can/full = 1,
		/obj/item/vamp/keys/hack=1
		)

/datum/outfit/job/hunter/post_equip(mob/living/carbon/human/H)
	..()
	if(H.clane)
		qdel(H.clane)
	H.set_species(/datum/species/human)
	H.generation = 13
	H.maxHealth = round((initial(H.maxHealth)-initial(H.maxHealth)/4)+(initial(H.maxHealth)/4)*(H.physique+13-H.generation))
	H.health = round((initial(H.health)-initial(H.health)/4)+(initial(H.health)/4)*(H.physique+13-H.generation))
	for(var/atom/movable/screen/blood/B in H.hud_used.infodisplay)
		B.icon_state = null
	for(var/atom/movable/screen/healths/HE in H.hud_used.infodisplay)
		HE.icon = 'code/modules/ziggers/ghoul_health.dmi'
	for(var/atom/movable/screen/drinkblood/DB in H.hud_used.static_inventory)
		DB.icon_state = null
	for(var/atom/movable/screen/bloodheal/BH in H.hud_used.static_inventory)
		BH.icon_state = null
	for(var/atom/movable/screen/bloodpower/BP in H.hud_used.static_inventory)
		BP.icon_state = null
	for(var/atom/movable/screen/disciplines/DI in H.hud_used.static_inventory)
		DI.icon_state = null
	for(var/datum/action/A in H.actions)
		if(A.vampiric)
			qdel(A)
	H.thaumaturgy_knowledge = FALSE
	QDEL_NULL(H.clane)
	var/obj/item/organ/eyes/NV = new()
	NV.Insert(H, TRUE, FALSE)
	if(H.mind)
		H.mind.add_antag_datum(/datum/antagonist/hunter)

	var/list/landmarkslist = list()
	for(var/obj/effect/landmark/start/S in GLOB.start_landmarks_list)
		if(S.name == name)
			landmarkslist += S
	var/obj/effect/landmark/start/D = pick(landmarkslist)
	H.forceMove(D.loc)

	var/list/loadouts = list("Fire Fighter", "EOD Suit", "Holy Presence")
	var/loadout_type = input(H, "Choose the Lord's gift for you:", "Loadout") as anything in loadouts
	switch(loadout_type)
		if("Fire Master")
			H.equip_to_slot_or_del(new /obj/item/clothing/head/vampire/helmet(H), ITEM_SLOT_HEAD)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/vampire/vest(H), ITEM_SLOT_OCLOTHING)
			H.put_in_r_hand(new /obj/item/vampire_flamethrower(H))
			H.put_in_l_hand(new /obj/item/melee/vampirearms/fireaxe(H))
			H.equip_to_slot_or_del(new /obj/item/black_king_bar(H), ITEM_SLOT_RPOCKET)
		if("EOD Suit")
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/vampire/eod(H), ITEM_SLOT_OCLOTHING)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/vampire/eod(H), ITEM_SLOT_HEAD)
			H.equip_to_slot_or_del(new /obj/item/black_king_bar(H), ITEM_SLOT_RPOCKET)
			H.put_in_r_hand(new /obj/item/gun/ballistic/shotgun/vampire(H))
			H.put_in_l_hand(new /obj/item/ammo_box/vampire/c12g(H))
		if("Holy Presence")
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/vampire/vest/army(H), ITEM_SLOT_OCLOTHING)
			H.put_in_r_hand(new /obj/item/melee/vampirearms/chainsaw(H))
			H.resistant_to_disciplines = TRUE
			to_chat(H, "<b>You are no longer vulnerable to vampire blood powers...</b>")

/obj/effect/landmark/start/hunter
	name = "Hunter"
	delete_after_roundstart = FALSE

/datum/antagonist/hunter
	name = "Hunter"
	roundend_category = "hunters"
	antagpanel_category = "Hunter"
	job_rank = ROLE_OPERATIVE
	antag_hud_type = ANTAG_HUD_OPS
	antag_hud_name = "synd"
	antag_moodlet = /datum/mood_event/focused
	show_to_ghosts = TRUE

/datum/antagonist/hunter/on_gain()
	owner.holy_role = HOLY_ROLE_PRIEST
	add_antag_hud(ANTAG_HUD_OPS, "synd", owner.current)
	owner.special_role = src
	var/datum/objective/custom/custom_objective = new
	custom_objective.owner = owner
	custom_objective.explanation_text = "Exterminate all evil spirits in the city. Let the Hunt begin!"
	objectives += custom_objective
	var/datum/objective/martyr/die_objective = new
	die_objective.owner = owner
	objectives += die_objective
	owner.current.playsound_local(get_turf(owner.current), 'code/modules/ziggers/sounds/orthodox_start.ogg', 100, FALSE, pressure_affected = FALSE, use_reverb = FALSE)
	return ..()

/datum/antagonist/hunter/on_removal()
	..()
	to_chat(owner.current,"<span class='userdanger'>You are no longer the Hunter!</span>")
	owner.special_role = null

/datum/antagonist/hunter/greet()
	to_chat(owner.current, "<span class='alertsyndie'>You are the Hunter.</span>")
	owner.announce_objectives()

/datum/outfit/job/sabbatist
	name = "Sabbatist"
	l_pocket = /obj/item/vamp/phone
	r_pocket = /obj/item/flashlight
	suit = /obj/item/clothing/suit/vampire/trench
	id = /obj/item/cockclock
	backpack_contents = list(/obj/item/passport=1, /obj/item/vampire_stake=3, /obj/item/gun/ballistic/vampire/revolver=1, /obj/item/melee/vampirearms/knife=1, /obj/item/vamp/keys/hack=1, /obj/item/melee/vampirearms/katana/kosa=1)

/datum/outfit/job/sabbatist/pre_equip(mob/living/carbon/human/H)
	..()
	H.frakcja = "Sabbat"
	if(H.gender == MALE)
		shoes = /obj/item/clothing/shoes/vampire
		if(H.clane)
			if(H.clane.male_clothes)
				uniform = text2path(H.clane.male_clothes)
	else
		shoes = /obj/item/clothing/shoes/vampire/heels
		if(H.clane)
			if(H.clane.female_clothes)
				uniform = text2path(H.clane.female_clothes)

/datum/outfit/job/sabbatist/post_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.add_antag_datum(/datum/antagonist/sabbatist)
	GLOB.sabbatites += H

	var/list/landmarkslist = list()
	for(var/obj/effect/landmark/start/S in GLOB.start_landmarks_list)
		if(S.name == name)
			landmarkslist += S
	var/obj/effect/landmark/start/D = pick(landmarkslist)
	H.forceMove(D.loc)

/obj/effect/landmark/start/sabbatist
	name = "Sabbatist"
	delete_after_roundstart = FALSE

/datum/antagonist/sabbatist
	name = "Sabbatist"
	roundend_category = "sabbattites"
	antagpanel_category = "Sabbat"
	job_rank = ROLE_REV
	antag_moodlet = /datum/mood_event/revolution
	antag_hud_type = ANTAG_HUD_REV
	antag_hud_name = "rev"

/datum/antagonist/sabbatist/on_gain()
	add_antag_hud(ANTAG_HUD_REV, "rev", owner.current)
	owner.special_role = src
	var/datum/objective/custom/custom_objective = new
	custom_objective.owner = owner
	custom_objective.explanation_text = "Kill Camarilla's and Anarch's heads. They do not deserve to rule that land. You deserve."
	objectives += custom_objective
	var/datum/objective/survive/survive_objective = new
	survive_objective.owner = owner
	objectives += survive_objective
	owner.current.playsound_local(get_turf(owner.current), 'code/modules/ziggers/sounds/evil_start.ogg', 100, FALSE, pressure_affected = FALSE, use_reverb = FALSE)
	return ..()

/datum/antagonist/sabbatist/on_removal()
	..()
	to_chat(owner.current,"<span class='userdanger'>You are no longer the part of Sabbat!</span>")
	owner.special_role = null

/datum/antagonist/sabbatist/greet()
	to_chat(owner.current, "<span class='alertsyndie'>You are the part of Sabbat.</span>")
	owner.announce_objectives()

/datum/job/vamp/giovanni
	title = "Giovanni Member"
	department_head = list("Justicar")
	faction = "Vampire"
	total_positions = 10
	spawn_positions = 10
	supervisors = "the Family and the Traditions"
	selection_color = "#cb4aad"

	outfit = /datum/outfit/job/giovanni

	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	minimal_access = list(ACCESS_BAR, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_GIOVANNI
	exp_type_department = EXP_TYPE_INDEPENDENT

//	minimal_generation = 11	//Uncomment when players get exp enough

	duty = "Protect the Family."
	minimal_masquerade = 0
	experience_addition = 10
	kindred_only = TRUE
	allowed_bloodlines = list("Giovanni")
	minimal_age = 12

/datum/outfit/job/giovanni
	name = "Giovanni Member"
	jobtype = /datum/job/vamp/giovanni

	id = /obj/item/cockclock
	glasses = /obj/item/clothing/glasses/vampire/sun
	uniform = /obj/item/clothing/under/vampire/suit
	suit = /obj/item/clothing/suit/vampire/trench
	shoes = /obj/item/clothing/shoes/vampire
	l_pocket = /obj/item/vamp/phone
	r_pocket = /obj/item/vamp/keys/giovanni
	backpack_contents = list(/obj/item/passport=1, /obj/item/flashlight=1, /obj/item/stack/dollar/fifty=1)

/datum/outfit/job/giovanni/pre_equip(mob/living/carbon/human/H)
	..()
	H.frakcja = "Giovanni"
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/vampire/suit/female
		shoes = /obj/item/clothing/shoes/vampire/heels

/obj/effect/landmark/start/giovanni
	name = "Giovanni Member"

/datum/job/vamp/taxi
	title = "Taxi Driver"
	department_head = list("Justicar")
	faction = "Vampire"
	total_positions = 3
	spawn_positions = 3
	supervisors = " the Traditions"
	selection_color = "#cb4aad"

	outfit = /datum/outfit/job/taxi

	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	minimal_access = list(ACCESS_BAR, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_TAXI
	exp_type_department = EXP_TYPE_INDEPENDENT

//	minimal_generation = 11	//Uncomment when players get exp enough
	humans_accessible = TRUE
	garou_allowed = TRUE

	duty = "Transfer people in the city."
	minimal_masquerade = 0
	experience_addition = 10
	allowed_bloodlines = list("Daughters of Cacaphony", "Salubri", "Baali", "Brujah", "Tremere", "Ventrue", "Nosferatu", "Gangrel", "Toreador", "Malkavian", "Banu Haqim", "Giovanni", "Ministry", "Tzimisce", "Lasombra", "Caitiff")

/datum/job/vamp/taxi/after_spawn(mob/living/H, mob/M, latejoin = FALSE)
	..()
	H.taxist = TRUE

/datum/outfit/job/taxi
	name = "Taxi Driver"
	jobtype = /datum/job/vamp/taxi

	id = /obj/item/cockclock
	glasses = /obj/item/clothing/glasses/vampire/sun
	uniform = /obj/item/clothing/under/vampire/suit
	shoes = /obj/item/clothing/shoes/vampire
	l_pocket = /obj/item/vamp/phone
	r_pocket = /obj/item/vamp/keys/taxi
	backpack_contents = list(/obj/item/passport=1, /obj/item/flashlight=1, /obj/item/stack/dollar/fifty=1)

/datum/outfit/job/taxi/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.clane)
		if(H.gender == MALE)
			shoes = /obj/item/clothing/shoes/vampire
			if(H.clane.male_clothes)
				uniform = text2path(H.clane.male_clothes)
		else
			shoes = /obj/item/clothing/shoes/vampire/heels
			if(H.clane.female_clothes)
				uniform = text2path(H.clane.female_clothes)
	else
		if(H.gender == MALE)
			shoes = /obj/item/clothing/shoes/vampire
			uniform = /obj/item/clothing/under/vampire/sport
		else
			shoes = /obj/item/clothing/shoes/vampire/heels
			uniform = /obj/item/clothing/under/vampire/red

/obj/effect/landmark/start/taxi
	name = "Taxi Driver"

/datum/antagonist/ambitious
	name = "Ambitious"
	roundend_category = "ambitious"
	antagpanel_category = "Ambitious"
	job_rank = ROLE_SYNDICATE
	antag_moodlet = /datum/mood_event/focused
	show_to_ghosts = FALSE

/datum/antagonist/ambitious/on_gain()
	owner.special_role = src
	var/objectve = rand(1, 4)
	switch(objectve)
		if(1)
			var/list/niggas = list()
			for(var/mob/living/carbon/human/H in GLOB.player_list)
				if(H.stat != DEAD && H.true_real_name != owner.current.true_real_name && H.frakcja != "Sabbat")
					niggas += H
			if(length(niggas))
				var/datum/objective/blood/blood_objective = new
				blood_objective.owner = owner
				var/mob/living/carbon/human/HU = pick(niggas)
				blood_objective.owner = owner
				blood_objective.target_name = HU.true_real_name
				objectives += blood_objective
				blood_objective.update_explanation_text()
			else
				var/datum/objective/money/money_objective = new
				money_objective.owner = owner
				money_objective.amount = rand(500, 5000)
				objectives += money_objective
				money_objective.update_explanation_text()
		if(2)
			var/datum/objective/money/money_objective = new
			money_objective.owner = owner
			money_objective.amount = rand(300, 1000)
			objectives += money_objective
			money_objective.update_explanation_text()
		if(3)
			var/list/niggas = list()
			for(var/mob/living/carbon/human/H in GLOB.player_list)
				if(H.stat != DEAD && H.true_real_name != owner.current.true_real_name && H.frakcja != "Sabbat")
					niggas += H
			if(length(niggas))
				var/datum/objective/protect_niga/protect_objective = new
				protect_objective.owner = owner
				var/mob/living/carbon/human/HU = pick(niggas)
				protect_objective.mine_target = HU
				objectives += protect_objective
				protect_objective.update_explanation_text()
			else
				var/datum/objective/money/money_objective = new
				money_objective.owner = owner
				money_objective.amount = rand(300, 1000)
				objectives += money_objective
				money_objective.update_explanation_text()
		if(4)
			var/list/available_factions = list("Camarilla", "Anarch", "Sabbat")
			if(ishuman(owner))
				var/mob/living/carbon/human/H = owner
				if(H.frakcja == "Camarilla" || H.frakcja == "Anarch" || H.frakcja == "Sabbat")
					available_factions -= H.frakcja
			var/datum/objective/become_member/member_objective = new
			member_objective.owner = owner
			member_objective.faction = pick(available_factions)
			objectives += member_objective
			member_objective.update_explanation_text()
	return ..()

/datum/antagonist/ambitious/on_removal()
	..()
	to_chat(owner.current,"<span class='userdanger'>You don't have ambitions anymore.</span>")
	owner.special_role = null

/datum/antagonist/ambitious/greet()
	to_chat(owner.current, "<span class='alertsyndie'>You got some goals that night.</span>")
	owner.announce_objectives()

/datum/job/vamp/primogen_malkavian
	title = "Primogen Malkavian"
	department_head = list("Justicar")
	faction = "Vampire"
	total_positions = 1
	spawn_positions = 1
	supervisors = " the Traditions"
	selection_color = "#cb4aad"

	outfit = /datum/outfit/job/malkav

	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	minimal_access = list(ACCESS_BAR, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_MALKAVIAN
	exp_type_department = EXP_TYPE_INDEPENDENT

	kindred_only = TRUE
	allowed_bloodlines = list("Malkavian")
	minimal_generation = 7	//Uncomment when players get exp enough

	duty = "Offer your infinite knowledge to Prince of the City."
	minimal_masquerade = 5
	my_contact_is_important = TRUE
	known_contacts = list("Prince")
	minimal_age = 12

/datum/outfit/job/malkav
	name = "Primogen Malkavian"
	jobtype = /datum/job/vamp/primogen_malkavian

	id = /obj/item/card/id/primogen
	glasses = /obj/item/clothing/glasses/vampire/sun
	uniform = /obj/item/clothing/under/vampire/primogen_malkavian
	suit = /obj/item/clothing/suit/vampire/trench/malkav
	shoes = /obj/item/clothing/shoes/vampire/jackboots
	head = /obj/item/clothing/head/vampire/malkav
	l_pocket = /obj/item/vamp/phone/malkavian
	r_pocket = /obj/item/cockclock
	backpack_contents = list(/obj/item/vamp/keys/malkav/primogen=1, /obj/item/passport=1, /obj/item/flashlight=1, /obj/item/stack/dollar/hundred=2)

/datum/outfit/job/malkav/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == FEMALE)
		suit = null
		head = null
		uniform = /obj/item/clothing/under/vampire/primogen_malkavian/female
		shoes = /obj/item/clothing/shoes/vampire/heels

/datum/job/vamp/primogen_nosferatu
	title = "Primogen Nosferatu"
	department_head = list("Justicar")
	faction = "Vampire"
	total_positions = 1
	spawn_positions = 1
	supervisors = " the Traditions"
	selection_color = "#cb4aad"

	outfit = /datum/outfit/job/nosferatu

	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	minimal_access = list(ACCESS_BAR, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_NOSFERATU
	exp_type_department = EXP_TYPE_INDEPENDENT

	kindred_only = TRUE
	allowed_bloodlines = list("Nosferatu")
	minimal_generation = 7	//Uncomment when players get exp enough

	duty = "Offer your infinite knowledge to Prince of the City."
	minimal_masquerade = 5
	my_contact_is_important = TRUE
	known_contacts = list("Prince")
	minimal_age = 12

/datum/outfit/job/nosferatu
	name = "Primogen Nosferatu"
	jobtype = /datum/job/vamp/primogen_nosferatu

	id = /obj/item/card/id/primogen
	glasses = /obj/item/clothing/glasses/vampire/sun
	uniform = /obj/item/clothing/under/vampire/suit
	suit = /obj/item/clothing/suit/vampire/trench
	shoes = /obj/item/clothing/shoes/vampire
	l_pocket = /obj/item/vamp/phone/nosferatu
	r_pocket = /obj/item/cockclock
	backpack_contents = list(/obj/item/vamp/keys/nosferatu/primogen=1, /obj/item/passport=1, /obj/item/flashlight=1, /obj/item/stack/dollar/hundred=2)

/datum/outfit/job/nosferatu/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == FEMALE)
		shoes = /obj/item/clothing/shoes/vampire/heels

/datum/job/vamp/primogen_ventrue
	title = "Primogen Ventrue"
	department_head = list("Justicar")
	faction = "Vampire"
	total_positions = 1
	spawn_positions = 1
	supervisors = " the Traditions"
	selection_color = "#cb4aad"

	outfit = /datum/outfit/job/ventrue

	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	minimal_access = list(ACCESS_BAR, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_VENTRUE
	exp_type_department = EXP_TYPE_INDEPENDENT

	kindred_only = TRUE
	allowed_bloodlines = list("Ventrue")
	minimal_generation = 7	//Uncomment when players get exp enough

	duty = "Offer your infinite knowledge to Prince of the City."
	minimal_masquerade = 5
	my_contact_is_important = TRUE
	known_contacts = list("Prince")
	minimal_age = 12

/datum/outfit/job/ventrue
	name = "Primogen Ventrue"
	jobtype = /datum/job/vamp/primogen_ventrue

	id = /obj/item/card/id/primogen
	glasses = /obj/item/clothing/glasses/vampire/sun
	uniform = /obj/item/clothing/under/vampire/suit
	suit = /obj/item/clothing/suit/vampire/trench
	shoes = /obj/item/clothing/shoes/vampire
	l_pocket = /obj/item/vamp/phone/ventrue
	r_pocket = /obj/item/cockclock
	backpack_contents = list(/obj/item/vamp/keys/ventrue/primogen=1, /obj/item/passport=1, /obj/item/flashlight=1, /obj/item/stack/dollar/hundred=2)

/datum/outfit/job/ventrue/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == FEMALE)
		shoes = /obj/item/clothing/shoes/vampire/heels

/datum/job/vamp/primogen_toreador
	title = "Primogen Toreador"
	department_head = list("Justicar")
	faction = "Vampire"
	total_positions = 1
	spawn_positions = 1
	supervisors = " the Traditions"
	selection_color = "#cb4aad"

	outfit = /datum/outfit/job/toreador

	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	minimal_access = list(ACCESS_BAR, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_TOREADOR
	exp_type_department = EXP_TYPE_INDEPENDENT

	kindred_only = TRUE
	allowed_bloodlines = list("Toreador")
	minimal_generation = 7	//Uncomment when players get exp enough

	duty = "Offer your infinite knowledge to Prince of the City."
	minimal_masquerade = 5
	my_contact_is_important = TRUE
	known_contacts = list("Prince")
	minimal_age = 12

/datum/outfit/job/toreador
	name = "Primogen Toreador"
	jobtype = /datum/job/vamp/primogen_toreador

	id = /obj/item/card/id/primogen
	glasses = /obj/item/clothing/glasses/vampire/sun
	uniform = /obj/item/clothing/under/vampire/primogen_toreador
	suit = /obj/item/clothing/suit/vampire/trench/alt
	shoes = /obj/item/clothing/shoes/vampire
	l_pocket = /obj/item/vamp/phone/toreador
	r_pocket = /obj/item/cockclock
	backpack_contents = list(/obj/item/vamp/keys/toreador/primogen=1, /obj/item/passport=1, /obj/item/flashlight=1, /obj/item/stack/dollar/hundred=2)

/datum/outfit/job/toreador/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/vampire/primogen_toreador/female
		shoes = /obj/item/clothing/shoes/vampire/heels/red


/datum/job/vamp/primogen_brujah
	title = "Primogen Brujah"
	department_head = list("Justicar")
	faction = "Vampire"
	total_positions = 1
	spawn_positions = 1
	supervisors = " the Traditions"
	selection_color = "#cb4aad"

	outfit = /datum/outfit/job/brujah

	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	minimal_access = list(ACCESS_BAR, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_BRUJAH
	exp_type_department = EXP_TYPE_INDEPENDENT

	kindred_only = TRUE
	allowed_bloodlines = list("Brujah")
	minimal_generation = 7	//Uncomment when players get exp enough

	duty = "Offer your infinite knowledge to Prince of the City."
	minimal_masquerade = 5
	my_contact_is_important = TRUE
	known_contacts = list("Prince")
	minimal_age = 12

/datum/outfit/job/brujah
	name = "Primogen Brujah"
	jobtype = /datum/job/vamp/primogen_brujah

	id = /obj/item/card/id/primogen
	glasses = /obj/item/clothing/glasses/vampire/yellow
	uniform = /obj/item/clothing/under/vampire/punk
	suit = /obj/item/clothing/suit/vampire/jacket/punk
	shoes = /obj/item/clothing/shoes/vampire/jackboots
	l_pocket = /obj/item/vamp/phone/brujah
	r_pocket = /obj/item/cockclock
	backpack_contents = list(/obj/item/vamp/keys/brujah/primogen=1, /obj/item/melee/vampirearms/eguitar=1, /obj/item/passport=1, /obj/item/flashlight=1, /obj/item/stack/dollar=1)

//HUMANS

/datum/job/vamp/police_officer
	title = "Police Officer"
	department_head = list("Police Department")
	faction = "Vampire"
	total_positions = 5
	spawn_positions = 5
	supervisors = " the SFPD"
	selection_color = "#7e7e7e"

	outfit = /datum/outfit/job/police_officer

	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	minimal_access = list(ACCESS_BAR, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_POLICE
	exp_type_department = EXP_TYPE_INDEPENDENT

	kindred_only = FALSE
	human_only = TRUE
	humans_accessible = TRUE
//	allowed_bloodlines = list()
	minimal_generation = 13

	duty = "Enforce the Law."
	minimal_masquerade = 0
	my_contact_is_important = FALSE
//	known_contacts = list("Investigator")
	minimal_age = 12

/datum/outfit/job/police_officer
	name = "Police Officer"
	jobtype = /datum/job/vamp/police_officer

	uniform = /obj/item/clothing/under/vampire/police
	shoes = /obj/item/clothing/shoes/vampire/jackboots
	suit = /obj/item/clothing/suit/vampire/vest
	belt = /obj/item/melee/classic_baton
	gloves = /obj/item/cockclock
	id = /obj/item/card/id/police
	l_pocket = /obj/item/vamp/phone
	r_pocket = /obj/item/flashlight
	l_hand = /obj/item/vamp/keys/police
	r_hand = /obj/item/police_radio
	backpack_contents = list(/obj/item/passport=1, /obj/item/implant/radio=1, /obj/item/stack/dollar=1)


/datum/job/vamp/fbi
	title = "Federal Investigator"
	department_head = list("Federal Bureau of Investigation")
	faction = "Vampire"
	total_positions = 2
	spawn_positions = 2
	supervisors = " the FBI"
	selection_color = "#7e7e7e"

	outfit = /datum/outfit/job/fbi

	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	minimal_access = list(ACCESS_BAR, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_FBI
	exp_type_department = EXP_TYPE_INDEPENDENT

	kindred_only = FALSE
	human_only = TRUE
	humans_accessible = TRUE
//	allowed_bloodlines = list()
	minimal_generation = 13

	duty = "Enforce the Law."
	minimal_masquerade = 0
	my_contact_is_important = FALSE
//	known_contacts = list("Investigator")
	minimal_age = 12

/datum/outfit/job/fbi
	name = "Federal Investigator"
	jobtype = /datum/job/vamp/fbi

	uniform = /obj/item/clothing/under/vampire/office
	shoes = /obj/item/clothing/shoes/vampire
	suit = /obj/item/clothing/suit/vampire/jacket/fbi
//	belt = /obj/item/melee/classic_baton
	id = /obj/item/card/id/police
	gloves = /obj/item/cockclock
	l_pocket = /obj/item/vamp/phone
	r_pocket = /obj/item/flashlight
	l_hand = /obj/item/vamp/keys/police
	r_hand = /obj/item/police_radio
	backpack_contents = list(/obj/item/passport=1, /obj/item/implant/radio=1, /obj/item/gun/ballistic/automatic/vampire/m1911=1, /obj/item/camera/detective=1, /obj/item/camera_film=1, /obj/item/taperecorder=1, /obj/item/tape=1, /obj/item/stack/dollar=1)
