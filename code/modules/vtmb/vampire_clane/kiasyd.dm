/datum/vampireclane/kiasyd
	name = "Kiasyd"
	desc = "The Kiasyd are a bloodline of the Lasombra founded after a mysterious \"accident\" involving the Lasombra Marconius of Strasbourg. The \"accident\", involving faeries and the blood of \"Zeernebooch, a god of the Underworld\", resulted in Marconius gaining several feet in height, turning chalky white and developing large, elongated black eyes."
	curse = "The fact that they look like 7 foot tall space aliens. Kiasyd are also in some way connected with changelings and they are vulnerable to cold iron."
	clane_disciplines = list(
		/datum/discipline/necromancy = 1,
		/datum/discipline/obtenebration = 2,
		/datum/discipline/mytherceria = 3
	)
	alt_sprite = "kiasyd"
	no_facial = TRUE
	male_clothes = "/obj/item/clothing/under/vampire/archivist"
	female_clothes = "/obj/item/clothing/under/vampire/archivist"
	whitelisted = TRUE
	current_accessory = "none"
	accessories = list("fae_ears", "none")
	accessories_layers = list("fae_ears" = UNICORN_LAYER, "none" = UNICORN_LAYER)

/datum/vampireclane/kiasyd/on_gain(mob/living/carbon/human/H)
	..()
	if(H.isdwarfy)
		H.RemoveElement(/datum/element/dwarfism, COMSIG_PARENT_PREQDELETED, src)
		H.isdwarfy = FALSE
	if(!H.istower)
		H.AddElement(/datum/element/giantism, COMSIG_PARENT_PREQDELETED, src)
		H.istower = TRUE
	var/obj/item/organ/eyes/night_vision/kiasyd/NV = new()
	NV.Insert(H, TRUE, FALSE)
	if(H.base_body_mod == "f")
		H.base_body_mod = ""
	H.update_body()

/datum/vampireclane/kiasyd/post_gain(mob/living/carbon/human/H)
	..()

//datum/discipline/visceratika/post_gain(mob/living/carbon/human/H)
//	var/obj/effect/proc_holder/spell/voice_of_god/S = new(H)
//	H.mind.AddSpell(S)

/datum/discipline/mytherceria
	name = "Mytherceria"
	desc = "Mytherceria is a Discipline that manifests in faerie-blooded vampires such as the Kiasyd and Maeghar. It grants the vampire mystical senses, the ability to steal knowledge, and other powers attributed to fae."
	icon_state = "mytherceria"
	cost = 1
	ranged = TRUE
	delay = 10 SECONDS
	activate_sound = 'code/modules/wod13/sounds/kiasyd.ogg'
	leveldelay = FALSE
	fearless = TRUE
	clane_restricted = TRUE

/obj/item
	var/is_iron = FALSE
	var/is_magic = FALSE

/mob
	var/myth_steal = FALSE

/mob/living
	var/datum/riddle/riddle
	var/bad_answers = 0
	var/list/stored_riddles = list()

/datum/riddle
	var/riddle_text
	var/list/riddle_options = list()
	var/riddle_answer

/atom/movable/screen/alert/riddle
	name = "Riddle"
	desc = "You have a riddle to solve!"
	icon_state = "riddle"

/atom/movable/screen/alert/riddle/Click()
	if(iscarbon(usr) && usr == owner)
		var/mob/living/carbon/M = usr
		if(M.riddle)
			M.riddle.try_answer(M)

/datum/riddle/proc/try_answer(var/mob/living/answerer)
	var/try_answer = input(answerer, riddle_text, "Riddle") as null|anything in riddle_options
	if(try_answer)
		answer_riddle(answerer, try_answer)

/datum/riddle/proc/ask(var/mob/living/asking)
	asking.throw_alert("riddle", /atom/movable/screen/alert/riddle)

/datum/riddle/proc/create_riddle(var/mob/living/riddler)
	var/proceed = FALSE
	var/text_riddle = input(riddler, "Create a riddle:", "Riddle", "Is it something?") as text|null
	if(text_riddle)
		riddle_text = text_riddle
		var/right_answer = input(riddler, "Create a right answer:", "Riddle", "Something") as text|null
		if(right_answer)
			riddle_answer = right_answer
			riddle_options += right_answer
			proceed = TRUE
			var/answer1 = input(riddler, "Create another answer:", "Riddle", "Anything") as text|null
			if(answer1)
				riddle_options += answer1
				var/answer2 = input(riddler, "Create another answer:", "Riddle", "Anything") as text|null
				if(answer2)
					riddle_options += answer2
					var/answer3 = input(riddler, "Create another answer:", "Riddle", "Anything") as text|null
					if(answer3)
						riddle_options += answer3
						var/answer4 = input(riddler, "Create another answer:", "Riddle", "Anything") as text|null
						if(answer4)
							riddle_options += answer4
	if(proceed)
		riddler.stored_riddles += src
		to_chat(riddler, "New riddle created.")
		return src
	else
		to_chat(riddler, "<span class='danger'>Your riddle is too complicated.</span>")
		return FALSE

/datum/riddle/proc/answer_riddle(var/mob/living/answerer, var/the_answer)
	if(the_answer != riddle_answer)
		answerer.bad_answers = answerer.bad_answers+1
		if(answerer.bad_answers >= round(length(riddle_options)/2))
			if(iscarbon(answerer))
				var/mob/living/carbon/C = answerer
				var/obj/item/organ/tongue/tongue = locate(/obj/item/organ/tongue) in C.internal_organs
				if(tongue)
					tongue.Remove(C)
			answerer.remove_movespeed_modifier(/datum/movespeed_modifier/riddle)
			answerer.bad_answers = 0
			answerer.riddle = null
	else
		answerer.riddle = null
		answerer.remove_movespeed_modifier(/datum/movespeed_modifier/riddle)
		answerer.say(the_answer)

/mob/living/Topic(href, href_list)
	var/mob/user = usr
	if(user != src)
		if(href_list["item"] && user.myth_steal)
			var/slot = text2num(href_list["item"])
			var/hand_index = text2num(href_list["hand_index"])
			var/obj/item/what
			if(hand_index)
				what = get_item_for_held_index(hand_index)
				slot = list(slot,hand_index)
			else
				what = get_item_by_slot(slot)
			if(what)
				if(!(what.item_flags & ABSTRACT))
					user.stripPanelUnequip(what,src,slot)
	. = ..()

/datum/discipline/mytherceria/activate(mob/living/target, mob/living/carbon/human/caster)
	. = ..()
	switch(level_casting)
		if(1)
			var/list/total_list = list()
			for(var/obj/item/I in target.contents)
				if(I)
					if(istype(I, /obj/item/storage))
						total_list |= I.contents
					total_list |= I
			var/text_started = FALSE
			for(var/obj/item/A in total_list)
				if(A)
					if(A.is_magic)
						if(!text_started)
							text_started = TRUE
							to_chat(caster, "<span class='nicegreen'>[A.name]</span>")
						else
							to_chat(caster, ", <span class='nicegreen'>[A.name]</span>")
					else if(A.is_iron)
						if(!text_started)
							text_started = TRUE
							to_chat(caster, "<span class='danger'>[A.name]</span>")
						else
							to_chat(caster, ", <span class='danger'>[A.name]</span>")
					else
						if(!text_started)
							text_started = TRUE
							to_chat(caster, "[A.name]")
						else
							to_chat(caster, ", [A.name]")
		if(2)
			caster.myth_steal = TRUE
			target.show_inv(caster)
			spawn(delay+caster.discipline_time_plus)
				caster.myth_steal = FALSE
		if(3)
			var/obj/item/clothing/mask/facehugger/kiasyd/K = new (get_turf(caster))
			K.throw_at(target, 10, 14, caster)
		if(4)
			var/list/screens = list(target.hud_used.plane_masters["[FLOOR_PLANE]"], target.hud_used.plane_masters["[GAME_PLANE]"], target.hud_used.plane_masters["[LIGHTING_PLANE]"])
			var/rotation = 50
			for(var/whole_screen in screens)
				animate(whole_screen, transform = matrix(rotation, MATRIX_ROTATE), time = 5, easing = QUAD_EASING, loop = -1)
				animate(transform = matrix(-rotation, MATRIX_ROTATE), time = 5, easing = QUAD_EASING)
			spawn(delay+caster.discipline_time_plus)
				for(var/whole_screen in screens)
					animate(whole_screen, transform = matrix(), time = 5, easing = QUAD_EASING)
		if(5)
			if(length(caster.stored_riddles))
				var/list/riddle_list = list("Create a new riddle...")
				for(var/datum/riddle/R in caster.stored_riddles)
					if(R)
						riddle_list += R.riddle_text
				var/try_riddle = input(caster, "Select a Riddle:", "Riddle") as null|anything in riddle_list
				if(try_riddle)
					if(try_riddle == "Create a new riddle...")
						var/datum/riddle/R = new ()
						if(R.create_riddle(caster))
							caster.stored_riddles += R
							target.riddle = R
							R.ask(target)
							caster.say(R.riddle_text)
						return
					var/datum/riddle/actual_riddle
					for(var/datum/riddle/RIDDLE in caster.stored_riddles)
						if(RIDDLE)
							if(RIDDLE.riddle_text == try_riddle)
								actual_riddle = RIDDLE
					if(!target.riddle)
						target.add_movespeed_modifier(/datum/movespeed_modifier/riddle)
					target.riddle = actual_riddle
					target.riddle.ask(target)
					caster.say(target.riddle.riddle_text)
			else
				var/datum/riddle/R = new ()
				if(R.create_riddle(caster))
					caster.stored_riddles += R
					target.riddle = R
					R.ask(target)
					caster.say(R.riddle_text)

/datum/movespeed_modifier/riddle
	multiplicative_slowdown = 5

/obj/item/clothing/mask/facehugger/kiasyd
	name = "goblin"
	desc = "A green changeling creature."
	worn_icon = 'code/modules/wod13/worn.dmi'
	icon = 'code/modules/wod13/icons.dmi'
	icon_state = "goblin"
	sterile = 1

/obj/item/clothing/mask/facehugger/kiasyd/attack_hand(mob/user)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.adjustBruteLoss(5)
		to_chat(user, "<span class='warning'>[src] bites!</span>")
		return
	. = ..()

/obj/item/clothing/mask/facehugger/kiasyd/Die()
	qdel(src)

/obj/item/clothing/mask/facehugger/kiasyd/Leap(mob/living/M)
	if(iscarbon(M))
		var/mob/living/carbon/target = M
		if(target.wear_mask && istype(target.wear_mask, /obj/item/clothing/mask/facehugger/kiasyd))
			return FALSE
	M.visible_message("<span class='danger'>[src] leaps at [M]'s face!</span>", \
							"<span class='userdanger'>[src] leaps at your face!</span>")
	if(iscarbon(M))
		var/mob/living/carbon/target = M

		if(target.head)
			var/obj/item/clothing/W = H.head
			target.dropItemToGround(W, TRUE)

		if(target.wear_mask)
			var/obj/item/clothing/W = target.wear_mask
			if(target.dropItemToGround(W, TRUE))
				target.visible_message("<span class='danger'>[src] tears [W] off of [target]'s face!</span>", \
									"<span class='userdanger'>[src] tears [W] off of your face!</span>")
		target.equip_to_slot_if_possible(src, ITEM_SLOT_MASK, 0, 1, 1)
		var/datum/cb = CALLBACK(src,/obj/item/clothing/mask/facehugger/kiasyd/proc/eat_head)
		for(var/i in 1 to 20)
			addtimer(cb, (i - 1)*15)
		spawn(31 SECONDS)
			qdel(src)
	return TRUE

/obj/item/clothing/mask/facehugger/kiasyd/proc/eat_head()
	if(iscarbon(loc))
		var/mob/living/carbon/C = loc
		to_chat(C, "<span class='warning'>[src] is eating your face!</span>")
		C.apply_damage(10, BRUTE)

/obj/item/afterattack(atom/target, mob/living/carbon/user, proximity)
	if(!proximity)
		return
	if(iskindred(target))
		var/mob/living/carbon/human/L = target
		if(L.clane?.name == "Kiasyd")
			L.apply_damage(w_class*3, CLONE)
	..()

/obj/item/gun/ballistic
	is_iron = TRUE

/obj/item/gun/ballistic/automatic/vampire/aug
	is_iron = FALSE

/obj/item/gun/ballistic/shotgun/toy/crossbow/vampire
	is_iron = FALSE

/obj/item/melee/vampirearms/tire
	is_iron = TRUE

/obj/item/melee/vampirearms/knife
	is_iron = TRUE

/obj/item/melee/vampirearms/knife/gangrel
	is_iron = FALSE

/obj/item/melee/vampirearms/chainsaw
	is_iron = TRUE

/obj/item/melee/vampirearms/shovel
	is_iron = TRUE

/obj/item/melee/vampirearms/katana
	is_iron = TRUE

/obj/item/flashlight
	is_iron = TRUE

/datum/discipline/mytherceria/post_gain(mob/living/carbon/human/H)
	if (level >= 3)
		var/datum/action/mytherceria/U = new()
		U.Grant(H)

/datum/action/mytherceria
	name = "Mytherceria Traps"
	desc = "Create a trap."
	button_icon_state = "mytherceria"
	check_flags = AB_CHECK_HANDS_BLOCKED|AB_CHECK_IMMOBILE|AB_CHECK_LYING|AB_CHECK_CONSCIOUS
	vampiric = TRUE

/datum/action/mytherceria/Trigger()
	. = ..()
	var/mob/living/carbon/human/NG = owner
	if(NG.stat > 1 || NG.IsSleeping() || NG.IsUnconscious() || NG.IsParalyzed() || NG.IsKnockdown() || NG.IsStun() || HAS_TRAIT(NG, TRAIT_RESTRAINED) || !isturf(NG.loc))
		return
	var/mob/living/carbon/human/H = owner
	var/try_trap = input(H, "Select a Trap:", "Trap") as null|anything in list("Brutal", "Spin", "Drop")
	if(try_trap)
		if(H.bloodpool < 1)
			to_chat(owner, "<span class='warning'>You don't have enough <b>BLOOD</b> to do that!</span>")
			return
		H.bloodpool = max(0, H.bloodpool-1)
		switch(try_trap)
			if("Brutal")
				var/obj/mytherceria_trap/trap = new (get_turf(owner))
				trap.owner = owner
			if("Spin")
				var/obj/mytherceria_trap/disorient/trap = new (get_turf(owner))
				trap.owner = owner
			if("Drop")
				var/obj/mytherceria_trap/drop/trap = new (get_turf(owner))
				trap.owner = owner
		to_chat(owner, "<span class='notice'>You've created a trap!</span>")

/obj/mytherceria_trap
	name = "mytherceria trap"
	desc = "Creates the Changeling Trap to protect kiasyd or his domain."
	anchored = TRUE
	density = FALSE
	alpha = 64
	icon = 'code/modules/wod13/icons.dmi'
	icon_state = "rune1"
	color = "#4182ad"
	var/unique = FALSE
	var/mob/owner

/obj/mytherceria_trap/Crossed(atom/movable/AM)
	..()
	if(isliving(AM) && owner)
		if(AM != owner)
			playsound(get_turf(src), 'code/modules/wod13/sounds/kiasyd.ogg', 100, FALSE)
			if(!unique)
				var/mob/living/L = AM
				var/atom/throw_target = get_edge_target_turf(AM, get_dir(src, AM))
				L.apply_damage(30, BRUTE)
				AM.throw_at(throw_target, rand(8,10), 14, owner)
				qdel(src)

/obj/mytherceria_trap/disorient
	name = "mytherceria trap"
	desc = "Creates the Changeling Trap to protect kiasyd or his domain."
	anchored = TRUE
	density = FALSE
	unique = TRUE
	icon_state = "rune2"

/obj/mytherceria_trap/disorient/Crossed(atom/movable/AM)
	..()
	if(isliving(AM) && owner)
		if(AM != owner)
			var/mob/living/L = AM
			var/list/screens = list(L.hud_used.plane_masters["[FLOOR_PLANE]"], L.hud_used.plane_masters["[GAME_PLANE]"], L.hud_used.plane_masters["[LIGHTING_PLANE]"])
			var/rotation = 50
			for(var/whole_screen in screens)
				animate(whole_screen, transform = matrix(rotation, MATRIX_ROTATE), time = 5, easing = QUAD_EASING, loop = -1)
				animate(transform = matrix(-rotation, MATRIX_ROTATE), time = 5, easing = QUAD_EASING)
			spawn(15 SECONDS)
				for(var/whole_screen in screens)
					animate(whole_screen, transform = matrix(), time = 5, easing = QUAD_EASING)
			qdel(src)

/obj/mytherceria_trap/drop
	name = "mytherceria trap"
	desc = "Creates the Changeling Trap to protect kiasyd or his domain."
	anchored = TRUE
	density = FALSE
	unique = TRUE
	icon_state = "rune3"

/obj/mytherceria_trap/drop/Crossed(atom/movable/AM)
	..()
	if(iscarbon(AM) && owner)
		if(AM != owner)
			var/mob/living/carbon/L = AM
			for(var/obj/item/I in L.get_equipped_items(include_pockets = TRUE))
				if(I)
					L.dropItemToGround(I, TRUE)
			qdel(src)
