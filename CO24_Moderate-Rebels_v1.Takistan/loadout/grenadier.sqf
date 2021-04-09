//to prevent MP / JIP issues
//waitUntil {!isNull player};

_unit = _this select 0;

// Common gear


comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
//removeUniform _unit;
//removeVest _unit;
//removeBackpack _unit;
removeHeadgear _unit;
//removeGoggles _unit;

_unit addHeadgear "rhssaf_helmet_m97_olive_nocamo";

_unit addMagazine "rhssaf_30Rnd_762x39mm_M67";
_unit addMagazine "rhs_VOG25";
_unit addWeapon "rhs_weap_m70b3n_pbg40";

{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch"];

// Uniform
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
{_unit addItemToUniform "ACE_packingBandage"} count [1,2,3,4];
{_unit addItemToUniform "ACE_morphine"} count [1,2];
{_unit addItemToUniform "ACE_tourniquet"} count [1];
{_unit addItemToUniform "rhssaf_30Rnd_762x39mm_M67"} count [1,2];

// Vest
{_unit addItemToVest "rhssaf_mag_brd_m83_green"} count [1];
{_unit addItemToVest "rhssaf_mag_brd_m83_red"} count [1];
{_unit addItemToVest "rhssaf_mag_brd_m83_white"} count [1];
{_unit addItemToVest "rhssaf_mag_br_m75"} count [1,2];
{_unit addItemToVest "rhssaf_30Rnd_762x39mm_M67"} count [1,2];

// Backpack
{_unit addItemToBackpack "rhssaf_30Rnd_762x39mm_M67"} count [1,2,3,4,5];
{_unit addItemToBackpack "rhs_VOG25"} count [1,2,3,4,5,7,8,9];
{_unit addItemToBackpack "rhs_GRD40_White"} count [1];
{_unit addItemToBackpack "rhs_GRD40_Green"} count [1];
{_unit addItemToBackpack "rhs_GRD40_Red"} count [1];



// radios
sleep 1;
_unit addItem "ACRE_PRC343";
//_unit additem "ACRE_PRC148";



/*
_unit forceAddUniform "rhs_uniform_g3_m81";

_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
_unit addWeapon "rhs_weap_mk18_eotech";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
_unit addPrimaryWeaponItem "rhsusf_acc_eotech_xps3";

_unit addWeapon "rhs_weap_M136";
_unit addMagazine "rhsusf_mag_17Rnd_9x19_FMJ";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addWeapon "Binocular";
removeBackpack _unit;

_unit addHeadgear "rhsusf_mich_bare_norotos";

_unit addVest "rhsusf_plateframe_rifleman";
_unit addBackpack "rhsusf_falconii_coy";
clearAllItemsFromBackpack _unit;
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch"];

{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
{_unit addItemToUniform "ACE_morphine"} count [1,2];
{_unit addItemToUniform "ACE_tourniquet"} count [1,2];
_unit addItemToUniform "ACE_MapTools";
{_unit addItemToUniform "ACE_packingBandage"} count [1,2];

{_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag"} count [1,2,3,4,5,6,7,8,9,10];
{_unit addItemToVest "rhs_mag_m67"} count [1,2];
{_unit addItemToVest "SmokeShellRed"} count [1,2];
{_unit addItemToVest "SmokeShellGreen"} count [1,2];
{_unit addItemToVest "SmokeShell"} count [1,2,3,4];
_unit addItemToVest "rhsusf_mag_17Rnd_9x19_FMJ";

_unit addItemToBackpack "rhs_Booniehat_m81";
_unit addItemToBackpack "ACE_NVG_Gen4";
*/



/*
if (groupID (group _unit) == "NullGroup") then 
{

}
else
{

};
*/
