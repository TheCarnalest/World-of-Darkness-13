/datum/action/innate/drink_blood
	name = "Испить смертного... Или не только смертного"
	desc = "При активации выпиваете кровь ближайшей жертвы"
/datum/action/innate/drinkblood/Activate()
	. = ..()
	var/choice = tgui_input_list(owner, "Выберете жертву", "SOSALKS", oviewers(1, owner))
	choice.Paralyze(200)
