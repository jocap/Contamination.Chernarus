execVM "effects.sqf";

TIMER = 0.005;
publicVariable "TIMER";

// Functions

_functions = [
	"anim_agony"
	, "addToVar"
	, "debugMonitor"
	, "SHK_pos"
	, "registerHits"
	, "inInventory"
	, "arrayToString"
	, "getItemName"
	, "map"
	, "capitalize"
	, "getWeight"
]; // Is there any way to list files in a directory in SQF?  Because that would be great in this case.

{ call compile format ["fnc_%1 = compile preprocessFileLineNumbers ""functions\%1.sqf""; publicVariable ""fnc_%1""", _x] }
	forEach _functions;

// Radiation
radiation_sources = [];
publicVariable "radiation_sources";

execVM "radiation\spawnParticles.sqf";

while {true} do
{
	playSound "wind"; sleep ((round(random 5)+1)*30); // Random spooky wind sound
};