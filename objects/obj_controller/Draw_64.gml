/// @description Insert description here
// You can write your code in this editor

var camera_width = camera_get_view_width(view_camera[0]);
var camera_height = camera_get_view_height(view_camera[0]);
draw_set_font(fnt_level);
draw_text(camera_width - 80, 10, _level);
draw_set_font(-1);

if (alarm[0] != -1) {
	draw_set_font(fnt_next_level_timer);
	draw_text(camera_width / 2 - 30, camera_height / 2 - 60, round(alarm[0] / room_speed));
	draw_set_font(fnt_next_level_txt);
	draw_set_color(c_black);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(camera_width / 2 - 20, camera_height / 2 + 20, "Next Round");
	draw_set_font(-1);
	draw_set_color(c_white);
	draw_set_halign(-1);
	draw_set_valign(-1);
}

with (obj_player) {
	var _prox = instance_nearest(x, y, obj_enemy_large);
	if (!_prox) return;
	var _dir = point_direction(x, y, _prox.x, _prox.y);
	draw_sprite_ext(obj_arrow, 0, camera_width / 2, 40, 1, 1, _dir, c_white, 1);
}
