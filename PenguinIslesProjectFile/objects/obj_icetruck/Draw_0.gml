// Draw Event for obj_icetruck
draw_self(); // Draw the sprite

// Display the interaction message if the player is close
if (distance_to_object(global.player_instance) < 32) { // Adjust the distance as needed
    var text = "Press 'E' to enter";
    var text_width = string_width(text);
    draw_set_color(c_black); // Set text color to black
    draw_text(x + (sprite_width / 2) - (text_width / 2), y - 20, text); // Center the text
    draw_set_font(-1); // Reset to default font
}