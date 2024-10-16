/// @description Insert description here
// You can write your code in this editor

// Draw Health background
draw_set_alpha(0);
draw_rectangle(30, 0, 150, 30, false);

if (instance_exists(obj_player)) {
    // Draw health (lifepips)
    for (var _i = 0; _i < obj_player.hp; _i++) {
        draw_set_alpha(1);
        draw_sprite_ext(spr_lifepip, 0, (50 + (80) * _i), 50, 0.4, 0.4, 0, c_white, 1);
    }

    draw_sprite_ext(spr_sm_empty_bar, 0, 400, 30, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_lg_empty_bar, 0, 400, 100, 1, 1, 0, c_white, 1);

    // Calculate the XP percentage
    var xp_percentage = min(global.xp / global.xp_goal, 1);  // Ensure percentage is between 0 and 1

    // Calculate the width of the filled XP bar portion
    var xp_bar_width = sprite_get_width(spr_xp_fill_bar) * xp_percentage;  // Only draw the filled portion
    var xp_bar_height = sprite_get_height(spr_xp_fill_bar);  // Use the full height of the XP bar

    // Draw the filled part of the XP bar using the new sprite name spr_xp_fill_bar
    draw_sprite_part(spr_xp_fill_bar, 0, 0, 0, xp_bar_width, xp_bar_height, 400, 30);  // XP bar fill aligned with the background

    // Implement mana bar using a percentage

    // Get how much of the mana bar should be filled
    var mana_percentage = min(global.mana / global.mana_max, 1);  // Calculate the percentage of the mana bar

    // Draw the filled part of the mana bar using draw_sprite_part()
    var mana_bar_width = sprite_get_width(spr_mana_fill_bar) * mana_percentage;  // Only draw part of the bar
    var mana_bar_height = sprite_get_height(spr_mana_fill_bar);  // Full height of the mana bar sprite

    // Draw only part of the mana bar (the filled part)
    draw_sprite_part(spr_mana_fill_bar, 0, 0, 0, mana_bar_width, mana_bar_height, 400, 100);  // Corrected to use the real width without stretching

    // Set the font for the level display
    draw_set_font(fnt_large);

    // Center the text vertically and horizontally
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // Draw the player's current level
    draw_text(1450, 65, "LV: " + string(global.level));
}
