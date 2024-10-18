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

if (global.game_over == true) {
	instance_destroy(obj_player) 
}

#region 

function show_toast(msg, duration) {
	obj_player.toast_message = msg;
    obj_player.toast_timer = duration;
}


if (keyboard_check(vk_alt) && !instance_exists(obj_level_up_screen)) {
    if (keyboard_check_pressed(ord("1"))) {
		show_toast("Invincible: player cannot die or be injured ", 60);
		obj_player.is_invincible = true;
    }
    else if (keyboard_check_pressed(ord("2"))) {
        show_toast("Level up: Increase the players level by 1", 60);
		global.xp = global.xp_goal;
    }
    else if (keyboard_check_pressed(ord("3"))) {
        show_toast("Health up: player gains 3 max health", 60);
		global.maxHealth += 3;
		obj_player.hp += 3;

    }
    else if (keyboard_check_pressed(ord("4"))) {
        show_toast("To Boss: skip to the final boss fight immediately", 60);
		// TODO
		// room_goto(rm_boss)
    }
    else if (keyboard_check_pressed(ord("5"))) {
        show_toast("Next wave: advance the wave immediately", 60);
		// destroys parent and all children
		with (obj_zombie) {
			instance_destroy();
		}
    }
}


#endregion


