{
	if (_x select 1) then
	{
		_relDir = [_this, _x select 0] call BIS_fnc_relativeDirTo;
		_angle = _x select 2;

		_plusminus = 100/(_this distance (_x select 0)); // how far off the angle can be for a hit to register
		if (100 < _this distance (_x select 0)) then { _plusminus = 0 };
		if (_relDir > (_angle - _plusminus) and {_relDir < (_angle + _plusminus)}) then
		{
			[_this, "hit_by", 1] call fnc_addToVar; // Updates the amount of disintegrations detected by GM counter
			
			playSound "click"; // GM ticking sound!
			
			// Different risk to "collect" the particle (basically, take cell damage or inhale it) for different gear
			_risk = 50; // in percent
			if ([_this, "used_filter"] call inInventory) then { _risk = 25 };
			if ([_this, "gas_mask"] call inInventory) then { _risk = 12.5 };

			if (floor(random 100)+1 <= _risk) then {
				[_this, "collected_dose", 1] call fnc_addToVar;
			};

			
		};
	};
} forEach isotopes;