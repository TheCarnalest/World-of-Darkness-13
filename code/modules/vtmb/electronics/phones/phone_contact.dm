
/datum/phonecontact
	var/name = "Unknown"
	var/number = ""

/datum/phonecontact/New()
	..()
	check_global_contacts()

/datum/phonecontact/proc/check_global_contacts()
	return FALSE
// If the phone is opened, this will go through and return true with the Name of the important contact and their number will also exist.


/datum/phonecontact/brujah
	name = "Primogen Brujah"

/datum/phonecontact/brujah/check_global_contacts()
	if(number != GLOB.brujahnumber)
		number = GLOB.brujahnumber
		name = GLOB.brujahname + " - " + " Primogen Brujah"
		return TRUE
	..()

/datum/phonecontact/malkavian
	name = "Primogen Malkavian"

/datum/phonecontact/malkavian/check_global_contacts()
	if(number != GLOB.malkaviannumber)
		number = GLOB.malkaviannumber
		name = GLOB.malkavianname + " - " + " Primogen Malkavian"
		return TRUE
	..()

/datum/phonecontact/nosferatu
	name = "Primogen Nosferatu"

/datum/phonecontact/nosferatu/check_global_contacts()
	if(number != GLOB.nosferatunumber)
		number = GLOB.nosferatunumber
		name = GLOB.nosferatuname + " - " + " Primogen Nosferatu"
		return TRUE
	..()

/datum/phonecontact/toreador
	name = "Primogen Toreador"

/datum/phonecontact/toreador/check_global_contacts()
	if(number != GLOB.toreadornumber)
		number = GLOB.toreadornumber
		name = GLOB.toreadorname + " - " + " Primogen Toreador"
		return TRUE
	..()

/datum/phonecontact/ventrue
	name = "Primogen Ventrue"

/datum/phonecontact/ventrue/check_global_contacts()
	if(number != GLOB.ventruenumber)
		number = GLOB.ventruenumber
		name = GLOB.ventruename + " - " + " Primogen Ventrue"
		return TRUE
	..()

/datum/phonecontact/prince
	name = "Prince"

/datum/phonecontact/prince/check_global_contacts()
	if(number != GLOB.princenumber)
		number = GLOB.princenumber
		name = GLOB.princename + " - " + " Prince"
		return TRUE
	..()

/datum/phonecontact/sheriff
	name = "Sheriff"

/datum/phonecontact/sheriff/check_global_contacts()
	if(number != GLOB.sheriffnumber)
		number = GLOB.sheriffnumber
		name = GLOB.sheriffname + " - " + " Sheriff"
		return TRUE
	..()

/datum/phonecontact/clerk
	name = "Seneschal"

/datum/phonecontact/clerk/check_global_contacts()
	if(number != GLOB.clerknumber)
		number = GLOB.clerknumber
		name = GLOB.clerkname + " - " + " Seneschal"
		return TRUE
	..()

/datum/phonecontact/barkeeper
	name = "Baron"

/datum/phonecontact/barkeeper/check_global_contacts()
	if(number != GLOB.barkeepernumber)
		number = GLOB.barkeepernumber
		name = GLOB.barkeepername + " - " + " Baron"
		return TRUE
	..()

/datum/phonecontact/dealer
	name = "Dealer"

/datum/phonecontact/dealer/check_global_contacts()
	if(number != GLOB.dealernumber)
		number = GLOB.dealernumber
		name = GLOB.dealername + " - " + " Dealer"
		return TRUE
	..()

/datum/phonecontact/tremere
	name = "Tremere Regent"

/datum/phonecontact/tremere/check_global_contacts()
	if(number != GLOB.tremerenumber)
		number = GLOB.tremerenumber
		name = GLOB.tremerename + " - " + " Tremere Regent"
		return TRUE
	..()


