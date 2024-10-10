
/datum/app/icq
	title = "ICQ"
	app_type = "icq"
	var/list/datum/message/messages = list()
	var/username = ""

/datum/app/icq/proc/SendMessage(message)
	var/datum/message/send = new(username, message)
	for(var/obj/vampire_computer/C in GLOB.vampire_computers)
		var/datum/app/icq/app = C.apps[1]
		app.messages += send

/datum/app/icq/data()
	. = ..()
	. += list("username" = username)
	var/list/data_messages = list()
	for(var/datum/message/message in messages)
		data_messages += list(list("author" = message.author, "message" = message.message))
	. += list("messages" = data_messages)

/datum/message
	var/author
	var/message

/datum/message/New(param_author, param_message)
	author = param_author
	message = param_message

/datum/app/error
	title = "Error!"
	app_type = "error"
	width = 330
	height = 100
	x = 300
	y = 300
	desktop_app = FALSE
	var/error_message

/datum/app/error/data()
	. = ..()
	. += list("error_message" = error_message)

/datum/app/notepad
	title = "Notepad"
	app_type = "notepad"
	var/text
	var/wordWrap = FALSE

/datum/app/notepad/data()
	. = ..()
	. += list("text" = text)
	. += list("wordWrap" = wordWrap)

/datum/app/gmail
	title = "Gmail"
	app_type = "gmail"
	var/list/datum/email/emails = list()
	var/email_adress = "test@gmail.com"
	var/screen = 1
	var/datum/email/current_email

/datum/app/gmail/data()
	. = ..()
	.+=list("email_adress" = email_adress)
	var/list/data_emails = list()
	for(var/datum/email/email in emails)
		var/list/data_email = email.to_data()
		data_email["reference"] = REF(email)
		data_emails += list(data_email)
	. += list("emails" = data_emails)
	. += list("screen" = screen)
	if(current_email)
		var/list/data_current_email = current_email.to_data()
		data_current_email["reference"] = REF(current_email)
		. += list("current_email" = data_current_email)


/datum/app/gmail/proc/send_email(param_message, params_subject, params_to)
	var/datum/email/email = new (email_adress, param_message, params_subject)
	for(var/obj/vampire_computer/C in GLOB.vampire_computers)
		var/datum/app/gmail/gmail = C.apps[3]
		if(gmail.email_adress == params_to)
			gmail.emails.Add(email)
			screen = 1
			return TRUE
	return FALSE

/datum/app/gmail/proc/generate_email()
	var/newEmail
	newEmail += pick("the", "if", "of", "as", "in", "a", "you", "from", "to", "an", "too", "little", "snow", "dead", "drunk", "rosebud", "duck", "al", "le")
	newEmail += pick("diamond", "beer", "mushroom", "assistant", "clown", "captain", "twinkie", "security", "nuke", "small", "big", "escape", "yellow", "gloves", "monkey", "engine", "nuclear", "ai")
	newEmail += pick("1", "2", "3", "4", "5", "6", "7", "8", "9", "0")
	newEmail += pick("1", "2", "3", "4", "5", "6", "7", "8", "9", "0")
	newEmail += "@gmail.com"
	email_adress = newEmail

/datum/email
	var/sender
	var/message
	var/date
	var/checked = FALSE
	var/stared = FALSE
	var/email_title = "none"
	var/subject

/datum/email/New(param_sender, param_message, param_subject)
	sender = param_sender
	subject = param_subject
	message = param_message
	date = SScity_time.timeofnight

/datum/email/proc/to_data()
	var/list/data = list("subject"=subject, "sender" = sender, "message" = message, "date" = date, "checked" = checked, "stared" = stared)
	return data

/datum/app/news
	title = "News"
	app_type = "news"
	var/text = "No messages"
	var/can_send = FALSE

/datum/app/news/data()
	.=..()
	. += list("text"=text)
	. += list("can_send"=can_send)
