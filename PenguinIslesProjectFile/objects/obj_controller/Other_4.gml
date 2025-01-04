// Room Start Event for obj_controller
if (!instance_exists(obj_player) && !instance_exists(obj_player_icetruck)) {
    if (global.current_skin == "player") {
        global.player_instance = instance_create_layer(x, y, "Instances", obj_player);
    } else if (global.current_skin == "icetruck") {
        global.player_instance = instance_create_layer(x, y, "Instances", obj_player_icetruck);
    }
}