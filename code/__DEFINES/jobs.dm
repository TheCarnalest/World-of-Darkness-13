#define get_job_playtime(client, job) ((client.prefs.exp[job]) ? client.prefs.exp[job] MINUTES_TO_DECISECOND : 0)

#define JOB_AVAILABLE 0
#define JOB_UNAVAILABLE_GENERIC 1
#define JOB_UNAVAILABLE_BANNED 2
#define JOB_UNAVAILABLE_PLAYTIME 3
#define JOB_UNAVAILABLE_ACCOUNTAGE 4
#define JOB_UNAVAILABLE_SLOTFULL 5
#define JOB_UNAVAILABLE_GENERATION 6
#define JOB_UNAVAILABLE_MASQUERADE 7
#define JOB_UNAVAILABLE_SPECIES 8
#define JOB_UNAVAILABLE_SPECIES_LIMITED 9
#define JOB_UNAVAILABLE_CLAN 10
#define JOB_UNAVAILABLE_AGE 11
#define JOB_UNAVAILABE_TIME_LOCK 12

#define DEFAULT_RELIGION "Christianity"
#define DEFAULT_DEITY "Space Jesus"

// Job Display order on preference

#define JOB_DISPLAY_ORDER_DEFAULT 0

#define JOB_DISPLAY_ORDER_CITIZEN 1
#define JOB_DISPLAY_ORDER_PRINCE 2
#define JOB_DISPLAY_ORDER_SHERIFF 3
#define JOB_DISPLAY_ORDER_CLERK 4
#define JOB_DISPLAY_ORDER_AGENT 5
#define JOB_DISPLAY_ORDER_BRUJAH 6
#define JOB_DISPLAY_ORDER_MALKAVIAN 7
#define JOB_DISPLAY_ORDER_NOSFERATU 8
#define JOB_DISPLAY_ORDER_TOREADOR 9
#define JOB_DISPLAY_ORDER_VENTRUE 10
#define JOB_DISPLAY_ORDER_PRIEST 11
#define JOB_DISPLAY_ORDER_GRAVEYARD 12
#define JOB_DISPLAY_ORDER_DOCTOR 13
#define JOB_DISPLAY_ORDER_STREETJAN 14
#define JOB_DISPLAY_ORDER_STRIP 15
#define JOB_DISPLAY_ORDER_TAXI 16
#define JOB_DISPLAY_ORDER_TRIAD_GANGSTER 17
#define JOB_DISPLAY_ORDER_BARKEEPER 18
#define JOB_DISPLAY_ORDER_BOUNCER 19
#define JOB_DISPLAY_ORDER_DEALER 20
#define JOB_DISPLAY_ORDER_SUPPLY 21
#define JOB_DISPLAY_ORDER_REGENT 22
#define JOB_DISPLAY_ORDER_ARCHIVIST 23
#define JOB_DISPLAY_ORDER_GIOVANNI 24
#define JOB_DISPLAY_ORDER_POLICE_CHIEF 25
#define JOB_DISPLAY_ORDER_POLICE 26
#define JOB_DISPLAY_ORDER_POLICE_SERGEANT 27
#define JOB_DISPLAY_ORDER_FBI 28
#define JOB_DISPLAY_ORDER_VOIVODE 29
#define JOB_DISPLAY_ORDER_BOGATYR 30
#define JOB_DISPLAY_ORDER_ZADRUGA 31


// Job Titles
#define JOB_LIVING_ROLES /datum/timelock/living

#define JOB_CIVILIAN "Citizen"

#define JOB_UNALIGNED_ROLES   /datum/timelock/unaligned
#define JOB_UNALIGNED_ROLES_LIST   list(JOB_CIVILIAN)

#define JOB_PRINCE "Prince"
#define JOB_CLERK "Seneschal"
#define JOB_SHERIFF "Sheriff"
#define JOB_AGENT "Scourge"

#define JOB_CAMARILLA_AUTHORITIES_ROLES    /datum/timelock/camarilla_authorities
#define JOB_CAMARILLA_AUTHORITIES_ROLES_LIST   list(JOB_SHERIFF, JOB_AGENT, JOB_CLERK, JOB_PRINCE)


#define JOB_BRUJAH "Primogen Brujah"
#define JOB_MALKAVIAN "Primogen Malkavian"
#define JOB_NOSFERATU "Primogen Nosferatu"
#define JOB_TOREADOR "Primogen Toreador"
#define JOB_VENTRUE "Primogen Ventrue"

#define JOB_CAMARILLA_COUNCIL_ROLES    /datum/timelock/camarilla_council
#define JOB_CAMARILLA_COUNCIL_ROLES_LIST   list(JOB_BRUJAH, JOB_MALKAVIAN,JOB_NOSFERATU, JOB_TOREADOR, JOB_VENTRUE)


#define JOB_PRIEST "Priest"

#define JOB_CHURCH_ROLES    /datum/timelock/church
#define JOB_CHURCH_ROLES_LIST   list(JOB_PRIEST)


#define JOB_GRAVEYARD "Graveyard Keeper"
#define JOB_DOCTOR "Doctor"
#define JOB_STREETJAN "Street Janitor"
#define JOB_STRIP "Stripper"
#define JOB_TAXI "Taxi Driver"

#define JOB_CITY_SERVICES_ROLES    /datum/timelock/city_services
#define JOB_CITY_SERVICES_ROLES_LIST   list(JOB_GRAVEYARD, JOB_DOCTOR,JOB_STREETJAN, JOB_STRIP, JOB_TAXI)

#define JOB_TRIAD_GANGSTER "Triad Soldier"

#define JOB_GANG_ROLES    /datum/timelock/gang
#define JOB_GANG_ROLES_LIST   list(JOB_TRIAD_GANGSTER)

#define JOB_BARKEEPER "Baron"
#define JOB_BOUNCER "Bouncer"

#define JOB_ANARCH_ROLES    /datum/timelock/anarch
#define JOB_ANARCH_ROLES_LIST   list(JOB_BARKEEPER,JOB_BOUNCER)

#define JOB_DEALER "Dealer"
#define JOB_SUPPLY "Supply Technician"

#define JOB_WAREHOUSE_ROLES    /datum/timelock/warehouse
#define JOB_WAREHOUSE_ROLES_LIST   list(JOB_DEALER,JOB_SUPPLY)

#define JOB_REGENT "Chantry Regent"
#define JOB_ARCHIVIST "Chantry Archivist"

#define JOB_TREMERE_ROLES    /datum/timelock/tremere
#define JOB_TREMERE_ROLES_LIST   list(JOB_REGENT,JOB_ARCHIVIST)

#define JOB_GIOVANNI_CAPO "Capo"
#define JOB_GIOVANNI_SQUADRA "La Squadra"
#define JOB_GIOVANNI_FAMIGLIA "La Famiglia"

#define JOB_GIOVANNI_ROLES    /datum/timelock/giovanni_family
#define JOB_GIOVANNI_ROLES_LIST   list(JOB_GIOVANNI_CAPO,JOB_GIOVANNI_SQUADRA,JOB_GIOVANNI_FAMIGLIA)

#define JOB_POLICE_CHIEF "Police Chief"
#define JOB_POLICE_SERGEANT "Police Sergeant"
#define JOB_POLICE "Police Officer"

#define JOB_POLICE_ROLES    /datum/timelock/police_force
#define JOB_POLICE_ROLES_LIST   list(JOB_POLICE_CHIEF,JOB_POLICE_SERGEANT,JOB_POLICE)

#define JOB_FBI "Federal Investigator"

#define JOB_NATIONAL_SECURITY_ROLES    /datum/timelock/national_security
#define JOB_NATIONAL_SECURITY_ROLES_LIST   list(JOB_FBI)

#define JOB_VOIVODE "Voivode"
#define JOB_BOGATYR "Bogatyr"
#define JOB_ZADRUGA "Zadruga"

#define JOB_TZIMISCE_MANSION_ROLES    /datum/timelock/tzimisce_mansion_v
#define JOB_TZIMISCE_MANSION_ROLES_LIST   list(JOB_VOIVODE,JOB_BOGATYR,JOB_ZADRUGA)



#define TIMELOCK_JOB(role_id, hours) new/datum/timelock(role_id, hours, role_id)



// Used to add a timelock to a job. Will be passed onto derivatives
#define AddTimelock(Path, timelockList) \
##Path/setup_requirements(list/L){\
	L += timelockList;\
	. = ..(L);\
}

// Used to add a timelock to a job. Will be passed onto derivates. Will not include the parent's timelocks.
#define OverrideTimelock(Path, timelockList) \
##Path/setup_requirements(list/L){\
	L = timelockList;\
	. = ..(L);\
}




// #define JOB_DISPLAY_ORDER_INVESTIGATOR 25
// #define JOB_DISPLAY_ORDER_CHAPLAIN 26
/*
#define JOB_DISPLAY_ORDER_ASSISTANT 1
#define JOB_DISPLAY_ORDER_CAPTAIN 2
#define JOB_DISPLAY_ORDER_HEAD_OF_PERSONNEL 3
#define JOB_DISPLAY_ORDER_QUARTERMASTER 4
#define JOB_DISPLAY_ORDER_CARGO_TECHNICIAN 5
#define JOB_DISPLAY_ORDER_SHAFT_MINER 6
#define JOB_DISPLAY_ORDER_BARTENDER 7
#define JOB_DISPLAY_ORDER_COOK 8
#define JOB_DISPLAY_ORDER_BOTANIST 9
#define JOB_DISPLAY_ORDER_JANITOR 10
#define JOB_DISPLAY_ORDER_CLOWN 11
#define JOB_DISPLAY_ORDER_MIME 12
#define JOB_DISPLAY_ORDER_CURATOR 13
#define JOB_DISPLAY_ORDER_LAWYER 14
#define JOB_DISPLAY_ORDER_CHAPLAIN 15
#define JOB_DISPLAY_ORDER_AI 16
#define JOB_DISPLAY_ORDER_CYBORG 17
#define JOB_DISPLAY_ORDER_CHIEF_ENGINEER 18
#define JOB_DISPLAY_ORDER_STATION_ENGINEER 19
#define JOB_DISPLAY_ORDER_ATMOSPHERIC_TECHNICIAN 20
#define JOB_DISPLAY_ORDER_CHIEF_MEDICAL_OFFICER 21
#define JOB_DISPLAY_ORDER_MEDICAL_DOCTOR 22
#define JOB_DISPLAY_ORDER_PARAMEDIC 23
#define JOB_DISPLAY_ORDER_CHEMIST 24
#define JOB_DISPLAY_ORDER_VIROLOGIST 25
#define JOB_DISPLAY_ORDER_PSYCHOLOGIST 26
#define JOB_DISPLAY_ORDER_RESEARCH_DIRECTOR 27
#define JOB_DISPLAY_ORDER_SCIENTIST 28
#define JOB_DISPLAY_ORDER_ROBOTICIST 29
#define JOB_DISPLAY_ORDER_GENETICIST 30
#define JOB_DISPLAY_ORDER_HEAD_OF_SECURITY 31
#define JOB_DISPLAY_ORDER_WARDEN 32
#define JOB_DISPLAY_ORDER_DETECTIVE 33
#define JOB_DISPLAY_ORDER_SECURITY_OFFICER 34
#define JOB_DISPLAY_ORDER_PRISONER 35
*/
