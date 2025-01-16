// Prevent map interaction when chat is active
if (global.chat_active) {
    exit;
}

depth = -1000;

// Existing step logic
x = camera_get_view_x(global.camera) + 10;
y = camera_get_view_y(global.camera) + camera_get_view_height(global.camera) - sprite_height - 10;
