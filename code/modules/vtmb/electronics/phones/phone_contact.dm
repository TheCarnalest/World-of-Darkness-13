
/datum/phonecontact
	var/name = "Unknown"
	var/number = ""

/datum/phonecontact/New()
	..()
	check_global_contacts()

/datum/phonecontact/proc/check_global_contacts()
	return FALSE

/datum/phonecontact/brujah
	name = "Primogen Brujah"

/datum/phonecontact/brujah/check_global_contacts()
	if(number != GLOB.brujahnumber)
		number = GLOB.brujahnumber
		return TRUE
	..()

/datum/phonecontact/malkavian
	name = "Primogen Malkavian"

/datum/phonecontact/malkavian/check_global_contacts()
	if(number != GLOB.malkaviannumber)
		number = GLOB.malkaviannumber
		return TRUE
	..()

/datum/phonecontact/nosferatu
	name = "Primogen Nosferatu"

/datum/phonecontact/nosferatu/check_global_contacts()
	if(number != GLOB.nosferatunumber)
		number = GLOB.nosferatunumber
		return TRUE
	..()

/datum/phonecontact/toreador
	name = "Primogen Toreador"

/datum/phonecontact/toreador/check_global_contacts()
	if(number != GLOB.toreadornumber)
		number = GLOB.toreadornumber
		return TRUE
	..()

/datum/phonecontact/ventrue
	name = "Primogen Ventrue"

/datum/phonecontact/ventrue/check_global_contacts()
	if(number != GLOB.ventruenumber)
		number = GLOB.ventruenumber
		return TRUE
	..()

/datum/phonecontact/prince
	name = "Prince"

/datum/phonecontact/prince/check_global_contacts()
	if(number != GLOB.princenumber)
		number = GLOB.princenumber
		return TRUE
	..()

/datum/phonecontact/sheriff
	name = "Sheriff"

/datum/phonecontact/sheriff/check_global_contacts()
	if(number != GLOB.sheriffnumber)
		number = GLOB.sheriffnumber
		return TRUE
	..()

/datum/phonecontact/clerk
	name = "Seneschal"

/datum/phonecontact/clerk/check_global_contacts()
	if(number != GLOB.clerknumber)
		number = GLOB.clerknumber
		return TRUE
	..()

/datum/phonecontact/barkeeper
	name = "Baron"

/datum/phonecontact/barkeeper/check_global_contacts()
	if(number != GLOB.barkeepernumber)
		number = GLOB.barkeepernumber
		return TRUE
	..()

/datum/phonecontact/dealer
	name = "Dealer"

/datum/phonecontact/dealer/check_global_contacts()
	if(number != GLOB.dealernumber)
		number = GLOB.dealernumber
		return TRUE
	..()
