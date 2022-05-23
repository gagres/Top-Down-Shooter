/// @description Insert description here
// You can write your code in this editor

_level = 1;
_timer_restart_room = room_speed * 5;
_scheduled_restart = false;

start = function () {
	randomize();
	resize_room();
	change_background();
	create_player();
	instance_create_layer(0, 0, layer, obj_screenshake);
	spawn_enemies();
}

resize_room = function () {
	room_width = irandom_range(1920, 3000);
	room_height = irandom_range(1080, 2500);
}

change_background = function () {
	var lay_id = layer_get_id("Background");
	var back_id = layer_background_get_id(lay_id);
	var background = choose(spr_background_1, spr_background_2);
	layer_background_sprite(back_id, background);
}

create_player = function () {
	var random_x = irandom_range(0 + 100, room_width - 100);
	var random_y = irandom_range(0 + 100, room_height - 100);
	instance_create_layer(random_x, random_y, "Player", obj_player);
}

spawn_enemies = function () {
	if (!instance_exists(obj_player)) return;
	var _qtd = irandom_range(3, 7) * _level;
	//// remove
	//_qtd = 1;
	do {
		var random_x = irandom_range(0 + 100, room_width - 100);
		var random_y = irandom_range(0 + 100, room_height - 100);
		var enemy = instance_create_layer(random_x, random_y, "Enemies", obj_enemy_large);
		var dist = point_distance(enemy.x, enemy.y, obj_player.x, obj_player.y);
		if (dist < 200) {
			instance_destroy(enemy, false);
		}
	} until (instance_number(obj_enemy_model) >= _qtd);
}

check_enemies = function () {
	if (instance_number(obj_enemy_large) == 0) {
		schedule_restart_room();
	}
}

schedule_restart_room = function ()
{
	if (_scheduled_restart) return;
	_scheduled_restart = true;
	alarm[0] = _timer_restart_room;
}
