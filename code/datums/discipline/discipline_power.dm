/datum/discipline_power
	///Name of the Discipline power
	var/name = "Discipline power name"
	///Description of the Discipline power
	var/desc = "Discipline power description"

	///What rank of the Discipline this Discipline power belongs to.
	var/level = 1
	///Bitflags determining the requirements to cast this power
	var/check_flags = DISC_CHECK_CONSCIOUS|DISC_CHECK_CAPABLE
	///How many blood points this power costs to activate
	var/vitae_cost = 1
	///Bitflags determining what types of entities this power is allowed to target. NONE if self-targeting.
	var/target_type = NONE
	///How many tiles away this power can be used from.
	var/range = 0

	///Sound file that plays to the user when this power is activated.
	var/activate_sound
	///Sound file that plays to the user when this power is deactivated.
	var/deactivate_sound
	///Sound file that plays to all nearby players when this power is activated.
	var/effect_sound
	///If this power will upset NPCs when used on them.
	var/aggravating = FALSE
	///If this power is an aggressive action and logged as such.
	var/hostile = FALSE
	///If use of this power creates a visible Masquerade breach.
	var/violates_masquerade = FALSE

	///If this Discipline doesn't automatically expire, but rather periodically drains blood.
	var/toggled = FALSE
	///If this power can be turned on and off.
	var/cancelable = FALSE
	///If this power can have multiple effects active at once, or only one.
	var/multi_activation = FALSE
	///Amount of time it takes until this Discipline deactivates itself. 0 if instantaneous.
	var/duration_length = 0
	///Timer tracking the duration of the power. Not used if multi_activation is TRUE.
	COOLDOWN_DECLARE(duration)
	///Amount of time it takes until this Discipline can be used again after activation.
	var/cooldown_length = 0
	///Timer tracking the cooldown of the power.
	COOLDOWN_DECLARE(cooldown)
	///List of Discipline power types that cannot be activated alongside this power.
	var/list/mutually_exclusive = list()

	///If this Discipline is currently in use.
	var/active = FALSE
	///The Discipline that this power is part of.
	var/datum/discipline/discipline
	///The player using this Discipline power.
	var/mob/living/carbon/human/owner

/datum/discipline_power/New(datum/discipline/discipline)
	if (discipline)
		src.discipline = discipline
		src.owner = discipline.owner

/datum/discipline_power/proc/get_cooldown()
	return COOLDOWN_TIMELEFT(src, cooldown)

/datum/discipline_power/proc/get_duration()
	return COOLDOWN_TIMELEFT(src, duration)

/datum/discipline_power/proc/can_afford()
	return owner.can_adjust_blood_points(-vitae_cost)

/datum/discipline_power/proc/can_activate(atom/target, alert = FALSE)
	SHOULD_CALL_PARENT(TRUE)

	//can't activate if the owner isn't capable of it
	if (!can_activate_untargeted(alert))
		return FALSE

	//self activated so target doesn't matter
	if (target_type == NONE)
		return TRUE

	//check if distance is in range
	if (get_dist(owner, target) > range)
		return FALSE

	//check target type
	if ((target_type & TARGET_MOB) && istype(target, /mob/living))
		//make sure our LIVING target isn't DEAD
		var/mob/living/living = target
		if ((target_type & TARGET_LIVING) && living.stat == DEAD)
			return FALSE

		//make sure they can be targeted by Disciplines
		if (ishuman(target))
			var/mob/living/carbon/human/human = living
			if (human.resistant_to_disciplines || HAS_TRAIT(human, TRAIT_ANTIMAGIC))
				return FALSE
		return TRUE

	if ((target_type & TARGET_OBJ) && istype(target, /obj))
		return TRUE

	if ((target_type & TARGET_DEAD) && istype(target, /mob/dead))
		return TRUE

	if ((target_type & TARGET_TURF) && istype(target, /turf))
		return TRUE

	//target doesn't match any targeted types, so can't activate on them
	if (alert)
		to_chat(owner, "<span class='warning'>You cannot cast [name] on [target]!</span>")
	return FALSE

/datum/discipline_power/proc/can_activate_untargeted(alert = FALSE)
	SHOULD_CALL_PARENT(TRUE)

	//status checks
	if ((check_flags & DISC_CHECK_TORPORED) && HAS_TRAIT(owner, TRAIT_TORPOR))
		if (alert)
			to_chat(owner, "<span class='warning'>You cannot cast [name] while in Torpor!</span>")
		return FALSE

	if ((check_flags & DISC_CHECK_CONSCIOUS) && HAS_TRAIT(owner, TRAIT_KNOCKEDOUT))
		if (alert)
			to_chat(owner, "<span class='warning'>You cannot cast [name] while unconscious!</span>")
		return FALSE

	if ((check_flags & DISC_CHECK_CAPABLE) && HAS_TRAIT(owner, TRAIT_INCAPACITATED))
		if (alert)
			to_chat(owner, "<span class='warning'>You cannot cast [name] while incapacitated!</span>")
		return FALSE

	if ((check_flags & DISC_CHECK_IMMOBILE) && HAS_TRAIT(owner, TRAIT_IMMOBILIZED))
		if (alert)
			to_chat(owner, "<span class='warning'>You cannot cast [name] while immobilised!</span>")
		return FALSE

	if ((check_flags & DISC_CHECK_LYING) && HAS_TRAIT(owner, TRAIT_FLOORED))
		if (alert)
			to_chat(owner, "<span class='warning'>You cannot cast [name] while lying on the floor!</span>")
		return FALSE

	if ((check_flags & DISC_CHECK_SEE) && HAS_TRAIT(owner, TRAIT_BLIND))
		if (alert)
			to_chat(owner, "<span class='warning'>You cannot cast [name] without your sight!</span>")
		return FALSE

	if ((check_flags & DISC_CHECK_SPEAK) && HAS_TRAIT(owner, TRAIT_MUTE))
		if (alert)
			to_chat(owner, "<span class='warning'>You cannot cast [name] without speaking!</span>")
		return FALSE

	if ((check_flags & DISC_CHECK_FREE_HAND) && HAS_TRAIT(owner, TRAIT_HANDS_BLOCKED))
		if (alert)
			to_chat(owner, "<span class='warning'>You cannot cast [name] without free hands!</span>")
		return FALSE

	//respect pacifism, prevent hostile Discipline usage from pacifists
	if (hostile && HAS_TRAIT(owner, TRAIT_PACIFISM))
		if (alert)
			to_chat(owner, "<span class='warning'>You cannot cast [name] as a pacifist!</span>")
		return FALSE

	//the power is currently active
	if (active && (!cancelable || !multi_activation || !toggled))
		if (alert)
			to_chat(owner, "<span class='warning'>[name] is already active!</span>")
		return FALSE

	//the power's cooldown has not elapsed
	if (get_cooldown())
		if (alert)
			to_chat(owner, "<span class='warning'>[name] is on cooldown!</span>")
		return FALSE

	//the user cannot afford the power's vitae expenditure
	if (!can_afford())
		if (alert)
			to_chat(owner, "<span class='warning'>You do not have enough blood to cast [name]!</span>")
		return FALSE

	//TODO: separate this from being a human????
	if (ishuman(owner))
		var/mob/living/carbon/human/human = owner
		var/datum/species/kindred/species = human.dna.species
		if (!species.can_spend_blood(vitae_cost))
			return FALSE

	//nothing found, it can be casted
	return TRUE

/datum/discipline_power/proc/activate(atom/target)
	SHOULD_CALL_PARENT(TRUE)

	//ensure everything is in place for activation to be possible
	if(!target && !(target_type == NONE))
		return
	if(!discipline?.owner)
		return
	active = TRUE

	//toggle the Discipline power off
	if(get_duration() && (cancelable || toggled))
		deactivate(target)

	//start the cooldown if there is one, instead triggers on deactivate() if toggled
	if (cooldown_length && !cancelable)
		COOLDOWN_START(src, cooldown, cooldown_length)

	//handle Discipline power duration, start duration timer if it can't have multiple effects running at once
	if (duration_length)
		if (!multi_activation)
			TIMER_COOLDOWN_START(src, duration, duration_length)
		if (toggled)
			addtimer(CALLBACK(src, PROC_REF(refresh), target), duration_length)
		else
			addtimer(CALLBACK(src, PROC_REF(deactivate), target), duration_length)

	//play the Discipline power's activation sound to the user if there is one
	if (activate_sound)
		owner.playsound_local(owner, activate_sound, 50, FALSE)

	//play the Discipline power's effect sound around the user if there is one
	if (effect_sound)
		playsound(owner, effect_sound, 50, FALSE)

	//make NPCs aggro if the power is aggravating, and do so as an attack if the power is hostile
	if (aggravating && isnpc(target))
		var/mob/living/carbon/human/npc/npc = target
		spawn()
			npc.Aggro(owner, hostile)

	//causes a Masquerade violation if masquerade violating power is used around NPCs
	if (violates_masquerade)
		spawn()
			if(owner.CheckEyewitness(target ? target : owner, owner, 7, TRUE))
				//TODO: detach this from being a human
				if (ishuman(owner))
					var/mob/living/carbon/human/human = owner
					human.AdjustMasquerade(-1)

	//spend the necessary blood points, TODO: god I hate this
	if (ishuman(owner))
		var/mob/living/carbon/human/human = owner
		var/datum/species/kindred/species = human.dna.species
		species.spend_blood(vitae_cost)
	else
		owner.adjust_blood_points(-vitae_cost)

	//TODO: rewrite this to be sane
	log_attack("[key_name(owner)] casted [name], level [discipline.level_casting] of the Discipline [discipline.name][!target_type ? "." : " on [key_name(discipline.owner)]"]")

/datum/discipline_power/proc/try_activate(atom/target)
	if (can_activate(target, TRUE))
		activate(target)
		return TRUE

	return FALSE

/datum/discipline_power/proc/deactivate(atom/target)
	SHOULD_CALL_PARENT(TRUE)

	active = FALSE
	if (!owner)
		return FALSE
	if (cancelable)
		COOLDOWN_START(src, cooldown, cooldown_length)
	if (deactivate_sound)
		owner.playsound_local(owner, deactivate_sound, 50, FALSE)
	return TRUE

/datum/discipline_power/proc/post_gain()
	return

/datum/discipline_power/proc/refresh(atom/target)
	if (active)
		var/repeat = FALSE
		if (ishuman(owner))
			var/mob/living/carbon/human/human = owner
			var/datum/species/kindred/species = human.dna.species
			if (species.try_spend_blood(vitae_cost))
				repeat = TRUE
		else
			if (owner.try_adjust_blood_points(-vitae_cost))
				repeat = TRUE

		if (repeat)
			addtimer(CALLBACK(src, PROC_REF(refresh), target), duration_length)
		else
			deactivate(target)

