/// @description Insert description here
// You can write your code in this editor

_shake_value = 0;

shake = function (_valor) {
	if (_valor <= _shake_value) return;
	_shake_value = _valor;
}
