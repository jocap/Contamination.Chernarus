_newArray = []; // that assigns each item to the number of duplicates of itself
_string = "";

// Establish duplicates
for "_i" from 0 to count _this - 1 do
{
	if (_this select _i in _newArray) then // if duplicate
	{
		_pos = _newArray find (_this select _i);
		_newArray set [_pos - 1, (_newArray select (_pos - 1)) + 1]; // increases the duplicate count
	}
	else
	{
		_newArray = _newArray + [1, _this select _i]; // if not duplicate, add to the new array
	};
};

// Create string
for "_i" from 0 to count _newArray - 1 do
{
	if (_i mod 2 == 1) then // odd
	{
		_string = _string + format ["- %1 (%2)", _newArray select _i, _newArray select (_i - 1)];
		if (_i != count _newArray - 1) then
			{ _string = _string + "\n"; }
	};
};

// Return string
//_string
_string