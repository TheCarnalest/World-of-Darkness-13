/obj/item/mystic_tome
	name = "mystic tome"
	desc = "The secrets of Abyss Mysticism..."
	icon_state = "mystic"
	icon = 'code/modules/ziggers/items.dmi'
	onflooricon = 'code/modules/ziggers/onfloor.dmi'
	w_class = WEIGHT_CLASS_SMALL
	var/list/rituals = list()

/obj/item/mystic_tome/Initialize()
	. = ..()
	for(var/i in subtypesof(/obj/abyssrune))
		if(i)
			var/obj/abyssrune/R = new i(src)
			rituals |= R

/obj/item/mystic_tome/attack_self(mob/user)
	. = ..()
	for(var/obj/abyssrune/R in rituals)
		if(R)
			if(R.sacrifice)
				var/obj/item/I = new R.sacrifice(src)
				to_chat(user, "[R.mystlevel] [R.name] - [R.desc] Requirements: [I].")
				qdel(I)
			else
				to_chat(user, "[R.mystlevel] [R.name] - [R.desc]")

/obj/abyssrune
	name = "Lasombra Rune"
	desc = "Learn the secrets of the Abyss, neonate..."
	icon = 'code/modules/ziggers/icons.dmi'
	icon_state = "rune1"
	color = rgb(0,0,0)
	anchored = TRUE
	var/word = "IDI NAH"
	var/activator_bonus = 0
	var/activated = FALSE
	var/mob/living/last_activator
	var/mystlevel = 1
	var/sacrifice

/mob/living
	var/mysticism_knowledge = FALSE

/obj/abyssrune/proc/complete()
	return

/obj/abyssrune/attack_hand(mob/user)
	if(!activated)
		var/mob/living/L = user
		if(L.mysticism_knowledge)
			L.say("[word]")
			L.Immobilize(30)
			last_activator = user
			activator_bonus = L.thaum_damage_plus
			if(sacrifice)
				for(var/obj/item/I in get_turf(src))
					if(I)
						if(istype(I, sacrifice))
							qdel(I)
							complete()
			else
				complete()

/obj/abyssrune/AltClick(mob/user)
	..()
	qdel(src)

/obj/abyssrune/selfgib
	name = "Self Destruction"
	desc = "Meet the Final Death."
	icon_state = "rune2"
	word = "YNT FRM MCHGN FYNV DN THS B'FO"

/obj/abyssrune/selfgib/complete()
	last_activator.death()

/obj/abyssrune/identification
	name = "Occult Items Identification"
	desc = "Identificates single occult item"
	icon_state = "rune4"
	word = "WUS'ZAT"

/obj/abyssrune/identification/complete()
	for(var/obj/item/vtm_artifact/VA in loc)
		if(VA)
			VA.identificate()
			playsound(loc, 'sound/magic/voidblink.ogg', 50, FALSE)
			qdel(src)
			return

/obj/abyssrune/teleport
	name = "Teleportation Rune"
	desc = "Move your body among the city streets."
	icon_state = "rune6"
	word = "REH'FLEC"
	mystlevel = 5
	sacrifice = /obj/item/drinkable_bloodpack

/obj/abyssrune/teleport/complete()
	if(!activated)
		activated = TRUE
		color = rgb(255,255,255)
		icon_state = "teleport"

/obj/abyssrune/teleport/attack_hand(mob/user)
	..()
	var/x_dir = 1
	var/y_dir = 1
	if(activated)
		var/x = input(user, "Choose x direction:\n(1-255)", "Teleportation Rune") as num|null
		if(x)
			x_dir = max(min(round(text2num(x)), 255),1)
			var/y = input(user, "Choose y direction:\n(1-255)", "Teleportation Rune") as num|null
			if(y)
				y_dir = max(min(round(text2num(y)), 255),1)
				var/atom/movable/AM = new(user.loc)
				AM.x = x_dir
				AM.y = y_dir
				if(istype(get_area(AM), /area/vtm))
					var/area/vtm/V = get_area(AM)
					if(V.name != "San Francisco")
						playsound(loc, 'sound/magic/voidblink.ogg', 50, FALSE)
						user.forceMove(get_turf(AM))
						qdel(AM)
						qdel(src)
						return
				else
					to_chat(user, "<span class='warning'>There is no available teleportation place by this coordinates!</span>")
					qdel(AM)
