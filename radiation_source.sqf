_object = _this select 0;
_options = if (count _this > 1) then { _this select 1 } else { [] };

radiation_sources = radiation_sources + [position _object];
publicVariable "radiation_sources";