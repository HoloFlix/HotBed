skin = "player"; // For obj_player

xspd = 0;
yspd = 0;
move_spd =2;

sliding = false;
slide_dir_x = 0;
slide_dir_y = 0;
slide_speed = 0;

sprite[RIGHT] = spr_player_right;
sprite[UP] = spr_player_up;
sprite[LEFT] = spr_player_left;
sprite[DOWN] = spr_player_down;

sprite[UP_RIGHT] = spr_player_up_right;
sprite[UP_LEFT] = spr_player_up_left;
sprite[DOWN_RIGHT] = spr_player_down_right;
sprite[DOWN_LEFT] = spr_player_down_left;

face = DOWN;

// Variables for driving the ice truck
driving = false;
ice_truck_sprite = spr_icetruck_facedown;
original_sprite = sprite_index;