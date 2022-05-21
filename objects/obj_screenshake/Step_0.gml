/// @description Insert description here
// You can write your code in this editor

view_xport[0] = irandom_range(-_shake_value, _shake_value);
view_yport[0] = irandom_range(-_shake_value, _shake_value);

if (_shake_value > 0) {
	_shake_value *= 0.95;
	if (_shake_value <= 0.1) _shake_value = 0;
}
