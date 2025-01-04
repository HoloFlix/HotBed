// Create Event for obj_skinpicker
depth = -100; // Ensuring the skin picker is in front of everything

// Set the desired menu size
menu_width = 75;
menu_height = 100;

// Get the currently controlled player object
var player_instance = instance_find(obj_player, 0);
if (player_instance != noone) {
    // Center the skin picker menu around the player
    x = player_instance.x - menu_width / 2;
    y = player_instance.y - menu_height / 2;
} else {
    // If no player instance is found, center on the view
    x = view_xview[0] + (view_wview[0] - menu_width) / 2;
    y = view_yview[0] + (view_hview[0] - menu_height) / 2;
}

var button_width = 37.5; // Desired button width
var button_height = 10; // Desired button height
var button_padding = 2.5; // Padding between buttons

var button_x = x + (menu_width - button_width) / 2; // Center buttons horizontally within the menu width
var button_y = y + button_padding; // Start button positioning from the top with padding

// Dynamically create buttons for each available skin
for (var i = 0; i < array_length(global.skins); i++) {
    var skin = global.skins[i];
    var btn_skin = instance_create_layer(button_x, button_y, "Instances", obj_button);
    btn_skin.skin_object = skin.object; // Set the object to switch to
    btn_skin.skin_name = skin.name; // Set the name for the button text
    btn_skin.sprite_index = spr_skinpicker_button; // Ensure the correct sprite is assigned
    
    // Scale buttons to the specified width and height
    btn_skin.image_xscale = button_width / sprite_get_width(spr_skinpicker_button);
    btn_skin.image_yscale = button_height / sprite_get_height(spr_skinpicker_button);

    button_y += button_height + button_padding; // Adjust spacing for the next button
}

// Create a button to close the skin picker menu
var btn_close = instance_create_layer(button_x, button_y, "Instances", obj_button);
btn_close.skin_object = noone; // No skin to switch to, just close the menu
btn_close.skin_name = "Close"; // Set the name for the button text
btn_close.sprite_index = spr_skinpicker_button; // Ensure the correct sprite is assigned

// Scale close button to fit the specified width and height
btn_close.image_xscale = button_width / sprite_get_width(spr_skinpicker_button);
btn_close.image_yscale = button_height / sprite_get_height(spr_skinpicker_button);