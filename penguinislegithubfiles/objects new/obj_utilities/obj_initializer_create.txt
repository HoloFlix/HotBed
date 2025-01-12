// Create Event for obj_initializer

// Initialize the player instance if not already done
if (!instance_exists(global.player_instance)) {
    if (global.current_skin == "player") {
        global.player_instance = instance_create_layer(x, y, "Instances", obj_player);
    } else if (global.current_skin == "icetruck") {
        global.player_instance = instance_create_layer(x, y, "Instances", obj_player_icetruck);
    }

    // Log debug information
    show_debug_message("Player instance created with ID: " + string(global.player_instance));
    show_debug_message("Starting skin: " + global.current_skin);
}
