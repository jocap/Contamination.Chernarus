_unit = _this;

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
\n
Inventory: %5
",
	//_radiationLevel*250,
	_unit getVariable "hit_by",
	_unit getVariable "collected_dose",
	_unit getVariable "time_since",
	100*(1-(damage _unit)), // damage -> health in percent
	str(_unit getVariable "inventory")
];