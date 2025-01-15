// Step Event for obj_initializer

if (instance_exists(global.camera)) {
    // Update camera position if necessary
    var target_x = global.player_instance.x - (camera_get_view_width(global.camera) / 2);
    var target_y = global.player_instance.y - (camera_get_view_height(global.camera) / 2);

    camera_set_view_pos(global.camera, target_x, target_y);
    show_debug_message("DEBUG: Camera exists and position updated.");
}