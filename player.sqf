sleep 0.1;

_unit = _this select 0;

_unit setVariable ["hit_by", 0];
_unit setVariable ["collected_dose", 0];
_unit setVariable ["inventory", []];

while {true} do
{
	titleText [str (_unit distance ([radiation_sources, _unit] call BIS_fnc_nearestPosition)), "PLAIN DOWN"];

	_unit execVM "radiation\hitByParticles.sqf";

	_unit call fnc_debugMonitor;

	sleep 0.005;
};