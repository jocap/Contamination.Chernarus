[_this select 1, "inventory", [_this select 3]] call fnc_addToVar;
_this select 0 removeAction (_this select 2);
titleText ["Took " + (_this select 3 call fnc_getItemName), "PLAIN DOWN"];
sleep 2;
titleFadeOut 2;