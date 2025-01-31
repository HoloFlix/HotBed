function switch_skin(new_skin) {
    var player_x, player_y;

    if (instance_exists(global.player_instance)) {
        player_x = global.player_instance.x;
        player_y = global.player_instance.y;
        instance_destroy(global.player_instance);
    } else {
        // Fallback in case global.player_instance doesn't exist
        player_x = room_width / 2;
        player_y = room_height / 2;
        show_debug_message("Warning: global.player_instance was invalid, defaulting position to room center.");
    }

    if (new_skin == "icetruck") {
        global.player_instance = instance_create_layer(player_x, player_y, "Instances", obj_player_icetruck);
        global.current_skin = "icetruck";
        show_debug_message("Switched to icetruck. Player instance ID: " + string(global.player_instance));
    } 
    else if (new_skin == "tube") {
        global.player_instance = instance_create_layer(player_x, player_y, "Instances", obj_player_tube);
        global.current_skin = "tube";
        show_debug_message("Switched to tube. Player instance ID: " + string(global.player_instance));
    } 
    else if (new_skin == "player") {
        global.player_instance = instance_create_layer(player_x, player_y, "Instances", obj_player);
        global.current_skin = "player";
        show_debug_message("Switched to player. Player instance ID: " + string(global.player_instance));

		
        // Destroy tube or icetruck objects nearby if they exist
        var ice_truck = instance_place(player_x, player_y, obj_icetruck);
        if (ice_truck != noone) {
            instance_destroy(ice_truck);
        }
        var tube = instance_place(player_x, player_y, obj_tube);
        if (tube != noone) {
            instance_destroy(tube);
        }

        show_debug_message("Switched to player. Player instance ID: " + string(global.player_instance));
    }
}

// Ensure the viewport follows the current player instance
if (instance_exists(global.player_instance)) {
    var target_x = global.player_instance.x - (camera_get_view_width(global.camera) / 2);
    var target_y = global.player_instance.y - (camera_get_view_height(global.camera) / 2);

    target_x = clamp(target_x, 0, room_width - camera_get_view_width(global.camera));
    target_y = clamp(target_y, 0, room_height - camera_get_view_height(global.camera));

    var smooth_x = lerp(camera_get_view_x(global.camera), target_x, 0.1);
    var smooth_y = lerp(camera_get_view_y(global.camera), target_y, 0.1);

    camera_set_view_pos(global.camera, smooth_x, smooth_y);
}


// Update in obj_controller_step
if (instance_exists(global.player_instance)) {
    view_object[0] = global.player_instance;  // Set the viewport to track the player
}

show_debug_message("Viewport object: " + string(view_object[0]));
