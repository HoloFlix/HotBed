// Create Event for obj_player_icetruck

global.player_instance = id;
global.current_skin = "icetruck";

// Core variables
xspd = 0;
yspd = 0;
move_spd = 4;

// Set direction and sprites
face = DOWN;
sprite[RIGHT] = spr_icetruck_right;
sprite[UP] = spr_icetruck_up;
sprite[LEFT] = spr_icetruck_left;
sprite[DOWN] = spr_icetruck_down;
sprite[UP_RIGHT] = spr_icetruck_up_right;
sprite[UP_LEFT] = spr_icetruck_up_left;
sprite[DOWN_RIGHT] = spr_icetruck_down_right;
sprite[DOWN_LEFT] = spr_icetruck_down_left;

// Debugging
show_debug_message("obj_player_icetruck: Initialized. Player instance ID: " + string(id));