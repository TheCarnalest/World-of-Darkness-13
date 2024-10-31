/obj/item
	var/cost = 0
	var/illegal = FALSE

/obj/lombard
	name = "pawnshop"
	desc = "Sell your stuff."
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	icon_state = "sell"
	icon = 'code/modules/wod13/props.dmi'
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
			for(var/i in 1 to (W.cost/5)*(user.social + user.additional_social * 0.1))
				new /obj/item/stack/dollar(loc)
			playsound(loc, 'code/modules/wod13/sounds/sell.ogg', 50, TRUE)
			if(istype(W, /obj/item/organ))
				var/mob/living/carbon/human/H = user
				to_chat(src, "<span class='userdanger'><b>Selling organs is a depraved act! If I keep doing this I will become a wight.</b></span>")
				H.AdjustHumanity(-1, 0)
			else if(istype(W, /obj/item/reagent_containers/food/drinks/meth/cocaine))
				var/mob/living/carbon/human/H = user
				H.AdjustHumanity(-1, 4)
			else if(istype(W, /obj/item/reagent_containers/food/drinks/meth))
				var/mob/living/carbon/human/H = user
				H.AdjustHumanity(-1, 3)
			else if(illegal)
				var/mob/living/carbon/human/H = user
				H.AdjustHumanity(-1, 5)
			qdel(W)
			return
	else
		..()

/obj/lombard/blackmarket
	name = "black market"
	desc = "Sell illegal goods."
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	icon_state = "sell_d"
	icon = 'code/modules/wod13/props.dmi'
	anchored = TRUE
	illegal = TRUE

/obj/item/organ/heart
	illegal = TRUE
	cost = 1500

/obj/item/organ/lungs
	illegal = TRUE
	cost = 800

/obj/item/organ/liver
	illegal = TRUE
	cost = 800

/obj/item/organ/stomach
	illegal = TRUE
	cost = 300

/obj/item/organ/eyes
	illegal = TRUE
	cost = 300

/obj/item/organ/ears
	illegal = TRUE
	cost = 300

/obj/item/organ/tongue
	illegal = TRUE
	cost = 200

/obj/item/weedseed
	illegal = TRUE
	cost = 100
/obj/item/weedpack
	illegal = TRUE
	cost = 100

/obj/item/reagent_containers/food/drinks/meth
	illegal = TRUE
	cost = 500

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
/obj/item/food/fish/catfish
	cost = 50
/obj/item/food/fish/shark
	cost = 400
/obj/item/food/fish/tune
	cost = 125
/obj/item/food/fish/crab
	cost = 200
/obj/item/cockclock
	cost = 50
