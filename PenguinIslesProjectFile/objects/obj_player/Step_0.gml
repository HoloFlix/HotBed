// Step Event for obj_player

// Handle entering and exiting the ice truck
if (keyboard_check_pressed(ord("E"))) {
    if (!driving && place_meeting(x, y, obj_icetruck)) {
        // Enter the ice truck
        driving = true;
        sprite_index = ice_truck_sprite;
        var icetruck = instance_place(x, y, obj_icetruck);
        if (icetruck != noone) {
            icetruck.instance_destroy(); // Destroy the ice truck instance
        }
    } else if (driving) {
        // Exit the ice truck
        driving = false;
        sprite_index = original_sprite;
        var exit_x = x + lengthdir_x(32, face); // Adjust the distance as needed
        var exit_y = y + lengthdir_y(32, face); // Adjust the distance as needed
        instance_create_layer(exit_x, exit_y, "Instances", obj_icetruck);
    }
}

// Handle movement
right_key = keyboard_check(ord("D")) || keyboard_check(vk_right);
left_key = keyboard_check(ord("A")) || keyboard_check(vk_left);
up_key = keyboard_check(ord("W")) || keyboard_check(vk_up);
down_key = keyboard_check(ord("S")) || keyboard_check(vk_down);

// Get xspd & yspd
if (!sliding) {
    xspd = (right_key - left_key) * move_spd;
    yspd = (down_key - up_key) * move_spd;
} else {
    // Continue sliding
    xspd = slide_dir_x * slide_speed;
    yspd = slide_dir_y * slide_speed;

    // Decelerate slide over time
    slide_speed *= 0.98; // Adjust this value to control sliding deceleration

    // Stop sliding if speed is low enough
    if (abs(slide_speed) < 0.1) {
        sliding = false;
        xspd = 0;
        yspd = 0;
    }
}

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

// Collisions for obj_icetruck
if (place_meeting(x + xspd, y, obj_wall) || place_meeting(x + xspd, y, obj_icetruck)) {
    xspd = 0;
}
if (place_meeting(x, y + yspd, obj_wall) || place_meeting(x, y + yspd, obj_icetruck)) { 
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