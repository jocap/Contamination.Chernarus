execVM "effects.sqf";

// Functions

fnc_anim_agony = compile preprocessFileLineNumbers "functions\anim_agony.sqf";

// Radiation

radiations = [];
_loop = true;
_i = -1;
while {_loop} do
{
	_i = _i + 1;
	if (getMarkerColor (format ["radiation_%1", _i]) != "") then // marker exists
	{
		radiations = radiations + [getMarkerPos (format ["radiation_%1", _i])];
		_nomarker = 0;
	};
	if (getMarkerColor (format ["radiation_%1", _i+1]) == "") then // next marker doesn't exist
		{ _loop = false };
};
publicVariable "radiations";

// Random spooky wind sound

while {true} do
	{playSound "wind"; sleep ((round(random 5)+1)*30)};