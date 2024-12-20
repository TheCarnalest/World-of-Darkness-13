/obj/structure/statue/petrified
	name = "statue"
	desc = "An incredibly lifelike marble carving."
	icon_state = "human_male"
	density = TRUE
	anchored = TRUE
//	max_integrity = 200
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	var/timer = 75 //eventually the person will be freed
	var/mob/living/petrified_mob

/obj/structure/statue/petrified/New(loc, mob/living/L, statue_timer)
	if(statue_timer)
		timer = statue_timer
	if(L)
		petrified_mob = L
		if(L.buckled)
			L.buckled.unbuckle_mob(L,force=1)
		L.visible_message("<span class='warning'>[L]'s skin rapidly turns to marble!</span>", "<span class='userdanger'>Your body freezes up! Can't... move... can't... think...</span>")
		L.forceMove(src)
		ADD_TRAIT(L, TRAIT_MUTE, STATUE_MUTE)
		L.faction += "mimic" //Stops mimics from instaqdeling people in statues
		L.status_flags |= GODMODE
		obj_integrity = L.health + 100 //stoning damaged mobs will result in easier to shatter statues
		max_integrity = obj_integrity
		START_PROCESSING(SSobj, src)
	..()

/obj/structure/statue/petrified/process(delta_time)
	if(!petrified_mob)
		STOP_PROCESSING(SSobj, src)
	timer -= delta_time
	petrified_mob.Stun(40) //So they can't do anything while petrified
	if(timer <= 0)
		STOP_PROCESSING(SSobj, src)
		qdel(src)

/obj/structure/statue/petrified/contents_explosion(severity, target)
	return

/obj/structure/statue/petrified/handle_atom_del(atom/A)
	if(A == petrified_mob)
		petrified_mob = null

/obj/structure/statue/petrified/Destroy()

	if(istype(src.loc, /mob/living/simple_animal/hostile/statue))
		var/mob/living/simple_animal/hostile/statue/S = src.loc
		forceMove(S.loc)
		if(S.mind)
			if(petrified_mob)
				S.mind.transfer_to(petrified_mob)
				petrified_mob.Paralyze(100)
				to_chat(petrified_mob, "<span class='notice'>You slowly come back to your senses. You are in control of yourself again!</span>")
		qdel(S)

	for(var/obj/O in src)
		O.forceMove(loc)

	if(petrified_mob)
		petrified_mob.status_flags &= ~GODMODE
		petrified_mob.forceMove(loc)
		REMOVE_TRAIT(petrified_mob, TRAIT_MUTE, STATUE_MUTE)
		REMOVE_TRAIT(petrified_mob, TRAIT_NOBLEED, MAGIC_TRAIT)
		petrified_mob.take_overall_damage((petrified_mob.health - obj_integrity + 100)) //any new damage the statue incurred is transfered to the mob
		petrified_mob.faction -= "mimic"
		petrified_mob = null
	return ..()

/obj/structure/statue/petrified/deconstruct(disassembled = TRUE)
	if(!disassembled)
		if(petrified_mob)
			petrified_mob.dust()
	visible_message("<span class='danger'>[src] shatters!.</span>")
	qdel(src)


/mob/proc/petrify(statue_timer)

/mob/living/carbon/human/petrify(statue_timer, clane_type)
	if(!isturf(loc))
		return FALSE
	if(iskindred(src))
		if(clane_type)
			if(clane_type == "Serpentis")
				ADD_TRAIT(src, TRAIT_NOBLEED, MAGIC_TRAIT)
				var/obj/structure/statue/petrified/S = new(loc, src, statue_timer)
				S.name = "[name]'s mummy"
				S.icon_state = "mummy"
				S.desc = "CURSE OF RA 𓀀 𓀁 𓀂 𓀃 𓀄 𓀅 𓀆 𓀇 𓀈 𓀉 𓀊 𓀋 𓀌 𓀍 𓀎 𓀏 𓀐 𓀑 𓀒 𓀓 𓀔 𓀕 𓀖 𓀗 𓀘 𓀙 𓀚 𓀛 𓀜 𓀝 𓀞 𓀟 𓀠 𓀡 𓀢 𓀣 𓀤 𓀥 𓀦 𓀧 𓀨 𓀩 𓀪 𓀫 𓀬 𓀭 𓀮 𓀯 𓀰 𓀱 𓀲 𓀳 𓀴 𓀵 𓀶 𓀷 𓀸 𓀹 𓀺 𓀻 𓀼 𓀽 𓀾 𓀿 𓁀 𓁁 𓁂 𓁃 𓁄 𓁅 𓁆 𓁇 𓁈 𓁉 𓁊 𓁋 𓁌 𓁍 𓁎 𓁏 𓁐 𓁑 𓀄 𓀅 𓀆."
			if(clane_type == "Visceratika")
				ADD_TRAIT(src, TRAIT_NOBLEED, MAGIC_TRAIT)
				var/obj/structure/statue/petrified/S = new(loc, src, statue_timer)
				S.name = "\improper gargoyle"
				S.desc = "Some kind of gothic architecture."
				S.icon = 'code/modules/wod13/32x48.dmi'
				S.icon_state = "gargoyle"
				S.dir = dir
				S.pixel_z = -16
		else
			var/obj/structure/statue/petrified/S = new(loc, src, statue_timer)
			S.name = "statue of [name]"
			ADD_TRAIT(src, TRAIT_NOBLEED, MAGIC_TRAIT)
			S.copy_overlays(src)
			var/newcolor = list(rgb(77,77,77), rgb(150,150,150), rgb(28,28,28), rgb(0,0,0))
			S.add_atom_colour(newcolor, FIXED_COLOUR_PRIORITY)
	else
		var/obj/structure/statue/petrified/S = new(loc, src, statue_timer)
		S.name = "statue of [name]"
		ADD_TRAIT(src, TRAIT_NOBLEED, MAGIC_TRAIT)
		S.copy_overlays(src)
		var/newcolor = list(rgb(77,77,77), rgb(150,150,150), rgb(28,28,28), rgb(0,0,0))
		S.add_atom_colour(newcolor, FIXED_COLOUR_PRIORITY)
	return TRUE

/mob/living/simple_animal/hostile/gargoyle/petrify(statue_timer)
	if(!isturf(loc))
		return FALSE
	var/obj/structure/statue/petrified/S = new(loc, src, statue_timer)
	S.name = "statue of [name]"
	S.icon = icon
	S.icon_state = icon_state
	S.color = "#000000"
	return TRUE

/mob/living/simple_animal/pet/dog/corgi/petrify(statue_timer)
	if(!isturf(loc))
		return FALSE
	var/obj/structure/statue/petrified/S = new (loc, src, statue_timer)
	S.name = "statue of a corgi"
	S.icon_state = "corgi"
	S.desc = "If it takes forever, I will wait for you..."
	return TRUE
