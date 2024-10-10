/obj/effect/reflection
	name = "reflection"
	appearance_flags = KEEP_TOGETHER|TILE_BOUND|PIXEL_SCALE
	mouse_opacity = 0
	vis_flags = VIS_HIDE
	layer = ABOVE_OBJ_LAYER
	var/alpha_icon = 'icons/obj/watercloset.dmi'
	var/alpha_icon_state = "mirror_mask"
	var/obj/mirror
	desc = "Why are you locked in the bathroom?"
	anchored = TRUE

	var/blur_filter

/obj/effect/reflection/proc/setup_visuals(target)
	mirror = target

	if(mirror.pixel_x > 0)
		dir = WEST
	else if (mirror.pixel_x < 0)
		dir = EAST

	if(mirror.pixel_y > 0)
		dir = SOUTH
	else if (mirror.pixel_y < 0)
		dir = NORTH

	pixel_x = mirror.pixel_x
	pixel_y = mirror.pixel_y

	blur_filter = filter(type="blur", size = 1)

	update_mirror_filters()

/obj/effect/reflection/proc/update_mirror_filters()
	filters = null

	vis_contents = null

	if(!mirror)
		return

	alpha = mirror.alpha

	var/matrix/M = matrix()
	if(dir == WEST || dir == EAST)
		M.Scale(-1, 1)
	else if(dir == SOUTH|| dir == NORTH)
		M.Scale(1, -1)
		pixel_y = mirror.pixel_y + 5

	transform = M

	filters += filter("type" = "alpha", "icon" = icon(alpha_icon, alpha_icon_state), "x" = 0, "y" = 0)

	vis_contents += get_turf(mirror)