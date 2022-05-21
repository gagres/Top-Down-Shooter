/// @description Insert description here
// You can write your code in this editor

start = function () {
	var random_x = irandom_range(0 + 100, room_width - 100);
	var random_y = irandom_range(0 + 100, room_height - 100);
	instance_create_layer(random_x, random_y, "Player", obj_player);
	instance_create_layer(0, 0, layer, obj_screenshake);
	spawn_enemies();
}

spawn_enemies = function () {
	if (!instance_exists(obj_player)) return;
	var _qtd = irandom_range(3, 7);
	do {
		var random_x = irandom_range(0 + 100, room_width - 100);
		var random_y = irandom_range(0 + 100, room_height - 100);
		var enemy = instance_create_layer(random_x, random_y, "Enemies", obj_enemy_large);
		var dist = point_distance(enemy.x, enemy.y, obj_player.x, obj_player.y);
		if (dist < 200) {
			instance_destroy(enemy, false);
			continue;
		}
	} until (instance_number(obj_enemy_model) < _qtd);
}
