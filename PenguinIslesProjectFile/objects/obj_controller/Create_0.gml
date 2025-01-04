// Create Event for obj_controller
global.skins = [
    { name: "Player", object: obj_player },
    { name: "Ice Truck", object: obj_player_icetruck }
];

// Create Event for obj_controller
if (!instance_exists(obj_player) && !instance_exists(obj_player_icetruck)) {
    global.current_skin = "player"; // Starting skin
    global.player_instance = instance_create_layer(x, y, "Instances", obj_player); // Create player instance
} else {
    // Find the existing player or ice truck instance
    if (instance_exists(obj_player)) {
        global.current_skin = "player";
        global.player_instance = instance_find(obj_player, 0);
    } else if (instance_exists(obj_player_icetruck)) {
        global.current_skin = "icetruck";
        global.player_instance = instance_find(obj_player_icetruck, 0);
    }
}