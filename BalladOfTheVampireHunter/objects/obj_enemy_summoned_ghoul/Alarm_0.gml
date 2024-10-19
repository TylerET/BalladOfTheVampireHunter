/// @description Transition into normal ghoul after reverse animation finishes
var new_ghoul = instance_create_layer(x, y, "Instances", obj_enemy_ghoul);

// Transfer relevant data (like hp)
new_ghoul.hp = hp;

// Destroy the summoning ghoul instance
instance_destroy();
