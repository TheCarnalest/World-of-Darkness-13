/datum/vampireclane/cappadocian
	name = "Cappadocian"
	desc = "A presumed-to-be-extinct Clan of necromancers, the Cappadocians studied death specifically in the physical world. The Giovanni were Embraced into their line to help further their studies into the underworld. They were rewarded with Diablerie and the destruction of their Clan."
	curse = "Extremely corpselike appearance that worsens with age."
	clane_disciplines = list(
		/datum/discipline/auspex = 1,
		/datum/discipline/fortitude = 2,
		/datum/discipline/necromancy = 3
	)
	violating_appearance = FALSE
	alt_sprite = "rotten_1"
	alt_sprite_greyscale = TRUE

	whitelisted = TRUE

/datum/vampireclane/cappadocian/on_gain(mob/living/carbon/human/H)
	var/years_undead = H.chronological_age - H.age
	switch(years_undead)
		if (-INFINITY to 100)
			alt_sprite = "rotten_1"
			alt_sprite_greyscale = TRUE
			violating_appearance = FALSE
		if (100 to 300)
			alt_sprite = "rotten_2"
			alt_sprite_greyscale = TRUE
			violating_appearance = FALSE
		if (300 to 500)
			alt_sprite = "rotten_3"
			alt_sprite_greyscale = FALSE
			violating_appearance = TRUE
		if (500 to INFINITY)
			alt_sprite = "rotten_4"
			alt_sprite_greyscale = FALSE
			violating_appearance = TRUE

	..()

