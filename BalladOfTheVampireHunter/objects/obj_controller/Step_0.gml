if (global.xp >= global.xp_goal)
{
	// Level up!
	global.level += 1;
		
	// Create the upgrade screen.
	// instance_create_layer(0, 0, "LevelUpScreen", obj_level_up_screen)
	global.xp = 0;
}

if (keyboard_check_pressed(ord("P"))) {

    global.isPaused = !global.isPaused;
}

if (global.isPaused) {
instance_deactivate_all(true);	
} else {
instance_activate_all()
}


