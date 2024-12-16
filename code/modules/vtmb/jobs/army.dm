/datum/outfit/job/army
	name = "Army Soldier"
	uniform = /obj/item/clothing/under/vampire/graveyard
	r_pocket = /obj/item/flashlight
	l_pocket = /obj/item/ammo_box/magazine/vampaug
	shoes = /obj/item/clothing/shoes/vampire/jackboots
	belt = /obj/item/gun/ballistic/automatic/vampire/aug
	suit = /obj/item/clothing/suit/vampire/vest/army
	head = /obj/item/clothing/head/vampire/army
	backpack_contents = list(
		/obj/item/ammo_box/magazine/vampaug = 3,
		/obj/item/radio/military = 1
		)

/datum/antagonist/army/proc/equip_army()
	var/mob/living/carbon/human/H = owner.current
	if(!ishuman(owner.current))
		return
	H.equipOutfit(army_outfit)
	if(H.clane)
		H.remove_overlay(H.clane.accessories_layers[H.clane.current_accessory])
		qdel(H.clane)
	H.set_species(/datum/species/human)
	H.generation = 13
	H.ignores_warrant = TRUE
	H.maxHealth = round((initial(H.maxHealth)-initial(H.maxHealth)/4)+(initial(H.maxHealth)/4)*(H.physique+13-H.generation))
	H.health = round((initial(H.health)-initial(H.health)/4)+(initial(H.health)/4)*(H.physique+13-H.generation))
	var/my_name = "Tyler"
	if(H.gender == MALE)
		my_name = pick(GLOB.first_names_male)
	else
		my_name = pick(GLOB.first_names_female)
	var/my_surname = pick(GLOB.last_names)
	H.fully_replace_character_name(null,"[my_name] [my_surname]")
	for(var/datum/action/A in H.actions)
		if(A.vampiric)
			A.Remove(H)
	H.thaumaturgy_knowledge = FALSE
	QDEL_NULL(H.clane)
	var/obj/item/organ/eyes/NV = new()
	NV.Insert(H, TRUE, FALSE)

	var/list/landmarkslist = list()
	for(var/obj/effect/landmark/start/S in GLOB.start_landmarks_list)
		if(S.name == name)
			landmarkslist += S
	var/obj/effect/landmark/start/D = pick(landmarkslist)
	H.forceMove(D.loc)

/datum/antagonist/army/proc/offer_loadout()
	var/list/loadouts = list(
		"Flamethrower",
		"EOD",
		"Medic",
		"Sniper",
		"Ammo Carrier"
	)
	var/loadout_type = input(owner.current, "Choose your loadout:", "Loadout Selection") in loadouts
	to_chat(owner.current, "DEBUG: Before loadout selection input.")
	switch(loadout_type)
		if("Flamethrower")
			owner.current.put_in_r_hand(new /obj/item/vampire_flamethrower(owner.current))
			owner.current.put_in_l_hand(new /obj/item/gas_can/full(owner.current))
		if("EOD")
			owner.current.put_in_r_hand(new /obj/item/clothing/suit/vampire/eod(owner.current))
			owner.current.put_in_l_hand(new /obj/item/clothing/head/vampire/eod(owner.current))
		if("Medic")
			owner.current.put_in_r_hand(new /obj/item/storage/firstaid/tactical(owner.current))
		if("Sniper")
			owner.current.put_in_r_hand(new /obj/item/gun/ballistic/automatic/vampire/sniper(owner.current))
			owner.current.put_in_l_hand(new /obj/item/ammo_box/vampire/c556(owner.current))
		if("Ammo Carrier")
			owner.current.put_in_r_hand(new /obj/item/ammo_box/vampire/c556/incendiary(owner.current))
			owner.current.put_in_l_hand(new /obj/item/ammo_box/vampire/c556/incendiary(owner.current))
	to_chat(owner.current, "DEBUG: After loadout selection input. You chose: [loadout_type]")
/obj/effect/landmark/start/army
	name = "Army"
	delete_after_roundstart = FALSE

/datum/antagonist/army
	name = "Army"
	roundend_category = "army"
	antagpanel_category = "Army"
	job_rank = ROLE_ARMY
	antag_hud_type = ANTAG_HUD_OPS
	antag_hud_name = "synd"
	antag_moodlet = /datum/mood_event/focused
	show_to_ghosts = TRUE
	var/always_new_team = FALSE
	var/datum/team/army/army_team
	var/army_outfit = /datum/outfit/job/army
	var/custom_objective

/datum/antagonist/army/sergeant
	name = "Army Sergeant"
	roundend_category = "army"
	antagpanel_category = "Army"
	job_rank = ROLE_ARMY
	antag_hud_type = ANTAG_HUD_OPS
	antag_hud_name = "synd"
	antag_moodlet = /datum/mood_event/focused
	show_to_ghosts = TRUE
	var/title

/datum/antagonist/army/on_gain()
	give_alias()
	add_antag_hud(ANTAG_HUD_OPS, "synd", owner.current)
	owner.special_role = src
	equip_army()
	offer_loadout()
	return ..()

/datum/antagonist/army/on_removal()
	..()
	to_chat(owner.current,"<span class='userdanger'>You are no longer in the Army now!</span>")
	owner.special_role = null

/datum/antagonist/army/greet()
	to_chat(owner.current, "<span class='alertsyndie'>You're in the army now.</span>")
	owner.announce_objectives()


/datum/antagonist/army/proc/give_alias()
	if(army_team?.army_name)
		var/mob/living/carbon/human/H = owner.current
		if(istype(H)) // Reinforcements get a real name
			var/chosen_name = H.dna.species.random_name(H.gender,0,army_team.army_name)
			H.fully_replace_character_name(H.real_name,chosen_name)
		else
			var/number = 1
			number = army_team.members.Find(owner)
			owner.current.real_name = "[army_team.army_name] Operative #[number]"

/datum/antagonist/army/proc/forge_objectives()
	if(army_team)
		objectives |= army_team.objectives

/datum/antagonist/army/sergeant/give_alias()
	title = pick("Sergeant", "Commander")
	if(army_team?.army_name)
		owner.current.real_name = "[army_team.army_name] [title]"
	else
		owner.current.real_name = "Army [title]"

/datum/team/army/antag_listing_name()
	if(army_name)
		return "[army_name] Soldiers"
	else
		return "Soldiers"


/datum/antagonist/army/sergeant/greet()
	owner.current.playsound_local(get_turf(owner.current), 'sound/ambience/antag/ops.ogg',100,0, use_reverb = FALSE)
	to_chat(owner, "<B>You are the leading [title] for this mission. You are responsible for guiding your team's operation.</B>")
	to_chat(owner, "<B>If you feel you are not up to this task, give your command to another soldier.</B>")
	owner.announce_objectives()
	addtimer(CALLBACK(src, PROC_REF(armyteam_name_assign)), 1)

/datum/antagonist/army/sergeant/proc/ask_name()
	var/randomname = pick(GLOB.last_names)
	var/newname = stripped_input(owner.current,"You are the army operative [title]. Please choose a last name for your family.", "Name change",randomname)
	if (!newname)
		newname = randomname
	else
		newname = reject_bad_name(newname)
		if(!newname)
			newname = randomname

/datum/antagonist/army/sergeant/proc/armyteam_name_assign()
	if(!army_team)
		return
	army_team.rename_team(ask_name())

/datum/antagonist/army/create_team(datum/team/army/new_team)
	if(!new_team)
		if(!always_new_team)
			for(var/datum/antagonist/army/N in GLOB.antagonists)
				if(!N.owner)
					stack_trace("Antagonist datum without owner in GLOB.antagonists: [N]")
					continue
		army_team = new /datum/team/army
		army_team.update_objectives()
		return
	if(!istype(army_team))
		stack_trace("Wrong team type passed to [type] initialization.")
	army_team = new_team

/datum/antagonist/army/admin_add(datum/mind/new_owner,mob/admin)
	new_owner.assigned_role = ROLE_ARMY
	new_owner.add_antag_datum(src)
	message_admins("[key_name_admin(admin)] has army'd [key_name_admin(new_owner)].")
	log_admin("[key_name(admin)] has army'd [key_name(new_owner)].")


/datum/team/army/proc/rename_team(new_name)
	army_name = new_name
	name = "[army_name] Team"
	for(var/I in members)
		var/datum/mind/army_mind = I
		var/mob/living/carbon/human/H = army_mind.current
		if(!istype(H))
			continue
		var/chosen_name = H.dna.species.random_name(H.gender,0,army_name)
		H.fully_replace_character_name(H.real_name,chosen_name)


/datum/team/army
	var/army_name
	var/core_objective = /datum/objective/army
	var/memorized_code
	var/list/team_discounts
	var/obj/item/nuclear_challenge/war_button

/datum/team/army/New()
	..()
	army_name = army_name()

/datum/team/army/proc/update_objectives()
	if(core_objective)
		var/datum/objective/O = new core_objective
		O.team = src
		objectives += O

//////////////////////////////////////////////
//                                          //
//          ARMY SQUAD (MIDROUND)   //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/midround/from_ghosts/army
	name = "Army Squad"
	antag_flag = ROLE_ARMY
	antag_datum = /datum/antagonist/army
	required_candidates = 1
	weight = 5
	cost = 35
	requirements = list(90,90,90,80,60,40,30,20,10,10)
	var/list/operative_cap = list(2,2,3,3,4,5,5,5,5,5)
	var/datum/team/army/army_team
	flags = HIGHLANDER_RULESET

/datum/dynamic_ruleset/midround/from_ghosts/army/acceptable(population=0, threat=0)
	indice_pop = min(operative_cap.len, round(living_players.len/5)+1)
	required_candidates = max(5, operative_cap[indice_pop])
	return ..()

/datum/dynamic_ruleset/midround/from_ghosts/army/ready(forced = FALSE)
	if (required_candidates > (dead_players.len + list_observers.len))
		return FALSE
	return ..()

/datum/dynamic_ruleset/midround/from_ghosts/army/finish_setup(mob/new_character, index)
	new_character.mind.special_role = "Army"
	new_character.mind.assigned_role = "Army"
	if (index == 1) // Our first guy is the leader
		var/datum/antagonist/army/sergeant/new_role = new
		army_team = new_role.army_team
		new_character.mind.add_antag_datum(new_role)
	else
		return ..()
