// Mouse Left Pressed Event for obj_player
if (!instance_exists(obj_skinpicker)) {
    if (instance_exists(global.player_instance)) {
        // Open the skin picker at the player's current position
        instance_create_layer(global.player_instance.x, global.player_instance.y, "Instances", obj_skinpicker);
    } else {
        // Fallback: Center the skin picker in the view
        instance_create_layer(view_xview[0] + view_wview[0] / 2, view_yview[0] + view_hview[0] / 2, "Instances", obj_skinpicker);
    }
}
