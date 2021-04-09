//to prevent MP / JIP issues
waitUntil {!isNull player};

_unit = _this select 0;

// Common gear

_unit addBackpack "B_AssaultPack_blk";

_unit removeweapon "arifle_SDAR_F";
_unit removeMagazines "30Rnd_556x45_Stanag";
_unit removeMagazines "20Rnd_556x45_UW_mag";

_unit addMagazines ["30Rnd_65x39_caseless_green",6];
_unit addWeapon "arifle_Katiba_ARCO_pointer_snds_F";

_unit removeWeapon "binocular";
_unit addWeapon "rangefinder";

_unit addItem "NVGoggles_OPFOR";
_unit addItem "ItemCTab";
_unit addItem "ItemCTabHCam";

sleep 0.5;
_unit additem "ACRE_PRC148";



if (groupID (group player) == "group") then 
{
	// Squad Gear


}
else
{


};

