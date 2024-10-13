/obj/item
	var/cost = 0
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
	if(W.cost > 0)
		if(W.illegal == illegal)
			for(var/i in 1 to (W.cost/3)*user.social)
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
	cost = 1000

/obj/item/organ/lungs
	illegal = TRUE
	cost = 500

/obj/item/organ/liver
	illegal = TRUE
	cost = 500

/obj/item/organ/stomach
	illegal = TRUE
	cost = 100

/obj/item/organ/eyes
	illegal = TRUE
	cost = 100

/obj/item/organ/ears
	illegal = TRUE
	cost = 100

/obj/item/organ/tongue
	illegal = TRUE
	cost = 50

/obj/item/weedseed
	illegal = TRUE
	cost = 50
/obj/item/weedpack
	illegal = TRUE
	cost = 50

/obj/item/reagent_containers/food/drinks/meth
	illegal = TRUE
	cost = 300

/obj/item/clothing/under/vampire
	cost = 10
/obj/item/clothing/shoes/vampire
	cost = 5
/obj/item/clothing/suit/vampire
	cost = 15
/obj/item/clothing/head/vampire
	cost = 10
/obj/item/gun/ballistic/vampire/revolver
	cost = 25
/obj/item/gun/ballistic/automatic/vampire/deagle
	cost = 75
/obj/item/gun/ballistic/automatic/vampire/uzi
	cost = 175
/obj/item/gun/ballistic/automatic/vampire/ar15
	cost = 250
/obj/item/melee/vampirearms
	cost = 25
/obj/item/melee/vampirearms/baseball
	cost = 50
/obj/item/melee/vampirearms/katana
	cost = 250
/obj/item/food/fish
	cost = 20
/obj/item/cockclock
	cost = 50
