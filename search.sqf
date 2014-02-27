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
		_gm_chance = 20; // short for Geiger-Mueller counter
		_used_filter_chance = 50;
		_gasmask_chance = 1;
	};
	default {};
};

_gm_roll = floor(random 99) + 1 <= _gm_chance;
_used_filter_roll = floor(random 99) + 1 <= _used_filter_chance;
_gasmask_roll = floor(random 99) + 1 <= _gasmask_chance;

if (_gm_roll or {_used_filter_roll} or {_gasmask_roll}) then
{
	
};