//Additional game logic should be stored in the component
GLOBAL_LIST_INIT(basic_disciplines, list(/datum/discipline/animalism)) //write here the main disciplines when I do them [Lucia] - god fucking damn it flavrius
/*
This datum stores a declarative description of clans, in order to make an instance of the clan component from this implementation in runtime
And it also helps for the character set panel
*/
/datum/vampireclane
	var/name = "Caitiff"
	var/desc = "The clanless. The rabble. Of no importance."
	var/list/clane_disciplines = list() //discipline datums
	var/datum/outfit/clane_outfit
	var/curse = "None."
	var/list/allowed_jobs = list()
	var/list/denied_jobs = list()
	var/clane_curse //There should be a reference here.
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
	var/whitelisted = FALSE

//var/datum/action/innate/drink_blood/sosalka = new

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
	var/datum/relationship/Myself

/datum/relationship/proc/publish()
	GLOB.relationship_list += src
	generate_relationships()

/datum/relationship
	var/need_friend = FALSE
	var/need_enemy = FALSE
	var/need_lover = FALSE

	var/datum/relationship/Friend
	var/datum/relationship/Enemy
	var/datum/relationship/Lover

	var/friend_text
	var/enemy_text
	var/lover_text

	var/phone_number

	var/mob/living/carbon/human/owner

/datum/relationship/proc/generate_relationships()
	if(!owner)
		return
	if(need_friend)
		for(var/datum/relationship/R in GLOB.relationship_list)
			if(R)
				if(R != src)
					if(R.need_friend && need_friend && !R.Friend && !Friend && R.Enemy != src && Enemy != R && R.Lover != src && Lover != R)
						Friend = R
						R.Friend = src
						to_chat(owner, "Your friend, <b>[R.owner.real_name]</b>, is now in the city!")
						to_chat(R.owner, "Your friend, <b>[owner.real_name]</b>, is now in the city!")
						need_friend = FALSE
	if(need_enemy)
		for(var/datum/relationship/R in GLOB.relationship_list)
			if(R)
				if(R != src)
					if(R.need_enemy && need_enemy && !R.Enemy && !Enemy && R.Friend != src && Friend != R && R.Lover != src && Lover != R)
						Enemy = R
						R.Enemy = src
						to_chat(owner, "Your enemy, <b>[R.owner.real_name]</b>, is now in the city!")
						to_chat(R.owner, "Your enemy, <b>[owner.real_name]</b>, is now in the city!")
						need_enemy = FALSE
	if(need_lover)
		for(var/datum/relationship/R in GLOB.relationship_list)
			if(R)
				if(R != src)
					if(R.need_lover && need_lover && !R.Lover && !Lover && R.Friend != src && Friend != R && R.Enemy != src && Enemy != R)
						if((R.owner.gender == owner.gender) && HAS_TRAIT(R.owner, TRAIT_HOMOSEXUAL) && HAS_TRAIT(owner, TRAIT_HOMOSEXUAL))
							Lover = R
							R.Lover = src
							to_chat(owner, "Your lover, <b>[R.owner.real_name]</b>, is now in the city!")
							to_chat(R.owner, "Your lover, <b>[owner.real_name]</b>, is now in the city!")
							need_lover = FALSE
						else if(!HAS_TRAIT(R.owner, TRAIT_HOMOSEXUAL) && !HAS_TRAIT(owner, TRAIT_HOMOSEXUAL) && (R.owner.gender != owner.gender))
							Lover = R
							R.Lover = src
							to_chat(owner, "Your lover, <b>[R.owner.real_name]</b>, is now in the city!")
							to_chat(R.owner, "Your lover, <b>[owner.real_name]</b>, is now in the city!")
							need_lover = FALSE

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
