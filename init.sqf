execVM "effects.sqf";

// Functions
fnc_anim_agony = compile preprocessFileLineNumbers "functions\anim_agony.sqf";
fnc_addToVar = compile preprocessFileLineNumbers "functions\addToVar.sqf";
fnc_debugMonitor = compile preprocessFileLineNumbers "functions\debugMonitor.sqf";

// Radiation
radiation_sources = [];
publicVariable "radiation_sources";

// Random spooky wind sound
while {true} do
	{playSound "wind"; sleep ((round(random 5)+1)*30)};