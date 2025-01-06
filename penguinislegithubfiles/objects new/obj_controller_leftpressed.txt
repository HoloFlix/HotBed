if (mouse_check_button_pressed(mb_left) && !instance_exists(obj_skinpicker)) {
    // Create the skin picker menu centered around the player
    if (instance_exists(global.player_instance)) {
        instance_create_layer(global.player_instance.x, global.player_instance.y, "Instances", obj_skinpicker);
    } else {
        // Center on the view if no player instance is found
        instance_create_layer(view_xview[0] + view_wview[0] / 2, view_yview[0] + view_hview[0] / 2, "Instances", obj_skinpicker);
    }
    // Apply a visual effect if desired
    shader_set(shd_blur);
}
