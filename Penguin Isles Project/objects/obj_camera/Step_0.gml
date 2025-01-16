// Step Event for obj_camera

// Ensure the player instance exists
if (instance_exists(global.player_instance)) {
    var target_x = global.player_instance.x - (camera_get_view_width(global.camera) / 2);
    var target_y = global.player_instance.y - (camera_get_view_height(global.camera) / 2);

    target_x = clamp(target_x, 0, room_width - camera_get_view_width(global.camera));
    target_y = clamp(target_y, 0, room_height - camera_get_view_height(global.camera));

    camera_set_view_pos(global.camera, target_x, target_y);
}