//normal duration defines
///Duration of one "turn" as defined in tabletop: 3 seconds
#define DURATION_TURN 30
///Duration of one "scene" as defined in tabletop: 5 minutes
#define DURATION_SCENE 3000

//targeting bitflags, NONE or 0 if targeting self
///Targets anything of type /obj and its children
#define TARGET_OBJ (1<<0)
///Targets anything of type /turf and its children
#define TARGET_TURF (1<<1)
///Targets anything of type /mob/living and its children if it is not dead
#define TARGET_LIVING (1<<2)
///Targets anything of type /mob/dead and its children, ie targets ghosts
#define TARGET_DEAD (1<<3)
///Targets anything of type /mob/living and its children, dead or not
#define TARGET_MOB (1<<4)

//bitflags to check for certain conditions determining ability to actually cast a discipline
//flags overlap, like DISC_CHECK_CAPABLE covers DISC_CHECK_CONSCIOUS and DISC_CHECK_TORPOR
///Caster must not be in Torpor
#define DISC_CHECK_TORPORED (1<<0)
///Caster must be conscious
#define DISC_CHECK_CONSCIOUS (1<<1)
///Caster must be capable of taking actions (not stunned)
#define DISC_CHECK_CAPABLE (1<<2)
///Caster must be standing up (not knocked down)
#define DISC_CHECK_LYING (1<<3)
///Caster must be capable of moving
#define DISC_CHECK_IMMOBILE (1<<4)
///Caster must have usable hands
#define DISC_CHECK_FREE_HAND (1<<5)
///Caster must be able to speak
#define DISC_CHECK_SPEAK (1<<6)
///Caster must be able to see
#define DISC_CHECK_SEE (1<<7)
