/*

/mob/living/carbon/human
	var/datum/archetype/__archetype
/datum/archetype
	var/name = "Morlok"
	var/desc = "Дает невосприимчивость к заклинаниям и полное сопротивление магическому урону.\
	Продолжительность уменьшается с каждым использованием. Некоторые способности могут проходить сквозь невосприимчивость к заклинаниям."
	var/mob/living/carbon/owner
/datum/archetype/proc/on_gain()
	ADD_TRAIT(owner, TRAIT_ANTIMAGIC, TRAIT_GENERIC)

/datum/archetype/proc/on_lose()
	REMOVE_TRAIT(owner, TRAIT_ANTIMAGIC, TRAIT_GENERIC)

*/