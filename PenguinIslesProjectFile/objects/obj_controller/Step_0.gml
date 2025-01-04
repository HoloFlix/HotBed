// Step Event for obj_controller
if (keyboard_check_pressed(ord("E"))) {
    // Check for interaction with the ice truck
    var ice_truck = instance_place(global.player_instance.x, global.player_instance.y, obj_icetruck);
    if (ice_truck != noone && global.current_skin == "player") {
        // Switch to ice truck player
        instance_destroy(ice_truck); // Remove the ice truck from the room
        var player_x = global.player_instance.x;
        var player_y = global.player_instance.y;
        instance_destroy(global.player_instance); // Destroy the current player instance
        global.player_instance = instance_create_layer(player_x, player_y, "Instances", obj_player_icetruck); // Create the ice truck player instance
        global.current_skin = "icetruck"; // Update the current skin
    } else if (global.current_skin == "icetruck") {
        // Switch back to player
        var player_x = global.player_instance.x;
        var player_y = global.player_instance.y;
        instance_destroy(global.player_instance); // Destroy the current player instance
        global.player_instance = instance_create_layer(player_x, player_y, "Instances", obj_player); // Create the player instance
        global.current_skin = "player"; // Update the current skin
    }
}

// End Step Event for obj_controller
if (instance_exists(global.player_instance)) {
    // Update the viewport to follow the player instance
    var view_x = clamp(global.player_instance.x - (view_wview[0] / 2), 0, room_width - view_wview[0]);
    var view_y = clamp(global.player_instance.y - (view_hview[0] / 2), 0, room_height - view_hview[0]);
    view_xview[0] = view_x;
    view_yview[0] = view_y;
}