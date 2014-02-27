_unit = _this select 0;

_unit setVariable ["sickness", 0]; // potential cures: potassium iodide tablets, vitamins, antibiotics (?)
_unit setVariable ["collected_dose", 0];
_unit setVariable ["time_since", 0];

while {true} do
{
	_closestRadiation = [radiations, _unit] call BIS_fnc_nearestPosition;
	_distance = _unit distance _closestRadiation;
	_rdist = round _distance;
	if (_rdist == 0) then { _rdist = 1 };

	_radiationLevel = 0;
	if (_distance <= 100) then
	{
		_unit setVariable ["time_since", 0];
		_radiationLevel = (10 / _rdist);
	};
	if (_distance <= 25) then
		{_radiationLevel = 0.4};

	if (_radiationLevel == 0) then { _unit setVariable ["time_since", (_unit getVariable "time_since") + 0.5] };
	if (_unit getVariable "time_since" > 45 && {_unit getVariable "collected_dose" > 0}) then
		{ _unit setVariable ["collected_dose", (_unit getVariable "collected_dose") - 1/128] };
	if (_unit getVariable "collected_dose" < 0) then { _unit setVariable ["collected_dose", 0] };

	_k = 1/4;
	//if (filter in items _unit) then { _k = 1/64 };
	//if (gasmask in items _unit) then { _k = 1/256 };
	//if (hazmat in items _unit) then { _k = 0 }; // if unit has hazmat suit, he needs a radio to talk to people. direct comm won't work
	_unit setVariable ["collected_dose", (_unit getVariable "collected_dose") + _k*_radiationLevel];

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

	titleText [str [_rdist], "PLAIN DOWN", 0];
	hintSilent format ["%1\n%2\n%3\n%4",
		_radiationLevel, _unit getVariable "collected_dose", _unit getVariable "time_since", damage _unit];

	sleep 0.5;
};