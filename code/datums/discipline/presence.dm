/datum/discipline/presence
	name = "Presence"
	desc = "Makes targets in radius more vulnerable to damages."
	icon_state = "presence"

/datum/discipline/presence/New(level)
	all_powers = subtypesof(/datum/discipline_power/presence)
	..()

/datum/discipline_power/presence
	name = "Presence power name"
	desc = "Presence power description"

	check_flags = DISC_CHECK_CAPABLE|DISC_CHECK_SPEAK
	target_type = TARGET_LIVING
	range = 7

	activate_sound = 'code/modules/wod13/sounds/presence_activate.ogg'
	deactivate_sound = 'code/modules/wod13/sounds/presence_deactivate.ogg'

	multi_activation = TRUE
	cooldown_length = 15 SECONDS
	duration_length = 3 SECONDS

/datum/discipline_power/presence/activate(mob/living/carbon/human/target)
	. = ..()
	target.remove_overlay(MUTATIONS_LAYER)
	var/mutable_appearance/presence_overlay = mutable_appearance('code/modules/wod13/icons.dmi', "presence", -MUTATIONS_LAYER)
	presence_overlay.pixel_z = 1
	target.overlays_standing[MUTATIONS_LAYER] = presence_overlay
	target.apply_overlay(MUTATIONS_LAYER)

/datum/discipline_power/presence/deactivate(mob/living/carbon/human/target)
	. = ..()
	if (!.)
		return
	target.remove_overlay(MUTATIONS_LAYER)

/datum/discipline_power/presence/can_activate(mob/living/target, alert = FALSE)
	. = ..()
	if (!.)
		return .
	if (!ishuman(target))
		return FALSE
	var/mypower = owner.social + owner.additional_social
	var/theirpower = target.mentality + target.additional_mentality
	if((theirpower >= mypower) || ((owner.generation - 3) >= target.generation))
		if (alert)
			to_chat(owner, "<span class='warning'>[target]'s mind is too powerful to sway!</span>")
		return FALSE
	return TRUE

//AWE
/datum/discipline_power/presence/awe
	name = "Awe"
	desc = "Make those around you admire and want to be closer to you."

	level = 1

/datum/discipline_power/presence/awe/activate(mob/living/carbon/human/target)
	. = ..()
	var/datum/cb = CALLBACK(H, /mob/living/carbon/human/proc/walk_to_caster, owner)
	for(var/i in 1 to 30)
		addtimer(cb, (i - 1) * H.total_multiplicative_slowdown())
	to_chat(target, "<span class='userlove'><b>COME HERE</b></span>")
	owner.say("COME HERE!!")

//DREAD GAZE
/datum/discipline_power/presence/dread_gaze
	name = "Dread Gaze"
	desc = "Incite fear in others through only your words and gaze."

	level = 2

/datum/discipline_power/presence/dread_gaze/activate(mob/living/carbon/human/target)
	. = ..()
	target.Stun(1 SECONDS)
	to_chat(target, "<span class='userlove'><b>REST</b></span>")
	owner.say("REST!!")
	if(target.body_position == STANDING_UP)
		target.toggle_resting()

//ENTRANCEMENT
/datum/discipline_power/presence/entrancement
	name = "Entrancement"
	desc = "Manipulate minds by bending emotions to your will."

	level = 3

/datum/discipline_power/presence/entrancement/activate(mob/living/carbon/human/target)
	. = ..()
	var/obj/item/I1 = target.get_active_held_item()
	var/obj/item/I2 = target.get_inactive_held_item()
	to_chat(target, "<span class='userlove'><b>PLEASE ME</b></span>")
	owner.say("PLEASE ME!!")
	target.face_atom(owner)
	target.do_jitter_animation(3 SECONDS)
	target.Immobilize(1 SECONDS)
	target.drop_all_held_items()
	if(I1)
		I1.throw_at(get_turf(owner), 3, 1, target)
	if(I2)
		I2.throw_at(get_turf(owner), 3, 1, target)

//SUMMON
/datum/discipline_power/presence/summon
	name = "Summon"
	desc = "Call anyone you've ever met to be by your side."

	level = 4

/datum/discipline_power/presence/summon/activate(mob/living/carbon/human/target)
	. = ..()
	to_chat(target, "<span class='userlove'><b>FEAR ME</b></span>")
	owner.say("FEAR ME!!")
	var/datum/cb = CALLBACK(target, /mob/living/carbon/human/proc/step_away_caster, owner)
	for(var/i in 1 to 30)
		addtimer(cb, (i - 1) * target.total_multiplicative_slowdown())
	target.emote("scream")
	target.do_jitter_animation(3 SECONDS)

//MAJESTY
/datum/discipline_power/presence/majesty
	name = "Majesty"
	desc = "Become so grand that others find it nearly impossible to disobey or harm you."

	level = 5

/datum/discipline_power/presence/majesty/activate(mob/living/carbon/human/target)
	. = ..()
	to_chat(target, "<span class='userlove'><b>UNDRESS YOURSELF</b></span>")
	owner.say("UNDRESS YOURSELF!!")
	target.Immobilize(1 SECONDS)
	for(var/obj/item/clothing/W in target.contents)
		if(W)
			H.dropItemToGround(W, TRUE)