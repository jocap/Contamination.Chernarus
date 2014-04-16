_object = _this select 0;
_unit = _this select 1;
_action = _this select 2;
_type = _this select 3;

_gm_chance = 0; // in percent // GM = Geiger-Müller
_used_filter_chance = 0;
_gas_mask_chance = 0;
_vodka_chance = 0;

_object removeAction _action;

switch (_type) do
{
	case "garbage":
	{
		_gm_chance = 10;
		_used_filter_chance = 20;
		_gas_mask_chance = 0.5;
		_vodka_chance = 75;
	};
	default {};
};

_gm_roll = floor(random 99) + 1;
_used_filter_roll = floor(random 99) + 1;
_gas_mask_roll = floor(random 99) + 1;
_vodka_roll = floor(random 99) + 1;

if (_gm_roll <= _gm_chance
	or {_used_filter_roll <= _used_filter_chance}
	or {_gas_mask_roll <= _gas_mask_chance}
	or {_vodka_roll <= _vodka_chance}) then
{
	_item = "something";
	// The item that was rolled and had the smallest chance wins
	if (_gm_roll < _used_filter_roll
		and {_gm_roll < _gas_mask_roll}
		and {_gm_roll < _vodka_roll}) then { _item = "gm"; };
	if (_used_filter_roll < _gm_roll
		and {_used_filter_roll < _gas_mask_roll}
		and {_used_filter_roll < _vodka_roll}) then { _item = "used_filter"; };
	if (_gas_mask_roll < _gm_roll
		and {_gas_mask_roll < _used_filter_roll}
		and {_gas_mask_roll < _vodka_roll}) then { _item = "gas_mask"; };
	if (_vodka_roll < _gm_roll
		and {_vodka_roll < _used_filter_roll}
		and {_vodka_roll < _gas_mask_roll}) then { _item = "vodka"; };

	titleText ["Found " + ([_item, true] call fnc_getItemName) + ".", "PLAIN DOWN"];

	_object addAction [
		format ["Take " + ([_item] call fnc_getItemName), _type]
		, "inventory\take.loot.sqf"
		, _item
		, 10
		, true
		, false
		, ""
		, "(position _this) distance (position _target) <= 3"
	];

	sleep 2;
	titleFadeOut 2;
}
else
{
	titleText ["Found nothing.", "PLAIN DOWN"];
	sleep 2;
	titleFadeOut 2;
};