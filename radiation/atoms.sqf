// Simulates unstable atoms that decay randomly.

waitUntil { count radiationSources > 0 };

atoms = [];
publicVariable "atoms";

_decay = {
	{
		if (floor(random 2) == 0) then // atom decays
		{
			_x set [1, true];
			_x set [2, random 360];
		}
	} forEach atoms;
	publicVariable "atoms";
	sleep 0.005; // as long as the player.sqf loop
	{
		_x set [1, false]; // reset decay status
	} forEach atoms;
	publicVariable "atoms";
};

_createatom = {
	_pos = _this select 0;
	_atom = [_pos, true, 0.0]; // the boolean is the decay status and the float is the direction (changed later)
	atoms = atoms + [_atom];
	publicVariable "atoms";
};

_createatoms = {
	_source = _this select 0;
	_k = _this select 1;
	// 400 atoms spawned within 25 meters of source
	for "_n" from 1 to _k*900 do
	{
		[([position _source, random 360, 25] call fnc_SHK_pos)] call _createatom;
	};
};

sleep 0.5;
{ _x call _createatoms } forEach radiationSources;

while {true} do
{
	call _decay;
	sleep 0.005;
};