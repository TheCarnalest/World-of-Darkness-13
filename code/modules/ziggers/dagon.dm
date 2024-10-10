/obj/item/dagon
	name = "Dagon"
	desc = "Волшебная палочка. Имеет разные градации силы"
	icon_state = "wiredrod"
	var/dagon_power = 400
/obj/item/dagon/two
	dagon_power = 500
/obj/item/dagon/three
	dagon_power = 600
/obj/item/dagon/fourth
	dagon_power = 700
/obj/item/dagon/five
	dagon_power = 800
/obj/item/dagon/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/nigga = target
		nigga.apply_damage(dagon_power, BURN,)
