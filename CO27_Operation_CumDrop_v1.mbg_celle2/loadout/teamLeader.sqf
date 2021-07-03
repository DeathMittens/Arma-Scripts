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

_unit addMagazine "ACE_20Rnd_762x51_M118LR_Mag";
_unit addWeapon "rhs_weap_m14_rail";
_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
_unit addPrimaryWeaponItem "rhsusf_acc_harris_swivel";

//_unit addMagazine "CUP_PTFHC_M";
//_unit addWeapon "CUP_launch_HCPF3_Loaded";
_unit addWeapon "ACE_VectorDay";
_unit addWeapon "rhs_weap_m72a7";

_unit addHeadgear "rhsusf_protech_helmet_rhino";
_unit addGoggles "CUP_G_ESS_BLK";
_unit addVest "rhsusf_spc_patchless";
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ACE_Altimeter","rhsusf_ANPVS_14"];

_unit addBackpack "B_Parachute";

// Uniform
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
{_unit addItemToUniform "ACE_packingBandage"} count [1,2,3,4];
{_unit addItemToUniform "ACE_morphine"} count [1,2];
{_unit addItemToUniform "ACE_tourniquet"} count [1];
_unit addItemToUniform "ACE_Maptools";
_unit addItemToUniform "SmokeShell";

_unit addItemToUniform "ACE_Chemlight_HiRed";

_group = groupID (group player);
switch(_group) do {
	case "Alpha": {_unit addItemToUniform "Chemlight_green";};
	case "Bravo": {_unit addItemToUniform "Chemlight_red";};
	case "Charlie": {_unit addItemToUniform "Chemlight_blue";};
	case "Delta": {_unit addItemToUniform "Chemlight_yellow";};
	default {_unit addItemToUniform "Chemlight_green";};
};


// Vest
//_unit addItemToVest "rhs_mag_m18_red";
//_unit addItemToVest "rhs_mag_m18_green";
//{_unit addItemToVest "rhs_mag_an_m8hc"} count [1,2];
//{_unit addItemToVest "rhs_mag_m67"} count [1,2];
{_unit addItemToVest "ACE_20Rnd_762x51_M118LR_Mag"} count [1,2,3,4,5,6,7,8];	


// radios
sleep 1;
_unit addItem "ACRE_PRC343";
_unit additem "ACRE_PRC148";
