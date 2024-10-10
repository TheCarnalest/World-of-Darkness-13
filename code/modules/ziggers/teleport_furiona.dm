/obj/item/staff/furion
	name = "Teleportation staff"
	desc = "The Prophet keeps his sentinel over the forest, protecting it when in need."
	icon_state = "bostaff0"
/obj/item/staff/furion/attack_self(mob/user)
	. = ..()
	var/selected_area = input(user, "Choose a area", "Teleportation") as anything in GLOB.sortedAreas
	if(!selected_area)
		return
	var/list/turfs = list()
	for(var/turf/T in selected_area)
		if(T.density)
			continue
		turfs.Add(T)

	if(length(turfs))
		var/turf/T = pick(turfs)
		usr.forceMove(T)
	else
		to_chat(src, "Nowhere to jump to!", confidential = TRUE)
		return


































/atom

/turf
/object
/mob
/area


/datum/discipline
	var/name = "Otrezat huy"
	var/desc = "Otrezaet huy"
	var/sound = 'sound/huy.ogg'

/atom/hud/disciplina
	icon = 'icon/huy.dmi'
	position = NORTH:1|SOUTH:1

/atom/hud/OnClick(client/C)
	kill.nigger()

/atom/hud/disciplina/OnClick(client/C)
	. = ..()
	playsound(C.loc, 'sound/hallucinations/huy.ogg', 100, FALSE)
	killniger(C)

/atom
	var/huy

/atom/proc/killnigger(var/mob/nigger)
	nigger.health = 0