//to prevent MP / JIP issues
waitUntil {!isNull player};

_unit = _this select 0;

// Common gear

_unit addBackpack "B_AssaultPack_rgr";
_unit removeWeapon "binocular";
_unit addWeapon "rangefinder";
_unit addItem "ItemCTabHCam";

sleep 0.5;
_unit additem "ACRE_PRC148";


if (groupID (group player) == "Alpha") then 
{
	// Squad Gear

_unit addItem "ItemCtab";

}
else
{

_unit addItem "ItemAndroid";

};

