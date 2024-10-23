/obj/phonevoice
	name = "unknown voice"
	speech_span = SPAN_ROBOT
	anchored = FALSE
	density = FALSE
	opacity = FALSE

/obj/phonevoice/say(message, bubble_type, list/spans = list(), sanitize = TRUE, datum/language/language = null, ignore_spam = FALSE, forced = null)
	if(message == "" || !message)
		return
	spans |= speech_span
	if(!language)
		language = get_selected_language()
	send_speech(message, 2, src, , spans, message_language=language)
//	speech_span = initial(speech_span)
