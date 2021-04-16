//to prevent MP / JIP issues
//waitUntil {!isNull player};

_unit = _this select 0;

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
//removeGoggles _unit;

_unit forceAddUniform "rhs_uniform_FROG01_wd";


// ALPHA / BRAVO GEAR
_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
_unit addWeapon "rhs_weap_m27iar_grip3";
_unit addPrimaryWeaponItem "optic_Arco_blk_F";
_unit addMagazine "rhsusf_mag_7x45acp_MHP";
_unit addWeapon "rhsusf_weap_m1911a1";

_unit addWeapon "ACE_Vector";

_unit addHeadgear "rhsusf_mich_bare_norotos_arc_alt"; // alt - rhsusf_mich_helmet_marpatwd_headset / rhsusf_opscore_ut_pelt
_unit addVest "rhsusf_spc_squadleader"; // alt - rhsusf_plateframe_rifleman / rhsusf_spc_rifleman
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch"];

// Uniform
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
{_unit addItemToUniform "ACE_packingBandage"} count [1,2,3,4];
{_unit addItemToUniform "ACE_morphine"} count [1,2];
{_unit addItemToUniform "ACE_tourniquet"} count [1];
_unit addItemToUniform "ACE_Maptools";
_unit addItemToUniform "ACE_microDAGR";
{_unit addItemToUniform "ACE_CableTie"} count [1,2];

// Vest
{_unit addItemToVest "rhs_mag_an_m8hc"} count [1,2];
{_unit addItemToVest "rhs_mag_m67"} count [1];
{_unit addItemToVest "rhs_mag_m18_red"} count [1,2];
{_unit addItemToVest "rhs_mag_30Rnd_556x45_M855_Stanag"} count [1,2,3,4,5,6,7,8,9];	
_unit addItemToVest "rhsusf_mag_7x45acp_MHP";
	
// Backpack
_unit addBackpack "rhsusf_falconii_coy";
//_unit addBackpack "B_RadioBag_01_wdl_F";
{_unit addItemToBackpack "rhs_mag_m18_green"} count [1,2];


// radios
sleep 1;
_unit addItem "ACRE_PRC343";
_unit additem "ACRE_PRC148";
_unit additem "ACRE_PRC117F";
