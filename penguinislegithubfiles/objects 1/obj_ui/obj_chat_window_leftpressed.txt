// Mouse Left Pressed Event
if (global.chat_active) {
    var camera_x = camera_get_view_x(global.camera);
    var camera_y = camera_get_view_y(global.camera);
    var camera_width = camera_get_view_width(global.camera);
    var camera_height = camera_get_view_height(global.camera);

    var menu_width = 300;
    var menu_height = 150;
    var menu_x = camera_x + (camera_width - menu_width) / 2;
    var menu_y = camera_y + camera_height - menu_height - 50;

    var close_button_size = 20;
    var close_x = menu_x + menu_width - close_button_size - 20;
    var close_y = menu_y + 20;

    if (mouse_x >= close_x && mouse_x <= close_x + close_button_size &&
        mouse_y >= close_y && mouse_y <= close_y + close_button_size) {
        global.chat_active = false;
        global.chat_npc = noone;
        dialog_queue = [];
        show_debug_message("Close button clicked. Chat deactivated.");
    }
}
