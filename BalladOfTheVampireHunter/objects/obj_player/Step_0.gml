 /// @description Insert description here
// You can write your code in this editor

// Debug print fps
show_debug_message(fps)

// Input
if (keyboard_check(ord("A"))) {
	h_input = -1
} else if (keyboard_check(ord("D"))) {
	h_input = 1
} else {
	h_input = 0
}

if (keyboard_check(ord("W"))) {
	v_input = -1
} else if (keyboard_check(ord("S"))) {
	v_input = 1
} else {
	v_input = 0
}

// Update velocity
xvel += h_input * walk_accel
yvel += v_input * walk_accel

// Normalize diagonal movement
combined_vel = sqrt(sqr(xvel) + sqr(yvel));

if (combined_vel > max_walk_vel) {
    // Normalize velocity if the combined velocity is too high
    xvel = (xvel / combined_vel) * max_walk_vel;
    yvel = (yvel / combined_vel) * max_walk_vel;
}

// Decelerate
if (h_input == 0) {
    if (sign(xvel) > 0) {
		if (xvel < deceleration) {
			xvel = 0
		} else {
			xvel -= deceleration
		}
	} else if (sign(xvel) < 0) {
		if (xvel > -deceleration) {
			xvel = 0
		} else {
			xvel += deceleration
		}
	}
}

if (v_input == 0) {
    if (yvel > 0) {
		if (yvel < deceleration) {
			yvel = 0
		} else {
			yvel -= deceleration
		}
	} else if (yvel < 0) {
		if (yvel > -deceleration) {
			yvel = 0
		} else {
			yvel += deceleration
		}
	}
}

xvel = clamp(xvel, -max_walk_vel, max_walk_vel)
yvel = clamp(yvel,-max_walk_vel, max_walk_vel)

// Update position
x += xvel
y += yvel