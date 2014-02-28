sleep 0.1;

_unit = _this select 0;

_unit setVariable ["hit_by", 0];
_unit setVariable ["weight", 0];
_unit setVariable ["collected_dose", 0]; // Sickness will be reached by 1200 collected dose.
_unit setVariable ["inventory", ["gm", "used_filter"]];

while {true} do
{
	_unit execVM "inventory\weight.sqf";

	_unit call fnc_registerHits;

	_unit call fnc_debugMonitor;

	sleep TIMER;
};