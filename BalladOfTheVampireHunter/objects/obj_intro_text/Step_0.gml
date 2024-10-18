
timer += type_speed;

// Check if space is pressed to skip the typewriter effect
if (keyboard_check_pressed(vk_space)) {
		if (text_index >= string_length(text)) {
		room_goto(rm_room_1)	
		} else {
    string_displayed = text;
    text_index = string_length(text);  
		}
} else if (timer >= 1 && text_index < string_length(text)) {
    text_index += 1;
    string_displayed = string_copy(text, 1, text_index);  
    timer = 0;
}