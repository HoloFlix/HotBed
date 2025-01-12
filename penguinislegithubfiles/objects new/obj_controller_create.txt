// Create Event for obj_controller
// Initialize global variables
global.skins = [
    { name: "Player", object: obj_player },
    { name: "Ice Truck", object: obj_player_icetruck },
    { name: "Tube", object: obj_player_tube }
];
global.current_skin = "player"; // Starting skin
global.player_instance = noone; // Initialize player instance
global.icetruck_destroyed = false; // Initialize icetruck_destroyed

// Ensure player instance exists
if (!instance_exists(global.player_instance)) {
    if (global.current_skin == "player") {
        global.player_instance = instance_create_layer(x, y, "Instances", obj_player);
    } else if (global.current_skin == "icetruck") {
        global.player_instance = instance_create_layer(x, y, "Instances", obj_player_icetruck);
    } else if (global.current_skin == "tube") {
        global.player_instance = instance_create_layer(x, y, "Instances", obj_player_tube);
    }
}

// Debugging
if (instance_exists(global.player_instance)) {
    show_debug_message("Player instance created: " + string(global.player_instance));
} else {
    show_debug_message("Error: Failed to create player instance.");
}

// Initialize move_spd from the player instance
if (instance_exists(global.player_instance)) {
    move_spd = global.player_instance.move_spd;
}

// Initialize chat variables
global.chat_active = false;
global.chat_npc = noone;