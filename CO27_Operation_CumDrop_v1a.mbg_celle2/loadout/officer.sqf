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
removeGoggles _unit;

_unit forceAddUniform "rhs_uniform_g3_rgr";
//_unit addBackpack "ACE_FakeBackpack";

_unit addMagazine "CUP_30Rnd_762x51_FNFAL_M";
_unit addWeapon "hlc_rifle_STG58F";
_unit addPrimaryWeaponItem "rhsusf_acc_aac_762sd_silencer";

//_unit addMagazine "CUP_PTFHC_M";
//_unit addWeapon "CUP_launch_HCPF3_Loaded";
_unit addWeapon "ACE_VectorDay";

_unit addHeadgear "rhsusf_cvc_green_alt_helmet";
_unit addGoggles "CUP_G_ESS_BLK";
_unit addVest "rhsusf_spc_patchless";
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ACE_Altimeter","rhsusf_ANPVS_15"];

_unit addBackpack "B_Parachute";

// Uniform
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
{_unit addItemToUniform "ACE_packingBandage"} count [1,2,3,4];
{_unit addItemToUniform "ACE_morphine"} count [1,2];
{_unit addItemToUniform "ACE_tourniquet"} count [1];
_unit addItemToUniform "ACE_Maptools";
_unit addItemToUniform "SmokeShell";

_unit addItemToUniform "Chemlight_green";
_unit addItemToUniform "ACE_Chemlight_HiRed";

// Vest
//_unit addItemToVest "rhs_mag_m18_red";
//_unit addItemToVest "rhs_mag_m18_green";
//{_unit addItemToVest "rhs_mag_an_m8hc"} count [1,2];
//{_unit addItemToVest "rhs_mag_m67"} count [1,2];
{_unit addItemToVest "CUP_30Rnd_762x51_FNFAL_M"} count [1,2,3,4,5,6,7,8];	


// radios
sleep 1;
_unit addItem "ACRE_PRC343";
_unit additem "ACRE_PRC148";
