/// @description Insert description here
// You can write your code in this editor
if (hp > 0 and !is_invincible and !global.isPaused) 
{
	show_debug_message(hp)
	hp -= 1
	is_invincible = true
	alarm[1] = flicker_rate //image flashing for i-frames
    alarm[0] = i_frames //timer to end i-frames
} else if (hp == 0) {
	show_debug_message("Game Over")
	// instance_destroy()
    global.game_over = true;
}