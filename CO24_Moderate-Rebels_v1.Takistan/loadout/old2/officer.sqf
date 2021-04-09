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
_unit addWeapon "rhs_weap_mk18_grip2_wd";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
_unit addPrimaryWeaponItem "optic_Arco_blk_F";
_unit addPrimaryWeaponItem "rhsusf_acc_grip2_wd";

_unit addMagazine "rhsusf_mag_7x45acp_MHP";
_unit addWeapon "rhsusf_weap_m1911a1";
_unit addWeapon "ACE_Vector";
removeBackpack _unit;

_unit addHeadgear "H_Booniehat_khk_hs";

_unit addVest "rhsusf_mbav_rifleman";
_unit addBackpack "rhsusf_falconii";
clearAllItemsFromBackpack _unit;
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","ItemGPS"];

{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
{_unit addItemToUniform "ACE_morphine"} count [1,2];
{_unit addItemToUniform "ACE_tourniquet"} count [1,2];
_unit addItemToUniform "ACE_MapTools";
{_unit addItemToUniform "ACE_packingBandage"} count [1,2];
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "rhsusf_mag_7x45acp_MHP";

{_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag"} count [1,2,3,4,5,6,7,8,9,10];
{_unit addItemToVest "rhs_mag_m67"} count [1,2];
{_unit addItemToVest "SmokeShellRed"} count [1,2];
{_unit addItemToVest "SmokeShellGreen"} count [1,2];
{_unit addItemToVest "SmokeShell"} count [1,2,3];

//_unit addItemToBackpack "rhs_Booniehat_m81";
_unit addItemToBackpack "ACE_NVG_Gen4";
{_unit addItemToBackpack "Chemlight_green"} count [1,2];
{_unit addItemToBackpack "Chemlight_red"} count [1,2];


sleep 1;
_unit addItem "ACRE_PRC343";
_unit addItem "ACRE_PRC148";
_unit addItem "ACRE_PRC117F";

