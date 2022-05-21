/// @description Insert description here
// You can write your code in this editor

keep_inside_room();

if (_change_move_timer <= 0) {
	change_move();
}
_change_move_timer--;

if (_can_follow_player) follow_player();
