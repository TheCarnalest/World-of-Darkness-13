/datum/vampireclane/true_brujah
	name = "True Brujah"
	desc = "The True Brujah are a bloodline of Clan Brujah that claim to be descendants of the original Antediluvian founder of the lineage and not his diablerist/childe Troile. They are also noted for their calm, detached behavior, which puts them in contrast to the main lineage who are known for their rather short, violent tempers and anti-establishment attitudes. "
	curse = "Absence of Passion."
	clane_disciplines = list(/datum/discipline/potence = 1,
														/datum/discipline/presence = 2,
														/datum/discipline/temporis = 3)
	violating_appearance = FALSE
	enlightement = TRUE
	male_clothes = "/obj/item/clothing/under/vampire/sport"
	female_clothes = "/obj/item/clothing/under/vampire/red"

/datum/discipline/temporis/post_gain(mob/living/carbon/human/H)
	if(level >= 1)
		var/datum/action/clock/clocke = new()
		clocke.Grant(H)


/datum/action/clock
	name = "Check Time"
	desc = "Telling the time is easy when you're True Brujah."
	button_icon_state = "clock2"
	check_flags = AB_CHECK_CONSCIOUS
	vampiric = TRUE

/datum/action/clock/Trigger()
	. = ..()
	to_chat(usr, "<b>[SScity_time.timeofnight]</b>")
