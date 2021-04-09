//to prevent MP / JIP issues
waitUntil {!isNull player};

_unit = _this select 0;

// Common gear

_unit removeweapon "arifle_SDAR_F";
_unit removeMagazines "30Rnd_556x45_Stanag";
_unit removeMagazines "20Rnd_556x45_UW_mag";

_unit addMagazines ["30Rnd_65x39_caseless_green",5];
_unit addWeapon "arifle_Katiba_C_ACO_pointer_snds_F";

_unit addItem "NVGoggles_OPFOR";
_unit addItem "ItemAndroid";



if (groupID (group player) == "group") then 
{
	// Squad Gear


}
else
{


};

