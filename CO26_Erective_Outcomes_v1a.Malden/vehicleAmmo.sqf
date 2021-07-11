//_nul = [this] execVM "vehicleAmmo.sqf";
if (!isServer) exitWith {};

_crate = _this select 0;


clearItemCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
clearWeaponCargoGlobal _crate;


//Add gear

_crate addWeaponCargoGlobal ["hlc_rifle_L1A1SLR", 2];
//_crate addWeaponCargoGlobal ["hlc_rifle_SLRchopmod", 2];
//_crate addWeaponCargoGlobal ["rhs_weap_ak74n_2", 2];
_crate addWeaponCargoGlobal ["uk3cb_ak47n", 2];
_crate addWeaponCargoGlobal ["rhs_weap_aks74un", 2];

_crate addWeaponCargoGlobal ["rhs_weap_rpg18", 2];

_crate addMagazineCargoGlobal ["rhsusf_100Rnd_762x51", 4];
_crate addMagazineCargoGlobal ["rhs_100Rnd_762x54mmR", 4];

_crate addMagazineCargoGlobal ["rhs_mag_20Rnd_762x51_m80_fnfal", 15];
_crate addMagazineCargoGlobal ["rhs_30Rnd_545x39_7N10_camo_AK", 15];
_crate addMagazineCargoGlobal ["rhs_30Rnd_762x39mm", 15];

_crate addMagazineCargoGlobal ["rhs_VOG25", 5];
//_crate addMagazineCargoGlobal ["rhs_GRD40_White", 5];
//_crate addMagazineCargoGlobal ["rhs_GRD40_Green", 5];
//_crate addMagazineCargoGlobal ["rhs_GRD40_Red", 5];

_crate addMagazineCargoGlobal ["rhs_rpg7_PG7VL_mag", 2];

_crate addMagazineCargoGlobal ["HandGrenade", 5];
_crate addMagazineCargoGlobal ["SmokeShell", 5];
_crate addMagazineCargoGlobal ["SmokeShellGreen", 5];
_crate addMagazineCargoGlobal ["SmokeShellRed", 5];
_crate addMagazineCargoGlobal ["SmokeShellOrange", 5];

_crate additemcargoGlobal ["ToolKit",1];

_crate addItemCargoGlobal ["ACE_fieldDressing", 20];
_crate addItemCargoGlobal ["ACE_morphine", 8];
_crate addItemCargoGlobal ["ACE_epinephrine", 8];
_crate addItemCargoGlobal ["ACE_bloodIV_500", 2];

_crate addItemCargoGlobal ["ACRE_PRC148", 1];


//nul =[this] execVM "supplyBox.sqf";

