// Room Start Event for obj_controller

show_debug_message("DEBUG: Room Start Event triggered in obj_controller.");

if (!variable_global_exists("camera") || global.camera == -1 || !is_real(global.camera)) {
    global.camera = camera_create();
    view_set_camera(0, global.camera);
    show_debug_message("DEBUG: Camera initialized/recreated in Room Start. ID: " + string(global.camera));
} else {
    view_set_camera(0, global.camera);
    show_debug_message("DEBUG: Existing global camera used in Room Start. ID: " + string(global.camera));
}

// Ensure the camera follows the player after a room transition
if (instance_exists(global.player_instance) && is_real(global.camera)) {
    var target_x = global.player_instance.x - (camera_get_view_width(global.camera) / 2);
    var target_y = global.player_instance.y - (camera_get_view_height(global.camera) / 2);

    camera_set_view_pos(global.camera, target_x, target_y);
    show_debug_message("DEBUG: Camera synchronized with player position after room transition.");
}

// Handle player instance and skin on room transition
if (!instance_exists(global.player_instance)) {
    if (global.current_skin == "player") {
        global.player_instance = instance_create_layer(x, y, "Instances", obj_player);
    } else if (global.current_skin == "icetruck") {
        global.player_instance = instance_create_layer(x, y, "Instances", obj_player_icetruck);
    } else if (global.current_skin == "tube") {
        global.player_instance = instance_create_layer(x, y, "Instances", obj_player_tube);
    }
}

// Ensure the ice truck remains destroyed if it was destroyed previously
if (global.icetruck_destroyed && instance_exists(obj_icetruck)) {
    with (obj_icetruck) {
        instance_destroy();
    }
}

show_debug_message("DEBUG: Room Start Event completed. Current skin: " + global.current_skin);
show_debug_message("DEBUG: Player instance ID: " + string(global.player_instance));