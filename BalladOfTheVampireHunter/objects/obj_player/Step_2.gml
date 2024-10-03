/// @description animation handler
//inspired by FSM project

if state == PLAYERSTATE.WALK {
	if yvel > 0 {
		sprite_index = spr_player_walk_down
	} else if yvel < 0 {
		sprite_index = spr_player_walk_up
	} else if xvel != 0 {
		//same sprite just flipped
		sprite_index = spr_player_walk_side
		image_xscale = sign(xvel)
	}
}

//pause animation if not moving and point toward mouse

if /*state == PLAYERSTATE.WALK and*/ (yvel = 0 and xvel = 0) {
	image_speed = 0
	image_xscale = 1
	sprite_index = spr_player_stand
	
	show_debug_message(image_index)
	
	switch (mouse_direction) {
		case 0: //right
			image_index = 2
		break
	
		case 1: //up
			image_index = 1
		break
	
		case 2: //left
			image_index = 2
			image_xscale = -1
		break
	
		case 3: //down
			image_index = 0
		break
	
		default: //something broke
			image_index = 0
		break	
	}
	
} else {
	image_speed = 1	
}