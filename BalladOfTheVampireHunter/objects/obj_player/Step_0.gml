 /// @description player controls
 
//TODO fix slippery movement?

#region debug

// check fps (if game seems laggy)
// show_debug_message(fps)

#endregion

#region input

mouse_angle = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y); 

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

if (mouse_check_button_pressed(mb_left)) //TODO: make angle fixed and not update during swing
{
    var sword = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_banjo);
    
    //Positioning Logic Described in obj_sword step event to set initial position for frame one
    var distance = 80;
	
    sword.x = obj_player.x + lengthdir_x(distance, mouse_angle);
    sword.y = obj_player.y + lengthdir_y(distance, mouse_angle);
	
    sword.image_angle = mouse_angle;
}

#endregion

#region velocity handler

xvel += h_input * walk_accel
yvel += v_input * walk_accel

// Normalize diagonal movement
combined_vel = sqrt(sqr(xvel) + sqr(yvel));

if (combined_vel > max_walk_vel)
{
    // Normalize velocity if the combined velocity is too high
    xvel = (xvel / combined_vel) * max_walk_vel;
    yvel = (yvel / combined_vel) * max_walk_vel;
}

// Decelerate
if (h_input == 0) 
{
    if (sign(xvel) > 0)
	{
		if (xvel < deceleration) 
		{
			xvel = 0
		} 
		else 
		{
			xvel -= deceleration
		}
	} 
	else if (sign(xvel) < 0)
	{
		if (xvel > -deceleration)
		{
			xvel = 0
		} 
		else
		{
			xvel += deceleration
		}
	}
}

if (v_input == 0)
{
    if (yvel > 0) 
	{
		if (yvel < deceleration)
		{
			yvel = 0
		} 
		else
		{
			yvel -= deceleration
		}
	} 
	else if (yvel < 0)
	{
		if (yvel > -deceleration)
		{
			yvel = 0
		} 
		else
		{
			yvel += deceleration
		}
	}
}

xvel = clamp(xvel, -max_walk_vel, max_walk_vel)
yvel = clamp(yvel,-max_walk_vel, max_walk_vel)

// Update position
x += xvel
y += yvel

#endregion