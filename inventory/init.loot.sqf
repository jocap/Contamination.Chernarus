_object = _this select 0;
_options = if (count _this > 1) then { _this select 1 } else { [] };
_type = if (count _options > 0) then { _options select 0 } else { "" };

_object addAction [
	format ["Search %1", _type]
	, "inventory\search.loot.sqf"
	, _type
	, 10
	, true
	, false
	, ""
	, "(position _this) distance (position _target) <= 3"
];