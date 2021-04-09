//to prevent MP / JIP issues
waitUntil {!isNull player};

_unit = _this select 0;

// Common gear


_unit removeWeapon "binocular";
_unit addWeapon "rangefinder";
_unit addItem "ItemcTab";
_unit addItem "ItemCTabHCam";

sleep 0.5;
_unit additem "ACRE_PRC148";
_unit additem "ACRE_PRC119";


if (groupID (group player) == "group") then 
{
	// Squad Gear


}
else
{

};

