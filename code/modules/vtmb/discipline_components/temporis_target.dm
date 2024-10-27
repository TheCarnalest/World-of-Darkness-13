/datum/component/temporis_target

/datum/component/temporis_target/RegisterWithParent()
	RegisterSignal(parent, COMSIG_MOVABLE_MOVED, PROC_REF(moved))
	RegisterSignal(parent, COMSIG_MOB_ITEM_ATTACK, PROC_REF(tattack))
	RegisterSignal(parent, COMSIG_ITEM_ATTACK_OBJ, PROC_REF(item_attack_obj))
	RegisterSignal(parent, COMSIG_LIVING_RESIST, PROC_REF(living_resist))
	RegisterSignal(parent, COMSIG_ACTION_TRIGGER, PROC_REF(action_trigger))
	RegisterSignal(parent, COMSIG_MOB_EMOTE, PROC_REF(mob_emote))
	RegisterSignal(parent, COMSIG_MOB_SAY, PROC_REF(mob_say))
	RegisterSignal(parent, COMSIG_STORAGE_ENTERED, PROC_REF(storage_entered))
	RegisterSignal(parent, COMSIG_STORAGE_EXITED, PROC_REF(storage_exited))


/datum/component/temporis_target/proc/moved(source, var/OldLoc, var/Dir, var/Forced)
	SIGNAL_HANDLER
	//assumes that only mobs will ever get this component
	var/mob/living/target = source
	var/NewLoc = target.loc
	if (!Forced)
		spawn(2 SECONDS)
			target.forceMove(OldLoc)
			target.Move(NewLoc, Dir)




