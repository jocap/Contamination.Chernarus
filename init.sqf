execVM "effects.sqf";

// Functions
fnc_anim_agony = compile preprocessFileLineNumbers "functions\anim_agony.sqf";
fnc_addToVar = compile preprocessFileLineNumbers "functions\addToVar.sqf";
fnc_debugMonitor = compile preprocessFileLineNumbers "functions\debugMonitor.sqf";
fnc_SHK_pos = compile preprocessFileLineNumbers "functions\SHK_pos.sqf";
publicVariable "fnc_anim_agony";
publicVariable "fnc_addToVar";
publicVariable "fnc_debugMonitor";
publicVariable "fnc_SHK_pos";

// Radiation
radiation_sources = [];
publicVariable "radiation_sources";

execVM "radiation\isotopes.sqf";

// Random spooky wind sound
while {true} do
	{playSound "wind"; sleep ((round(random 5)+1)*30)};