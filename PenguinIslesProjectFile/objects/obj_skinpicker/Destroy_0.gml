// Destroy Event for obj_skinpicker
// Destroy all button instances when the skin picker menu is destroyed
with (instance_find(obj_button, 0)) {
    instance_destroy();
}
shader_reset(); // Reset the shader to remove the blur effect