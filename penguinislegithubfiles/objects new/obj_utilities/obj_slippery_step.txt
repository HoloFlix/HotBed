if (!sliding) {
    sliding = true;
    slide_dir_x = sign(xspd);
    slide_dir_y = sign(yspd);
    slide_speed = move_spd *5; // Initial slide speed, adjust as necessary
}