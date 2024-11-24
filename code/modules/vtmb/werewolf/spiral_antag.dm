/datum/outfit/job/spiral
	name = "Black Spiral Dancer"
	uniform = /obj/item/clothing/under/vampire/graveyard
	r_pocket = /obj/item/flashlight
	id = /obj/item/cockclock
	shoes = /obj/item/clothing/shoes/vampire/jackboots
	backpack_contents = list(
		/obj/item/molotov = 1,
		/obj/item/gas_can/full = 1,
		/obj/item/vamp/keys/hack=1
	)

/datum/outfit/job/spiral/post_equip(mob/living/carbon/human/H)
	..()
	if(!isgarou(H))
		H.set_species(/datum/species/garou)
		H.generation = 13
		H.maxHealth = round((initial(H.maxHealth)+(initial(H.maxHealth)/4)*H.physique))
		H.health = round((initial(H.maxHealth)+(initial(H.maxHealth)/4)*H.physique))
//		for(var/atom/movable/screen/blood/B in H.hud_used.infodisplay)
//			B.icon_state = null
//		for(var/atom/movable/screen/healths/HE in H.hud_used.infodisplay)
//			HE.icon = 'code/modules/wod13/ghoul_health.dmi'
//		for(var/atom/movable/screen/drinkblood/DB in H.hud_used.static_inventory)
//			DB.icon_state = null
//		for(var/atom/movable/screen/bloodheal/BH in H.hud_used.static_inventory)
//			BH.icon_state = null
//		for(var/atom/movable/screen/bloodpower/BP in H.hud_used.static_inventory)
//			BP.icon_state = null
//		for(var/atom/movable/screen/disciplines/DI in H.hud_used.static_inventory)
//			DI.icon_state = null
		for(var/datum/action/A in H.actions)
			if(A.vampiric)
				A.Remove(H)
		var/datum/hud/HD = H.hud_used
		var/atom/movable/screen/transform_werewolf
		transform_werewolf = new /atom/movable/screen/transform_lupus()
		transform_werewolf.screen_loc = ui_werewolf_lupus
		transform_werewolf.hud = HD
		HD.static_inventory += transform_werewolf

		transform_werewolf = new /atom/movable/screen/transform_crinos()
		transform_werewolf.screen_loc = ui_werewolf_crinos
		transform_werewolf.hud = HD
		HD.static_inventory += transform_werewolf

		transform_werewolf = new /atom/movable/screen/transform_homid()
		transform_werewolf.screen_loc = ui_werewolf_homid
		transform_werewolf.hud = HD
		HD.static_inventory += transform_werewolf

		transform_werewolf = new /atom/movable/screen/auspice()
		transform_werewolf.screen_loc = ui_werewolf_auspice
		transform_werewolf.hud = HD
		HD.static_inventory += transform_werewolf

		HD.rage_icon = new /atom/movable/screen/rage()
		HD.rage_icon.screen_loc = ui_werewolf_rage
		HD.rage_icon.hud = HD
		HD.infodisplay += HD.rage_icon

		H.thaumaturgy_knowledge = FALSE
		QDEL_NULL(H.clane)
		var/ausp = pick(subtypesof(/datum/auspice))
		var/datum/auspice/CLN = new ausp()
		H.auspice = CLN
		H.auspice.level = rand(1, 3)
		H.auspice.tribe = "Black Spiral"
		H.auspice.on_gain(H)
		H.auspice.base_breed = pick("Homid", "Lupus", "Metis")
		switch(H.auspice.base_breed)
			if("Homid")
				H.auspice.gnosis = 1
				H.auspice.start_gnosis = 1
				H.auspice.base_breed = "Homid"
			if("Lupus")
				H.auspice.gnosis = 5
				H.auspice.start_gnosis = 5
				H.auspice.base_breed = "Lupus"
			if("Metis")
				H.auspice.gnosis = 3
				H.auspice.start_gnosis = 3
				H.auspice.base_breed = "Crinos"
		if(H.transformator)
			if(H.transformator.crinos_form && H.transformator.lupus_form)
				H.transformator.crinos_form.sprite_color = pick("black", "gray", "white", "red", "ginger", "brown")
				if(prob(25))
					H.transformator.crinos_form.sprite_scar = rand(1, 7)
				H.transformator.crinos_form.sprite_hair = rand(0, 4)
				H.transformator.crinos_form.sprite_hair_color = H.hair_color
				H.transformator.crinos_form.sprite_eye_color = H.eye_color
				H.transformator.lupus_form.sprite_color = H.transformator.crinos_form.sprite_color
				H.transformator.lupus_form.sprite_eye_color = H.eye_color

				H.transformator.crinos_form.name = H.real_name
				H.transformator.lupus_form.name = H.real_name

				H.transformator.crinos_form.physique = H.physique
				H.transformator.crinos_form.dexterity = H.dexterity
				H.transformator.crinos_form.mentality = H.mentality
				H.transformator.crinos_form.social = H.social
				H.transformator.crinos_form.blood = H.blood

				H.transformator.lupus_form.physique = H.physique
				H.transformator.lupus_form.dexterity = H.dexterity
				H.transformator.lupus_form.social = H.social
				H.transformator.lupus_form.blood = H.blood

				H.transformator.lupus_form.maxHealth = round((initial(H.transformator.lupus_form.maxHealth)+(initial(H.maxHealth)/4)*H.physique))+(H.auspice.level-1)*50
				H.transformator.lupus_form.health = H.transformator.lupus_form.maxHealth
				H.transformator.crinos_form.maxHealth = round((initial(H.transformator.crinos_form.maxHealth)+(initial(H.maxHealth)/4)*H.physique))+(H.auspice.level-1)*50
				H.transformator.crinos_form.health = H.transformator.crinos_form.maxHealth
	if(H.mind)
		H.mind.add_antag_datum(/datum/antagonist/spiral)

	for(var/obj/structure/werewolf_totem/spiral/S in GLOB.totems)
		if(S)
			H.forceMove(get_turf(S))
			S.mouse_opacity = 1
			S.alpha = 255
			S.density = 1

/obj/effect/landmark/start/spiral
	name = "Black Spiral Dancer"
	delete_after_roundstart = FALSE

/datum/antagonist/spiral
	name = "Black Spiral Dancer"
	roundend_category = "black spiral dancers"
	antagpanel_category = "Black Spiral Dancer"
	job_rank = ROLE_HERETIC
	antag_hud_type = ANTAG_HUD_HERETIC
	antag_hud_name = "spiral"
	antag_moodlet = /datum/mood_event/focused
	show_to_ghosts = TRUE

/datum/antagonist/spiral/on_gain()
	owner.holy_role = HOLY_ROLE_PRIEST
	add_antag_hud(ANTAG_HUD_HERETIC, "spiral", owner.current)
	owner.special_role = src
	var/datum/objective/spiral/die_objective = new
	die_objective.owner = owner
	objectives += die_objective
	owner.current.playsound_local(get_turf(owner.current), 'code/modules/wod13/sounds/spiral_start.ogg', 100, FALSE, pressure_affected = FALSE, use_reverb = FALSE)
	return ..()

/datum/antagonist/spiral/on_removal()
	..()
	to_chat(owner.current,"<span class='userdanger'>You are no longer the Black Spiral Dancer!</span>")
	owner.special_role = null

/datum/antagonist/spiral/greet()
	to_chat(owner.current, "<span class='alertsyndie'>You are the Black Spiral Dancer.</span>")
	owner.announce_objectives()
