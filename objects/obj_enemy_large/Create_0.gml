/// @description Insert description here
// You can write your code in this editor

event_inherited();

_life = 10;
_max_speed = 1;
_can_follow_player = false;
_change_move_timeout = room_speed * irandom_range(5, 15);
_change_move_timer = _change_move_timeout;
_shake = 20;
_min_slices = 15;
_max_slices = 30;
_damage = 2;

_lay_egg_interval = room_speed * 2;
_lay_egg_timer = _lay_egg_interval;
lay_egg = function () {
	if (_lay_egg_timer <= 0) {
		instance_create_layer(x, y, layer, obj_enemy_egg);
		_lay_egg_timer = room_speed * irandom_range(1, 3);
	}
	_lay_egg_timer--;
}
