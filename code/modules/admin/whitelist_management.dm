/datum/admins/proc/whitelist_panel()
	var/list/output = list("All whitelists<br>To edit, use the Grant/Revoke Whitelist verbs.<br><hr>")
	for(var/datum/whitelist/current_whitelist in SSwhitelists.whitelist_entries)
		output += {"
			CKey: [current_whitelist.ckey]
			<br>Whitelist: [current_whitelist.whitelist]
			<br>Approver Ckey: [current_whitelist.approver_ckey]
			<br>Ticket Link: <a href='url'>[current_whitelist.ticket_link]</a>
			<br>Approval Reason: [current_whitelist.approval_reason]
			<br>Date Whitelisted: [current_whitelist.date_whitelisted]
		"}
		output += "<hr style='background:#000000; border:0; height:3px'>"
	var/datum/browser/panel = new(usr, "wlpanel", "Whitelist Panel", 700, 400)
	panel.set_content(jointext(output, ""))
	panel.open()
