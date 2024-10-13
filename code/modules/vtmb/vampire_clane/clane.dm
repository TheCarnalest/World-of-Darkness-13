/mob/living/carbon/human
	var/datum/vampireclane/clane
//Additional game logic should be stored in the component
GLOBAL_LIST_INIT(basic_disciplines, list(/datum/discipline/animalism)) //сюда написать основные дисциплины когда я их сделаю
/*
This datum stores a declarative description of clans, in order to make an instance of the clan component from this implementation in runtime
And it also helps for the character set panel*/
/datum/vampireclane
	var/name = "каитиф лол))))))" //в нейм только дефайны
	var/desc = "Ну описание клана"
	var/list/clane_disciplines = list() //discipline datums
	var/datum/outfit/clane_outfit
	var/curse = "МОРЛОК ТЫ ГАНДОН ПИДОРАС УБИВАЕШЬ НАС БЕЗ ПРИЧИНЫ ЛИШЬ ПОТОМУ ЧТО МЫ КАИТИФФЫ"
	var/list/allowed_jobs = list()
	var/list/denied_jobs = list()
	var/clane_curse //Здесь должен быть сигнал
	var/alt_sprite
	var/no_hair
	var/no_facial
	var/humanitymod = 1
	var/frenzymod = 1
	var/start_humanity = 7
	var/haircuts
	var/violating_appearance
	var/male_clothes
	var/female_clothes
	var/enlightement = FALSE
	var/list/whitelist = list()	//For whitelisting
//	var/datum/action/innate/drink_blood/sosalka = new
//Дополнительная игровая логика должна храниться в компоненте

/datum/vampireclane/proc/on_gain(var/mob/living/carbon/human/H)
	if(alt_sprite)
		H.skin_tone = "albino"
		H.dna.species.limbs_id = alt_sprite
		H.update_body_parts()
		H.update_body()
		H.update_icon()
//	if(no_hair)
//		H.facial_hairstyle = "Shaved"
//		H.hairstyle = "Bald"
//		H.update_hair()

/mob/living/carbon
	var/friend_name
	var/enemy_name
	var/lover_name
	var/have_friend = FALSE
	var/have_enemy = FALSE
	var/have_lover = FALSE

/mob/living/carbon/human/proc/generate_friends()
	if(have_friend && !friend_name)
		for(var/mob/living/carbon/human/H in GLOB.player_list)
			if(H.stat != DEAD && H.have_friend && !H.friend_name && H.client && H.enemy_name != real_name && H.lover_name != real_name && H.dna.real_name != real_name)
				H.friend_name = real_name
				friend_name = H.dna.real_name
				to_chat(src, "Your friend, <b>[friend_name]</b>, is now in the city!")
				to_chat(H, "Your friend, <b>[H.friend_name]</b>, is now in the city!")
	if(have_enemy && !enemy_name)
		for(var/mob/living/carbon/human/H in GLOB.player_list)
			if(H.stat != DEAD && H.have_enemy && !H.enemy_name && H.client && H.friend_name != real_name && H.lover_name != real_name && H.dna.real_name != real_name)
				H.enemy_name = real_name
				enemy_name = H.dna.real_name
				to_chat(src, "Your enemy, <b>[enemy_name]</b>, is now in the city!")
				to_chat(H, "Your enemy, <b>[H.enemy_name]</b>, is now in the city!")
	if(have_lover && !lover_name)
		if(HAS_TRAIT(src, TRAIT_HOMOSEXUAL))
			for(var/mob/living/carbon/human/H in GLOB.player_list)
				if(H.stat != DEAD && H.have_lover && !H.lover_name && H.client && HAS_TRAIT(H, TRAIT_HOMOSEXUAL) && H.gender == gender && H.enemy_name != real_name && H.friend_name != real_name && H.dna.real_name != real_name)
					H.lover_name = real_name
					lover_name = H.dna.real_name
					to_chat(src, "Your lover, <b>[lover_name]</b>, is now in the city!")
					to_chat(H, "Your lover, <b>[H.lover_name]</b>, is now in the city!")
		else
			for(var/mob/living/carbon/human/H in GLOB.player_list)
				if(H.stat != DEAD && H.have_lover && !H.lover_name && H.client && !HAS_TRAIT(H, TRAIT_HOMOSEXUAL) && H.gender != gender && H.enemy_name != real_name && H.friend_name != real_name && H.dna.real_name != real_name)
					H.lover_name = real_name
					lover_name = H.client.prefs.real_name
					to_chat(src, "Your lover, <b>[lover_name]</b>, is now in the city!")
					to_chat(H, "Your lover, <b>[H.lover_name]</b>, is now in the city!")

/datum/vampireclane/proc/post_gain(var/mob/living/carbon/human/H)
	if(violating_appearance)
		if(length(GLOB.masquerade_latejoin))
			var/obj/effect/landmark/latejoin_masquerade/LM = pick(GLOB.masquerade_latejoin)
			if(LM)
				H.forceMove(LM.loc)
	if(H.hud_used)
		if(H.hud_used.discipline1_icon)
			if(H.hud_used.discipline1_icon.dscpln)
				H.hud_used.discipline1_icon.dscpln.post_gain(H)
		if(H.hud_used.discipline2_icon)
			if(H.hud_used.discipline2_icon.dscpln)
				H.hud_used.discipline2_icon.dscpln.post_gain(H)
		if(H.hud_used.discipline3_icon)
			if(H.hud_used.discipline3_icon.dscpln)
				H.hud_used.discipline3_icon.dscpln.post_gain(H)
		if(H.hud_used.discipline4_icon)
			if(H.hud_used.discipline4_icon.dscpln)
				H.hud_used.discipline4_icon.dscpln.post_gain(H)
//	if(H.client.ckey == "Egorium")
//		H.put_in_r_hand(new /obj/item/melee/vampirearms/katana/kosa/egorium(H))
//	if(H.client.ckey == "BadTeammate")
//		H.put_in_r_hand(new /obj/item/melee/vampirearms/katana/kosa/egorium(H))

/datum/action
	var/vampiric = FALSE
