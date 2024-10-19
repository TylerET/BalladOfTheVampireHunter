/// @description Insert description here
// You can write your code in this editor
// Check if the animation has finished (or is at the last frame or beyond)
if (image_index >= image_number - 1) {
    var new_ghoul = instance_create_layer(x, y, "Instances", obj_enemy_ghoul);
    new_ghoul.hp = hp;

    instance_destroy();  // Destroy the current instance once the animation is done
}
