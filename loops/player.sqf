while {true} do
{
	_this execVM "inventory\weight.sqf";

	_this call fnc_registerHits;

	if (_this getVariable "collected_dose" >= 1200) then
		{ _this setDamage (damage _this + 1/(200*60*40)) }; // 40 minutes till death

	_this call fnc_debugMonitor;

	sleep TIMER;
};