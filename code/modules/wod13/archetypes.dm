/*

/mob/living/carbon/human
	var/datum/archetype/__archetype
/datum/archetype
	var/name = "Morlok"
	var/desc = "Grants immunity to spells and total resistance to magic damage.\ Duration decreases with each use. Some abilities can pierce spell immunity."
	var/mob/living/carbon/owner
/datum/archetype/proc/on_gain()
	ADD_TRAIT(owner, TRAIT_ANTIMAGIC, TRAIT_GENERIC)

/datum/archetype/proc/on_lose()
	REMOVE_TRAIT(owner, TRAIT_ANTIMAGIC, TRAIT_GENERIC)

*/
