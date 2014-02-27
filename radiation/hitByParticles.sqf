_unit = _this;

{
	if (_x select 1) then
	{
		_relDir = [_unit, _x select 0] call BIS_fnc_relativeDirTo;
		_angle = _x select 2;

		if (_relDir > (_angle - 5) and {_relDir < (_angle + 5)} and {_unit distance (_x select 0) <= 50}) then
		{
			[_unit, "hit_by", 1] call fnc_addToVar;
			if (floor(random 2) == 0) then {
				[_unit, "collected_dose", 1] call fnc_addToVar;
			};
			playSound "click";
		};
	};
} forEach isotopes;