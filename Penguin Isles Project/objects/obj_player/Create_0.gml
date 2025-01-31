// Create Event for obj_player

// Core variables
xspd = 0;
yspd = 0;
move_spd = 2;

// Sliding variables
sliding = false;
slide_dir_x = 0;
slide_dir_y = 0;
slide_speed = 0;

// Driving variables
driving = false;
ice_truck_sprite = spr_icetruck_facedown;
original_sprite = sprite_index;

// Set direction and sprites
face = DOWN;
sprite[RIGHT] = spr_player_right;
sprite[UP] = spr_player_up;
sprite[LEFT] = spr_player_left;
sprite[DOWN] = spr_player_down;
sprite[UP_RIGHT] = spr_player_up_right;
sprite[UP_LEFT] = spr_player_up_left;
sprite[DOWN_RIGHT] = spr_player_down_right;
sprite[DOWN_LEFT] = spr_player_down_left;

// Debugging
show_debug_message("obj_player: Initialized. Driving state: " + string(driving));