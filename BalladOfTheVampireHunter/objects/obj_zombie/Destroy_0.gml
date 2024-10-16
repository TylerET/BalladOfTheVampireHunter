if (irandom(99) < 50)  // 5% chance (0 to 4 out of 100)
{
    // Create the life drop object at the enemy's position
    instance_create_layer(x, y, "Instances", obj_lifedrop);
}


global.xp += xp_val
show_debug_message("xp:  " + string(global.xp));
