/obj/item
	var/lombard_cost = 0
	var/illegal = FALSE

/obj/lombard
	name = "pawnshop"
	desc = "Sell your stuff."
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	icon_state = "sell"
	icon = 'code/modules/ziggers/props.dmi'
	anchored = TRUE
	var/illegal = FALSE

/obj/lombard/attackby(obj/item/W, mob/living/user, params)
	if(istype(W, /obj/item/stack))
		return
	if(istype(W, /obj/item/organ))
		var/obj/item/organ/O = W
		if(O.damage > round(O.maxHealth/2))
			to_chat(user, "<span class='warning'>[W] is too damaged to sell!</span>")
			return
	if(W.lombard_cost > 0)
		if(W.illegal == illegal)
			for(var/i in 1 to (W.lombard_cost/3)*user.social)
				new /obj/item/stack/dollar(loc)
			playsound(loc, 'code/modules/ziggers/sounds/sell.ogg', 50, TRUE)
			if(illegal)
				var/mob/living/carbon/human/H = user
				H.AdjustHumanity(-1, 2)
			qdel(W)
			return
	else
		..()

/obj/lombard/blackmarket
	name = "black market"
	desc = "Sell your stuff."
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	icon_state = "sell_d"
	icon = 'code/modules/ziggers/props.dmi'
	anchored = TRUE
	illegal = TRUE

/obj/item/organ/heart
	illegal = TRUE
	lombard_cost = 1000

/obj/item/organ/lungs
	illegal = TRUE
	lombard_cost = 500

/obj/item/organ/liver
	illegal = TRUE
	lombard_cost = 500

/obj/item/organ/stomach
	illegal = TRUE
	lombard_cost = 100

/obj/item/organ/eyes
	illegal = TRUE
	lombard_cost = 100

/obj/item/organ/ears
	illegal = TRUE
	lombard_cost = 100

/obj/item/organ/tongue
	illegal = TRUE
	lombard_cost = 50

/obj/item/weedseed
	illegal = TRUE
	lombard_cost = 50
/obj/item/weedpack
	illegal = TRUE
	lombard_cost = 50

/obj/item/reagent_containers/food/drinks/meth
	illegal = TRUE
	lombard_cost = 300

/obj/item/clothing/under/vampire
	lombard_cost = 10
/obj/item/clothing/shoes/vampire
	lombard_cost = 5
/obj/item/clothing/suit/vampire
	lombard_cost = 15
/obj/item/clothing/head/vampire
	lombard_cost = 10
/obj/item/gun/ballistic/vampire/revolver
	lombard_cost = 25
/obj/item/gun/ballistic/automatic/vampire/deagle
	lombard_cost = 75
/obj/item/gun/ballistic/automatic/vampire/uzi
	lombard_cost = 175
/obj/item/gun/ballistic/automatic/vampire/ar15
	lombard_cost = 250
/obj/item/melee/vampirearms
	lombard_cost = 25
/obj/item/melee/vampirearms/baseball
	lombard_cost = 50
/obj/item/melee/vampirearms/katana
	lombard_cost = 250
/obj/item/food/fish
	lombard_cost = 20
/obj/item/cockclock
	lombard_cost = 50
