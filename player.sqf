_unit = _this select 0;

_unit setVariable ["sickness", 0]; // potential cures: potassium iodide tablets, vitamins, antibiotics (?)
_unit setVariable ["collected_dose", 0];
_unit setVariable ["time_since", 0];
_unit setVariable ["inventory", []];

while {true} do
{
	// Get distance to closest radiation source
	_closestRadiation = [radiation_sources, _unit] call BIS_fnc_nearestPosition;
	_distance = _unit distance _closestRadiation;
	_rdist = round _distance;
	if (_rdist == 0) then { _rdist = 1 };

	// Set radiation level
	_radiationLevel = 0;
	if (_distance <= 100) then
	{
		_unit setVariable ["time_since", 0];
		_radiationLevel = (10 / _rdist);
	};
	if (_distance <= 25) then
		{_radiationLevel = 0.4};

	// Decrease collected dose after 45 seconds >100 meters from a radiation source
	if (_radiationLevel == 0) then { _unit setVariable ["time_since", (_unit getVariable "time_since") + 0.5] };
	if (_unit getVariable "time_since" > 45 && {_unit getVariable "collected_dose" > 0}) then
		{ _unit setVariable ["collected_dose", (_unit getVariable "collected_dose") - 1/128] };
	if (_unit getVariable "collected_dose" < 0) then { _unit setVariable ["collected_dose", 0] };

	// Collect dose when 100 m within a radiation source
	_k = 1/4; // Dose co-efficient
	//if (filter in items _unit) then { _k = 1/64 };
	//if (gasmask in items _unit) then { _k = 1/256 };
	//if (hazmat in items _unit) then { _k = 0 }; // if unit has hazmat suit, he needs a radio to talk to people. direct comm won't work
	_unit setVariable ["collected_dose", (_unit getVariable "collected_dose") + _k*_radiationLevel];

	// Acquire radiation sickness if dose >= 50
	// and randomize the agony animation when sick
	if (_unit getVariable "collected_dose" >= 50 && {_unit getVariable "sickness" == 0}) then
	{
		_unit setVariable ["sickness", 1];
		[_unit] call fnc_anim_agony;
	};
	if ((_unit getVariable "sickness") == 1) then
	{
		_unit setDamage (damage _unit + 0.000125);
		if (floor random 100 >= 99) then // 1% risk every half second
			{ [_unit] call fnc_anim_agony };
	};

	// Debug console
	hintSilent format ["DEBUG MONITOR:\n\nRadiation Level: %1\nCollected Dose: %2\nTime Since Exposed: %3\nHealth: %4",
		_radiationLevel*250, _unit getVariable "collected_dose", _unit getVariable "time_since", 100*(1-(damage _unit))];

	sleep 0.5;
};