// Handle Player Warping
if place_meeting(x, y, obj_player) && !instance_exists(obj_warp)
{
    var inst = instance_create_depth(0, 0, -9999, obj_warp);
    inst.target_x = target_x;
    inst.target_y = target_y;
    inst.target_rm = target_rm;
    inst.target_face = target_face;
    inst.target_instance = instance_find(obj_player, 0); // Set the target instance to the player
}

// Handle Ice Truck Warping
if (place_meeting(x, y, obj_player_icetruck) && !instance_exists(obj_warp))
{
    var inst = instance_create_depth(0, 0, -9999, obj_warp);
    inst.target_x = target_x;
    inst.target_y = target_y;
    inst.target_rm = target_rm;
    inst.target_face = target_face;
    inst.target_instance = instance_find(obj_player_icetruck, 0); // Set the target instance to the ice truck
}

// Handle Tube Player Warping
if (place_meeting(x, y, obj_player_tube) && !instance_exists(obj_warp)) 
{    
	var inst = instance_create_depth(0, 0, -9999, obj_warp);
    inst.target_x = target_x;
    inst.target_y = target_y;
    inst.target_rm = target_rm;
    inst.target_face = target_face;
    inst.target_instance = instance_find(obj_player_tube, 0); // Target the tube player
}

// Handle NPC Warping
if place_meeting(x, y, obj_npc) && !instance_exists(obj_warp)
{
    var inst = instance_create_depth(0, 0, -9999, obj_warp);
    inst.target_x = target_x;
    inst.target_y = target_y;
    inst.target_rm = target_rm;
    inst.target_face = target_face;
    inst.target_instance = instance_find(obj_npc, 0); // Set the target instance to the NPC
}
