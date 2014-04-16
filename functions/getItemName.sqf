_item = _this;
__article = false;
_capitalize = false;
if ("ARRAY" == typeName _this) then
{
	_item = _this select 0;
	waitUntil { !(isNil "BIS_fnc_init") };
	__article = [_this, 1, false, [true, objNull]] call BIS_fnc_param; // whether to add "a" or "an"
	_capitalize = [_this, 2, false, [true, objNull]] call BIS_fnc_param; // whether to capitalize the first letter
};

_name = _item;
_article = "";

switch (_item) do
{
	case "gm":
	{
		_article = "a";
		_name = "Geiger counter";
	};
	case "used_filter":
	{
		_article = "a";
		_name = "used filter";
	};
	case "gas_mask":
	{
		_article = "a";
		_name = "gas mask";
	};
	case "vodka":
	{
		_article = "a";
		_name = "bottle of vodka";
	};
};

if (__article) then
	{ _article = _article + " " }
else
	{ _article = "" };
if (_capitalize and {not __article}) then
	{ _name = _name call fnc_capitalize };
if (_capitalize and {__article}) then
	{ _article = _article call fnc_capitalize };
_article + _name