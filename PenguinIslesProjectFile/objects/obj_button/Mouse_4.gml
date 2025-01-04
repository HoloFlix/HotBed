// Mouse Left Pressed Event for obj_button
if (skin_object != noone) {
    // Change the player's skin
    var player_instance = instance_find(obj_player, 0);
    if (player_instance != noone) {
        player_instance.skin_index = skin_object;
    }
}

// Destroy the skin picker menu and remove all buttons
with (instance_find(obj_skinpicker, 0)) {
    instance_destroy();
}
shader_reset(); // Reset the shader to remove the blur effect