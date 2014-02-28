// List comprehensions for SQF.  Yeah.  I'm crazy.

_array = +(_this select 0);
_code = _this select 1;
_arguments = if (2 < count _this) then { _this select 2 } else { [] };

_newArray = [];

for "_i" from 0 to count _array - 1 do
{
	__x = _array select _i;
	if ("STRING" == typeName _code) then
		{ _code = compile _code };
	_newArray = _newArray + [[__x, _i, _arguments] call _code];
};
_newArray