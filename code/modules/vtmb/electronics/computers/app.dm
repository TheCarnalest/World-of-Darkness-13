/datum/app
	var/title
	var/x = 50
	var/y = 50
	var/minimized= FALSE
	var/launched = FALSE
	var/app_type
	var/width = 660
	var/height = 500
	var/desktop_app = TRUE

/datum/app/proc/data()
	var/list/data = list()
	data["launched"]= launched
	data["type"]= app_type
	data["title"]= title
	data["minimized"]= minimized
	data["x"]= x
	data["y"]= y
	data["width"]= width
	data["height"]= height
	data["desktop_app"]= desktop_app
	return data
