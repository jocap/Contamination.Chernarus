_object = _this select 0;
_unit = _this select 1;
_action = _this select 2;
_type = _this select 3;

_gm_chance = 0; // in percent
_used_filter_chance = 0;
_gasmask_chance = 0;

_object removeAction _action;

switch (_type) do
{
	case "garbage":
	{
		_gm_chance = 10; // short for Geiger-Mueller counter
		_used_filter_chance = 20;
		_gasmask_chance = 0.5;
	};
	default {};
};

_gm_roll = floor(random 99) + 1;
_used_filter_roll = floor(random 99) + 1;
_gasmask_roll = floor(random 99) + 1;

if (_gm_roll <= _gm_chance or {_used_filter_roll <= _used_filter_chance} or {_gasmask_roll <= _gasmask_chance}) then
{
	_item = "";
	_itemName = "nothing";
	// The item that was rolled and had the smallest chance wins
	if (_gm_roll < _used_filter_roll and {_gm_roll < _gasmask_roll}) then { _item = "gm"; _itemName = "a Geiger counter" };
	if (_used_filter_roll < _gm_roll and {_used_filter_roll < _gasmask_roll}) then { _item = "used_filter"; _itemName = "a used filter" };
	if (_gasmask_roll < _gm_roll and {_gasmask_roll < _used_filter_roll}) then { _item = "gasmask"; _itemName = "a gas mask" };

	titleText ["Found " + _itemName + ".", "PLAIN DOWN"];
	[_unit, "inventory", [_item]] call fnc_addToVar;
	sleep 2;
	titleFadeOut 2;
}
else
{
	titleText ["Found nothing.", "PLAIN DOWN"];
	sleep 2;
	titleFadeOut 2;
};