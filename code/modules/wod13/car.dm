#define TURNLEFT 0
#define NOTURN 1
#define TURNRIGHT 2

#define BACKWARDS 0
#define AHEAD 1

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
	density = TRUE
	plane = GAME_PLANE
	layer = CAR_LAYER
	pixel_w = -32
	pixel_z = -32
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	throwforce = 150

	var/last_vzhzh = 0

	var/obj/effect/fari/FARI
	var/fari_on = FALSE

	var/mob/living/driver
	var/list/passengers = list()
	var/max_passengers = 3

	var/speed = 1	//Future
	var/stage = 1
	var/last_speeded = 0
	var/turning = NOTURN
	var/driving = AHEAD
	var/facing_dir = SOUTH
	var/moving_dir = SOUTH
	var/last_dir = SOUTH
	var/turf_crossed = 0	//For turning
	var/on = FALSE
	var/locked = TRUE
	var/access = "none"

	var/health = 100
	var/maxhealth = 100
	var/repairing = FALSE

	var/last_beep = 0

	var/component_type = /datum/component/storage/concrete
	var/baggage_limit = 30
	var/baggage_max = WEIGHT_CLASS_BULKY

	var/exploded = FALSE
	var/beep_sound = 'code/modules/wod13/sounds/beep.ogg'

	var/gas = 1000

/obj/vampire_car/ComponentInitialize()
	. = ..()
	AddComponent(component_type)
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_combined_w_class = baggage_limit
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

/obj/vampire_car/Initialize()
	. = ..()
	gas = rand(100, 1000)
	FARI = new(src)
	FARI.forceMove(get_step(src, facing_dir))
	FARI.anchored = TRUE

/obj/vampire_car/Destroy()
	. = ..()
	qdel(FARI)
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

/obj/vampire_car/process(delta_time)
	if(gas <= 0)
		on = FALSE
		STOP_PROCESSING(SSobj, src)
		set_light(0)
		if(driver)
			to_chat(driver, "<span class='warning'>No fuel in the tank!</span>")
	if(last_speeded+15 < world.time)
		speed = 0
	if(last_vzhzh+10 < world.time)
		playsound(src, 'code/modules/wod13/sounds/work.ogg', 25, FALSE)
		last_vzhzh = world.time
		if(turning != NOTURN)
			playsound(src, 'code/modules/wod13/sounds/povorotnik.ogg', 50, FALSE)

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
		STOP_PROCESSING(SSobj, src)
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
	else if(prob(50) && health <= maxhealth/2)
		on = FALSE
		STOP_PROCESSING(SSobj, src)
		set_light(0)
	return

/datum/action/carr/fari_vrubi
	name = "Toggle Light"
	desc = "Toggle light on/off."
	button_icon_state = "lights"

/datum/action/carr/fari_vrubi/Trigger()
	if(istype(owner.loc, /obj/vampire_car))
		var/obj/vampire_car/V = owner.loc
		if(V.FARI)
			if(!V.fari_on)
				V.fari_on = TRUE
				V.FARI.set_light(6, 4)
				to_chat(owner, "<span class='notice'>You toggle [V]'s lights.</span>")
				playsound(V, 'sound/weapons/magin.ogg', 40, TRUE)
			else
				V.fari_on = FALSE
				V.FARI.set_light(0)
				V.set_light(0)
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
				START_PROCESSING(SSobj, V)
				return
			if(prob(100*(V.health/V.maxhealth)))
				V.on = TRUE
				playsound(V, 'code/modules/wod13/sounds/start.ogg', 50, TRUE)
				to_chat(owner, "<span class='notice'>You managed to start [V]'s engine.</span>")
				START_PROCESSING(SSobj, V)
				return
			else
				to_chat(owner, "<span class='warning'>You failed to start [V]'s engine.</span>")
				return
		else
			V.on = FALSE
			playsound(V, 'code/modules/wod13/sounds/stop.ogg', 50, TRUE)
			to_chat(owner, "<span class='notice'>You stop [V]'s engine.</span>")
			STOP_PROCESSING(SSobj, V)
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

/obj/vampire_car/relaymove(mob, direct)
	if(!on)
		return
	if(istype(mob, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = mob
		if(H.stat >= 2)
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
			driving = AHEAD
			turning = NOTURN
		if(NORTHEAST)
			driving = AHEAD
			turning = TURNLEFT
		if(NORTHWEST)
			driving = AHEAD
			turning = TURNRIGHT
		if(SOUTH)
			driving = BACKWARDS
			turning = NOTURN
		if(SOUTHEAST)
			driving = BACKWARDS
			turning = TURNLEFT
		if(SOUTHWEST)
			driving = BACKWARDS
			turning = TURNRIGHT
		if(EAST)
			return
		if(WEST)
			return

	if(driving == AHEAD)
		switch(turning)
			if(NOTURN)
				moving_dir = facing_dir
			if(TURNLEFT)
				if(turf_crossed > stage-1 || HAS_TRAIT(driver, TRAIT_EXP_DRIVER))
					moving_dir = turn(facing_dir, -45)
					turf_crossed = 0
			if(TURNRIGHT)
				if(turf_crossed > stage-1 || HAS_TRAIT(driver, TRAIT_EXP_DRIVER))
					moving_dir = turn(facing_dir, 45)
					turf_crossed = 0
	else
		switch(turning)
			if(NOTURN)
				moving_dir = turn(facing_dir, 180)
			if(TURNLEFT)
				moving_dir = turn(facing_dir, 135)
				turf_crossed = 0
			if(TURNRIGHT)
				moving_dir = turn(facing_dir, 225)
				turf_crossed = 0

	var/delay = 1
	var/diagonal = FALSE
	if(health < maxhealth/4)
		delay = delay+round((maxhealth-health)/20)

	if(driving == BACKWARDS)
		delay = delay*3
	else
		if(speed == 0 && stage > 1)
			delay = delay*3
		else
			delay = delay+(3-stage)

	if(moving_dir != NORTH && moving_dir != SOUTH && moving_dir != EAST && moving_dir != WEST)
		diagonal = TRUE

	if(world.time < last_speeded+delay)
		return

	if(speed < 5 && last_speeded+delay+10 > world.time)
		if(moving_dir != turn(last_dir, 45) && moving_dir != turn(last_dir, -45) && moving_dir != last_dir)
			if(last_beep+10 < world.time)
				last_beep = world.time
				playsound(src, 'code/modules/wod13/sounds/stopping.ogg', 40, TRUE)
			speed = 0
			return

	if(delay)
		speed = delay
		last_speeded = world.time
		if(driving == AHEAD)
			facing_dir = moving_dir
		else
			facing_dir = turn(moving_dir, 180)
//		var/target_turf = get_step(src, last_dir)	//Fo futue
		if(moving_dir != NORTH && moving_dir != SOUTH && moving_dir != WEST && moving_dir != EAST)
			delay = delay /= 0.75
		glide_size = (32 / delay) * world.tick_lag / (diagonal ? 0.75 : 1)// * (world.tick_lag / CLIENTSIDE_TICK_LAG_SMOOTH)
		step(src, moving_dir)
		gas = max(0, gas-0.05)
		dir = facing_dir
		FARI.forceMove(get_step(src, facing_dir))
		last_dir = moving_dir
		turf_crossed = min(3, turf_crossed+1)
		glide_size = (32 / delay) * world.tick_lag / (diagonal ? 0.75 : 1)// * (world.tick_lag / CLIENTSIDE_TICK_LAG_SMOOTH)
		playsound(src, 'code/modules/wod13/sounds/drive.ogg', 5, FALSE)
		if(health < maxhealth/2)
			pixel_x = rand(-2, 2)
			pixel_y = rand(-2, 2)
		for(var/mob/living/L in loc)
			if(L)
				L.apply_damage(25, BRUTE, BODY_ZONE_CHEST)
				do_attack_animation(L)

/obj/vampire_car/Bump(atom/A)
	if(speed > 5)
		return
	if(driver)
		if(istype(A, /mob/living/carbon/human/npc))
			var/mob/living/carbon/human/npc/NPC = A
			NPC.Aggro(driver, TRUE)
	playsound(src, 'code/modules/wod13/sounds/bump.ogg', 50, TRUE)
	last_speeded = world.time+20
	do_attack_animation(A)
	if(driving != BACKWARDS)
		if(istype(A, /mob/living))
			var/mob/living/L = A
			var/dam2 = 5
			if(!HAS_TRAIT(L, TRAIT_TOUGH_FLESH))
				L.Knockdown(10)
				dam2 = 15
			L.apply_damage(dam2*stage, BRUTE, BODY_ZONE_CHEST)
			var/dam = 5
			if(driver)
				if(HAS_TRAIT(driver, TRAIT_EXP_DRIVER))
					dam = 1
			get_damage(dam)
		else
			var/dam = 10
			if(driver)
				if(HAS_TRAIT(driver, TRAIT_EXP_DRIVER))
					dam = 5
			get_damage(dam)
			driver.apply_damage(10, BRUTE, BODY_ZONE_CHEST)
	else
		get_damage(1)
		if(istype(A, /mob/living))
			var/mob/living/L = A
			L.apply_damage(10, BRUTE, BODY_ZONE_CHEST)
	return

/obj/vampire_car/retro
	icon_state = "1"
	max_passengers = 1
	dir = WEST
	facing_dir = WEST
	moving_dir = WEST
	last_dir = WEST

/obj/vampire_car/retro/rand
	icon_state = "3"

/obj/vampire_car/retro/rand/Initialize()
	. = ..()
	icon_state = "[pick(1, 3, 5)]"
	if(access == "none")
		access = "npc[rand(1, 20)]"

/obj/vampire_car/rand
	icon_state = "4"
	dir = WEST
	facing_dir = WEST
	moving_dir = WEST
	last_dir = WEST

/obj/vampire_car/rand/Initialize()
	. = ..()
	icon_state = "[pick(2, 4, 6)]"
	if(access == "none")
		access = "npc[rand(1, 20)]"

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
	facing_dir = WEST
	moving_dir = WEST
	last_dir = WEST
	beep_sound = 'code/modules/wod13/sounds/migalka.ogg'
	access = "police"
	baggage_limit = 45
	baggage_max = WEIGHT_CLASS_BULKY
	var/color_blue = FALSE
	var/last_color_change = 0

/obj/vampire_car/police/process(delta_time)
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
	facing_dir = WEST
	moving_dir = WEST
	last_dir = WEST
	access = "taxi"
	baggage_limit = 40
	baggage_max = WEIGHT_CLASS_BULKY

/obj/vampire_car/track
	icon_state = "track"
	max_passengers = 6
	dir = WEST
	facing_dir = WEST
	moving_dir = WEST
	last_dir = WEST
	access = "none"
	baggage_limit = 100
	baggage_max = WEIGHT_CLASS_BULKY

/obj/vampire_car/track/Initialize()
	. = ..()
	if(access == "none")
		access = "npc[rand(1, 20)]"

/obj/vampire_car/track/volkswagen
	icon_state = "volkswagen"
	baggage_limit = 60

/obj/vampire_car/track/ambulance
	icon_state = "ambulance"
	access = "clinic"
	baggage_limit = 60

/obj/effect/fari
	invisibility = INVISIBILITY_ABSTRACT

#undef TURNLEFT
#undef NOTURN
#undef TURNRIGHT

#undef BACKWARDS
#undef AHEAD
