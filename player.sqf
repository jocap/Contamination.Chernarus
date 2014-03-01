cutText ["", "BLACK FADED", 2];
waitUntil { serverInitDone };
sleep 1;
cutText ["", "BLACK IN", 0];
execVM "effects.sqf";
["",  str(date select 1) + "." + str(date select 2) + "." + str(2011), "Somewhere in Chernarus"] spawn BIS_fnc_infoText;

_unit = _this select 0;

_unit setVariable ["hit_by", 0];
_unit setVariable ["weight", 0];
_unit setVariable ["collected_dose", 0]; // Sickness will be reached by 1200 collected dose.
_unit setVariable ["inventory", []];

_unit call compile preprocessFileLineNumbers "loops\player.sqf";