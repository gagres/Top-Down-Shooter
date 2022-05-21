/// @description Insert description here
// You can write your code in this editor

move();
look_at_mouse();
fire();
check_hit_by_enemy();

if (_is_invunerable) {
	image_alpha = random_range(0.3, 0.7);
} else {
	image_alpha = 1;
}
