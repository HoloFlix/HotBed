// Mouse Left Pressed Event for obj_player
if (!instance_exists(obj_skinpicker)) {
    var player_instance = instance_find(obj_controller, 0);
    if (player_instance != noone) {
        instance_create_layer(player_instance.x, player_instance.y, "Instances", obj_skinpicker);
    } else {
        instance_create_layer(view_xview[0] + view_wview[0] / 2, view_yview[0] + view_hview[0] / 2, "Instances", obj_skinpicker);
    }
}