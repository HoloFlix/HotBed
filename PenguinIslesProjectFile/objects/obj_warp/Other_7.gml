// Animation End Event for obj_warp
room_goto(target_rm);
if (target_instance != noone) {
    target_instance.x = target_x;
    target_instance.y = target_y;
    target_instance.face = target_face; // Optional: set the facing direction
}
image_speed = -1;