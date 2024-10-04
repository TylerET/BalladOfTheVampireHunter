// If mouse is over this instance, adjusting for the GUI layer...
if (device_mouse_x_to_gui(0) > bbox_left && device_mouse_x_to_gui(0) < bbox_right && device_mouse_y_to_gui(0) > bbox_top && device_mouse_y_to_gui(0) < bbox_bottom)
{
	
	// If left mouse button is pressed...
	if (mouse_check_button_pressed(mb_left))
	{
		
		// Sets click state to true.
		is_clicked = true;
		
	}
	
	// Checks if mouse has been clicked on this button.
	if (is_clicked)
	{
		
		// If left mouse button is released...
		if (mouse_check_button_released(mb_left))
		{
			// Closes the game.
			game_end();
		}
	}
}