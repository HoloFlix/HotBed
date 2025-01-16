if (global.chat_active) {
    // Draw chat window
    var window_width = 400;
    var window_height = 200;
    var window_x = camera_get_view_x(global.camera) + (camera_get_view_width(global.camera) / 2) - (window_width / 2);
    var window_y = camera_get_view_y(global.camera) + camera_get_view_height(global.camera) - window_height - 20;

    draw_sprite_stretched(spr_chat, 0, window_x, window_y, window_width, window_height);

    // Draw text
    draw_set_color(c_black);
    draw_text(window_x + 20, window_y + 20, dialog_queue[dialog_index]);
}
