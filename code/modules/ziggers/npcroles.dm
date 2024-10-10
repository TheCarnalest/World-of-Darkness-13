/datum/socialrole/bandit
	s_tones = list("caucasian3",
								"latino",
								"mediterranean",
								"asian1",
								"asian2",
								"arab",
								"indian",
								"african1",
								"african2")

	min_age = 18
	max_age = 45
	preferedgender = MALE
	male_names = null
	surnames = null

	hair_colors = list("040404",	//Black
											"120b05",	//Dark Brown
											"342414",	//Brown
											"554433")	//Light Brown
	male_hair = list("Balding Hair",
										"Bedhead",
										"Bedhead 2",
										"Bedhead 3",
										"Boddicker",
										"Business Hair",
										"Business Hair 2",
										"Business Hair 3",
										"Business Hair 4",
										"Coffee House",
										"Combover",
										"Crewcut",
										"Father",
										"Flat Top",
										"Gelled Back",
										"Joestar",
										"Keanu Hair",
										"Oxton",
										"Volaju")
	male_facial = list("Beard (Abraham Lincoln)",
											"Beard (Chinstrap)",
											"Beard (Full)",
											"Beard (Cropped Fullbeard)",
											"Beard (Hipster)",
											"Beard (Neckbeard)",
											"Beard (Three o Clock Shadow)",
											"Beard (Five o Clock Shadow)",
											"Beard (Seven o Clock Shadow)",
											"Moustache (Hulk Hogan)",
											"Moustache (Watson)",
											"Sideburns (Elvis)",
											"Sideburns",
											"Shaved")

	shoes = list(/obj/item/clothing/shoes/vampire/sneakers,
								/obj/item/clothing/shoes/vampire/sneakers/red,
								/obj/item/clothing/shoes/vampire/jackboots)
	uniforms = list(/obj/item/clothing/under/vampire/larry,
									/obj/item/clothing/under/vampire/bandit,
									/obj/item/clothing/under/vampire/biker)
	hats = list(/obj/item/clothing/head/vampire/bandana,
							/obj/item/clothing/head/vampire/bandana/red,
							/obj/item/clothing/head/vampire/bandana/black,
							/obj/item/clothing/head/vampire/beanie,
							/obj/item/clothing/head/vampire/beanie/black)
	pockets = list(/obj/item/stack/dollar/rand,
					/obj/item/vamp/keys/hack)

	male_phrases = list("What are you staring at, bitch?",
											"Are you threating me?",
											"What do you need, motherfucker?",
											"I see you lost your fear, bitch ass.",
											"Fuck off, before I smash you!",
											"Get lost, liberal...",
											"Do I need to explain it to you?",
											"Go away.",
											"Piss off.",
											"Fuck you.")
	neutral_phrases = list("What are you staring at, bitch?",
											"Are you threating me?",
											"What do you need, motherfucker?",
											"I see you lost your fear, bitch ass.",
											"Fuck off, before I smash you!",
											"Get lost, liberal...",
											"Do I need to explain it to you?",
											"Go away.",
											"Piss off.",
											"Fuck you.")
	random_phrases = list("Nigga!",
												"I miss my lady...",
												"What's wrong bro?",
												"Good, fucking, evening.",
												"Saw you selling weed!",
												"We will die...",
												"Guh...")
	answer_phrases = list("I have it...",
												"Fucking apocalypse.",
												"Shit, nigga.",
												"Choom, do I know you?",
												"Right.",
												"Uhmm...",
												"I shitted well.")
	help_phrases = list("God damn!",
											"FUCKING FUCK OFF!!",
											"What the hell?!",
											"Fucking hell!",
											"Get gunned, bros!",
											"Lay down and get yo ass ready!!")

/datum/socialrole/usualmale
	s_tones = list("albino",
								"caucasian1",
								"caucasian2",
								"caucasian3")

	min_age = 18
	max_age = 85
	preferedgender = MALE
	male_names = null
	surnames = null

	hair_colors = list("040404",	//Black
										"120b05",	//Dark Brown
										"342414",	//Brown
										"554433",	//Light Brown
										"695c3b",	//Dark Blond
										"ad924e",	//Blond
										"dac07f",	//Light Blond
										"802400",	//Ginger
										"a5380e",	//Ginger alt
										"ffeace",	//Albino
										"650b0b",	//Punk Red
										"14350e",	//Punk Green
										"080918")	//Punk Blue
	male_hair = list("Balding Hair",
										"Bedhead",
										"Bedhead 2",
										"Bedhead 3",
										"Boddicker",
										"Business Hair",
										"Business Hair 2",
										"Business Hair 3",
										"Business Hair 4",
										"Coffee House",
										"Combover",
										"Crewcut",
										"Father",
										"Flat Top",
										"Gelled Back",
										"Joestar",
										"Keanu Hair",
										"Oxton",
										"Volaju")
	male_facial = list("Beard (Abraham Lincoln)",
											"Beard (Chinstrap)",
											"Beard (Full)",
											"Beard (Cropped Fullbeard)",
											"Beard (Hipster)",
											"Beard (Neckbeard)",
											"Beard (Three o Clock Shadow)",
											"Beard (Five o Clock Shadow)",
											"Beard (Seven o Clock Shadow)",
											"Moustache (Hulk Hogan)",
											"Moustache (Watson)",
											"Sideburns (Elvis)",
											"Sideburns",
											"Shaved")

	shoes = list(/obj/item/clothing/shoes/vampire/sneakers,
								/obj/item/clothing/shoes/vampire,
								/obj/item/clothing/shoes/vampire/brown)
	uniforms = list(/obj/item/clothing/under/vampire/mechanic,
									/obj/item/clothing/under/vampire/sport,
									/obj/item/clothing/under/vampire/office,
									/obj/item/clothing/under/vampire/sexy,
									/obj/item/clothing/under/vampire/pimp,
									/obj/item/clothing/under/vampire/emo)
	pockets = list(/obj/item/vamp/keys/npc,
					/obj/item/stack/dollar/rand)

	male_phrases = list("What do you need, mate?",
											"Do you need something?",
											"Can you repeat what you were saying?",
											"I'm late, don't interrupt me.",
											"Check bar for new company...",
											"Can't speak right now.",
											"Good night I guess?",
											"Guh...",
											"I dunno what to say.",
											"That's all, folks.")
	neutral_phrases = list("What do you need, mate?",
											"Do you need something?",
											"Can you repeat what you were saying?",
											"I'm late, don't interrupt me.",
											"Check bar for new company...",
											"Can't speak right now.",
											"Good night I guess?",
											"Guh...",
											"I dunno what to say.",
											"That's all, folks.")
	random_phrases = list("Hey, mate!",
												"I miss my beer...",
												"Everything okay?",
												"Hello.",
												"Didn't I meet you?",
												"Something wrong here.",
												"Oooh, dude...")
	answer_phrases = list("Trying...",
												"Awesome.",
												"Bad, mate.",
												"You picked wrong person.",
												"Yeah, right.",
												"O'kaay...",
												"Nice.")
	help_phrases = list("Oh God!",
											"Go away!!",
											"What the heck is happening?!",
											"Stop!",
											"Someone, help!",
											"Mommy!")

/datum/socialrole/usualfemale
	s_tones = list("albino",
								"caucasian1",
								"caucasian2",
								"caucasian3")

	min_age = 18
	max_age = 85
	preferedgender = FEMALE
	female_names = null
	surnames = null

	hair_colors = list("040404",	//Black
										"120b05",	//Dark Brown
										"342414",	//Brown
										"554433",	//Light Brown
										"695c3b",	//Dark Blond
										"ad924e",	//Blond
										"dac07f",	//Light Blond
										"802400",	//Ginger
										"a5380e",	//Ginger alt
										"ffeace",	//Albino
										"650b0b",	//Punk Red
										"14350e",	//Punk Green
										"080918")	//Punk Blue
	female_hair = list("Ahoge",
										"Long Bedhead",
										"Beehive",
										"Beehive 2",
										"Bob Hair",
										"Bob Hair 2",
										"Bob Hair 3",
										"Bob Hair 4",
										"Bobcurl",
										"Braided",
										"Braided Front",
										"Braid (Short)",
										"Braid (Low)",
										"Bun Head",
										"Bun Head 2",
										"Bun Head 3",
										"Bun (Large)",
										"Bun (Tight)",
										"Double Bun",
										"Emo",
										"Emo Fringe",
										"Feather",
										"Gentle",
										"Long Hair 1",
										"Long Hair 2",
										"Long Hair 3",
										"Long Over Eye",
										"Long Emo",
										"Long Fringe",
										"Ponytail",
										"Ponytail 2",
										"Ponytail 3",
										"Ponytail 4",
										"Ponytail 5",
										"Ponytail 6",
										"Ponytail 7",
										"Ponytail (High)",
										"Ponytail (Short)",
										"Ponytail (Long)",
										"Ponytail (Country)",
										"Ponytail (Fringe)",
										"Poofy",
										"Short Hair Rosa",
										"Shoulder-length Hair",
										"Volaju")

	shoes = list(/obj/item/clothing/shoes/vampire/heels,
								/obj/item/clothing/shoes/vampire/sneakers,
								/obj/item/clothing/shoes/vampire/jackboots)
	uniforms = list(/obj/item/clothing/under/vampire/black,
									/obj/item/clothing/under/vampire/red,
									/obj/item/clothing/under/vampire/gothic)
	pockets = list(/obj/item/vamp/keys/npc,
					/obj/item/stack/dollar/rand)

	female_phrases = list("What do you need?",
											"Do you need something?",
											"Do I really need to answer?",
											"I'm late.",
											"Pervert...",
											"Can't speak right now.",
											"Buy yourself a watch",
											"Hey.",
											"Go away.")
	neutral_phrases = list("What do you need?",
											"Do you need something?",
											"Do I really need to answer?",
											"I'm late.",
											"Pervert...",
											"Can't speak right now.",
											"Buy yourself a watch",
											"Hey.",
											"Go away.")
	random_phrases = list("Хэй, пышка!",
												"Эхх, сейчас бы вина...",
												"В чём дело?",
												"Приветики.",
												"Ого, а мы встречались раньше?",
												"Слышали? Что-то неладное творится в городе.",
												"Оо-о, ничего себе...")
	answer_phrases = list("Стараюсь...",
												"Неописуемо.",
												"Плохо, пупсик.",
												"Вы кажется перепутали меня с кем-то.",
												"Да, точно.",
												"О'ке-ей...",
												"Хорошо.")
	help_phrases = list("Oh God!",
											"Go away!!",
											"What the heck is happening?!",
											"Stop!",
											"Someone, help!",
											"Mommy!")

/datum/socialrole/poormale
	s_tones = list("albino",
								"caucasian1",
								"caucasian2",
								"caucasian3")

	min_age = 45
	max_age = 85
	preferedgender = MALE
	male_names = null
	surnames = null

	hair_colors = list("040404",	//Black
										"120b05",	//Dark Brown
										"342414",	//Brown
										"554433",	//Light Brown
										"695c3b",	//Dark Blond
										"ad924e",	//Blond
										"dac07f",	//Light Blond
										"802400",	//Ginger
										"a5380e",	//Ginger alt
										"ffeace",	//Albino
										"650b0b",	//Punk Red
										"14350e",	//Punk Green
										"080918")	//Punk Blue
	male_hair = list("Balding Hair",
										"Bedhead",
										"Bedhead 2",
										"Bedhead 3",
										"Boddicker",
										"Business Hair",
										"Business Hair 2",
										"Business Hair 3",
										"Business Hair 4",
										"Coffee House",
										"Combover",
										"Crewcut",
										"Father",
										"Flat Top",
										"Gelled Back",
										"Joestar",
										"Keanu Hair",
										"Oxton",
										"Volaju")
	male_facial = list("Beard (Abraham Lincoln)",
											"Beard (Chinstrap)",
											"Beard (Full)",
											"Beard (Cropped Fullbeard)",
											"Beard (Hipster)",
											"Beard (Neckbeard)",
											"Beard (Three o Clock Shadow)",
											"Beard (Five o Clock Shadow)",
											"Beard (Seven o Clock Shadow)",
											"Moustache (Hulk Hogan)",
											"Moustache (Watson)",
											"Sideburns (Elvis)",
											"Sideburns")

	shoes = list(/obj/item/clothing/shoes/vampire/jackboots/work)
	uniforms = list(/obj/item/clothing/under/vampire/homeless)
	suits = list(/obj/item/clothing/suit/vampire/coat)
	hats = list(/obj/item/clothing/head/vampire/beanie/black)
	gloves = list(/obj/item/clothing/gloves/vampire/work)
	neck = list(/obj/item/clothing/neck/vampire/scarf/red,
							/obj/item/clothing/neck/vampire/scarf,
							/obj/item/clothing/neck/vampire/scarf/blue,
							/obj/item/clothing/neck/vampire/scarf/green,
							/obj/item/clothing/neck/vampire/scarf/white)

	male_phrases = list("Fuck, shit, daa-amn...",
											"We're fucked!",
											"Grubrhggsmm...",
											"Brrr.",
											"Drunk...")
	neutral_phrases = list("Fuck, shit, daa-amn...",
											"We're fucked!",
											"Grubrhggsmm...",
											"Brrr.",
											"Drunk...")
	random_phrases = list("Fuck, shit, daa-amn...",
											"We're fucked!",
											"Grubrhggsmm...",
											"Brrr.",
											"Drunk...")
	answer_phrases = list("Fuck, shit, daa-amn...",
											"We're fucked!",
											"Grubrhggsmm...",
											"Brrr.",
											"Drunk...")
	help_phrases = list("Aaaugh!",
											"AAAAHHHH!!",
											"Wut de fuck? WHOM'RE YOU?!",
											"Shit!",
											"Ass!",
											"Dick!")

/datum/socialrole/poorfemale
	s_tones = list("albino",
								"caucasian1",
								"caucasian2",
								"caucasian3")

	min_age = 45
	max_age = 85
	preferedgender = FEMALE
	female_names = null
	surnames = null

	hair_colors = list("040404",	//Black
										"120b05",	//Dark Brown
										"342414",	//Brown
										"554433",	//Light Brown
										"695c3b",	//Dark Blond
										"ad924e",	//Blond
										"dac07f",	//Light Blond
										"802400",	//Ginger
										"a5380e",	//Ginger alt
										"ffeace",	//Albino
										"650b0b",	//Punk Red
										"14350e",	//Punk Green
										"080918")	//Punk Blue
	female_hair = list("Ahoge",
										"Long Bedhead",
										"Beehive",
										"Beehive 2",
										"Bob Hair",
										"Bob Hair 2",
										"Bob Hair 3",
										"Bob Hair 4",
										"Bobcurl",
										"Braided",
										"Braided Front",
										"Braid (Short)",
										"Braid (Low)",
										"Bun Head",
										"Bun Head 2",
										"Bun Head 3",
										"Bun (Large)",
										"Bun (Tight)",
										"Double Bun",
										"Emo",
										"Emo Fringe",
										"Feather",
										"Gentle",
										"Long Hair 1",
										"Long Hair 2",
										"Long Hair 3",
										"Long Over Eye",
										"Long Emo",
										"Long Fringe",
										"Ponytail",
										"Ponytail 2",
										"Ponytail 3",
										"Ponytail 4",
										"Ponytail 5",
										"Ponytail 6",
										"Ponytail 7",
										"Ponytail (High)",
										"Ponytail (Short)",
										"Ponytail (Long)",
										"Ponytail (Country)",
										"Ponytail (Fringe)",
										"Poofy",
										"Short Hair Rosa",
										"Shoulder-length Hair",
										"Volaju")

	shoes = list(/obj/item/clothing/shoes/vampire/brown)
	uniforms = list(/obj/item/clothing/under/vampire/homeless/female)
	suits = list(/obj/item/clothing/suit/vampire/coat/alt)
	hats = list(/obj/item/clothing/head/vampire/beanie/homeless)

	female_phrases = list("Fuck, shit, daa-amn...",
											"We're fucked!",
											"Grubrhggsmm...",
											"Brrr.",
											"Drunk...")
	neutral_phrases = list("Fuck, shit, daa-amn...",
											"We're fucked!",
											"Grubrhggsmm...",
											"Brrr.",
											"Drunk...")
	random_phrases = list("Fuck, shit, daa-amn...",
											"We're fucked!",
											"Grubrhggsmm...",
											"Brrr.",
											"Drunk...")
	answer_phrases = list("Fuck, shit, daa-amn...",
											"We're fucked!",
											"Grubrhggsmm...",
											"Brrr.",
											"Drunk...")
	help_phrases = list("Aaaugh!",
											"AAAAHHHH!!",
											"Wut de fuck? WHOM'RE YOU?!",
											"Shit!",
											"Ass!",
											"Dick!")

/datum/socialrole/richmale
	s_tones = list("albino")

	min_age = 18
	max_age = 85
	preferedgender = MALE
	male_names = null
	surnames = null

	hair_colors = list("040404",	//Black
										"120b05",	//Dark Brown
										"342414",	//Brown
										"554433",	//Light Brown
										"695c3b",	//Dark Blond
										"ad924e",	//Blond
										"dac07f",	//Light Blond
										"802400",	//Ginger
										"a5380e",	//Ginger alt
										"ffeace",	//Albino
										"650b0b",	//Punk Red
										"14350e",	//Punk Green
										"080918")	//Punk Blue
	male_hair = list("Business Hair",
										"Business Hair 2",
										"Business Hair 3",
										"Business Hair 4",
										"Coffee House",
										"Combover",
										"Crewcut",
										"Father",
										"Flat Top",
										"Gelled Back",
										"Joestar",
										"Keanu Hair",
										"Oxton",
										"Volaju")
	male_facial = list("Beard (Neckbeard)",
											"Beard (Three o Clock Shadow)",
											"Sideburns (Elvis)",
											"Sideburns",
											"Shaved")

	shoes = list(/obj/item/clothing/shoes/vampire,
								/obj/item/clothing/shoes/vampire/white)
	uniforms = list(/obj/item/clothing/under/vampire/rich)
	inhand_items = list(/obj/item/storage/briefcase)
	pockets = list(/obj/item/vamp/keys/npc,
					/obj/item/stack/dollar/fifty,
					/obj/item/stack/dollar/hundred)

	male_phrases = list("Did you ask something?",
											"Excuse me?",
											"What?",
											"I'm going somewhere important.",
											"Get lost, peasant...",
											"Whaa-aat...",
											"Stop doing that, imbecile.")
	neutral_phrases = list("Did you ask something?",
											"Excuse me?",
											"What?",
											"I'm going somewhere important.",
											"Get lost, peasant...",
											"Whaa-aat...",
											"Stop doing that, imbecile.")
	random_phrases = list("Хэй, приятель!",
												"Эхх, сейчас бы пинту пива...",
												"В чём дело, друг?",
												"Хочу поприветствоваться.",
												"Ого, а мы встречались раньше?",
												"Слышали? Что-то неладное творится в городе.",
												"Оо-о, чувак...")
	answer_phrases = list("Стараюсь...",
												"Неописуемо.",
												"Плохо, друг.",
												"Вы кажется перепутали меня с кем-то.",
												"Да, точно.",
												"О'ке-ей...",
												"Хорошо.")
	help_phrases = list("What in the god damn?!",
											"Go away or I will call the cops!!",
											"What is happening?!",
											"Stop doing this!",
											"Someone, call the ambulance!")

/datum/socialrole/richfemale
	s_tones = list("albino")

	min_age = 18
	max_age = 85
	preferedgender = FEMALE
	female_names = null
	surnames = null

	hair_colors = list("040404",	//Black
										"120b05",	//Dark Brown
										"342414",	//Brown
										"554433",	//Light Brown
										"695c3b",	//Dark Blond
										"ad924e",	//Blond
										"dac07f",	//Light Blond
										"802400",	//Ginger
										"a5380e",	//Ginger alt
										"ffeace",	//Albino
										"650b0b",	//Punk Red
										"14350e",	//Punk Green
										"080918")	//Punk Blue
	female_hair = list("Ahoge",
										"Bob Hair",
										"Bob Hair 2",
										"Bob Hair 3",
										"Bob Hair 4",
										"Bobcurl",
										"Braided",
										"Braided Front",
										"Braid (Short)",
										"Braid (Low)",
										"Bun Head",
										"Bun Head 2",
										"Bun Head 3",
										"Bun (Large)",
										"Bun (Tight)",
										"Gentle",
										"Long Hair 1",
										"Long Hair 2",
										"Long Hair 3",
										"Short Hair Rosa",
										"Shoulder-length Hair",
										"Volaju")

	shoes = list(/obj/item/clothing/shoes/vampire/heels,
								/obj/item/clothing/shoes/vampire/heels/red)
	uniforms = list(/obj/item/clothing/under/vampire/business)
	pockets = list(/obj/item/vamp/keys/npc,
					/obj/item/stack/dollar/fifty,
					/obj/item/stack/dollar/hundred)

	female_phrases = list("Did you ask something?",
											"Excuse me?",
											"What?",
											"I'm going somewhere important.",
											"Get lost, peasant...",
											"Whaa-aat...",
											"Stop doing that, imbecile.")
	neutral_phrases = list("Did you ask something?",
											"Excuse me?",
											"What?",
											"I'm going somewhere important.",
											"Get lost, peasant...",
											"Whaa-aat...",
											"Stop doing that, imbecile.")
	random_phrases = list("Хэй, пышка!",
												"Эхх, сейчас бы вина...",
												"В чём дело?",
												"Приветики.",
												"Ого, а мы встречались раньше?",
												"Слышали? Что-то неладное творится в городе.",
												"Оо-о, ничего себе...")
	answer_phrases = list("Стараюсь...",
												"Неописуемо.",
												"Плохо, пупсик.",
												"Вы кажется перепутали меня с кем-то.",
												"Да, точно.",
												"О'ке-ей...",
												"Хорошо.")
	help_phrases = list("What in the god damn?!",
											"Go away or I will call the cops!!",
											"What is happening?!",
											"Stop doing this!",
											"Someone, call the ambulance!")

/mob/living/carbon/human/npc/bandit
	frakcja = "City"
	max_stat = 3

/mob/living/carbon/human/npc/bandit/Initialize()
	..()
	if(prob(33))
		base_body_mod = "f"
	if(prob(33))
		my_weapon = new /obj/item/gun/ballistic/automatic/vampire/deagle(src)
	else
		if(prob(50))
			my_weapon = new /obj/item/melee/vampirearms/baseball(src)
		else
			my_weapon = new /obj/item/melee/vampirearms/knife(src)
	AssignSocialRole(/datum/socialrole/bandit)

/mob/living/carbon/human/npc/walkby
	frakcja = "City"

/mob/living/carbon/human/npc/walkby/Initialize()
	..()
	if(prob(50))
		base_body_mod = pick("s", "f")
	AssignSocialRole(pick(/datum/socialrole/usualmale, /datum/socialrole/usualfemale))

/mob/living/carbon/human/npc/hobo
	frakcja = "City"
	bloodquality = BLOOD_QUALITY_LOW
	old_movement = TRUE

/mob/living/carbon/human/npc/hobo/Initialize()
	..()
	if(prob(33))
		base_body_mod = "s"
	AssignSocialRole(pick(/datum/socialrole/poormale, /datum/socialrole/poorfemale))

/mob/living/carbon/human/npc/business
	frakcja = "City"
	bloodquality = BLOOD_QUALITY_HIGH

/mob/living/carbon/human/npc/business/Initialize()
	..()
	if(prob(66))
		base_body_mod = "s"
	AssignSocialRole(pick(/datum/socialrole/richmale, /datum/socialrole/richfemale))

/mob/living/simple_animal/pet/rat
	name = "rat"
	desc = "It's a rat."
	icon = 'code/modules/ziggers/icons.dmi'
	icon_state = "rat"
	icon_living = "rat"
	icon_dead = "rat_dead"
	emote_hear = list("squeeks.")
	emote_see = list("shakes its head.", "shivers.")
	speak_chance = 0
	turns_per_move = 5
	see_in_dark = 6
	butcher_results = list(/obj/item/food/meat/slab = 1)
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	can_be_held = TRUE
	density = FALSE
	anchored = FALSE
	footstep_type = FOOTSTEP_MOB_CLAW
	bloodquality = BLOOD_QUALITY_LOW
	bloodpool = 1
	maxbloodpool = 1
	del_on_death = 1
	maxHealth = 5
	health = 5

/mob/living/simple_animal/pet/rat/Initialize()
	. = ..()
	pixel_w = rand(-8, 8)
	pixel_z = rand(-8, 8)

/mob/living/simple_animal/pet/rat/Life()
	. = ..()
	var/delete_me = TRUE
	for(var/mob/living/carbon/human/H in oviewers(5, src))
		if(H)
			delete_me = FALSE
	if(delete_me)
		death()

/mob/living/simple_animal/hostile/beastmaster/rat
	name = "rat"
	desc = "It's a rat."
	icon = 'code/modules/ziggers/icons.dmi'
	icon_state = "rat"
	icon_living = "rat"
	icon_dead = "rat_dead"
	emote_hear = list("squeeks.")
	emote_see = list("shakes its head.", "shivers.")
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'code/modules/ziggers/sounds/rat.ogg'
	speak_chance = 0
	turns_per_move = 5
	see_in_dark = 6
	butcher_results = list(/obj/item/food/meat/slab = 1)
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	can_be_held = TRUE
	density = FALSE
	anchored = FALSE
	footstep_type = FOOTSTEP_MOB_CLAW
	bloodquality = BLOOD_QUALITY_LOW
	bloodpool = 1
	maxbloodpool = 1
	del_on_death = 1
	maxHealth = 20
	health = 20
	harm_intent_damage = 10
	melee_damage_lower = 10
	melee_damage_upper = 10
	speed = 0

/mob/living/simple_animal/hostile/beastmaster/rat/Initialize()
	. = ..()
	pixel_w = rand(-8, 8)
	pixel_z = rand(-8, 8)

/mob/living/simple_animal/hostile/beastmaster/rat/flying
	icon = 'code/modules/ziggers/mobs.dmi'
	icon_state = "bat"
	icon_living = "bat"
	icon_dead = "bat_dead"
	name = "bat"
	desc = "It's a bat."
	is_flying_animal = TRUE
	speed = -1

/mob/living/simple_animal/hostile/beastmaster/rat/flying/UnarmedAttack(atom/A)
	. = ..()
	if(ishuman(A))
		var/mob/living/carbon/human/H = A
		if(H.bloodpool)
			if(prob(5))
				H.bloodpool = max(0, H.bloodpool-1)
				beastmaster.bloodpool = min(beastmaster.maxbloodpool, beastmaster.bloodpool+1)

/datum/socialrole/shop
	s_tones = list("albino",
								"caucasian1",
								"caucasian2",
								"caucasian3")

	min_age = 18
	max_age = 45
	preferedgender = MALE
	male_names = null
	surnames = null

	hair_colors = list("040404",	//Black
										"120b05",	//Dark Brown
										"342414",	//Brown
										"554433",	//Light Brown
										"695c3b",	//Dark Blond
										"ad924e",	//Blond
										"dac07f",	//Light Blond
										"802400",	//Ginger
										"a5380e",	//Ginger alt
										"ffeace",	//Albino
										"650b0b",	//Punk Red
										"14350e",	//Punk Green
										"080918")	//Punk Blue
	male_hair = list("Balding Hair",
										"Bedhead",
										"Bedhead 2",
										"Bedhead 3",
										"Boddicker",
										"Business Hair",
										"Business Hair 2",
										"Business Hair 3",
										"Business Hair 4",
										"Coffee House",
										"Combover",
										"Crewcut",
										"Father",
										"Flat Top",
										"Gelled Back",
										"Joestar",
										"Keanu Hair",
										"Oxton",
										"Volaju")
	male_facial = list("Beard (Abraham Lincoln)",
											"Beard (Chinstrap)",
											"Beard (Full)",
											"Beard (Cropped Fullbeard)",
											"Beard (Hipster)",
											"Beard (Neckbeard)",
											"Beard (Three o Clock Shadow)",
											"Beard (Five o Clock Shadow)",
											"Beard (Seven o Clock Shadow)",
											"Moustache (Hulk Hogan)",
											"Moustache (Watson)",
											"Sideburns (Elvis)",
											"Sideburns",
											"Shaved")

	shoes = list(/obj/item/clothing/shoes/vampire/sneakers,
								/obj/item/clothing/shoes/vampire,
								/obj/item/clothing/shoes/vampire/brown)
	uniforms = list(/obj/item/clothing/under/vampire/mechanic)
	pockets = list(/obj/item/vamp/keys/npc,
					/obj/item/stack/dollar/rand)

	male_phrases = list("Wanna buy something?",
											"Can I help?",
											"Hey, wanna buy it?")
	neutral_phrases = list("Wanna buy something?",
											"Can I help?",
											"Hey, wanna buy it?")
	random_phrases = list("Check this!",
												"Can I help?",
												"Hey, wanna buy it?")
	answer_phrases = list("I just work here...")
	help_phrases = list("What in the god damn?!",
											"Go away or I will call the cops!!",
											"What is happening?!",
											"Stop doing this!",
											"Someone, call the ambulance!")

/mob/living/carbon/human/npc/shop
	frakcja = "City"
	staying = TRUE
	is_talking = TRUE

/mob/living/carbon/human/npc/shop/Initialize()
	..()
	if(prob(66))
		base_body_mod = "f"
	AssignSocialRole(/datum/socialrole/shop)

/datum/socialrole/shop/bacotell
	uniforms = list(/obj/item/clothing/under/vampire/bacotell)

/mob/living/carbon/human/npc/bacotell
	frakcja = "City"
	staying = TRUE

/mob/living/carbon/human/npc/bacotell/Initialize()
	..()
	if(prob(66))
		base_body_mod = "f"
	AssignSocialRole(/datum/socialrole/shop/bacotell)

/datum/socialrole/shop/bubway
	uniforms = list(/obj/item/clothing/under/vampire/bubway)

/mob/living/carbon/human/npc/bubway
	frakcja = "City"
	staying = TRUE

/mob/living/carbon/human/npc/bubway/Initialize()
	..()
	if(prob(66))
		base_body_mod = "f"
	AssignSocialRole(/datum/socialrole/shop/bubway)

/datum/socialrole/shop/gummaguts
	uniforms = list(/obj/item/clothing/under/vampire/gummaguts)

/mob/living/carbon/human/npc/gummaguts
	frakcja = "City"
	staying = TRUE

/mob/living/carbon/human/npc/gummaguts/Initialize()
	..()
	if(prob(66))
		base_body_mod = "f"
	AssignSocialRole(/datum/socialrole/shop/gummaguts)

/datum/socialrole/police
	s_tones = list("albino",
								"caucasian1",
								"caucasian2",
								"caucasian3")

	min_age = 18
	max_age = 45
	preferedgender = MALE
	male_names = null
	surnames = null

	hair_colors = list("040404",	//Black
										"120b05",	//Dark Brown
										"342414",	//Brown
										"554433",	//Light Brown
										"695c3b",	//Dark Blond
										"ad924e",	//Blond
										"dac07f",	//Light Blond
										"802400",	//Ginger
										"a5380e",	//Ginger alt
										"ffeace",	//Albino
										"650b0b",	//Punk Red
										"14350e",	//Punk Green
										"080918")	//Punk Blue
	male_hair = list("Balding Hair",
										"Bedhead",
										"Bedhead 2",
										"Bedhead 3",
										"Boddicker",
										"Business Hair",
										"Business Hair 2",
										"Business Hair 3",
										"Business Hair 4",
										"Coffee House",
										"Combover",
										"Crewcut",
										"Father",
										"Flat Top",
										"Gelled Back",
										"Joestar",
										"Keanu Hair",
										"Oxton",
										"Volaju")
	male_facial = list("Beard (Abraham Lincoln)",
											"Beard (Chinstrap)",
											"Beard (Full)",
											"Beard (Cropped Fullbeard)",
											"Beard (Hipster)",
											"Beard (Neckbeard)",
											"Beard (Three o Clock Shadow)",
											"Beard (Five o Clock Shadow)",
											"Beard (Seven o Clock Shadow)",
											"Moustache (Hulk Hogan)",
											"Moustache (Watson)",
											"Sideburns (Elvis)",
											"Sideburns",
											"Shaved")

	shoes = list(/obj/item/clothing/shoes/vampire/jackboots)
	uniforms = list(/obj/item/clothing/under/vampire/police)
	hats = list(/obj/item/clothing/head/vampire/police)
	suits = list(/obj/item/clothing/suit/vampire/vest)
	pockets = list(/obj/item/vamp/keys/police,
					/obj/item/stack/dollar/rand)

	male_phrases = list("I see you.",
											"Looking suspicious...",
											"I got some bullets if you got some crime-ass ideas.",
											"I'm the law.",
											"Have you seen man in black coat with black hair?")
	neutral_phrases = list("I see you.",
											"Looking suspicious...",
											"I got some bullets if you got some crime-ass ideas.",
											"I'm the law.",
											"Have you seen man in black coat with black hair?")
	random_phrases = list("I see you.",
											"Looking suspicious...",
											"I got some bullets if you got some crime-ass ideas.",
											"I'm the law.",
											"Have you seen man in black coat with black hair?")
	answer_phrases = list("I'm here to protect you.")
	help_phrases = list("Lay down!",
											"Stop right there!!",
											"Drop your weapon!",
											"Stop there right now!!",
											"This is SFPD, stay down!")

/mob/living/carbon/human/npc/police
	frakcja = "City"
	fights_anyway = TRUE
	max_stat = 4

/mob/living/carbon/human/npc/police/Initialize()
	..()
	if(prob(66))
		base_body_mod = "f"
	if(prob(50))
		my_weapon = new /obj/item/gun/ballistic/automatic/vampire/deagle(src)
	else
		my_weapon = new /obj/item/gun/ballistic/automatic/vampire/ar15(src)
	AssignSocialRole(/datum/socialrole/police)

/mob/living/carbon/human/npc/police/Life()
	. = ..()
	if(stat < 1)
		if(prob(10))
			for(var/mob/living/carbon/human/H in oviewers(4, src))
				if(H)
					if(H.warrant)
						Aggro(H, FALSE)

/datum/socialrole/guard
	s_tones = list("albino",
								"caucasian1",
								"caucasian2",
								"caucasian3")

	min_age = 18
	max_age = 85
	preferedgender = MALE
	male_names = null
	surnames = null

	hair_colors = list("040404",	//Black
										"120b05",	//Dark Brown
										"342414",	//Brown
										"554433",	//Light Brown
										"695c3b",	//Dark Blond
										"ad924e",	//Blond
										"dac07f",	//Light Blond
										"802400",	//Ginger
										"a5380e",	//Ginger alt
										"ffeace",	//Albino
										"650b0b",	//Punk Red
										"14350e",	//Punk Green
										"080918")	//Punk Blue
	male_hair = list("Balding Hair",
										"Bedhead",
										"Bedhead 2",
										"Bedhead 3",
										"Boddicker",
										"Business Hair",
										"Business Hair 2",
										"Business Hair 3",
										"Business Hair 4",
										"Coffee House",
										"Combover",
										"Crewcut",
										"Father",
										"Flat Top",
										"Gelled Back",
										"Joestar",
										"Keanu Hair",
										"Oxton",
										"Volaju")
	male_facial = list("Beard (Abraham Lincoln)",
											"Beard (Chinstrap)",
											"Beard (Full)",
											"Beard (Cropped Fullbeard)",
											"Beard (Hipster)",
											"Beard (Neckbeard)",
											"Beard (Three o Clock Shadow)",
											"Beard (Five o Clock Shadow)",
											"Beard (Seven o Clock Shadow)",
											"Moustache (Hulk Hogan)",
											"Moustache (Watson)",
											"Sideburns (Elvis)",
											"Sideburns",
											"Shaved")

	shoes = list(/obj/item/clothing/shoes/vampire)
	uniforms = list(/obj/item/clothing/under/vampire/guard)
	pockets = list(/obj/item/vamp/keys/npc,
					/obj/item/stack/dollar/rand)

	male_phrases = list("I see you.",
											"Looking suspicious...",
											"I got some bullets if you got some crime-ass ideas.",
											"I'm the law.",
											"Have you seen man in black coat with black hair?")
	neutral_phrases = list("I see you.",
											"Looking suspicious...",
											"I got some bullets if you got some crime-ass ideas.",
											"I'm the law.",
											"Have you seen man in black coat with black hair?")
	random_phrases = list("I see you.",
											"Looking suspicious...",
											"I got some bullets if you got some crime-ass ideas.",
											"I'm the law.",
											"Have you seen man in black coat with black hair?")
	answer_phrases = list("I'm here to protect you.")
	help_phrases = list("Lay down!",
											"Stop right there!!",
											"Drop your weapon!",
											"Stop there right now!!",
											"This is SFPD, stay down!")

/mob/living/carbon/human/npc/guard
	frakcja = "City"
	staying = TRUE
	fights_anyway = TRUE
	max_stat = 4

/mob/living/carbon/human/npc/guard/Initialize()
	..()
	if(prob(66))
		base_body_mod = "f"
	my_weapon = new /obj/item/gun/ballistic/automatic/vampire/deagle(src)
	AssignSocialRole(/datum/socialrole/guard)

/mob/living/carbon/human/npc/walkby/club/Life()
	. = ..()
	if(staying && stat < 2)
		if(prob(5))
			var/hasjukebox = FALSE
			for(var/obj/machinery/jukebox/J in range(5, src))
				if(J)
					hasjukebox = TRUE
					if(J.active)
						if(prob(50))
							dancefirst(src)
						else
							dancesecond(src)
			if(!hasjukebox)
				staying = FALSE

/mob/living/carbon/human/npc/walkby/club
	frakcja = "City"
	staying = TRUE

/datum/socialrole/stripfemale
	s_tones = list("albino",
								"caucasian1",
								"caucasian2",
								"caucasian3")

	min_age = 18
	max_age = 30
	preferedgender = FEMALE
	female_names = null
	surnames = null

	hair_colors = list("040404",	//Black
										"120b05",	//Dark Brown
										"342414",	//Brown
										"554433",	//Light Brown
										"695c3b",	//Dark Blond
										"ad924e",	//Blond
										"dac07f",	//Light Blond
										"802400",	//Ginger
										"a5380e",	//Ginger alt
										"ffeace",	//Albino
										"650b0b",	//Punk Red
										"14350e",	//Punk Green
										"080918")	//Punk Blue
	female_hair = list("Ahoge",
										"Long Bedhead",
										"Beehive",
										"Beehive 2",
										"Bob Hair",
										"Bob Hair 2",
										"Bob Hair 3",
										"Bob Hair 4",
										"Bobcurl",
										"Braided",
										"Braided Front",
										"Braid (Short)",
										"Braid (Low)",
										"Bun Head",
										"Bun Head 2",
										"Bun Head 3",
										"Bun (Large)",
										"Bun (Tight)",
										"Double Bun",
										"Emo",
										"Emo Fringe",
										"Feather",
										"Gentle",
										"Long Hair 1",
										"Long Hair 2",
										"Long Hair 3",
										"Long Over Eye",
										"Long Emo",
										"Long Fringe",
										"Ponytail",
										"Ponytail 2",
										"Ponytail 3",
										"Ponytail 4",
										"Ponytail 5",
										"Ponytail 6",
										"Ponytail 7",
										"Ponytail (High)",
										"Ponytail (Short)",
										"Ponytail (Long)",
										"Ponytail (Country)",
										"Ponytail (Fringe)",
										"Poofy",
										"Short Hair Rosa",
										"Shoulder-length Hair",
										"Volaju")

	shoes = list(/obj/item/clothing/shoes/vampire/heels)
	uniforms = list(/obj/item/clothing/under/vampire/whore)
	backpacks = list()

	female_phrases = list("Wanna touch this boobies?",
											"Do you like my butt?",
											"Wanna play?",
											"He-he.",
											"Any dance for you...",
											"Sit and rest.",
											"Do you like this?",
											"Ahh...")
	neutral_phrases = list("Wanna touch this boobies?",
											"Do you like my butt?",
											"Wanna play?",
											"He-he.",
											"Any dance for you...",
											"Sit and rest.",
											"Do you like this?",
											"Ahh...")
	random_phrases = list("Wanna touch this boobies?",
											"Do you like my butt?",
											"Wanna play?",
											"He-he.",
											"Any dance for you...",
											"Sit and rest.",
											"Do you like this?",
											"Ahh...")
	answer_phrases = list("That'll cost...",
												"He-he-he.",
												"Twenty bucks.",
												"Sure you do...")
	help_phrases = list("Oh God!",
											"Ahhh!!",
											"I'm just a strip worker!",
											"Stop!",
											"Help me!",
											"Help!")

/mob/living/carbon/human/npc/stripper
	frakcja = "City"
	staying = TRUE

/mob/living/carbon/human/npc/stripper/Initialize()
	..()
	base_body_mod = "s"
	AssignSocialRole(/datum/socialrole/stripfemale)
	underwear = "Nude"
	undershirt = "Nude"
	socks = "Nude"
	update_body()

/mob/living/carbon/human/npc/stripper/Life()
	. = ..()
	if(stat < 2)
		if(prob(20))
			for(var/obj/structure/pole/P in range(1, src))
				if(P)
					drop_all_held_items()
					ClickOn(P)

/mob/living/carbon/human/npc/incel
	frakcja = "City"
	staying = TRUE

/mob/living/carbon/human/npc/incel/Initialize()
	..()
	if(prob(50))
		base_body_mod = "f"
	AssignSocialRole(/datum/socialrole/usualmale)

/datum/socialrole/shop/illegal
	masks = list(/obj/item/clothing/mask/vampire/balaclava)
	shoes = list(/obj/item/clothing/shoes/vampire/sneakers)
	uniforms = list(/obj/item/clothing/under/vampire/emo)
	pockets = list(/obj/item/stack/dollar/rand)

	male_phrases = list("Pss... wanna try some weed?",
											"Hey, vagabond...",
											"Check this shit...")
	neutral_phrases = list("Pss... wanna try some weed?",
											"Hey, vagabond...",
											"Check this shit...")
	random_phrases = list("Pss... wanna try some weed?",
											"Hey, vagabond...",
											"Check this shit...")
	answer_phrases = list("Nothing personal...")
	help_phrases = list("Cops!",
											"Fuck the police!!",
											"COPS?!!")

/mob/living/carbon/human/npc/illegal
	frakcja = "City"
	staying = TRUE
	is_talking = TRUE

/mob/living/carbon/human/npc/illegal/Initialize()
	..()
	AssignSocialRole(/datum/socialrole/shop/illegal)