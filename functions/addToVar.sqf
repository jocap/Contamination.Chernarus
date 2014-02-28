_unit = _this select 0;
_var = _this select 1;
_inc = _this select 2;

_unit setVariable [_var, (_unit getVariable _var) + _inc];