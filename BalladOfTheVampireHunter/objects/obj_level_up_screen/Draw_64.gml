// Get screen dimensions for GUI
var _screen_width = display_get_gui_width();
var _screen_height = display_get_gui_height();

// Calculate 75% of the screen dimensions for the background rectangle
var _gui_width = _screen_width * 0.75;
var _gui_height = _screen_height * 0.75;

// Calculate the top-left position to center the GUI background
var _gui_x = (_screen_width - _gui_width) / 2;
var _gui_y = (_screen_height - _gui_height) / 2;

// Set alpha and color for the background rectangle (transparent black)
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(_gui_x, _gui_y, _gui_x + _gui_width, _gui_y + _gui_height, false);

// Reset the draw color and alpha after drawing the background
draw_set_color(c_white);
draw_set_alpha(1);

// Set text alignment to center and middle for the heading
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_large);

// Draw the heading text in the center of the GUI
draw_text(_screen_width / 2, _gui_y + 60, "UPGRADE");

var card_width = 200; 
var card_height = 300; 
var spacing = 80;  

var total_card_width = (card_width * 4) + (spacing * 3); 
var card_start_x = (_screen_width - total_card_width) / 2; 
var card_y = (_screen_height / 2) - (card_height / 2); 

// Position for each card
var card1_x = card_start_x;  
var card2_x = card_start_x + card_width + spacing;  
var card3_x = card_start_x + (card_width + spacing) * 2;  
var card4_x = card_start_x + (card_width + spacing) * 3;  

// Draw sprites for each card
draw_sprite(spr_sword, 0, card1_x, card_y);
draw_sprite(spr_lifepip, 0, card2_x, card_y);
draw_sprite(spr_player_old, 0, card3_x, card_y);
draw_sprite(spr_banjo, 0, card4_x, card_y);

// Draw text below each sprite to represent different upgrades
draw_set_font(fnt_small);
var text_y_offset = card_y + card_height / 2
draw_text(card1_x, text_y_offset, "Damage Up");
draw_text(card2_x, text_y_offset, "Max HP Up");
draw_text(card3_x, text_y_offset, "Speed Up");
draw_text(card4_x, text_y_offset, "Music Up");


// Reset the color and alpha for further drawing operations
draw_set_color(c_white);
draw_set_alpha(1);
