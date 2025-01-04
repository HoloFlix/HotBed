// Mouse Left Pressed Event for obj_controller
if (mouse_check_button_pressed(mb_left) && !instance_exists(obj_skinpicker)) {
    // Get the player's position
    var player_instance = instance_find(obj_player, 0);
    if (player_instance != noone) {
        // Create the skin picker menu centered around the player
        instance_create_layer(player_instance.x, player_instance.y, "Instances", obj_skinpicker);
    } else {
        // Center on the view if no player instance is found
        instance_create_layer(view_xview[0] + view_wview[0] / 2, view_yview[0] + view_hview[0] / 2, "Instances", obj_skinpicker);
    }
    // Apply the blur effect
    shader_set(shd_blur);
}