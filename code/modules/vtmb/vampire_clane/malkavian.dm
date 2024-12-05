/datum/vampireclane/malkavian
	name = "Malkavian"
	desc = "Derided as Lunatics by other vampires, the Blood of the Malkavians lets them perceive and foretell truths hidden from others. Like the �wise madmen� of poetry their fractured perspective stems from seeing too much of the world at once, from understanding too deeply, and feeling emotions that are just too strong to bear."
	curse = "Insanity."
	clane_disciplines = list(
		/datum/discipline/auspex = 1,
		/datum/discipline/dementation = 2,
		/datum/discipline/obfuscate = 3
	)
	male_clothes = "/obj/item/clothing/under/vampire/malkavian"
	female_clothes = "/obj/item/clothing/under/vampire/malkavian/female"

/datum/discipline/dementation/post_gain(mob/living/carbon/human/H)
	..()
	H.add_quirk(/datum/quirk/insanity)
	var/datum/action/malk_hivemind/GH = new()
	GH.Grant(H)
	GLOB.malkavian_list += H

/datum/action/malk_hivemind
	name = "Hivemind"
	desc = "Talk."
	button_icon_state = "hivemind"
	check_flags = AB_CHECK_CONSCIOUS
	vampiric = TRUE
	var/abuse_fix = 0

/datum/action/malk_hivemind/Trigger()
	. = ..()
	if((abuse_fix + 5 SECONDS) > world.time)
		to_chat(owner, "<span class='warning'>Your mind feels a bit empty...</span>")
		return
	var/new_thought = input(owner, "Have any thought about this, buddy?") as text|null
	if(new_thought)
		abuse_fix = world.time
		for(var/mob/living/carbon/human/H in GLOB.player_list)
			if (iskindred(H))
				var/datum/species/kindred/species = H.dna.species
				if (species.get_discipline("Dementation"))
					to_chat(H, "<span class='ghostalert'>[sanitize_text(new_thought)]</span>")
