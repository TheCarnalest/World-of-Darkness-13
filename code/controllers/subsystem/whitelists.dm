SUBSYSTEM_DEF(whitelists)
	name = "Whitelists"
	flags = SS_NO_FIRE
	init_order = INIT_ORDER_WHITELISTS
	var/whitelists_enabled = FALSE

	///All whitelists possible to have, corresponding to everything that's whitelisted.
	var/list/possible_whitelists = list()
	///All whitelist entries found in the database. Format: "CKEY" = list("whitelist1", "whitelist2", ...)
	var/list/datum/whitelist/whitelist_entries = list()

/datum/controller/subsystem/whitelists/Initialize(timeofday)
	if(!SSdbcore.Connect())
		return ..()
	whitelists_enabled = TRUE

	for (var/key in subtypesof(/datum/vampireclane))
		var/datum/vampireclane/clan = new key
		if (clan.whitelisted)
			possible_whitelists += clan.name

	for (var/key in subtypesof(/datum/species))
		var/datum/species/species = new key
		if (species.selectable && species.whitelisted)
			possible_whitelists += species.id

	//placeholder until a proper morality system is added
	possible_whitelists += "enlightenment"

	var/datum/db_query/query = SSdbcore.NewQuery("SELECT ckey,whitelist,approver_ckey,ticket_link,approval_reason,date_whitelisted FROM [format_table_name("whitelist")]")
	if(!query.Execute(async = TRUE))
		qdel(query)
		return
	else
		while(query.NextRow())
			var/datum/whitelist/entry = new(query.item[1], query.item[2], query.item[3], query.item[4], query.item[5], query.item[6])
			whitelist_entries += entry
		qdel(query)

	return ..()

/datum/controller/subsystem/whitelists/proc/is_whitelisted(checked_ckey, checked_whitelist)
	if (!SSdbcore.Connect())
		return TRUE

	for (var/datum/whitelist/current_whitelist in whitelist_entries)
		if ((current_whitelist.ckey == checked_ckey) && (current_whitelist.whitelist == checked_whitelist))
			return TRUE

	return FALSE



