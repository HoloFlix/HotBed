// Interact with the tube if the player is nearby and presses "E"
if (keyboard_check_pressed(ord("E")) && distance_to_object(global.player_instance) < 32 && global.current_skin == "player") {
    obj_controller.switch_skin("tube");
    show_debug_message("Entered tube. Switched to player tube.");
}
