_object = _this select 0;
_k = if (1 < count _this) then { _this select 1 } else { 1 };
// May add options like strength in the future

radiationSources = radiationSources + [[_object, _k]];
publicVariable "radiationSources";

// Turn off street lamps nearby
{ _x switchLight "OFF" } forEach ((getPos _object) nearObjects ["StreetLamp",200]);