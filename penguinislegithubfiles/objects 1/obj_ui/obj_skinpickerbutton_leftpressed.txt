if (skin_object != noone) {
    // Ensure the player instance exists
    if (instance_exists(global.player_instance)) {
        // Store the current player position
        var player_x = global.player_instance.x;
        var player_y = global.player_instance.y;

        // Destroy the current player instance
        instance_destroy(global.player_instance);

        // Create the new player instance with the selected skin
        global.player_instance = instance_create_layer(player_x, player_y, "Instances", skin_object);
        global.current_skin = skin_name; // Update the current skin name

        show_debug_message("Skin switched to: " + global.current_skin);
    } else {
        show_debug_message("Error: global.player_instance does not exist!");
    }
} else if (skin_name == "Close") {
    // Close the menu
    with (obj_skinpicker) {
        instance_destroy();
    }
    show_debug_message("Skin picker closed.");
} else {
    show_debug_message("Error: Skin object is invalid.");
}

// Destroy the skin picker menu if a valid skin was selected
if (skin_object != noone) {
    with (obj_skinpicker) {
        instance_destroy();
    }
}
