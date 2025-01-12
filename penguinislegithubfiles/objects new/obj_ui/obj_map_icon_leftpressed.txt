// obj_map_icon Mouse Left Pressed Event
global.camera_width = camera_get_view_width(global.camera);
global.camera_height = camera_get_view_height(global.camera);

// Expand the camera view to the room size
camera_set_view_size(global.camera, room_width, room_height);

// Ensure the sprite is correctly referenced
var map_x = (room_width - sprite_get_width(spr_map)) / 2;
var map_y = (room_height - sprite_get_height(spr_map)) / 2;

// Create the map instance at the calculated position
instance_create_layer(map_x, map_y, "Instances", obj_map);

show_debug_message("Map icon clicked, opening map.");