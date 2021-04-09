//to prevent MP / JIP issues
waitUntil {!isNull player};

_unit = _this select 0;

// Common gear


sleep 0.5;
_unit additem "ACRE_PRC148";

if (groupID (group player) == "groupname") then 
{
	// Squad Gear

}
else
{


};

