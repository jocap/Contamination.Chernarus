serverInitDone = false;
publicVariable "serverInitDone";
if (isServer) then // executes on server
{

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
		, "formatNumber"
	]; // Is there any way to list files in a directory in SQF?  Because that would be great in this case.

	{ call compile format ["fnc_%1 = compile preprocessFileLineNumbers ""functions\%1.sqf""; publicVariable ""fnc_%1""", _x] }
		forEach _functions;

	// Radiation
	radiationSources = [];
	publicVariable "radiationSources";
	// Spawn particles
	execVM "radiation\atoms.sqf";

	serverInitDone = true;
	publicVariable "serverInitDone";
};

while {true} do // executes on all clients
{
	playSound "wind"; sleep ((round(random 5)+1)*30); // Random spooky wind sound
};