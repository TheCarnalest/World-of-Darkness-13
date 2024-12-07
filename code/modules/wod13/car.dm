GLOBAL_LIST_EMPTY(car_list)
SUBSYSTEM_DEF(carpool)
	name = "Car Pool"
	flags = SS_POST_FIRE_TIMING|SS_NO_INIT|SS_BACKGROUND
	priority = FIRE_PRIORITY_OBJ
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME
	wait = 5

	var/list/currentrun = list()

/datum/controller/subsystem/carpool/stat_entry(msg)
	var/list/activelist = GLOB.car_list
	msg = "CARS:[length(activelist)]"
	return ..()

/datum/controller/subsystem/carpool/fire(resumed = FALSE)

	if (!resumed)
		var/list/activelist = GLOB.car_list
		src.currentrun = activelist.Copy()

	//cache for sanic speed (lists are references anyways)
	var/list/currentrun = src.currentrun

	while(currentrun.len)
		var/obj/vampire_car/CAR = currentrun[currentrun.len]
		--currentrun.len

		if (QDELETED(CAR))
			GLOB.car_list -= CAR
			if(QDELETED(CAR))
				log_world("Found a null in car list!")
			continue

		if(MC_TICK_CHECK)
			return
		CAR.handle_caring()

/obj/item/gas_can
	name = "gas can"
	desc = "Stores gasoline or pure fire death."
	icon_state = "gasoline"
	icon = 'code/modules/wod13/items.dmi'
	onflooricon = 'code/modules/wod13/onfloor.dmi'
	lefthand_file = 'code/modules/wod13/righthand.dmi'
	righthand_file = 'code/modules/wod13/lefthand.dmi'
	w_class = WEIGHT_CLASS_SMALL
	var/stored_gasoline = 0

/obj/item/gas_can/examine(mob/user)
	. = ..()
	. += "<b>Gas</b>: [stored_gasoline]/1000"

/obj/item/gas_can/full
	stored_gasoline = 1000

/obj/item/gas_can/rand

/obj/item/gas_can/rand/Initialize()
	. = ..()
	stored_gasoline = rand(0, 500)

/obj/item/gas_can/afterattack(atom/A, mob/user, proximity)
	. = ..()
	if(istype(get_turf(A), /turf/open/floor) && !istype(A, /obj/vampire_car) && !istype(A, /obj/structure/fuelstation) && !istype(A, /mob/living/carbon/human))
		var/obj/effect/decal/cleanable/gasoline/G = locate() in get_turf(A)
		if(G)
			return
		if(!proximity)
			return
		if(stored_gasoline < 50)
			return
		stored_gasoline = max(0, stored_gasoline-50)
		new /obj/effect/decal/cleanable/gasoline(get_turf(A))
		playsound(get_turf(src), 'code/modules/wod13/sounds/gas_splat.ogg', 50, TRUE)
	if(istype(A, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = A
		if(!proximity)
			return
		if(stored_gasoline < 50)
			return
		stored_gasoline = max(0, stored_gasoline-50)
		H.fire_stacks = min(10, H.fire_stacks+10)
		playsound(get_turf(H), 'code/modules/wod13/sounds/gas_splat.ogg', 50, TRUE)
		user.visible_message("<span class='warning'>[user] covers [A] in something flammable!</span>")


/obj/vampire_car/attack_hand(mob/user)
	. = ..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.a_intent == INTENT_HARM && H.potential >= 4)
			var/atom/throw_target = get_edge_target_turf(src, user.dir)
			playsound(get_turf(src), 'code/modules/wod13/sounds/bump.ogg', 100, FALSE)
			get_damage(10)
			throw_at(throw_target, rand(4, 6), 4, user)

/obj/vampire_car
	name = "car"
	desc = "Take me home, country roads..."
	icon_state = "2"
	icon = 'code/modules/wod13/cars.dmi'
	anchored = TRUE
	plane = GAME_PLANE
	layer = CAR_LAYER
	density = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	throwforce = 150

	var/last_vzhzh = 0

	var/image/Fari
	var/fari_on = FALSE

	var/mob/living/driver
	var/list/passengers = list()
	var/max_passengers = 3

	var/speed = 1	//Future
	var/stage = 1
	var/on = FALSE
	var/locked = TRUE
	var/access = "none"

	var/health = 100
	var/maxhealth = 100
	var/repairing = FALSE

	var/last_beep = 0

	var/component_type = /datum/component/storage/concrete/vtm/car
	var/baggage_limit = 40
	var/baggage_max = WEIGHT_CLASS_BULKY

	var/exploded = FALSE
	var/beep_sound = 'code/modules/wod13/sounds/beep.ogg'

	var/gas = 1000

/obj/vampire_car/ComponentInitialize()
	. = ..()
	AddComponent(component_type)
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_combined_w_class = 100
	STR.max_w_class = baggage_max
	STR.max_items = baggage_limit
	STR.locked = TRUE

/obj/vampire_car/bullet_act(obj/projectile/P, def_zone, piercing_hit = FALSE)
	. = ..()
	get_damage(5)
	for(var/mob/living/L in src)
		if(prob(50))
			L.apply_damage(P.damage, P.damage_type, pick(BODY_ZONE_HEAD, BODY_ZONE_CHEST))

/obj/vampire_car/AltClick(mob/user)
	..()
	if(!repairing)
		if(locked)
			to_chat(user, "<span class='warning'>[src] is locked!</span>")
			return
		repairing = TRUE
		if(do_mob(user, src, 10 SECONDS))
			if(driver)
				var/datum/action/carr/exit_car/C = locate() in driver.actions
				to_chat(user, "<span class='notice'>You've managed to get [driver] out of [src].</span>")
				if(C)
					C.Trigger()
				repairing = FALSE
				return
			else if(length(passengers))
				var/mob/living/L = pick(passengers)
				to_chat(user, "<span class='notice'>You've managed to get [L] out of [src].</span>")
				var/datum/action/carr/exit_car/C = locate() in L.actions
				if(C)
					C.Trigger()
				repairing = FALSE
				return
			else
				to_chat(user, "<span class='warning'>There is no one in [src].</span>")
				repairing = FALSE
				return
		else
			to_chat(user, "<span class='warning'>You've failed to get anyone out of [src].</span>")
			repairing = FALSE
			return

/obj/vampire_car/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/gas_can))
		var/obj/item/gas_can/G = I
		if(G.stored_gasoline && gas < 1000 && isturf(user.loc))
			var/gas_to_transfer = min(1000-gas, min(100, max(1, G.stored_gasoline)))
			G.stored_gasoline = max(0, G.stored_gasoline-gas_to_transfer)
			gas = min(1000, gas+gas_to_transfer)
			playsound(loc, 'code/modules/wod13/sounds/gas_fill.ogg', 25, TRUE)
			to_chat(user, "<span class='notice'>You transfer [gas_to_transfer] fuel to [src].</span>")
		return
	if(istype(I, /obj/item/vamp/keys))
		var/obj/item/vamp/keys/K = I
		if(istype(I, /obj/item/vamp/keys/hack))
			if(!repairing)
				repairing = TRUE
				if(do_mob(user, src, 20 SECONDS))
					var/roll = rand(1, 20) + (user.lockpicking+user.dexterity) - 8
					if (roll <= 1)
						to_chat(user, "<span class='warning'>Your lockpick broke!</span>")
						qdel(K)
						repairing = FALSE
					if (roll >= 10)
						locked = FALSE
						repairing = FALSE
						to_chat(user, "<span class='notice'>You've managed to open [src]'s lock.</span>")
						playsound(src, 'code/modules/wod13/sounds/open.ogg', 50, TRUE)
					if(initial(access) == "none")
						if(ishuman(user))
							var/mob/living/carbon/human/H = user
							H.AdjustHumanity(-1, 6)
						return
					else
						to_chat(user, "<span class='warning'>You've failed to open [src]'s lock.</span>")
						playsound(src, 'code/modules/wod13/sounds/signal.ogg', 50, FALSE)
						for(var/mob/living/carbon/human/npc/police/P in oviewers(7, src))
							if(P)
								P.Aggro(user)
						repairing = FALSE
						return
				else
					to_chat(user, "<span class='warning'>You've failed to open [src]'s lock.</span>")
					repairing = FALSE
					return
			return
		if(K.accesslocks)
			for(var/i in K.accesslocks)
				if(i == access)
					to_chat(user, "<span class='notice'>You [locked ? "open" : "close"] [src]'s lock.</span>")
					playsound(src, 'code/modules/wod13/sounds/open.ogg', 50, TRUE)
					locked = !locked
					return
		return
	if(istype(I, /obj/item/melee/vampirearms/tire))
		if(!repairing)
			repairing = TRUE
			if(do_mob(user, src, 5 SECONDS))
				get_damage(-20)
				playsound(src, 'code/modules/wod13/sounds/repair.ogg', 50, TRUE)
				to_chat(user, "<span class='notice'>You repair some dents on [src].</span>")
				repairing = FALSE
				return
			else
				to_chat(user, "<span class='warning'>You failed to repair [src].</span>")
				repairing = FALSE
				return
		return

	else
		if(I.force)
			get_damage(round(I.force/2))
			for(var/mob/living/L in src)
				if(prob(50))
					L.apply_damage(round(I.force/2), I.damtype, pick(BODY_ZONE_HEAD, BODY_ZONE_CHEST))

			if(!driver && !length(passengers) && last_beep+70 < world.time && locked)
				last_beep = world.time
				playsound(src, 'code/modules/wod13/sounds/signal.ogg', 50, FALSE)
				for(var/mob/living/carbon/human/npc/police/P in oviewers(7, src))
					P.Aggro(user)

			if(prob(10) && locked)
				playsound(src, 'code/modules/wod13/sounds/open.ogg', 50, TRUE)
				locked = FALSE

	..()

/obj/vampire_car/Destroy()
	GLOB.car_list -= src
	. = ..()
	for(var/mob/living/L in src)
		L.forceMove(loc)
		var/datum/action/carr/exit_car/E = locate() in L.actions
		if(E)
			qdel(E)
		var/datum/action/carr/fari_vrubi/F = locate() in L.actions
		if(F)
			qdel(F)
		var/datum/action/carr/engine/N = locate() in L.actions
		if(N)
			qdel(N)
		var/datum/action/carr/stage/S = locate() in L.actions
		if(S)
			qdel(S)
		var/datum/action/carr/beep/B = locate() in L.actions
		if(B)
			qdel(B)
		var/datum/action/carr/baggage/G = locate() in L.actions
		if(G)
			qdel(G)

/obj/vampire_car/examine(mob/user)
	. = ..()
	if(user.loc == src)
		. += "<b>Gas</b>: [gas]/1000"
	if(health < maxhealth && health >= maxhealth-(maxhealth/4))
		. += "It's slightly dented..."
	if(health < maxhealth-(maxhealth/4) && health >= maxhealth/2)
		. += "It has some major dents..."
	if(health < maxhealth/2 && health >= maxhealth/4)
		. += "It's heavily damaged..."
	if(health < maxhealth/4)
		. += "<span class='warning'>It appears to be falling apart...</span>"
	if(locked)
		. += "<span class='warning'>It's locked.</span>"
	for(var/mob/living/L in src)
		. += "<span class='notice'>You see [L] inside.</span>"

/obj/vampire_car/proc/get_damage(var/cost)
	if(cost > 0)
		health = max(0, health-cost)
	if(cost < 0)
		health = min(maxhealth, health-cost)

	if(health == 0)
		on = FALSE
		set_light(0)
		color = "#919191"
		if(!exploded && prob(10))
			exploded = TRUE
			for(var/mob/living/L in src)
				L.forceMove(loc)
				var/datum/action/carr/exit_car/E = locate() in L.actions
				if(E)
					qdel(E)
				var/datum/action/carr/fari_vrubi/F = locate() in L.actions
				if(F)
					qdel(F)
				var/datum/action/carr/engine/N = locate() in L.actions
				if(N)
					qdel(N)
				var/datum/action/carr/stage/S = locate() in L.actions
				if(S)
					qdel(S)
				var/datum/action/carr/beep/B = locate() in L.actions
				if(B)
					qdel(B)
				var/datum/action/carr/baggage/G = locate() in L.actions
				if(G)
					qdel(G)
			explosion(loc,0,1,3,4)
			GLOB.car_list -= src
	else if(prob(50) && health <= maxhealth/2)
		on = FALSE
		set_light(0)
	return

/datum/action/carr/fari_vrubi
	name = "Toggle Light"
	desc = "Toggle light on/off."
	button_icon_state = "lights"

/datum/action/carr/fari_vrubi/Trigger()
	if(istype(owner.loc, /obj/vampire_car))
		var/obj/vampire_car/V = owner.loc
		if(!V.fari_on)
			V.fari_on = TRUE
			V.add_overlay(V.Fari)
			to_chat(owner, "<span class='notice'>You toggle [V]'s lights.</span>")
			playsound(V, 'sound/weapons/magin.ogg', 40, TRUE)
		else
			V.fari_on = FALSE
			V.cut_overlay(V.Fari)
			to_chat(owner, "<span class='notice'>You toggle [V]'s lights.</span>")
			playsound(V, 'sound/weapons/magout.ogg', 40, TRUE)

/datum/action/carr/beep
	name = "Signal"
	desc = "Beep-beep."
	button_icon_state = "beep"

/datum/action/carr/beep/Trigger()
	if(istype(owner.loc, /obj/vampire_car))
		var/obj/vampire_car/V = owner.loc
		if(V.last_beep+10 < world.time)
			V.last_beep = world.time
			playsound(V.loc, V.beep_sound, 60, FALSE)

/datum/action/carr/stage
	name = "Toggle Transmission"
	desc = "Toggle transmission to 1, 2 or 3."
	button_icon_state = "stage"

/datum/action/carr/stage/Trigger()
	if(istype(owner.loc, /obj/vampire_car))
		var/obj/vampire_car/V = owner.loc
		if(V.stage < 3)
			V.stage = V.stage+1
		else
			V.stage = 1
		to_chat(owner, "<span class='notice'>You enable [V]'s transmission at [V.stage].</span>")

/datum/action/carr/baggage
	name = "Lock Baggage"
	desc = "Lock/Unlock Baggage."
	button_icon_state = "baggage"

/datum/action/carr/baggage/Trigger()
	if(istype(owner.loc, /obj/vampire_car))
		var/obj/vampire_car/V = owner.loc
		var/datum/component/storage/STR = V.GetComponent(/datum/component/storage)
		STR.locked = !STR.locked
		playsound(V, 'code/modules/wod13/sounds/door.ogg', 50, TRUE)
		if(STR.locked)
			to_chat(owner, "<span class='notice'>You lock [V]'s baggage.</span>")
		else
			to_chat(owner, "<span class='notice'>You unlock [V]'s baggage.</span>")

/datum/action/carr/engine
	name = "Toggle Engine"
	desc = "Toggle engine on/off."
	button_icon_state = "keys"

/datum/action/carr/engine/Trigger()
	if(istype(owner.loc, /obj/vampire_car))
		var/obj/vampire_car/V = owner.loc
		if(!V.on)
			if(V.health == V.maxhealth)
				V.on = TRUE
				playsound(V, 'code/modules/wod13/sounds/start.ogg', 50, TRUE)
				to_chat(owner, "<span class='notice'>You managed to start [V]'s engine.</span>")
				return
			if(prob(100*(V.health/V.maxhealth)))
				V.on = TRUE
				playsound(V, 'code/modules/wod13/sounds/start.ogg', 50, TRUE)
				to_chat(owner, "<span class='notice'>You managed to start [V]'s engine.</span>")
				return
			else
				to_chat(owner, "<span class='warning'>You failed to start [V]'s engine.</span>")
				return
		else
			V.on = FALSE
			playsound(V, 'code/modules/wod13/sounds/stop.ogg', 50, TRUE)
			to_chat(owner, "<span class='notice'>You stop [V]'s engine.</span>")
			V.set_light(0)
			return

/datum/action/carr/exit_car
	name = "Exit"
	desc = "Exit the vehicle."
	button_icon_state = "exit"

/datum/action/carr/exit_car/Trigger()
	if(istype(owner.loc, /obj/vampire_car))
		var/obj/vampire_car/V = owner.loc
		if(V.driver == owner)
			V.driver = null
		if(owner in V.passengers)
			V.passengers -= owner
		owner.forceMove(V.loc)
		for(var/datum/action/carr/C in owner.actions)
			qdel(C)
		to_chat(owner, "<span class='notice'>You exit [V].</span>")
		if(owner)
			if(owner.client)
				owner.client.pixel_x = 0
				owner.client.pixel_y = 0
		playsound(V, 'code/modules/wod13/sounds/door.ogg', 50, TRUE)

/mob/living/carbon/human/MouseDrop(atom/over_object)
	. = ..()
	if(istype(over_object, /obj/vampire_car))
		if(get_dist(src, over_object) < 2)
			var/obj/vampire_car/V = over_object
			if(!V.locked)
				if(!V.driver)
					forceMove(over_object)
					V.driver = src
					var/datum/action/carr/exit_car/E = new()
					E.Grant(src)
					var/datum/action/carr/fari_vrubi/F = new()
					F.Grant(src)
					var/datum/action/carr/engine/N = new()
					N.Grant(src)
					var/datum/action/carr/stage/S = new()
					S.Grant(src)
					var/datum/action/carr/beep/B = new()
					B.Grant(src)
					var/datum/action/carr/baggage/G = new()
					G.Grant(src)
				else if(length(V.passengers) < V.max_passengers)
					forceMove(over_object)
					V.passengers += src
					var/datum/action/carr/exit_car/E = new()
					E.Grant(src)
				to_chat(src, "<span class='notice'>You enter [V].</span>")
				playsound(V, 'code/modules/wod13/sounds/door.ogg', 50, TRUE)
				return
			else
				to_chat(src, "<span class='warning'>[V] is locked.</span>")
				return

/obj/vampire_car/Bump(atom/A)
	if(!A)
		return
	var/prev_speed = round(abs(speed_in_pixels)/8)
	if(!prev_speed)
		return
	speed_in_pixels = 0
	last_pos["x_pix"] = 0
	last_pos["y_pix"] = 0
	for(var/mob/living/L in src)
		if(L)
			if(L.client)
				L.client.pixel_x = 0
				L.client.pixel_y = 0
	if(driver)
		if(istype(A, /mob/living/carbon/human/npc))
			var/mob/living/carbon/human/npc/NPC = A
			NPC.Aggro(driver, TRUE)
	playsound(src, 'code/modules/wod13/sounds/bump.ogg', 50, TRUE)
	if(istype(A, /mob/living))
		var/mob/living/L = A
		var/dam2 = prev_speed
		if(!HAS_TRAIT(L, TRAIT_TOUGH_FLESH))
			L.Knockdown(10)
			dam2 = dam2*2
		L.apply_damage(dam2, BRUTE, BODY_ZONE_CHEST)
		var/dam = prev_speed
		if(driver)
			if(HAS_TRAIT(driver, TRAIT_EXP_DRIVER))
				dam = round(dam/2)
		get_damage(dam)
	else
		var/dam = prev_speed
		if(driver)
			if(HAS_TRAIT(driver, TRAIT_EXP_DRIVER))
				dam = round(dam/2)
			driver.apply_damage(prev_speed, BRUTE, BODY_ZONE_CHEST)
		get_damage(dam)
	return

/obj/vampire_car/retro
	icon_state = "1"
	max_passengers = 1
	dir = WEST

/obj/vampire_car/retro/rand
	icon_state = "3"

/obj/vampire_car/retro/rand/Initialize()
	icon_state = "[pick(1, 3, 5)]"
	if(access == "none")
		access = "npc[rand(1, 20)]"
	..()

/obj/vampire_car/rand
	icon_state = "4"
	dir = WEST

/obj/vampire_car/rand/Initialize()
	icon_state = "[pick(2, 4, 6)]"
	if(access == "none")
		access = "npc[rand(1, 20)]"
	..()

/obj/vampire_car/rand/camarilla
	access = "camarilla"
	icon_state = "6"

/obj/vampire_car/retro/rand/camarilla
	access = "camarilla"
	icon_state = "5"

/obj/vampire_car/rand/anarch
	access = "anarch"
	icon_state = "6"

/obj/vampire_car/retro/rand/anarch
	access = "anarch"
	icon_state = "5"

/obj/vampire_car/rand/clinic
	access = "clinic"
	icon_state = "6"

/obj/vampire_car/retro/rand/clinic
	access = "clinic"
	icon_state = "5"

/obj/vampire_car/police
	icon_state = "police"
	max_passengers = 3
	dir = WEST
	beep_sound = 'code/modules/wod13/sounds/migalka.ogg'
	access = "police"
	baggage_limit = 45
	baggage_max = WEIGHT_CLASS_BULKY
	var/color_blue = FALSE
	var/last_color_change = 0

/obj/vampire_car/police/handle_caring()
	if(fari_on)
		if(last_color_change+10 <= world.time)
			last_color_change = world.time
			if(color_blue)
				color_blue = FALSE
				set_light(0)
				set_light(4, 6, "#ff0000")
			else
				color_blue = TRUE
				set_light(0)
				set_light(4, 6, "#0000ff")
	else
		if(last_color_change+10 <= world.time)
			last_color_change = world.time
			set_light(0)
	..()

/obj/vampire_car/taxi
	icon_state = "taxi"
	max_passengers = 3
	dir = WEST
	access = "taxi"
	baggage_limit = 40
	baggage_max = WEIGHT_CLASS_BULKY

/obj/vampire_car/track
	icon_state = "track"
	max_passengers = 6
	dir = WEST
	access = "none"
	baggage_limit = 100
	baggage_max = WEIGHT_CLASS_BULKY

/obj/vampire_car/track/Initialize()
	if(access == "none")
		access = "npc[rand(1, 20)]"
	..()

/obj/vampire_car/track/volkswagen
	icon_state = "volkswagen"
	baggage_limit = 60

/obj/vampire_car/track/ambulance
	icon_state = "ambulance"
	access = "clinic"
	baggage_limit = 60

/proc/get_dist_in_pixels(var/pixel_starts_x, var/pixel_starts_y, var/pixel_ends_x, var/pixel_ends_y)
	var/total_x = abs(pixel_starts_x-pixel_ends_x)
	var/total_y = abs(pixel_starts_y-pixel_ends_y)
	return round(sqrt(total_x*total_x + total_y*total_y))

/proc/get_angle_raw(start_x, start_y, start_pixel_x, start_pixel_y, end_x, end_y, end_pixel_x, end_pixel_y)
	var/dy = (world.icon_size * end_y + end_pixel_y) - (world.icon_size * start_y + start_pixel_y)
	var/dx = (world.icon_size * end_x + end_pixel_x) - (world.icon_size * start_x + start_pixel_x)
	if(!dy)
		return (dx >= 0) ? 90 : 270
	. = arctan(dx/dy)
	if(dy < 0)
		. += 180
	else if(dx < 0)
		. += 360

/proc/get_angle_diff(var/angle_a, var/angle_b)
	return ((angle_b - angle_a) + 180) % 360 - 180;

/obj/vampire_car
	var/movement_vector = 0		//0-359 degrees
	var/speed_in_pixels = 0		// 16 pixels (turf is 2x2m) = 1 meter per 1 SECOND (process fire). Minus equals to reverse, max should be 444
	var/last_pos = list("x" = 0, "y" = 0, "x_pix" = 0, "y_pix" = 0)
	var/impact_delay = 0
	glide_size = 96

/obj/vampire_car/Initialize()
	. = ..()
	Fari = new (src)
	Fari.icon = 'icons/effects/light_overlays/light_cone_car.dmi'
	Fari.icon_state = "light"
	Fari.pixel_x = -64
	Fari.pixel_y = -64
	Fari.layer = O_LIGHTING_VISUAL_LAYER
	Fari.plane = O_LIGHTING_VISUAL_PLANE
	Fari.appearance_flags = RESET_COLOR | RESET_ALPHA | RESET_TRANSFORM
	Fari.mouse_opacity = MOUSE_OPACITY_TRANSPARENT
//	Fari.vis_flags = NONE
	Fari.alpha = 110
	gas = rand(100, 1000)
	GLOB.car_list += src
	last_pos["x"] = x
	last_pos["y"] = y
//	last_pos["x_pix"] = 32
//	last_pos["y_pix"] = 32
	switch(dir)
		if(SOUTH)
			movement_vector = 180
		if(EAST)
			movement_vector = 90
		if(WEST)
			movement_vector = 270
	add_overlay(image(icon = src.icon, icon_state = src.icon_state, pixel_x = -32, pixel_y = -32))
	icon_state = "empty"

/turf
	var/list/unpassable = list()

/turf/Initialize()
	. = ..()
	if(density)
		unpassable += src

/atom/movable/Initialize()
	. = ..()
	if(density && !isitem(src))
		if(isturf(get_turf(src)))
			var/turf/T = get_turf(src)
			T.unpassable += src

/atom/movable/Destroy()
	var/turf/T = get_turf(src)
	if(T)
		T.unpassable -= src
	. = ..()

/turf/Exited(atom/movable/AM, atom/newLoc)
	. = ..()
	unpassable -= AM
	if(AM.density && !isitem(AM))
		if(isturf(newLoc))
			var/turf/T = newLoc
			T.unpassable += AM

/mob/living/death(gibbed)
	. = ..()
	var/turf/T = get_turf(src)
	if(T)
		T.unpassable -= src

/obj/vampire_car/setDir(newdir)
	. = ..()
	apply_vector_angle()

/obj/vampire_car/Moved(atom/OldLoc, Dir)
	. = ..()
	last_pos["x"] = x
	last_pos["y"] = y

/obj/vampire_car/proc/handle_caring()
	var/used_vector = movement_vector
	var/used_speed = speed_in_pixels
	if(gas <= 0)
		on = FALSE
		set_light(0)
		if(driver)
			to_chat(driver, "<span class='warning'>No fuel in the tank!</span>")
	if(on)
		if(last_vzhzh+10 < world.time)
			playsound(src, 'code/modules/wod13/sounds/work.ogg', 25, FALSE)
			last_vzhzh = world.time
	forceMove(locate(last_pos["x"], last_pos["y"], z))
	pixel_x = last_pos["x_pix"]
	pixel_y = last_pos["y_pix"]
	var/moved_x = round(sin(used_vector)*used_speed)
	var/moved_y = round(cos(used_vector)*used_speed)
	if(used_speed != 0)
		var/true_movement_angle = used_vector
		var/true_speed = get_dist_in_pixels(0, 0, moved_x, moved_y)
		if(used_speed < 0)
			true_movement_angle = SIMPLIFY_DEGREES(used_vector+180)
		var/turf/check_turf = get_turf_in_angle(true_movement_angle, get_turf(src), 15)
		var/list/the_line = get_line(src, check_turf)
		var/turf/hit_turf
		for(var/turf/T in the_line)
			if(T)
				var/dist_to_hit = get_dist_in_pixels(last_pos["x"]*32+last_pos["x_pix"], last_pos["y"]*32+last_pos["y_pix"], T.x*32, T.y*32)
				if(dist_to_hit <= true_speed)
					var/list/stuff = T.unpassable.Copy()
					stuff -= src
					if(length(stuff))
						if(!hit_turf || dist_to_hit < get_dist_in_pixels(last_pos["x"]*32+last_pos["x_pix"], last_pos["y"]*32+last_pos["y_pix"], hit_turf.x*32, hit_turf.y*32))
							hit_turf = T
		if(hit_turf)
			Bump(pick(hit_turf.unpassable))
			impact_delay = world.time
//			to_chat(world, "I can't pass that [hit_turf] at [hit_turf.x] x [hit_turf.y] cause of [pick(hit_turf.unpassable)] FUCK")
//			var/bearing = get_angle_raw(x, y, pixel_x, pixel_y, hit_turf.x, hit_turf.y, 0, 0)
			var/actual_distance = get_dist_in_pixels(last_pos["x"]*32+last_pos["x_pix"], last_pos["y"]*32+last_pos["y_pix"], hit_turf.x*32, hit_turf.y*32)-32
			moved_x = round(sin(true_movement_angle)*actual_distance)
			moved_y = round(cos(true_movement_angle)*actual_distance)
			if(last_pos["x"]*32+last_pos["x_pix"] > hit_turf.x*32)
				moved_x = max((hit_turf.x*32+32)-(last_pos["x"]*32+last_pos["x_pix"]), moved_x)
			if(last_pos["x"]*32+last_pos["x_pix"] < hit_turf.x*32)
				moved_x = min((hit_turf.x*32-32)-(last_pos["x"]*32+last_pos["x_pix"]), moved_x)
			if(last_pos["y"]*32+last_pos["y_pix"] > hit_turf.y*32)
				moved_y = max((hit_turf.y*32+32)-(last_pos["y"]*32+last_pos["y_pix"]), moved_y)
			if(last_pos["y"]*32+last_pos["y_pix"] < hit_turf.y*32)
				moved_y = min((hit_turf.y*32-32)-(last_pos["y"]*32+last_pos["y_pix"]), moved_y)
			speed_in_pixels = 0
	var/turf/west_turf = get_step(src, WEST)
	if(length(west_turf.unpassable))
		moved_x = max(-8-last_pos["x_pix"], moved_x)
	var/turf/east_turf = get_step(src, EAST)
	if(length(east_turf.unpassable))
		moved_x = min(8-last_pos["x_pix"], moved_x)
	var/turf/north_turf = get_step(src, NORTH)
	if(length(north_turf.unpassable))
		moved_y = min(8-last_pos["y_pix"], moved_y)
	var/turf/south_turf = get_step(src, SOUTH)
	if(length(south_turf.unpassable))
		moved_y = max(-8-last_pos["y_pix"], moved_y)
	for(var/mob/living/L in src)
		if(L)
			if(L.client)
				L.client.pixel_x = last_pos["x_pix"]
				L.client.pixel_y = last_pos["y_pix"]
				animate(L.client, pixel_x = last_pos["x_pix"]+moved_x, pixel_y = last_pos["y_pix"]+moved_y, SScarpool.wait, 1)
	animate(src, pixel_x = last_pos["x_pix"]+moved_x, pixel_y = last_pos["y_pix"]+moved_y, SScarpool.wait, 1)
	last_pos["x_pix"] = last_pos["x_pix"]+moved_x
	last_pos["y_pix"] = last_pos["y_pix"]+moved_y
	var/new_x = last_pos["x"]
	var/new_y = last_pos["y"]
	while(last_pos["x_pix"] > 16)
		last_pos["x_pix"] -= 32
		new_x++
	while(last_pos["x_pix"] < -16)
		last_pos["x_pix"] += 32
		new_x--
	while(last_pos["y_pix"] > 16)
		last_pos["y_pix"] -= 32
		new_y++
	while(last_pos["y_pix"] < -16)
		last_pos["y_pix"] += 32
		new_y--
	last_pos["x"] = clamp(new_x, 1, world.maxx)
	last_pos["y"] = clamp(new_y, 1, world.maxx)		//since the map is 255x255

/obj/vampire_car/relaymove(mob, direct)
	if(world.time-impact_delay < 20)
		return
	if(istype(mob, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = mob
		if(H.stat >= UNCONSCIOUS)
			return
		if(H.IsSleeping())
			return
		if(H.IsUnconscious())
			return
		if(H.IsParalyzed())
			return
		if(H.IsKnockdown())
			return
		if(H.IsStun())
			return
		if(HAS_TRAIT(H, TRAIT_RESTRAINED))
			return
	switch(direct)
		if(NORTH)
			controlling(1, 0)
		if(NORTHEAST)
			controlling(1, 3)
		if(NORTHWEST)
			controlling(1, -3)
		if(SOUTH)
			controlling(-1, 0)
		if(SOUTHEAST)
			controlling(-1, 3)
		if(SOUTHWEST)
			controlling(-1, -3)
		if(EAST)
			controlling(0, 3)
		if(WEST)
			controlling(0, -3)

/obj/vampire_car/proc/controlling(var/adjusting_speed, var/adjusting_turn)
	var/drift = 1
	if(driver)
		if(HAS_TRAIT(driver, TRAIT_EXP_DRIVER))
			drift = 2
	var/adjust_true = adjusting_turn
	if(speed_in_pixels < 0)
		adjust_true = -adjusting_turn
	if(speed_in_pixels != 0)
		movement_vector = SIMPLIFY_DEGREES(movement_vector+adjust_true)
		apply_vector_angle()
	if(adjusting_speed)
		if(on)
			if(adjusting_speed > 0 && speed_in_pixels <= 0)
				playsound(src, 'code/modules/wod13/sounds/stopping.ogg', 10, FALSE)
				speed_in_pixels = speed_in_pixels+adjusting_speed*3
				movement_vector = SIMPLIFY_DEGREES(movement_vector+adjust_true*drift)
			else if(adjusting_speed < 0 && speed_in_pixels > 0)
				playsound(src, 'code/modules/wod13/sounds/stopping.ogg', 10, FALSE)
				speed_in_pixels = speed_in_pixels+adjusting_speed*3
				movement_vector = SIMPLIFY_DEGREES(movement_vector+adjust_true*drift)
			else
				speed_in_pixels = min(stage*64, max(-stage*64, speed_in_pixels+adjusting_speed*stage))
				playsound(src, 'code/modules/wod13/sounds/drive.ogg', 10, FALSE)
		else
			if(adjusting_speed > 0 && speed_in_pixels < 0)
				playsound(src, 'code/modules/wod13/sounds/stopping.ogg', 10, FALSE)
				speed_in_pixels = min(0, speed_in_pixels+adjusting_speed*3)
				movement_vector = SIMPLIFY_DEGREES(movement_vector+adjust_true*drift)
			else if(adjusting_speed < 0 && speed_in_pixels > 0)
				playsound(src, 'code/modules/wod13/sounds/stopping.ogg', 10, FALSE)
				speed_in_pixels = max(0, speed_in_pixels+adjusting_speed*3)
				movement_vector = SIMPLIFY_DEGREES(movement_vector+adjust_true*drift)

/obj/vampire_car/proc/apply_vector_angle()
	var/minus_angle = 0
	switch(movement_vector)
		if(338 to 359)
			dir = NORTH
		if(0 to 22)
			dir = NORTH
		if(23 to 67)
			dir = NORTHEAST
			minus_angle = 45
		if(68 to 112)
			dir = EAST
			minus_angle = 90
		if(113 to 157)
			dir = SOUTHEAST
			minus_angle = 135
		if(158 to 202)
			dir = SOUTH
			minus_angle = 180
		if(203 to 247)
			dir = SOUTHWEST
			minus_angle = 225
		if(248 to 292)
			dir = WEST
			minus_angle = 270
		if(293 to 337)
			dir = NORTHWEST
			minus_angle = 315
	var/matrix/M = matrix()
	M.Turn(SIMPLIFY_DEGREES(movement_vector-minus_angle))
	transform = M
