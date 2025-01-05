xspd = 0;
yspd = 0;

move_spd =2;


sprite[RIGHT] = spr_player_right;
sprite[UP] = spr_player_up;
sprite[LEFT] = spr_player_left;
sprite[DOWN] = spr_player_down;

sprite[UP_RIGHT] = spr_player_up_right;
sprite[UP_LEFT] = spr_player_up_left;
sprite[DOWN_RIGHT] = spr_player_down_right;
sprite[DOWN_LEFT] = spr_player_down_left;

face = DOWN;

sliding = false;
slide_dir_x = 0;
slide_dir_y = 0;
slide_speed = 0;

// Random initial direction
direction = choose(0, 45, 90, 135, 180, 225, 270, 315, -0, -45, -90, -135, -180, -225, -270, -315);
change_direction_timer = fps * 2; // Change direction every 2 seconds