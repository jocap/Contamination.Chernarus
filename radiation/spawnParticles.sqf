// Simulates unstable isotopes that decay randomly.

waitUntil { count radiationSources > 0 };

isotopes = [];
publicVariable "isotopes";

_decay = {
	{
		if (floor(random 2) == 0) then // isotope decays
		{
			_x set [1, true];
			_x set [2, random 360];
		}
	} forEach isotopes;
	publicVariable "isotopes";
	sleep 0.005; // as long as the player.sqf loop
	{
		_x set [1, false]; // reset decay status
	} forEach isotopes;
	publicVariable "isotopes";
};

_createIsotope = {
	_pos = _this select 0;
	_isotope = [_pos, true, 0.0]; // the boolean is the decay status and the float is the direction (changed later)
	isotopes = isotopes + [_isotope];
	publicVariable "isotopes";
};

_createIsotopes = {
	_source = _this;
	// 400 isotopes spawned within 25 meters of source
	for "_n" from 1 to 400 do
	{
		[([position _source, random 360, 25] call fnc_SHK_pos)] call _createIsotope;
	};
};

sleep 0.5;
{ _x call _createIsotopes } forEach radiationSources;

while {true} do
{
	call _decay;
	sleep 0.005;
};