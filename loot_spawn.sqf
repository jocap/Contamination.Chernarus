_object = _this select 0;
_options = if (count _this > 1) then { _this select 1 } else { [] };
_type = if (count _options > 0) then { _options select 0 } else { "" };

/* // This works, but concatenating the condition string doesn't work.  To be added.
switch (_type) do
{
	case "garbage": { _range = 3 };
	default { _range = 2 };
};
*/

_object addAction [
	format ["Search %1", _type]
	, "search.sqf"
	, _type
	, 10
	, true
	, true
	, ""
	, "(position _this) distance (position _target) <= 3"
];