while {true} do
{
	_this execVM "inventory\weight.sqf";

	_this call fnc_registerHits;

	// TODO: Linear damage increments (=> exponential damage if exposed to the same amount of radiation) that depends on the collected dose
	if (_this getVariable "collected_dose" >= 200) then
		{ _this setDamage (damage _this + (1/576000)*(_this getVariable "collected_dose")) };

	_this call fnc_debugMonitor;

	sleep TIMER;
};

// When the particles are too many, the loop SLOWS DOWN.
// TODO: Solve it!  Maybe check after, compare the times and for example the damage taken, and adjust accordingly?