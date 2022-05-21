/// @description Insert description here
// You can write your code in this editor

speed = 10;

image_xscale = 3;
image_yscale = 3;

_timeout = room_speed * 6;
_damage = 1;

hit_enemy = function () {
	var _enemy = instance_place(x, y, obj_enemy_model);
	if (_enemy == noone) return;
	_enemy.take_damage(_damage);
	if (instance_exists(obj_screenshake)) obj_screenshake.shake(2);
	instance_destroy();
}
