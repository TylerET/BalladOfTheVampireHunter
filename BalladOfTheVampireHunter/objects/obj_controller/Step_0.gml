if (global.xp >= global.xp_goal)
{
	// Level up!
	global.level += 1;
		
	// Create the upgrade screen.
	global.isPaused = true;
	instance_create_layer(0, 0, "LevelUpScreen", obj_level_up_screen)
	global.xp = 0;
}

if (keyboard_check_pressed(ord("P"))) {

    global.isPaused = !global.isPaused;
}

if (global.isPaused) {
instance_deactivate_all(true);
instance_activate_object(obj_controller);
instance_activate_object(obj_persistent_controller);
instance_activate_object(obj_level_up_screen);
instance_activate_object(obj_player);
} else {
instance_activate_all()
}


