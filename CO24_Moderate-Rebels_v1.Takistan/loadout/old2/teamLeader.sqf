//to prevent MP / JIP issues
//waitUntil {!isNull player};

_unit = _this select 0;

// Common gear

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
//removeGoggles _unit;

_unit forceAddUniform "rhs_uniform_g3_m81";

_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
_unit addWeapon "rhs_weap_m4a1_blockII_KAC";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
_unit addPrimaryWeaponItem "rhsusf_acc_eotech_xps3";

_unit addMagazine "rhsusf_mag_17Rnd_9x19_FMJ";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addWeapon "ACE_Vector";
removeBackpack _unit;

_unit addHeadgear "rhsusf_mich_bare_norotos_alt";

_unit addVest "rhsusf_plateframe_teamleader";
_unit addBackpack "rhsusf_falconii_coy";
clearAllItemsFromBackpack _unit;
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","ItemGPS"];

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
{_unit addItemToBackpack "Chemlight_green"} count [1,2];
{_unit addItemToBackpack "Chemlight_red"} count [1,2];


sleep 1;
_unit addItem "ACRE_PRC343";
_unit addItem "ACRE_PRC148";
//_unit addItem "ACRE_PRC117F";


//ACRE_PRC343
//ACRE_PRC148
//ACRE_PRC117F

