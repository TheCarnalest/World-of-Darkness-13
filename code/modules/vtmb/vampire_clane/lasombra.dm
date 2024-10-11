/datum/vampireclane/lasombra
	name = "Lasombra"
	desc = "The Lasombra exist for their own success, fighting for personal victories rather than solely for a crown to wear or a throne to sit upon. They believe that might makes right, and are willing to sacrifice anything to achieve their goals. A clan that uses spirituality as a tool rather than seeking honest enlightenment, their fickle loyalties are currently highlighted by half their clan's defection from the Sabbat."
	curse = "Technology refuse."
	clane_disciplines = list(/datum/discipline/potence = 1,
														/datum/discipline/dominate = 2,
														/datum/discipline/obtenebration = 3)
	male_clothes = "/obj/item/clothing/under/vampire/emo"
	female_clothes = "/obj/item/clothing/under/vampire/business"
	enlightement = TRUE
	whitelist = list("akrolon", "agateophobia", "raikyh", "pluviifera")

/datum/vampireclane/lasombra/post_gain(mob/living/carbon/human/H)
	..()
	var/obj/item/organ/eyes/night_vision/NV = new()
	NV.Insert(H, TRUE, FALSE)
	H.vis_flags |= VIS_HIDE

/datum/discipline/obtenebration/post_gain(mob/living/carbon/human/H)
	H.faction |= "Lasombra"
	var/datum/action/shadowcontrol/control = new()
	control.Grant(H)
	if(level >= 3)
		var/datum/action/lastentacles/tentacles = new()
		tentacles.Grant(H)
	if(level >= 4)
		var/datum/action/lasarmor/armor = new()
		armor.Grant(H)
	if(level >= 5)
		var/obj/effect/proc_holder/spell/targeted/shadowwalk/S = new(H)
		H.mind.AddSpell(S)

/datum/action/lastentacles
	name = "Summon Tentacles"
	desc = "Summon tentacles from shadows to assist you."
	button_icon_state = "tentacles"
	check_flags = AB_CHECK_HANDS_BLOCKED|AB_CHECK_IMMOBILE|AB_CHECK_LYING|AB_CHECK_CONSCIOUS
	vampiric = TRUE
	var/abuse_fix = 0

/datum/action/lastentacles/Trigger()
	. = ..()
	if(abuse_fix+100 > world.time)
		return
	var/mob/living/carbon/human/H = owner
	if(H.bloodpool < 1)
		to_chat(owner, "<span class='warning'>You don't have enough <b>BLOOD</b> to do that!</span>")
		return
	H.bloodpool = max(0, H.bloodpool-1)
	playsound(H.loc, 'sound/magic/voidblink.ogg', 50, FALSE)
	abuse_fix = world.time
	H.drop_all_held_items()
	H.put_in_r_hand(new /obj/item/melee/vampirearms/knife/gangrel/lasombra(H))
	H.put_in_l_hand(new /obj/item/melee/vampirearms/knife/gangrel/lasombra(H))
//	H.physiology.armor.melee += 50
//	H.physiology.armor.bullet += 50
//	animate(H, color = "#000000", time = 10, loop = 1)
	if(H.CheckEyewitness(H, H, 7, FALSE))
		H.AdjustMasquerade(-1)
	spawn(100)
		if(H)
			playsound(H.loc, 'sound/magic/voidblink.ogg', 50, FALSE)
			for(var/obj/item/melee/vampirearms/knife/gangrel/lasombra/G in H.contents)
				if(G)
					qdel(G)
//			H.physiology.armor.melee -= 50
//			H.physiology.armor.bullet -= 50
//			H.color = initial(H.color)

/datum/action/lasarmor
	name = "Shadow Armor"
	desc = "Turn into shadow abomination for your safety."
	button_icon_state = "armor"
	check_flags = AB_CHECK_HANDS_BLOCKED|AB_CHECK_IMMOBILE|AB_CHECK_LYING|AB_CHECK_CONSCIOUS
	vampiric = TRUE
	var/abuse_fix = 0

/datum/action/lasarmor/Trigger()
	. = ..()
	if(abuse_fix+100 > world.time)
		return
	var/mob/living/carbon/human/H = owner
	if(H.bloodpool < 2)
		to_chat(owner, "<span class='warning'>You don't have enough <b>BLOOD</b> to do that!</span>")
		return
	H.bloodpool = max(0, H.bloodpool-2)
	playsound(H.loc, 'sound/magic/voidblink.ogg', 50, FALSE)
	abuse_fix = world.time
	H.physiology.damage_resistance += 75
	animate(H, color = "#000000", time = 10, loop = 1)
	if(H.CheckEyewitness(H, H, 7, FALSE))
		H.AdjustMasquerade(-1)
	spawn(100)
		if(H)
			playsound(H.loc, 'sound/magic/voidblink.ogg', 50, FALSE)
			H.physiology.damage_resistance -= 75
			H.color = initial(H.color)

/datum/action/shadowcontrol
	name = "Control Shadows"
	desc = "Control shadows around you"
	button_icon_state = "shadow"
	check_flags = AB_CHECK_HANDS_BLOCKED|AB_CHECK_IMMOBILE|AB_CHECK_LYING|AB_CHECK_CONSCIOUS
	vampiric = TRUE
	var/abuse_fix = 0

/datum/action/shadowcontrol/Trigger()
	. = ..()
	if(abuse_fix+100 > world.time)
		return
	var/mob/living/carbon/human/H = owner
	if(H.bloodpool < 1)
		to_chat(owner, "<span class='warning'>You don't have enough <b>BLOOD</b> to do that!</span>")
		return
	H.bloodpool = max(0, H.bloodpool-1)
	playsound(H.loc, 'sound/magic/voidblink.ogg', 50, FALSE)
	abuse_fix = world.time
	var/atom/movable/AM = new(H)
	AM.set_light(3, -7)
	if(H.CheckEyewitness(H, H, 7, FALSE))
		H.AdjustMasquerade(-1)
	spawn(100)
		if(AM)
			qdel(AM)
			if(H)
				playsound(H.loc, 'sound/magic/voidblink.ogg', 50, FALSE)
