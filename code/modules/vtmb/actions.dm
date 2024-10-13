/datum/action/innate/drink_blood
	name = "Drink Blood"
	desc = "When activated, drink the blood of the nearest victim."
/datum/action/innate/drinkblood/Activate()
	. = ..()
	var/choice = tgui_input_list(owner, "Choose a victim", "SOSALKS", oviewers(1, owner))
	choice.Paralyze(200)
