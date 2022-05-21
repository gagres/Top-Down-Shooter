/// @description Insert description here
// You can write your code in this editor

_life = 3;
_speed = 3;
_delay_fire = room_speed * .2;
_last_fire_timer = 0;
_is_invunerable = false;
_invunerability_time = room_speed * 2;

move = function () {
	var move_left = keyboard_check(ord("A"));
	var move_right = keyboard_check(ord("D"));
	var move_up = keyboard_check(ord("W"));
	var move_down = keyboard_check(ord("S"));
	
	var dir_x = (move_right - move_left) * _speed;
	var dir_y = (move_down - move_up) * _speed;
	
	x += dir_x;
	y += dir_y;
	
	if (dir_x != 0 || dir_y != 0) {
		walk();
	} else {
		idle()
	}
}

idle = function () {
	image_index = 0;
	image_speed = 0;
}

walk = function () {
	image_speed = 1;
}

look_at_mouse = function () {
	var dir = point_direction(x + 15, y - 5, mouse_x, mouse_y);
	image_angle = dir;
}

fire = function () {
	if (_last_fire_timer <= 0 && mouse_check_button(mb_left)) {
		var bullet = instance_create_layer(x, y, "Bullets", obj_bullet);
		bullet.direction = point_direction(bullet.x, bullet.y, mouse_x, mouse_y);
		_last_fire_timer = _delay_fire;
		sprite_index = spr_player_shooting;
	}
	if (_last_fire_timer <= 0) {
		sprite_index = spr_player;
	}
	_last_fire_timer--;
}

take_damage = function () {
	_life--;
	if (_life <= 0) {
		instance_destroy();
	}
}

check_hit_by_enemy = function () {
	if (_is_invunerable) return;
	var enemy = instance_place(x, y, obj_enemy_model);
	if (enemy == noone) return;
	take_damage(enemy._damage);
	enemy.take_damage(1);
	make_invunerable();
}


make_invunerable = function () {
	_is_invunerable = true;
	alarm[0] = _invunerability_time;
}

