GLOBAL_LIST_EMPTY(cable_list)					    //Index for all cables, so that powernets don't have to look through the entire world all the time
GLOBAL_LIST_EMPTY(portals)					        //list of all /obj/effect/portal
GLOBAL_LIST_EMPTY(airlocks)					        //list of all airlocks
GLOBAL_LIST_EMPTY(curtains)							//list of all curtains
GLOBAL_LIST_EMPTY(mechas_list)				        //list of all mechs. Used by hostile mobs target tracking.
GLOBAL_LIST_EMPTY(shuttle_caller_list)  		    //list of all communication consoles and AIs, for automatic shuttle calls when there are none.
GLOBAL_LIST_EMPTY(machines)					        //NOTE: this is a list of ALL machines now. The processing machines list is SSmachine.processing !
GLOBAL_LIST_EMPTY(navigation_computers)				//list of all /obj/machinery/computer/camera_advanced/shuttle_docker
GLOBAL_LIST_EMPTY(syndicate_shuttle_boards)	        //important to keep track of for managing nukeops war declarations.
GLOBAL_LIST_EMPTY(navbeacons)					    //list of all bot nagivation beacons, used for patrolling.
GLOBAL_LIST_EMPTY(teleportbeacons)			        //list of all tracking beacons used by teleporters
GLOBAL_LIST_EMPTY(deliverybeacons)			        //list of all MULEbot delivery beacons.
GLOBAL_LIST_EMPTY(deliverybeacontags)			    //list of all tags associated with delivery beacons.
GLOBAL_LIST_EMPTY(wayfindingbeacons)			    //list of all navigation beacons used by wayfinding pinpointers
GLOBAL_LIST_EMPTY(nuke_list)
GLOBAL_LIST_EMPTY(alarmdisplay)				        //list of all machines or programs that can display station alerts
GLOBAL_LIST_EMPTY_TYPED(singularities, /datum/component/singularity) //list of all singularities on the station
GLOBAL_LIST_EMPTY(mechpad_list)						//list of all /obj/machinery/mechpad

GLOBAL_LIST(chemical_reactions_list)				//list of all /datum/chemical_reaction datums. Used during chemical reactions
GLOBAL_LIST(chemical_reagents_list)				//list of all /datum/reagent datums indexed by reagent id. Used by chemistry stuff
GLOBAL_LIST_EMPTY(tech_list)					//list of all /datum/tech datums indexed by id.
GLOBAL_LIST_EMPTY(surgeries_list)				//list of all surgeries by name, associated with their path.
GLOBAL_LIST_EMPTY(crafting_recipes)				//list of all table craft recipes
GLOBAL_LIST_EMPTY(rcd_list)					//list of Rapid Construction Devices.
GLOBAL_LIST_EMPTY(apcs_list)					//list of all Area Power Controller machines, separate from machines for powernet speeeeeeed.
GLOBAL_LIST_EMPTY(tracked_implants)			//list of all current implants that are tracked to work out what sort of trek everyone is on. Sadly not on lavaworld not implemented...
GLOBAL_LIST_EMPTY(tracked_chem_implants)			//list of implants the prisoner console can track and send inject commands too
GLOBAL_LIST_EMPTY(poi_list)					//list of points of interest for observe/follow
GLOBAL_LIST_EMPTY(pinpointer_list)			//list of all pinpointers. Used to change stuff they are pointing to all at once.
GLOBAL_LIST_EMPTY(zombie_infection_list) 		// A list of all zombie_infection organs, for any mass "animation"
GLOBAL_LIST_EMPTY(meteor_list)				// List of all meteors.
GLOBAL_LIST_EMPTY(active_jammers)             // List of active radio jammers
GLOBAL_LIST_EMPTY(ladders)
GLOBAL_LIST_EMPTY(trophy_cases)
///This is a global list of all signs you can change an existing sign or new sign backing to, when using a pen on them.
GLOBAL_LIST_EMPTY(editable_sign_types)

GLOBAL_LIST_EMPTY(wire_color_directory)
GLOBAL_LIST_EMPTY(wire_name_directory)

GLOBAL_LIST_EMPTY(ai_status_displays)

GLOBAL_LIST_EMPTY(mob_spawners) 		    // All mob_spawn objects
GLOBAL_LIST_EMPTY(alert_consoles)			// Station alert consoles, /obj/machinery/computer/station_alert

GLOBAL_LIST_EMPTY(air_scrub_names)			// Name list of all air scrubbers
GLOBAL_LIST_EMPTY(air_vent_names)			// Name list of all air vents

GLOBAL_LIST_EMPTY(subscribers_numbers_list)
GLOBAL_LIST_EMPTY(phone_numbers_list)
GLOBAL_LIST_EMPTY(phones_list)

GLOBAL_LIST_EMPTY(masquerade_breakers_list)
GLOBAL_LIST_EMPTY(masquerade_latejoin)
GLOBAL_LIST_EMPTY(niggers)

GLOBAL_LIST_EMPTY(generators)
GLOBAL_LIST_EMPTY(totems)
GLOBAL_LIST_EMPTY(umbra_portals)

//Dear God
GLOBAL_LIST_INIT(donaters, list("badteammate", "meomoor", "terain1", "egorium", "vanotyan", "takyon69", "lemshake", "happypala44", "kerststf", "oneplusone", "leonko", "twiner", "sishtis", "shirumic", "kommando", "nehoroshka", "raikyh", "themaskedman2", "xilvahphyre", "nikroszero", "foxfiredogs", "d6ll1r10um", "drdreidel", "stinkethstonketh", "neepbeep666", "parchment", "blackcat055", "laoziofcitium", "aniotaess", "andreykey", "mosasauruss", "animusin", "mercuryarrow", "keebo885", "homuhomu", "ivanzarax", "testuser", "cmdrgungnir", "psewdoplot", "dyzennon", "looptyloo", "heimy", "notaspider", "fourty2", "mormaethor", "odin933", "feudeytf", "awakethedemon", "noxesdeadwish", "ifrickfracki", "gruesomeborg68915", "asskek", "suriyel", "kayzach", "darkincarnate", "weredeaddeeds", "tonybito", "darkrixd", "justben201", "redruse", "deendoor24", "ambrosiafumari", "0nemore", "dangitmaster", "kirichi", "parasoul", "athiny", "swatogor", "adverseking", "mrfier", "agatickpapugatick", "huivn", "cocko", "shiranaisan", "4ejltbi", "prostoxorek", "danchsa", "otuskursky", "akayenthefake", "blockbatr", "gggf5", "ocherkashin"))

//666.6 - owners
//6.9 - developers, noddists, other
//1.01 - not known

// [ChillRaccoon] - better to make it through DataBase connection, DB data updates server data every round start
GLOBAL_LIST_INIT(donaters_amount, list("leonko" = 666,
								"badteammate" = 666.6,
								"meomoor" = 666.6,
								"terain1" = 1.01,
								"egorium" = 20,
								"vanotyan" = 1.01,
								"takyon69" = 6.9,
								"lemshake" = 6.9,
								"happypala44" = 6.9,
								"kerststf" = 6.9,
								"oneplusone" = 1.01,
								"leonko" = 6.9,
								"twiner" = 1.01,
								"sishtis" = 1.01,
								"shirumic" = 10,
								"kommando" = 1.01,
								"nehoroshka" = 1,
								"raikyh" = 1.01,
								"themaskedman2" = 5,
								"xilvahphyre" = 1.01,
								"nikroszero" = 1.01,
								"foxfiredogs" = 20,
								"d6ll1r10um" = 1.01,
								"drdreidel" = 1.01,
								"stinkethstonketh" = 10,
								"neepbeep666" = 1.01,
								"parchment" = 1.01,
								"blackcat055" = 1.01,
								"laoziofcitium" = 1.01,
								"aniotaess" = 1.01,
								"andreykey" = 1.01,
								"mosasauruss" = 1.01,
								"animusin" = 1.01,
								"mercuryarrow" = 1.01,
								"keebo885" = 1.01,
								"homuhomu" = 1.01,
								"ivanzarax" = 15,
								"testuser" = 266,
								"cmdrgungnir" = 1.01,
								"psewdoplot" = 1.01,
								"dyzennon" = 1.01,
								"looptyloo" = 1.01,
								"heimy" = 1.01,
								"notaspider" = 10,
								"fourty2" = 1.01,
								"mormaethor" = 1.01,
								"odin933" = 1.01,
								"feudeytf" = 6.9,
								"awakethedemon" = 1.01,
								"noxesdeadwish" = 1.01,
								"ifrickfracki" = 1.01,
								"gruesomeborg68915" = 30,
								"asskek" = 1.01,
								"suriyel" = 45,
								"kayzach" = 1.01,
								"darkincarnate" = 1.01,
								"weredeaddeeds" = 1.01,
								"tonybito" = 1.01,
								"darkrixd" = 1.01,
								"justben201" = 10,
								"redruse" = 1.01,
								"deendoor24" = 1.01,
								"ambrosiafumari" = 1.01,
								"0nemore" = 1.01,
								"dangitmaster" = 30,
								"kirichi" = 1.01,
								"parasoul" = 20,
								"athiny" = 31,
								"swatogor" = 1.01,
								"adverseking" = 1.01,
								"mrfier" = 1.01,
								"agatickpapugatick" = 6.9,
								"huivn" = 6.9,
								"cocko" = 1.01,
								"shiranaisan" = 6.9,
								"4ejltbi" = 1.01,
								"prostoxorek" = 5,
								"danchsa" = 20,
								"otuskursky" = 1,
								"akayenthefake" = 5,
								"blockbatr" = 1.01,
								"gggf5" = 1,
								"ocherkashin" = 3))

GLOBAL_LIST_EMPTY(fucking_joined)

GLOBAL_LIST_EMPTY(police_radios)
GLOBAL_LIST_EMPTY(cleanable_list)
GLOBAL_LIST_EMPTY(malkavian_list)
GLOBAL_LIST_EMPTY(auspex_list)
GLOBAL_LIST_EMPTY(stock_licenses)
GLOBAL_LIST_EMPTY(npc_activities)
GLOBAL_LIST_EMPTY(sabbatites)
GLOBAL_LIST_EMPTY(fog_suka)
GLOBAL_LIST_EMPTY(rain_suka)
GLOBAL_LIST_EMPTY(snow_suka)

GLOBAL_LIST_EMPTY(beast_list)
GLOBAL_LIST_EMPTY(weed_list)
GLOBAL_LIST_EMPTY(zombie_list)

GLOBAL_LIST_INIT(psychokids, list("badteammate", "meomoor", "twiner", "andreykey", "d6ll1r10um", "zxcnegr228822", "leonko", "chillraccoon"))
