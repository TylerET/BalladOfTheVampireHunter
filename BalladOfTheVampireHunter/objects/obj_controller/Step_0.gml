if (global.xp >= global.xp_goal)
{
	// Level up!
	global.level += 1;
		
	// Create the upgrade screen.
	instance_create_layer(0, 0, "LevelUpScreen", obj_level_up_screen)
	global.xp = 0;
}
if (keyboard_check(vk_escape)) {
	game_end()	
}