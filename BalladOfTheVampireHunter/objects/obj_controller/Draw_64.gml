/// @description Modular UI for Health, XP, and Mana Bars

// Constants for padding
var defaultPadding = 10;

// Base X and Y for the UI
var base_x = 20;
var base_y = 50;

// Helper function to draw a part of the bar based on percentage fill
function draw_filled_bar(spr_empty, spr_fill, x, y, percentage) {
    // Draw the empty bar (background)
    draw_sprite_ext(spr_empty, 0, x, y, 1, 1, 0, c_white, 1);
    
    // Calculate fill size and draw the filled part of the bar
    var fill_width = sprite_get_width(spr_fill) * percentage;
    var fill_height = sprite_get_height(spr_fill);
    
    // Draw only the filled portion of the bar
    draw_sprite_part(spr_fill, 0, 0, 0, fill_width, fill_height, x, y);
}

if (instance_exists(obj_player)) {
    // Draw health UI
    var current_y = base_y;  // Starting y-coordinate for health

    for (var _i = 0; _i < obj_player.hp; _i++) {
        draw_set_alpha(1);
        draw_sprite_ext(spr_lifepip, 0, (base_x + 20) + (80 * _i), current_y, 0.4, 0.4, 0, c_white, 1);
    }

    // Update current_y for XP bar position (underneath health bar)
    current_y += sprite_get_height(spr_lifepip) * 0.4 + defaultPadding;

    // Draw XP bar
    var xp_percentage = min(global.xp / global.xp_goal, 1);  // Ensure percentage is between 0 and 1
    draw_filled_bar(spr_sm_empty_bar, spr_xp_fill_bar, base_x, current_y, xp_percentage);

    // Update current_y for mana bar position (underneath XP bar)
    current_y += sprite_get_height(spr_sm_empty_bar) + defaultPadding;

    // Draw Mana bar
    var mana_percentage = min(global.mana / global.mana_max, 1);  // Ensure percentage is between 0 and 1
    draw_filled_bar(spr_lg_empty_bar, spr_mana_fill_bar, base_x, current_y, mana_percentage);

    // Set the font for the level display
    draw_set_font(fnt_large);

    // Center the text vertically and horizontally
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // Draw the player's current level, positioned relative to the UI
    draw_text(base_x + 400, base_y, "LV: " + string(global.level));
}
