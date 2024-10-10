/obj/item/kitchen/knife/combat/blinkdagger
	name = "Blink Dagger"
	desc = "Мгновенно перемещает к указанной точке на расстоянии до 7 шагов"
	var/cooldown = 15 SECONDS
	var/last_used
	var/phasein = /obj/effect/temp_visual/dir_setting/ninja/phase
	var/phaseout = /obj/effect/temp_visual/dir_setting/ninja/phase/out
	var/can_blink = TRUE

/obj/item/kitchen/knife/combat/blinkdagger/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
//	if(world.time - last_used == cooldown && isopenturf(target))
	Teleport(target, user)
/obj/item/kitchen/knife/combat/blinkdagger/proc/Teleport(atom/target, mob/user)
	var/turf/T = get_turf(target)
	if(target in view(user.client.view, user))
		var/obj/spot1 = new phaseout(get_turf(user), user.dir)
		user.forceMove(T)
		playsound(T, 'sound/magic/blink.ogg', 25, TRUE)
		var/obj/spot2 = new phasein(get_turf(user), user.dir)
		spot1.Beam(spot2,"blur",time=2 SECONDS)
