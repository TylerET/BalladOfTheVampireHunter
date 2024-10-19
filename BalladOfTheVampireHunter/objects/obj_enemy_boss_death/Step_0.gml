/// @description Insert description here
// You can write your code in this editor
// Check if the animation has finished (or is at the last frame or beyond)
if (image_index >= image_number - 1) {
	instance_deactivate_object(obj_player)
    room_goto(rm_outro_room)  // Destroy the current instance once the animation is done
}
