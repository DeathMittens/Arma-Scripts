//_nul = [this] execVM "ammoBox.sqf";
if (!isServer) exitWith {};

_crate = _this select 0;


clearItemCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
clearWeaponCargoGlobal _crate;

//Add gear

_crate addWeaponCargoGlobal ["hlc_rifle_L1A1SLR", 2];
_crate addWeaponCargoGlobal ["hlc_rifle_SLRchopmod", 2];
_crate addWeaponCargoGlobal ["rhs_weap_ak74n_2", 2];
_crate addWeaponCargoGlobal ["uk3cb_ak47n", 2];
_crate addWeaponCargoGlobal ["rhs_weap_aks74un", 2];

_crate addWeaponCargoGlobal ["rhs_weap_rpg18", 2];

_crate addMagazineCargoGlobal ["rhsusf_100Rnd_762x51", 8];
_crate addMagazineCargoGlobal ["rhs_100Rnd_762x54mmR", 8];

_crate addMagazineCargoGlobal ["rhs_mag_20Rnd_762x51_m80_fnfal", 30];
_crate addMagazineCargoGlobal ["rhs_30Rnd_545x39_7N10_camo_AK", 30];
_crate addMagazineCargoGlobal ["rhs_30Rnd_762x39mm", 30];

_crate addMagazineCargoGlobal ["rhs_VOG25", 10];
_crate addMagazineCargoGlobal ["rhs_GRD40_White", 10];
_crate addMagazineCargoGlobal ["rhs_GRD40_Green", 10];
_crate addMagazineCargoGlobal ["rhs_GRD40_Red", 10];

_crate addMagazineCargoGlobal ["rhs_rpg7_PG7VL_mag", 6];

_crate addMagazineCargoGlobal ["HandGrenade", 10];
_crate addMagazineCargoGlobal ["SmokeShell", 10];
_crate addMagazineCargoGlobal ["SmokeShellGreen", 10];
_crate addMagazineCargoGlobal ["SmokeShellRed", 10];
_crate addMagazineCargoGlobal ["SmokeShellOrange", 10];

_crate additemcargoGlobal ["ToolKit",1];

_crate addItemCargoGlobal ["ACE_fieldDressing", 20];
_crate addItemCargoGlobal ["ACE_morphine", 10];
_crate addItemCargoGlobal ["ACE_epinephrine", 10];
_crate addItemCargoGlobal ["ACE_bloodIV_500", 10];

_crate addItemCargoGlobal ["ACRE_PRC148", 2];
_crate addItemCargoGlobal ["ACRE_PRC117F", 2];


//nul =[this] execVM "supplyBox.sqf";
