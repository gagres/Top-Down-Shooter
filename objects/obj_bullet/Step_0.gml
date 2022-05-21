/// @description Insert description here
// You can write your code in this editor

image_xscale = lerp(image_xscale, 1, 0.3);
image_yscale = lerp(image_yscale, 1, 0.3);

if (_timeout <= 0) instance_destroy();
_timeout--;

hit_enemy();
