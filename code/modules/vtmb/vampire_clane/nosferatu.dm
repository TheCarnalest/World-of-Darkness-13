/datum/vampireclane/nosferatu
	name = "Nosferatu"
	desc = "The Nosferatu wear their curse on the outside. Their bodies horribly twisted and deformed through the Embrace, they lurk on the fringes of most cities, acting as spies and brokers of information. Using animals and their own supernatural capacity to hide, nothing escapes the eyes of the so-called Sewer Rats."
	curse = "Masquerade-violating appearance."
	alt_sprite = "nosferatu"
//	no_hair = TRUE		//U Pyotra iz Hunter the Parenting bili volosi, i eto ne vibivalos is settinga. Ya sdelayu ogranichennie pricheski
	no_facial = TRUE
	clane_disciplines = list(/datum/discipline/animalism = 1,
														/datum/discipline/potence = 2,
														/datum/discipline/obfuscate = 3)
	haircuts = list("Bald",
									"Pyotr",
									"Balding Hair",
									"Boddicker",
									"Feather",
									"Gelled Back",
									"Cornrows",
									"Cornrows 2",
									"Cornrow Bun",
									"Cornrow Braid",
									"Cornrow Tail")
	violating_appearance = TRUE
	male_clothes = "/obj/item/clothing/under/vampire/nosferatu"
	female_clothes = "/obj/item/clothing/under/vampire/nosferatu/female"

/datum/vampireclane/nosferatu/on_gain(mob/living/carbon/human/H)
	..()
	H.remove_overlay(UPPER_EARS_LAYER)
	var/mutable_appearance/ears_overlay = mutable_appearance('code/modules/ziggers/icons.dmi', "nosferatu_ears", -UPPER_EARS_LAYER)
	H.overlays_standing[UPPER_EARS_LAYER] = ears_overlay
	H.apply_overlay(UPPER_EARS_LAYER)
	var/obj/item/organ/eyes/night_vision/NV = new()
	NV.Insert(H, TRUE, FALSE)

/datum/vampireclane/nosferatu/post_gain(mob/living/carbon/human/H)
	..()
	if(H.frakcja != "Camarilla" && H.frakcja != "Anarch" && H.frakcja != "Sabbat")
		H.frakcja = "Nosferatu"