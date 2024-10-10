SUBSYSTEM_DEF(factionwar)
	name = "Faction War"
	init_order = INIT_ORDER_DEFAULT
	wait = 6000
	priority = FIRE_PRIORITY_VERYLOW

	var/list/marks_camarilla = list()
	var/list/marks_anarch = list()
	var/list/marks_sabbat = list()

	var/camarilla_power = 500
	var/list/camarilla_members = list()
	var/anarch_power = 500
	var/list/anarch_members = list()

/mob/living/carbon/human/Destroy()
	if(frakcja == "Camarilla")
		SSfactionwar.camarilla_members -= src
	..()

/datum/controller/subsystem/factionwar/proc/adjust_members()
	camarilla_members = list()
	anarch_members = list()
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(H)
			if(H.frakcja == "Camarilla")
				camarilla_members += H
			if(H.frakcja == "Anarch")
				anarch_members += H

/datum/controller/subsystem/factionwar/fire()
	//Sanity check
	camarilla_members = list()
	anarch_members = list()
	var/how_much_cam = length(marks_camarilla)
	var/how_much_an = length(marks_anarch)
//	var/how_much_sab = length(marks_sabbat)
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(H)
//			var/datum/preferences/P = GLOB.preferences_datums[ckey(H.key)]
//			var/mode = 1
//			if(HAS_TRAIT(H, TRAIT_NON_INT))
//				mode = 2
//			if(P)
			if(H.frakcja == "Camarilla")
				camarilla_members += H
//					P.exper = min(calculate_mob_max_exper(H), P.exper+((4/mode)*how_much_cam))
			if(H.frakcja == "Anarch")
				anarch_members += H
//					P.exper = min(calculate_mob_max_exper(H), P.exper+((4/mode)*how_much_an))
//				if(H.frakcja == "Sabbat")
//					P.exper = min(calculate_mob_max_exper(H), P.exper+((4/mode)*how_much_sab))
	camarilla_power = max(0, camarilla_power-(how_much_cam*5))
	if(camarilla_power == 0)
		var/list/shit = list()
		for(var/obj/graffiti/G in marks_camarilla)
			if(G)
				if(!G.permanent)
					shit += G
		if(length(shit))
			var/obj/graffiti/R = pick(shit)
			marks_camarilla -= R
			R.icon_state = "Unknown"
			for(var/mob/living/carbon/human/H in GLOB.player_list)
				if(H.frakcja == "Camarilla" || H.frakcja == "Anarch" || H.frakcja == "Sabbat")
					var/area/A = get_area(R)
					to_chat(H, "<b><span class='warning'>Camarilla</span> don't have recources to sustain [A.name] [R.x]:[R.y], so it belongs to no one now.</b>")
	anarch_power = max(0, anarch_power-(how_much_an*5))
	if(anarch_power == 0)
		var/list/shit = list()
		for(var/obj/graffiti/G in marks_anarch)
			if(G)
				if(!G.permanent)
					shit += G
		if(length(shit))
			var/obj/graffiti/R = pick(shit)
			marks_anarch -= R
			R.icon_state = "Unknown"
			for(var/mob/living/carbon/human/H in GLOB.player_list)
				if(H.frakcja == "Camarilla" || H.frakcja == "Anarch" || H.frakcja == "Sabbat")
					var/area/A = get_area(R)
					to_chat(H, "<b><span class='warning'>Anarch</span> don't have recources to sustain [A.name] [R.x]:[R.y], so it belongs to no one now.</b>")


/datum/controller/subsystem/factionwar/proc/switch_member(var/mob/living/member, var/frakcja)
	switch(frakcja)
		if("Camarilla")
			anarch_members -= member
			camarilla_members += member
		if("Anarch")
			camarilla_members -= member
			anarch_members += member
		if("Sabbat")
			camarilla_members -= member
			anarch_members -= member

/datum/controller/subsystem/factionwar/proc/check_faction_ability(var/frakcja)
	switch(frakcja)
		if("Sabbat")
			return TRUE
		if("Camarilla")
			if(round(length(marks_camarilla)/3) > length(camarilla_members))
				return FALSE
			if(camarilla_power < length(marks_camarilla)*5)
				return FALSE
			return TRUE
		if("Anarch")
			if(round(length(marks_anarch)/3) > length(anarch_members))
				return FALSE
			if(anarch_power < length(marks_anarch)*5)
				return FALSE
			return TRUE

/datum/controller/subsystem/factionwar/proc/move_mark(var/obj/graffiti/G, var/frakcja)
	switch(frakcja)
		if("Camarilla")
			marks_anarch -= G
			marks_sabbat -= G
			marks_camarilla |= G
		if("Anarch")
			marks_camarilla -= G
			marks_sabbat -= G
			marks_anarch |= G
		if("Sabbat")
			marks_camarilla -= G
			marks_anarch -= G
			marks_sabbat |= G

/mob/living
	var/frakcja

/obj/graffiti
	name = "faction mark"
	desc = "Reminds anyone who sees it which faction it belongs to..."
	icon = 'code/modules/ziggers/48x48.dmi'
	plane = GAME_PLANE
	layer = ABOVE_NORMAL_TURF_LAYER
	anchored = TRUE
	pixel_w = -8
	pixel_z = -8
	alpha = 128
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	var/repainting = FALSE
	var/permanent = FALSE

/obj/graffiti/Initialize()
	. = ..()
	if(icon_state)
		SSfactionwar.move_mark(src, icon_state)

/obj/graffiti/camarilla
	icon_state = "Camarilla"

/obj/graffiti/anarch
	icon_state = "Anarch"

/obj/graffiti/sabbat
	icon_state = "Sabbat"

/obj/graffiti/AltClick(mob/user)
	..()
	if(isliving(user))
		var/mob/living/L = user
		if(!L.frakcja)
			to_chat(user, "You don't belong to any faction, so you can't repaint it.")
			return
		if(L.frakcja == "Camarilla" || L.frakcja == "Anarch" || L.frakcja == "Sabbat")
			if(L.frakcja != icon_state)
				if(SSfactionwar.check_faction_ability(L.frakcja))
					if(!repainting)
						repainting = TRUE
						if(do_mob(user, src, 10 SECONDS))
							icon_state = L.frakcja
							if(ishuman(user))
								var/mob/living/carbon/human/H = user
								H.last_repainted_mark = L.frakcja
							if(L.frakcja == "Camarilla")
								SSfactionwar.camarilla_power = max(0, SSfactionwar.camarilla_power-length(SSfactionwar.marks_camarilla)*5)
							if(L.frakcja == "Anarch")
								SSfactionwar.anarch_power = max(0, SSfactionwar.anarch_power-length(SSfactionwar.marks_anarch)*5)
							SSfactionwar.move_mark(src, L.frakcja)
							for(var/mob/living/carbon/human/H in GLOB.player_list)
								if(H.frakcja == "Camarilla" || H.frakcja == "Anarch" || H.frakcja == "Sabbat")
									var/area/vtm/A = get_area(src)
									to_chat(H, "<b>[A.name] [x]:[y] mark now belongs to <span class='warning'>[L.frakcja]</span></b>")
									if(A.zone_owner)
										A.zone_owner = L.frakcja
//						if(user.client)
//							var/mode = 1
//							if(HAS_TRAIT(user, TRAIT_NON_INT))
//								mode = 2
//							user.client.prefs.exper = min(calculate_mob_max_exper(user), user.client.prefs.exper+(50+L.experience_plus)/mode)
//							to_chat(user, "Successfuly repainted to [L.frakcja]'s mark.")
							repainting = FALSE
						else
							repainting = FALSE
				else
					if(L.frakcja == "Camarilla")
						to_chat(user, "Your faction needs <span class='warning'>[round(length(SSfactionwar.marks_camarilla)/3)]</span> members and <span class='warning'>[length(SSfactionwar.marks_camarilla)*5]</span> influence to gain this mark.")
					if(L.frakcja == "Anarch")
						to_chat(user, "Your faction needs <span class='warning'>[round(length(SSfactionwar.marks_anarch)/3)]</span> members and <span class='warning'>[length(SSfactionwar.marks_anarch)*5]</span> influence to gain this mark.")
			else
				to_chat(user, "Your faction already own this.")

/obj/structure/faction_map
	name = "faction marks map"
	desc = "Exact map of all marks. <b>Insert dollars to gain influence and bloodbond kindred to gain faction members</b>."
	icon = 'code/modules/ziggers/props.dmi'
	icon_state = "faction_map"
	plane = GAME_PLANE
	layer = CAR_LAYER
	anchored = TRUE
	density = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	var/faction

/obj/structure/faction_map/examine(mob/user)
	. = ..()
	switch(faction)
		if("Camarilla")
			. += "<b>Total Influence:</b> [SSfactionwar.camarilla_power]"
			if(length(SSfactionwar.camarilla_members))
				. += "<b>Total Members:</b> [length(SSfactionwar.camarilla_members)]"
			if(length(SSfactionwar.marks_camarilla))
				. += "<b>Total Marks:</b> [length(SSfactionwar.marks_camarilla)]"
			. += "<b>Next Mark Cost:</b> [round(length(SSfactionwar.marks_camarilla)/3)] members and [length(SSfactionwar.marks_camarilla)*5] influence"
		if("Anarch")
			. += "<b>Total Influence:</b> [SSfactionwar.anarch_power]"
			if(length(SSfactionwar.anarch_members))
				. += "<b>Total Members:</b> [length(SSfactionwar.anarch_members)]"
			if(length(SSfactionwar.marks_anarch))
				. += "<b>Total Marks:</b> [length(SSfactionwar.marks_anarch)]"
			. += "<b>Next Mark Cost:</b> [round(length(SSfactionwar.marks_anarch)/3)] members and [length(SSfactionwar.marks_anarch)*5] influence"

/obj/structure/faction_map/camarilla
	icon_state = "camarilla_map"
	faction = "Camarilla"

/obj/structure/faction_map/anarch
	icon_state = "anarch_map"
	faction = "Anarch"

/obj/structure/faction_map/attackby(obj/item/I, mob/living/user, params)
	. = ..()
	if(istype(I, /obj/item/stack/dollar))
		var/obj/item/stack/dollar/D = I
		if(faction == "Camarilla")
			SSfactionwar.camarilla_power += D.amount
			qdel(I)
		if(faction == "Anarch")
			SSfactionwar.anarch_power += D.amount
			qdel(I)