if (global.chat_active) {
    show_debug_message("Map interaction blocked: Chat is active.");
    exit; // Prevent interaction when the chat window is open
}

// obj_map Mouse Left Pressed Event
var click_x = device_mouse_x_to_gui(0);
var click_y = device_mouse_y_to_gui(0);

show_debug_message("Mouse clicked at: " + string(click_x) + ", " + string(click_y));

// Define clickable regions for different rooms (halved size)
if (click_x > 87 - 25 && click_x < 87 + 25 && click_y > 283 - 25 && click_y < 283 + 25) {
    // Move to Beach
    show_debug_message("Beach region clicked");
    create_warp_instance(rm_beach);
} else if (click_x > 185 - 25 && click_x < 185 + 25 && click_y > 228 - 25 && click_y < 228 + 25) {
    // Move to town
    show_debug_message("Town region clicked");
    create_warp_instance(rm_town);
} else if (click_x > 55 - 25 && click_x < 55 + 25 && click_y > 190 - 25 && click_y < 190 + 25) {
    // Move to beach
    show_debug_message("Beach region clicked");
    create_warp_instance(rm_beach);
} else if (click_x > 155 - 25 && click_x < 155 + 25 && click_y > 128 - 25 && click_y < 128 + 25) {
    // Move to ski village
    show_debug_message("Ski village region clicked");
    create_warp_instance(rm_ski_village);
} else if (click_x > 280 - 25 && click_x < 280 + 25 && click_y > 250 - 25 && click_y < 250 + 25) {
    // Move to snow fort
    show_debug_message("Snow fort region clicked");
    create_warp_instance(rm_snow_fort);
} else if (click_x > 410 - 25 && click_x < 410 + 25 && click_y > 277 - 25 && click_y < 277 + 25) {
    // Move to welcome room
    show_debug_message("Welcome room region clicked");
    create_warp_instance(rm_welcome_room);
} else if (click_x > 380 - 25 && click_x < 380 + 25 && click_y > 230 - 25 && click_y < 230 + 25) {
    // Move to plaza
    show_debug_message("Plaza region clicked");
    create_warp_instance(rm_plaza);
} else if (click_x > 395 - 25 && click_x < 395 + 25 && click_y > 170 - 25 && click_y < 170 + 25) {
    // Move to forest
    show_debug_message("Forest region clicked");
    create_warp_instance(rm_forest);
} else if (click_x > 400 - 25 && click_x < 400 + 25 && click_y > 130 - 25 && click_y < 130 + 25) {
    // Move to cove
    show_debug_message("Cove region clicked");
    create_warp_instance(rm_cove);
} else if (click_x > 135 - 25 && click_x < 135 + 25 && click_y > 60 - 25 && click_y < 60 + 25) {
    // Move to mountain top
    show_debug_message("Mountain top region clicked");
    create_warp_instance(rm_ski_mountaintop);
} else {
    show_debug_message("No region matched. Click ignored.");
}

// Function to create a warp instance for room transition
function create_warp_instance(target_room) {
    var inst = instance_create_depth(global.player_instance.x, global.player_instance.y, -9999, obj_warp);
    inst.target_x = global.player_instance.x;  // or a specific target location within the room
    inst.target_y = global.player_instance.y;  // or a specific target location within the room
    inst.target_rm = target_room;
    inst.target_face = global.player_instance.image_angle;  // Assuming you want to keep the same facing direction
    inst.target_instance = global.player_instance;
    inst.is_npc = false;  // Ensure this is the player, not an NPC

    // Reset camera and viewport
    camera_reset(inst);
}

// Function to reset the camera and viewport
function camera_reset(inst) {
    // Reset camera to default position
    var default_camera = camera_create();
    camera_set_view_size(default_camera, 640, 480);  // Set the default view size
    camera_set_view_pos(default_camera, inst.target_x - 320, inst.target_y - 240);  // Center the camera on the target position
    camera_set_view_target(default_camera, inst.target_instance);

    // Reset viewport to follow the player instance
    view_set_camera(0, default_camera);
    view_object[0] = inst.target_instance;
}