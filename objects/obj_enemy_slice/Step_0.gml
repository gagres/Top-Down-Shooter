/// @description Insert description here
// You can write your code in this editor

speed = lerp(speed, 0, 0.05);

if (image_alpha <= 0) {
	instance_destroy();
}

image_alpha *= 0.95;
