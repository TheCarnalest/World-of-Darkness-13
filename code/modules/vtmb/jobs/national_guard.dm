/datum/outfit/job/national_guard
	name = "National Guard Soldier"
	uniform = /obj/item/clothing/under/vampire/military_fatigues
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

/datum/antagonist/national_guard/proc/equip_national_guard()
	var/mob/living/carbon/human/H = owner.current
	if(!ishuman(owner.current))
		return
	H.equipOutfit(national_guard_outfit)
	if(H.clane)
		H.remove_overlay(H.clane.accessories_layers[H.clane.current_accessory])
		qdel(H.clane)
	H.set_species(/datum/species/human)
	H.generation = 13
	H.ignores_warrant = TRUE
	H.maxHealth = round((initial(H.maxHealth)-initial(H.maxHealth)/4)+(initial(H.maxHealth)/4)*(H.physique+13-H.generation))
	H.health = round((initial(H.health)-initial(H.health)/4)+(initial(H.health)/4)*(H.physique+13-H.generation))
/*	var/my_name = "Tyler"
	if(H.gender == MALE)
		my_name = pick(GLOB.first_names_male)
	else
		my_name = pick(GLOB.first_names_female)
	var/my_surname = pick(GLOB.last_names)
	H.fully_replace_character_name(null,"[my_name] [my_surname]")*/
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

/datum/antagonist/national_guard/proc/offer_loadout()
	var/list/loadouts = list(
		"Flamethrower",
		"EOD",
		"Medic",
		"Sniper",
		"Ammo Carrier"
	)
	var/loadout_type = input(owner.current, "Choose your loadout:", "Loadout Selection") in loadouts
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

/obj/effect/landmark/start/national_guard
	name = "National Guard"
	delete_after_roundstart = FALSE

/datum/antagonist/national_guard
	name = "National Guard"
	roundend_category = "national guard"
	antagpanel_category = "National Guard"
	job_rank = ROLE_NATIONAL_GUARD
	antag_hud_type = ANTAG_HUD_OPS
	antag_hud_name = "synd"
	antag_moodlet = /datum/mood_event/focused
	show_to_ghosts = TRUE
	var/always_new_team = FALSE
	var/datum/team/national_guard/national_guard_team
	var/national_guard_outfit = /datum/outfit/job/national_guard
	var/custom_objective

/datum/antagonist/national_guard/sergeant
	name = "National Guard Sergeant"
	always_new_team = TRUE
	var/title

/datum/antagonist/national_guard/on_gain()
	give_alias()
	add_antag_hud(ANTAG_HUD_OPS, "synd", owner.current)
	owner.special_role = src
	equip_national_guard()
	offer_loadout()
	return ..()

/datum/antagonist/national_guard/on_removal()
	..()
	to_chat(owner.current,"<span class='userdanger'>You are no longer in the National Guard!</span>")
	owner.special_role = null

/datum/antagonist/national_guard/greet()
	to_chat(owner.current, "<span class='alertsyndie'>You're in the national guard.</span>")
	to_chat(owner, "<span class='notice'>You are a [national_guard_team ? national_guard_team.national_guard_name : "national guard"] soldier!</span>")
	owner.announce_objectives()


/datum/antagonist/national_guard/proc/give_alias()
	if(national_guard_team?.national_guard_name)
		var/mob/living/carbon/human/H = owner.current
		if(istype(H)) // Reinforcements get a real name
			var/chosen_name = H.dna.species.random_name(H.gender,0,national_guard_team.national_guard_name)
			H.fully_replace_character_name(H.real_name,chosen_name)
		else
			var/number = 1
			number = national_guard_team.members.Find(owner)
			owner.current.real_name = "[national_guard_team.national_guard_name] Operative #[number]"

/datum/antagonist/national_guard/proc/forge_objectives()
	if(national_guard_team)
		objectives |= national_guard_team.objectives

/datum/antagonist/national_guard/sergeant/give_alias()
	title = pick("Sergeant", "Commander")
	if(national_guard_team?.national_guard_name)
		owner.current.real_name = "[national_guard_team.national_guard_name] [title]"
	else
		owner.current.real_name = "National Guard [title]"

/datum/team/national_guard/antag_listing_name()
	if(national_guard_name)
		return "[national_guard_name] Soldiers"
	else
		return "Soldiers"


/datum/antagonist/national_guard/sergeant/greet()
	to_chat(owner, "<B>You are the leading [title] for this mission. You are responsible for guiding your team's operation.</B>")
	to_chat(owner, "<B>If you feel you are not up to this task, give your command to another soldier.</B>")
	owner.announce_objectives()
	addtimer(CALLBACK(src, PROC_REF(national_guardteam_name_assign)), 1)

/datum/antagonist/national_guard/sergeant/proc/ask_name()
	var/randomname = pick(GLOB.last_names)
	var/newname = stripped_input(owner.current,"You are the national guard operative [title]. Please choose a last name for your family.", "Name change",randomname)
	if (!newname)
		newname = randomname
	else
		newname = reject_bad_name(newname)
		if(!newname)
			newname = randomname
	return capitalize(newname)

/datum/antagonist/national_guard/sergeant/proc/national_guardteam_name_assign()
	if(!national_guard_team)
		return
	national_guard_team.rename_team(ask_name())

/datum/antagonist/national_guard/create_team(datum/team/national_guard/new_team)
	if(!new_team)
		if(!always_new_team)
			for(var/datum/antagonist/national_guard/N in GLOB.antagonists)
				if(!N.owner)
					stack_trace("Antagonist datum without owner in GLOB.antagonists: [N]")
					continue
		national_guard_team = new /datum/team/national_guard
		national_guard_team.update_objectives()
		return
	if(!istype(national_guard_team))
		stack_trace("Wrong team type passed to [type] initialization.")
	national_guard_team = new_team

/datum/antagonist/national_guard/admin_add(datum/mind/new_owner,mob/admin)
	new_owner.assigned_role = ROLE_NATIONAL_GUARD
	new_owner.add_antag_datum(src)
	message_admins("[key_name_admin(admin)] has national guard'd [key_name_admin(new_owner)].")
	log_admin("[key_name(admin)] has national guard'd [key_name(new_owner)].")


/datum/team/national_guard/proc/rename_team(new_name)
	national_guard_name = new_name
	name = "[national_guard_name] Team"
	for(var/I in members)
		var/datum/mind/national_guard_mind = I
		var/mob/living/carbon/human/H = national_guard_mind.current
		if(!istype(H))
			continue
		var/chosen_name = H.dna.species.random_name(H.gender,0,national_guard_name)
		H.fully_replace_character_name(H.real_name,chosen_name)


/datum/team/national_guard
	var/national_guard_name
	var/core_objective = /datum/objective/national_guard
	member_name = "National Guard Operative"
	var/memorized_code
	var/list/team_discounts
	var/obj/item/nuclear_challenge/war_button

/datum/team/national_guard/New()
	..()
	national_guard_name = national_guard_name()

/datum/team/national_guard/proc/update_objectives()
	if(core_objective)
		var/datum/objective/O = new core_objective
		O.team = src
		objectives += O


/datum/team/national_guard/roundend_report()
	var/list/parts = list()
	parts += "<span class='header'>[national_guard_name] Operatives:</span>"

	var/text = "<br><span class='header'>The national guard were:</span>"
	text += printplayerlist(members)
	parts += text

	return "<div class='panel redborder'>[parts.Join("<br>")]</div>"


//////////////////////////////////////////////
//                                          //
//       NATIONAL GUARD SQUAD (MIDROUND)    //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/midround/from_ghosts/national_guard
	name = "National Guard Squad"
	antag_flag = ROLE_NATIONAL_GUARD
	antag_datum = /datum/antagonist/national_guard
	required_candidates = 1
	weight = 5
	cost = 35
	requirements = list(90,90,90,80,60,40,30,20,10,10)
	var/list/operative_cap = list(2,2,3,3,4,5,5,5,5,5)
	var/datum/team/national_guard/national_guard_team
	flags = HIGHLANDER_RULESET

/datum/dynamic_ruleset/midround/from_ghosts/national_guard/acceptable(population=0, threat=0)
	indice_pop = min(operative_cap.len, round(living_players.len/5)+1)
	required_candidates = max(5, operative_cap[indice_pop])
	return ..()

/datum/dynamic_ruleset/midround/from_ghosts/national_guard/ready(forced = FALSE)
	if (required_candidates > (dead_players.len + list_observers.len))
		return FALSE
	return ..()

/datum/dynamic_ruleset/midround/from_ghosts/national_guard/finish_setup(mob/new_character, index)
	new_character.mind.special_role = "National Guard"
	new_character.mind.assigned_role = "National Guard"
	if (index == 1) // Our first guy is the leader
		var/datum/antagonist/national_guard/sergeant/new_role = new
		national_guard_team = new_role.national_guard_team
		new_character.mind.add_antag_datum(new_role)
	else
		return ..()

