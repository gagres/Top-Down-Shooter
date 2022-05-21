/// @description Define enemy model
// You can write your code in this editor

_life = 1;
_change_move_timeout = room_speed;
_change_move_timer = _change_move_timeout;
_min_distance = 200;
_can_follow_player = true;
_max_speed = 3;
_min_slices = 1;
_max_slices = 5;
_damage = 1;

change_move = function () {
	speed = random(_max_speed);
	direction = irandom(359);
	image_angle = direction;
	_change_move_timer = _change_move_timeout;
}

keep_inside_room = function () {
	if (x - sprite_width / 2 < 0 || x + sprite_width / 2 > room_width) {
		hspeed *= -1;	
	}
	if (y - sprite_height / 2 < 0 || y + sprite_height / 2 > room_height) {
		vspeed *= -1;
	}
	image_angle = direction;
}

follow_player = function () {
	if (!instance_exists(obj_player)) return;
	var player = obj_player;
	var distance = point_distance(x, y, player.x, player.y);
	if (distance < _min_distance) {
		speed = 1;
		direction = point_direction(x, y, player.x, player.y);
		image_angle = direction;
	}
}

take_damage = function (_damage = 1) {
	_life -= _damage;
	if (_life <= 0) instance_destroy();
}

explode = function () {
	repeat(irandom_range(_min_slices, _max_slices)) {
		var _enemy = instance_create_layer(x, y, layer, obj_enemy_slice)
		_enemy.speed = irandom_range(6, 10);
		_enemy.direction = irandom(359);
		_enemy.image_angle = _enemy.direction;
	}
	instance_create_layer(x, y, layer, obj_enemy_trace);
	if (obj_screenshake) obj_screenshake.shake(_shake);
}

// init enemy movement
change_move();
