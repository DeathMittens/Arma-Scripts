//to prevent MP / JIP issues
waitUntil {!isNull player};

_unit = _this select 0;

// Common gear


_unit addItem "ItemcTab";
_unit addItem "ItemCTabHCam";


sleep 0.5;
_unit additem "ACRE_PRC148";


if (groupID (group player) == "Command") then 
{
	// Squad Gear

	sleep 0.5;
	_unit additem "ACRE_PRC119";

}
else
{



};

