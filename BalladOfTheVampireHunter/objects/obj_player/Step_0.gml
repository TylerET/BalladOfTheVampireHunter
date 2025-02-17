 /// @description player controls
 
//TODO fix slippery movement?

#region debug

// check fps (if game seems laggy)
// show_debug_message(fps)

#endregion

#region input

mouse_angle = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y); 

if (!global.isPaused){
	if (keyboard_check(ord("A"))|| keyboard_check(vk_left) )
	{
		h_input = -1
	}
	else if (keyboard_check(ord("D")) || keyboard_check(vk_right))
	{
		h_input = 1
	}
	else
	{
		h_input = 0
	}

	if (keyboard_check(ord("W")) || keyboard_check(vk_up))
	{
		v_input = -1
	} 
	else if (keyboard_check(ord("S")) || keyboard_check(vk_down))
	{
		v_input = 1
	} 
	else 
	{
		v_input = 0
	}
}

#endregion 

#region animation info

mouse_direction = int64((mouse_angle + 45) / 90) // 0 = right, 1 = up, 2 = left, 3 = down
if (mouse_direction > 3) //rounding error ;)
	mouse_direction = 0 

// show_debug_message(mouse_direction)
// show_debug_message(mouse_angle)

if (xvel > yvel) {
	if (xvel > 0) {
		walk_direction = DIR.RIGHT
	} else {
		walk_direction = DIR.LEFT
	}
} else {
	if (yvel > 0) {
		walk_direction = DIR.DOWN
	} else {
		walk_direction = DIR.UP
	}
}

#endregion

#region attack

if (!global.isPaused and mouse_check_button(mb_left) and !atk_on_cd)
{
    //Positioning Logic Described in obj_sword step event to set initial position for frame one
    // handle alternate swinging direction
    obj_persistent_controller.banjo_flipflop *= -1
    
    banjo_angle = mouse_angle + 90*(sign(obj_persistent_controller.banjo_flipflop))
    
    var _banjo = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_banjo);

    _banjo.x = obj_player.x + lengthdir_x(obj_banjo.dist_from_player, banjo_angle);
    _banjo.y = obj_player.y + lengthdir_y(obj_banjo.dist_from_player, banjo_angle);
    _banjo.image_angle = banjo_angle
    _banjo.visible = false
    
    atk_on_cd = true
    alarm[2] = atk_cd
}

#endregion


#region velocity handler
if (!global.isPaused) {

    xvel += h_input * walk_accel;
    yvel += v_input * walk_accel;

    // Normalize diagonal movement
    combined_vel = sqrt(sqr(xvel) + sqr(yvel));

    if (combined_vel > max_walk_vel) {
        // Normalize velocity if the combined velocity is too high
        xvel = (xvel / combined_vel) * max_walk_vel;
        yvel = (yvel / combined_vel) * max_walk_vel;
    }

    // Decelerate on no input
    if (h_input == 0) {
        if (sign(xvel) > 0) {
            xvel = max(0, xvel - deceleration);
        } else if (sign(xvel) < 0) {
            xvel = min(0, xvel + deceleration);
        }
    }

    if (v_input == 0) {
        if (yvel > 0) {
            yvel = max(0, yvel - deceleration);
        } else if (yvel < 0) {
            yvel = min(0, yvel + deceleration);
        }
    }

    // Clamp velocities
    xvel = clamp(xvel, -max_walk_vel, max_walk_vel);
    yvel = clamp(yvel, -max_walk_vel, max_walk_vel);

    // Collision check with obj_wall_collisions before moving
    var future_x = x + xvel;
    var future_y = y + yvel;

    if (!place_meeting(future_x, y, obj_wall_collisions)) {
        x = future_x;
    } else {
        xvel = 0; // Stop movement in x direction if colliding
    }

    if (!place_meeting(x, future_y, obj_wall_collisions)) {
        y = future_y;
    } else {
        yvel = 0; // Stop movement in y direction if colliding
    }
}

#endregion

#region outside border
// Check for left boundary (x cannot be less than 0)
if (x < 0) {
    x = 0;
}

// Check for right boundary (x cannot be more than room_width - sprite_width)
if (x > room_width - sprite_width) {
    x = room_width - sprite_width;
}

// Check for top boundary (y cannot be less than 0)
if (y < 0) {
    y = 0;
}

// Check for bottom boundary (y cannot be more than room_height - sprite_height)
if (y > room_height - sprite_height) {
    y = room_height - sprite_height;
}

#endregion

function trigger_custom_event() {
	if (hp > 0 and !is_invincible) 
{
	show_debug_message(hp)
	hp -= 1
	is_invincible = true
	alarm[1] = flicker_rate //image flashing for i-frames
    alarm[0] = i_frames //timer to end i-frames
} else if (hp == 0) {
	show_debug_message("Game Over")
    global.game_over = true;
}
}

if ( mouse_check_button_pressed(mb_right)) {
	if (global.mana >= 60) {
    instance_create_layer(x, y, "Instances", obj_bullet_player);
    global.mana -= 60;
	} else {
	obj_controller.show_toast("Not enough musical inspiration", 30)
	}
}
