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

_unit addMagazine "rhs_mag_20Rnd_SCAR_762x51_m80a1_epr";
_unit addWeapon "rhs_weap_mk17_CQC";
_unit addPrimaryWeaponItem "rhsusf_acc_aac_762sdn6_silencer";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk_sc";
_unit addPrimaryWeaponItem "optic_Arco_blk_F"; // rhsusf_acc_eotech_xps3

_unit addMagazine "rhsusf_mag_17Rnd_9x19_FMJ";
_unit addWeapon "rhsusf_weap_glock17g4";

_unit addItem "Laserbatteries";
_unit addWeapon "Laserdesignator_01_khk_F";

removeBackpack _unit;

_unit addHeadgear "rhs_Booniehat_m81";

_unit addVest "rhsusf_mbav_rifleman";
_unit addBackpack "rhsusf_assault_eagleaiii_coy";
clearAllItemsFromBackpack _unit;
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","ItemGPS"];

{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
{_unit addItemToUniform "ACE_morphine"} count [1,2];
{_unit addItemToUniform "ACE_tourniquet"} count [1,2];
_unit addItemToUniform "ACE_MapTools";
{_unit addItemToUniform "ACE_packingBandage"} count [1,2];
_unit addItemToUniform "rhsusf_mag_17Rnd_9x19_FMJ";

{_unit addItemToVest "rhs_mag_20Rnd_SCAR_762x51_m80a1_epr"} count [1,2,3,4,5,6,7];
{_unit addItemToVest "rhs_mag_m67"} count [1];
{_unit addItemToVest "SmokeShellRed"} count [1];
{_unit addItemToVest "SmokeShellGreen"} count [1];
{_unit addItemToVest "SmokeShell"} count [1];


_unit addItemToBackpack "rhsusf_opscore_fg_pelt";
_unit addItemToBackpack "ACE_NVG_Gen4";
{_unit addItemToBackpack "Chemlight_green"} count [1];
{_unit addItemToBackpack "Chemlight_red"} count [1];
{_unit addItemToBackpack "rhs_mag_20Rnd_SCAR_762x51_m80a1_epr"} count [1,2,3];


//sleep 1;
_unit addItem "ACRE_PRC343";
_unit addItem "ACRE_PRC148";
_unit addItem "ACRE_PRC117F";

waitUntil { ([] call acre_api_fnc_isInitialized) };
sleep 2;
[(["ACRE_PRC117F"] call acre_api_fnc_getRadioByType), 2] call acre_api_fnc_setRadioChannel;

/*
if (groupID (group _unit) == "NullGroup") then 
{

}
else
{

};
*/
