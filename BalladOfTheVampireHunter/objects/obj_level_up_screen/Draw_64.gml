// Get screen dimensions for GUI
var _screen_width = display_get_gui_width();
var _screen_height = display_get_gui_height();

// Calculate 75% of the screen dimensions
var _gui_width = _screen_width * 0.75;
var _gui_height = _screen_height * 0.75;

// Calculate the top-left position to center the GUI
var _gui_x = (_screen_width - _gui_width) / 2;
var _gui_y = (_screen_height - _gui_height) / 2;

// Set alpha and color, then draw a rectangled
draw_set_alpha(0.4);
draw_set_colour(c_black);
draw_rectangle(_gui_x, _gui_y, _gui_x + _gui_width, _gui_y + _gui_height, false); // Draw the rectangle

// Reset the draw color and alpha
draw_set_colour(c_white);
draw_set_alpha(1);

// Set the heading font
draw_set_font(fnt_large);

// Set text alignment to center and middle
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw the heading text in the center of the GUI
draw_text(_screen_width / 2, _gui_y + 60, "UPGRADE");
