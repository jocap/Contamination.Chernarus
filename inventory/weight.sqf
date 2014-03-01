_weapons = weapons _this;
_inventory = _this getVariable "inventory";

_w = 0;
{
	_w = _w + ([_x, "weapon"] call fnc_getWeight);
} forEach _weapons;
{
	_w = _w + ([_x, "item"] call fnc_getWeight);
} forEach _inventory;

_this setVariable ["weight", _w];