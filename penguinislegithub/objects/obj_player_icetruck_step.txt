// Step Event for obj_icetruck_player
right_key = keyboard_check(ord("D")) || keyboard_check(vk_right);
left_key = keyboard_check(ord("A")) || keyboard_check(vk_left);
up_key = keyboard_check(ord("W")) || keyboard_check(vk_up);
down_key = keyboard_check(ord("S")) || keyboard_check(vk_down);

// Get xspd & yspd
xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;

// Pause
if instance_exists(obj_pauser) {
    xspd = 0;
    yspd = 0;
}

// Set sprite
mask_index = sprite[DOWN];
if (yspd < 0) {
    if (xspd < 0) { face = UP_LEFT; }
    if (xspd > 0) { face = UP_RIGHT; }
}

if (yspd > 0) {
    if (xspd < 0) { face = DOWN_LEFT; }
    if (xspd > 0) { face = DOWN_RIGHT; }
}

if (yspd == 0) {
    if (xspd > 0) { face = RIGHT; }
    if (xspd < 0) { face = LEFT; }
}

if (xspd == 0) {
    if (yspd > 0) { face = DOWN; }
    if (yspd < 0) { face = UP; }
}
sprite_index = sprite[face];

// Collisions
if (place_meeting(x + xspd, y, obj_wall)) {
    xspd = 0;
}
if (place_meeting(x, y + yspd, obj_wall)) { // changed second argument to y
    yspd = 0;
}

// Move the player
x += xspd;
y += yspd;

// Animate
if (xspd == 0 && yspd == 0) {
    image_index = 0;
}

// Depth
depth = -bbox_bottom;