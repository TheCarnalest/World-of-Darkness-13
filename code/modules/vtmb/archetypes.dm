/datum/archetype
	var/name = "Archetype Example"
	var/specialization = "Nothing Special."
	var/start_physique = 1
	var/start_social = 1
	var/start_mentality = 1
	var/start_blood = 1

/datum/archetype/proc/special_skill(var/mob/living/carbon/human/H)
	return

/datum/archetype/average
	name = "Average"
	specialization = "Nothing special."
	start_physique = 2
	start_social = 2
	start_mentality = 2
	start_blood = 1

/datum/archetype/warrior
	name = "Warrior"
	specialization = "Better melee combat skills."
	start_physique = 2
	start_social = 1
	start_mentality = 2
	start_blood = 2

/datum/archetype/warrior/special_skill(var/mob/living/carbon/human/H)
	H.melee_professional = TRUE

/datum/archetype/gunfighter
	name = "Gunfighter"
	specialization = "Better shooting technique."
	start_physique = 2
	start_social = 1
	start_mentality = 2
	start_blood = 2

/datum/archetype/gunfighter/special_skill(var/mob/living/carbon/human/H)
	H.no_fire_delay = TRUE

/datum/archetype/diplomatic
	name = "Diplomatic"
	specialization = "More allies available. (Use Animalism)"
	start_physique = 2
	start_social = 2
	start_mentality = 2
	start_blood = 1

/datum/archetype/diplomatic/special_skill(var/mob/living/carbon/human/H)
	H.more_companions = 3

/datum/archetype/masochist
	name = "Masochist"
	specialization = "Takes more blows before passage."
	start_physique = 3
	start_social = 1
	start_mentality = 1
	start_blood = 1

/datum/archetype/masochist/special_skill(var/mob/living/carbon/human/H)
	ADD_TRAIT(H, TRAIT_NOSOFTCRIT, TRAUMA_TRAIT)

/datum/archetype/wiseman
	name = "Wiseman"
	specialization = "A lot more mental than you can expect."
	start_physique = 1
	start_social = 1
	start_mentality = 3
	start_blood = 1

/datum/archetype/wiseman/special_skill(var/mob/living/carbon/human/H)
	H.additional_mentality += 3

/datum/archetype/beauty
	name = "Sharp Beauty"
	specialization = "Charisma power."
	start_physique = 1
	start_social = 3
	start_mentality = 1
	start_blood = 2

/datum/archetype/dude
	name = "Dude"
	specialization = "Sadistic consequences."
	start_physique = 1
	start_social = 1
	start_mentality = 1
	start_blood = 3

/datum/archetype/homebrew
	name = "Homebrew"
	specialization = "Mommy's child."
	start_physique = 1
	start_social = 1
	start_mentality = 1
	start_blood = 1
