sleep 0.1;

_unit = _this select 0;

_unit setVariable ["hit_by", 0];
_unit setVariable ["collected_dose", 0]; // Sickness will be reached by 1200 collected dose.
_unit setVariable ["inventory", []];

while {true} do
{
	_unit call fnc_exposed;

	_unit call fnc_debugMonitor;

	sleep 0.005;
};