/// @description iframe flicker

if (visible) {
	visible = false
	show_debug_message("flickering off")
} else {
	visible = true
	show_debug_message("flickering on")
}
alarm[1] = flicker_rate