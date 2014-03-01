hintSilent format ["
DEBUG MONITOR:
\n
\n
Disintegrations: %1
\n
Collected Dose: %2
\n
Time Since Exposed: %3
\n
Health: %4
\n
Weight Carried: %5 kg
\n
\n
Inventory:
\n
%6
",
	_this getVariable "hit_by"
	, _this getVariable "collected_dose"
	, _this getVariable "time_since"
	, str([100*(1-(damage _this)), 2] call fnc_formatNumber) + "%" // damage -> health in percent
	, _this getVariable "weight"
	, ([_this getVariable "inventory", { [_this select 0, false, true] call fnc_getItemName }] call fnc_map) call fnc_arrayToString
];