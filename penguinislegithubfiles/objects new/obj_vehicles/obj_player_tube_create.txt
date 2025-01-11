// Core variables
xspd = 0;
yspd = 0;
move_spd = 2;
sliding = true;
slide_dir_x = 0;
slide_dir_y = 0;
slide_speed = 3;

// Set direction and sprites
face = DOWN;
sprite[RIGHT] = spr_tube_right;
sprite[UP] = spr_tube_up;
sprite[LEFT] = spr_tube_left;
sprite[DOWN] = spr_tube_down;
sprite[UP_RIGHT] = spr_tube_up_right;
sprite[UP_LEFT] = spr_tube_up_left;
sprite[DOWN_RIGHT] = spr_tube_down_right;
sprite[DOWN_LEFT] = spr_tube_down_left;

// Set player's initial sprite
sprite_index = sprite[face];

// Set global player instance
global.player_instance = id;
global.current_skin = "tube";

// Debugging
show_debug_message("obj_player_tube: Initialized. Player instance ID: " + string(id));