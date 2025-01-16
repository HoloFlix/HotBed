if (!sliding) {
    sliding = true;
    slide_dir_x = sign(xspd);
    slide_dir_y = sign(yspd);
     slide_speed = max(abs(xspd), abs(yspd)); // Start with current speed
}

 // Deceleration logic for sliding
    xspd += -slide_dir_x * 0.2; // Adjust the "0.2" for more/less deceleration
    yspd += -slide_dir_y * 0.2;

    // Add a rubber-band effect by reversing the sliding direction slightly
    if (abs(xspd) < 0.1) slide_dir_x = -slide_dir_x;
    if (abs(yspd) < 0.1) slide_dir_y = -slide_dir_y;

    // Clamp speed to avoid infinite sliding
    slide_speed *= 0.95; // Reduce speed gradually
	if (slide_speed < 0.1) {
		sliding = false;
		
	if (place_meeting(x + slide_dir_x * slide_speed, y, obj_wall)) {
    slide_dir_x = -slide_dir_x; // Bounce back
	}
	if (place_meeting(x, y + slide_dir_y * slide_speed, obj_wall)) {
    slide_dir_y = -slide_dir_y;
	}
}
