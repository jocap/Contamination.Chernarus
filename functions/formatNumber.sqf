/*---------------------------------------------------------------------------
formatNumber function
-----------------------------------------------------------------------------
Arguments:
1. Number (containing only plus/minus sign, numbers and one period -- i.e., no letters)
2. Amount of decimals
*/

_len = count toArray str(_this select 0);
_p1 = [];
_p2 = [];
if (46 in toArray str(_this select 0)) then // if has decimal
{
	_p1done = false;
	{
		if (46 == _x) then { _p1done = true }
		else
		{
			if (_p1done) then { _p2 = _p2 + [_x] }
			else { _p1 = _p1 + [_x] };
		};
	} forEach toArray str(_this select 0);
}
else
{
	_p1 = toArray str(_this select 0);
};
if (0 == count _p2) exitWith { parseNumber toString _p1 };
_p2 resize (_this select 1);
parseNumber toString(_p1 + [46] + _p2)