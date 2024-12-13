/datum/action/discipline
	check_flags = NONE
	button_icon = 'code/modules/wod13/UI/actions.dmi' //This is the file for the BACKGROUND icon
	background_icon_state = "discipline" //And this is the state for the background icon
	icon_icon = 'code/modules/wod13/UI/actions.dmi' //This is the file for the ACTION icon
	button_icon_state = "discipline" //And this is the state for the action icon

	vampiric = TRUE
	var/level_icon_state = "1" //And this is the state for the action icon
	var/datum/discipline/discipline
	var/targeting = FALSE

/datum/action/discipline/New(datum/discipline/discipline)
	. = ..()
	src.discipline = discipline

/datum/action/discipline/Grant(mob/M)
	. = ..()
	discipline.assign(M)

/datum/action/discipline/IsAvailable()
	return discipline?.current_power.can_activate_untargeted()

/datum/action/discipline/Trigger()
	. = ..()
	if (!.)
		return .

	if (!discipline?.current_power || !isliving(owner))
		. = FALSE

	var/datum/discipline_power/power = discipline.current_power
	if (power.target_type == NONE) //self activation
		power.try_activate()
	else if (power.range > 0) //ranged targeted activation
		begin_targeting()

	return .

/datum/action/discipline/ApplyIcon(atom/movable/screen/movable/action_button/current_button, force = FALSE)
	if(owner?.client?.prefs?.old_discipline)
		button_icon = 'code/modules/wod13/disciplines.dmi'
		icon_icon = 'code/modules/wod13/disciplines.dmi'
	else
		button_icon = 'code/modules/wod13/UI/actions.dmi'
		icon_icon = 'code/modules/wod13/UI/actions.dmi'
	if(icon_icon && button_icon_state && ((current_button.button_icon_state != button_icon_state) || force))
		current_button.cut_overlays(TRUE)
		if(discipline)
			current_button.name = discipline.name
			current_button.desc = discipline.desc
			current_button.add_overlay(mutable_appearance(icon_icon, "[discipline.icon_state]"))
			current_button.button_icon_state = "[discipline.icon_state]"
			current_button.add_overlay(mutable_appearance(icon_icon, "[discipline.level_casting]"))
		else
			current_button.add_overlay(mutable_appearance(icon_icon, button_icon_state))
			current_button.button_icon_state = button_icon_state

/datum/action/discipline/proc/switch_level()
	SEND_SOUND(owner, sound('code/modules/wod13/sounds/highlight.ogg', 0, 0, 50))
	if (discipline.equipped_powers.len >= (discipline.level_casting + 1))
		discipline.level_casting++
	else
		discipline.level_casting = 1

	discipline.current_power = discipline.equipped_powers[discipline.level_casting]
	if (button)
		ApplyIcon(button, TRUE)

/datum/action/discipline/proc/end_targeting()
	if (!owner?.client)
		return
	if (!targeting)
		return
	var/client/client = owner.client

	UnregisterSignal(owner, COMSIG_MOB_CLICKON)
	targeting = FALSE
	client.mouse_pointer_icon = initial(client.mouse_pointer_icon)

/datum/action/discipline/proc/handle_click(mob/source, atom/target)
	SIGNAL_HANDLER

	//ensure we actually need a target
	if (!targeting)
		end_targeting()
		return
	//prevent using multiple actions at once
	if (istype(target, /atom/movable/screen/movable/action_button))
		end_targeting()
		return
	//actually try to use the Discipline on the target
	if (discipline.try_activate(target))
		end_targeting()
		return

/datum/action/discipline/proc/begin_targeting()
	if (!owner?.client)
		return
	if (targeting)
		return
	var/client/client = owner.client

	SEND_SOUND(owner, sound('code/modules/wod13/sounds/highlight.ogg', 0, 0, 50))
	RegisterSignal(owner, COMSIG_MOB_CLICKON, PROC_REF(handle_click))
	targeting = TRUE
	client.mouse_pointer_icon = 'icons/effects/mouse_pointers/discipline.dmi'

/atom/movable/screen/movable/action_button/Click(location,control,params)
	if(istype(linked_action, /datum/action/discipline))
		var/list/modifiers = params2list(params)
		if(LAZYACCESS(modifiers, "right"))
			var/datum/action/discipline/D = linked_action
			D.switch_level()
			return
		//TODO: middle click to swap loadout
	. = ..()