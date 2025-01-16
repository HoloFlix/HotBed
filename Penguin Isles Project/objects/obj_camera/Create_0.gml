// Create Event for obj_camera

// If the global camera already exists, reattach to it
if (variable_global_exists("camera") && global.camera != -1 && is_real(global.camera)) {
    view_set_camera(0, global.camera);
    show_debug_message("DEBUG: Reattached to existing global camera. ID: " + string(global.camera));
} else {
    // If no global camera exists, create a new one
    global.camera = camera_create();
    view_set_camera(0, global.camera);
    camera_set_view_size(global.camera, view_wview[0], view_hview[0]);
    camera_set_view_pos(global.camera, 0, 0);
    show_debug_message("DEBUG: New global camera created. ID: " + string(global.camera));
}