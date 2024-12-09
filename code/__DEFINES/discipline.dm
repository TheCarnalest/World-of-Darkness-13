//normal duration defines
#define DURATION_TURN 30
#define DURATION_SCENE 3000

//targeting bitflags, NONE or 0 if targeting self
#define TARGET_OBJ (1<<0)
#define TARGET_TURF (1<<1)
#define TARGET_LIVING (1<<2)
#define TARGET_DEAD (1<<3)
#define TARGET_MOB (1<<4)

//bitflags to check for certain conditions determining ability to actually cast a discipline
#define DISC_CHECK_TORPORED (1<<0)
#define DISC_CHECK_CONSCIOUS (1<<1)
#define DISC_CHECK_LYING (1<<2)
#define DISC_CHECK_CAPABLE (1<<3)
#define DISC_CHECK_IMMOBILE (1<<4)
#define DISC_CHECK_FREE_HAND (1<<5)
#define DISC_CHECK_SPEAK (1<<6)
#define DISC_CHECK_SEE (1<<7)
