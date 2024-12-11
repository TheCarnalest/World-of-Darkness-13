/datum/vampireclane/nosferatu
	name = "Nosferatu"
	desc = "The Nosferatu wear their curse on the outside. Their bodies horribly twisted and deformed through the Embrace, they lurk on the fringes of most cities, acting as spies and brokers of information. Using animals and their own supernatural capacity to hide, nothing escapes the eyes of the so-called Sewer Rats."
	curse = "Masquerade-violating appearance."
	alt_sprite = "nosferatu"
//	no_hair = TRUE		//Pyotr from Hunter the Parenting had hair and it didn't go out of place in the setting. I'll do limited hairstyles
	no_facial = TRUE
	clane_disciplines = list(
		/datum/discipline/animalism = 1,
		/datum/discipline/potence = 2,
		/datum/discipline/obfuscate = 3
	)
	haircuts = list(
		"Bald",
		"Pyotr",
		"Balding Hair",
		"Boddicker",
		"Feather",
		"Gelled Back",
		"Cornrows",
		"Cornrows 2",
		"Cornrow Bun",
		"Cornrow Braid",
		"Cornrow Tail"
	)
	violating_appearance = TRUE
	male_clothes = "/obj/item/clothing/under/vampire/nosferatu"
	female_clothes = "/obj/item/clothing/under/vampire/nosferatu/female"
	accessories = list("nosferatu_ears")
	accessories_layers = list("nosferatu_ears" = UPPER_EARS_LAYER)
	current_accessory = "nosferatu_ears"

/datum/vampireclane/nosferatu/on_gain(mob/living/carbon/human/H)
	..()
	var/obj/item/organ/eyes/night_vision/NV = new()
	NV.Insert(H, TRUE, FALSE)
	H.ventcrawler = VENTCRAWLER_ALWAYS

/datum/vampireclane/nosferatu/post_gain(mob/living/carbon/human/H)
	..()
	if(H.vampire_faction != "Camarilla" && H.vampire_faction != "Anarch" && H.vampire_faction != "Sabbat")
		H.vampire_faction = "Nosferatu"

/datum/discipline/obfuscate/post_gain(mob/living/carbon/human/H)
	if(level >= 3)
		var/datum/action/thousand_faces/thou = new()
		thou.Grant(H)

/datum/action/thousand_faces
	name = "Mask of 1000 faces"
	desc = "Change your appearance and mannerisms to mimic someone else."
	button_icon_state = "1000mask"
	check_flags = AB_CHECK_CONSCIOUS
	vampiric = TRUE
	var/last_hair
	var/last_facehair
	var/last_skintone
	var/last_gender
	var/last_bodytype
	var/last_haircolor
	var/last_facialhaircolor
	var/last_bodysprite
	var/last_eyecolor
	var/last_realname
	var/last_age
	var/last_body_mode

	var/original_hair
	var/original_facehair
	var/original_skintone
	var/original_gender
	var/original_bodytype
	var/original_haircolor
	var/original_facialhaircolor
	var/original_bodysprite
	var/original_eyecolor
	var/original_realname
	var/original_age
	var/original_body_mode
	var/furry_changed = FALSE

/datum/action/thousand_faces/Trigger()
	. = ..()
	var/mob/living/carbon/human/H = owner
	var/list/nibbers = list()
	for(var/mob/living/carbon/human/HU in oviewers(6, H))
		if(HU)
			nibbers += HU
	if(!furry_changed)
		if(last_hair)
			if(alert("Continue with last saved appearance?",,"Yes","No")=="Yes")
				H.switch_masquerade(H)
				original_hair = H.hairstyle
				original_facehair = H.facial_hairstyle
				original_skintone = H.skin_tone
				original_gender = H.gender
				original_bodytype = H.body_type
				original_haircolor = H.hair_color
				original_facialhaircolor = H.facial_hair_color
				original_bodysprite = H.unique_body_sprite
				original_eyecolor = H.eye_color
				original_realname = H.real_name
				original_age = H.age
				original_body_mode = H.base_body_mod
				playsound(get_turf(H), 'sound/magic/mandswap.ogg', 100, TRUE, -6)
				H.Stun(10)
				H.do_jitter_animation(10)
				H.clane.alt_sprite = FALSE
				H.clane.violating_appearance = FALSE
				H.remove_overlay(UPPER_EARS_LAYER)
				H.hairstyle = last_hair
				H.facial_hairstyle = last_facehair
				H.skin_tone = last_skintone
				H.gender = last_gender
				H.body_type = last_bodytype
				H.hair_color = last_haircolor
				H.facial_hair_color = last_facialhaircolor
				H.unique_body_sprite = last_bodysprite
				H.eye_color = last_eyecolor
				H.real_name = last_realname
				H.name = H.real_name
				H.age = last_age
				H.base_body_mod = last_body_mode
				H.update_body()
				H.update_hair()
				H.update_body_parts()
				furry_changed = TRUE
				return
		if(length(nibbers) >= 1)
			var/victim = input(owner, "Choose victim to copy:", "Vicissitude Appearance") as null|mob in nibbers
			if(victim)
				H.switch_masquerade(H)
				original_hair = H.hairstyle
				original_facehair = H.facial_hairstyle
				original_skintone = H.skin_tone
				original_gender = H.gender
				original_bodytype = H.body_type
				original_haircolor = H.hair_color
				original_facialhaircolor = H.facial_hair_color
				original_bodysprite = H.unique_body_sprite
				original_eyecolor = H.eye_color
				original_realname = H.real_name
				original_age = H.age
				original_body_mode = H.base_body_mod
				playsound(get_turf(H), 'sound/magic/mandswap.ogg', 100, TRUE, -6)
				H.Stun(10)
				H.do_jitter_animation(10)
				H.clane.alt_sprite = FALSE
				H.clane.violating_appearance = FALSE
				H.remove_overlay(UPPER_EARS_LAYER)
				var/mob/living/carbon/human/ZV = victim
				H.hairstyle = ZV.hairstyle
				H.facial_hairstyle = ZV.facial_hairstyle
				H.skin_tone = ZV.skin_tone
				H.gender = ZV.gender
				H.body_type = ZV.body_type
				H.hair_color = ZV.hair_color
				H.facial_hair_color = ZV.facial_hair_color
				H.unique_body_sprite = ZV.unique_body_sprite
				H.eye_color = ZV.eye_color
				H.real_name = ZV.real_name
				H.name = H.real_name
				H.age = ZV.age
				H.base_body_mod = ZV.base_body_mod
				H.update_body()
				H.update_hair()
				H.update_body_parts()
				last_hair = H.hairstyle
				last_facehair = H.facial_hairstyle
				last_skintone = H.skin_tone
				last_gender = H.gender
				last_bodytype = H.body_type
				last_haircolor = H.hair_color
				last_facialhaircolor = H.facial_hair_color
				last_bodysprite = H.unique_body_sprite
				last_eyecolor = H.eye_color
				last_realname = H.real_name
				last_age = H.age
				last_body_mode = H.base_body_mod
				furry_changed = TRUE
			else
				return
		else
			to_chat(H, "<span class='warning'>You see no soul which can be copied...</span>")
			return
		return
	else
		H.switch_masquerade(H)
		playsound(get_turf(H), 'sound/magic/mandswap.ogg', 100, TRUE, -6)
		H.Stun(10)
		H.do_jitter_animation(10)
		H.hairstyle = original_hair
		H.facial_hairstyle = original_facehair
		H.skin_tone = original_skintone
		H.gender = original_gender
		H.body_type = original_bodytype
		H.hair_color = original_haircolor
		H.facial_hair_color = original_facialhaircolor
		H.unique_body_sprite = original_bodysprite
		if(H.clane.name == "Nosferatu")
			H.clane.violating_appearance = TRUE
			H.clane.accessories = list("nosferatu_ears")
			H.clane.alt_sprite = "nosferatu"
			H.apply_overlay(UPPER_EARS_LAYER)
		H.eye_color = original_eyecolor
		H.real_name = original_realname
		H.name = H.real_name
		H.age = original_age
		H.base_body_mod = original_body_mode
		H.update_body()
		H.update_hair()
		H.update_body_parts()
		furry_changed = FALSE
		return
