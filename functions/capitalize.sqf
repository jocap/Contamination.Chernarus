// Converts the first letter to uppercase.  Only works with English characters.

_chars = toArray _this;
if (97 <= _chars select 0 and {122 >= _chars select 0}) then // if first letter is lowercase
{
	_chars set [0, (_chars select 0) - 32];
};
toString _chars