//_nul = [this] execVM "ammoBox.sqf";
if (!isServer) exitWith {};

_crate = _this select 0;


clearItemCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
clearWeaponCargoGlobal _crate;


_crate addBackpackCargoGlobal ["B_Parachute", 8];
_crate addBackpackCargoGlobal ["B_AssaultPack_rgr", 8];

_crate addItemCargoGlobal ["ACE_Clacker", 2];
_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 4];

_crate addMagazineCargoGlobal ["UK3CB_HK33_30rnd_556x45", 20];
_crate addMagazineCargoGlobal ["rhsusf_200Rnd_556x45_M855_soft_pouch", 10];
_crate addMagazineCargoGlobal ["ACE_20Rnd_762x51_M118LR_Mag", 20];
_crate addMagazineCargoGlobal ["CUP_30Rnd_762x51_FNFAL_M", 20];

_crate addItemCargoGlobal ["ACRE_PRC148", 1];
_crate addItemCargoGlobal ["SmokeShellRed", 4];
_crate addItemCargoGlobal ["SmokeShellGreen", 4];
_crate addItemCargoGlobal ["SmokeShell", 4];


/*
_crate addItemCargoGlobal ["ACE_fieldDressing", 50];
_crate addItemCargoGlobal ["ACE_packingBandage", 20];
_crate addItemCargoGlobal ["ACE_elasticBandage", 20];
_crate addItemCargoGlobal ["ACE_morphine", 20];
_crate addItemCargoGlobal ["ACE_epinephrine", 20];
_crate addItemCargoGlobal ["ACE_bloodIV_500", 10];
_crate addItemCargoGlobal ["ACE_personalAidKit", 4];


_crate addMagazineCargoGlobal ["rhsusf_m112_mag", 4];
_crate addItemCargoGlobal ["ACE_Clacker", 2];

_crate addItemCargoGlobal ["ACRE_PRC148", 4];
_crate addItemCargoGlobal ["ACRE_PRC117F", 2];

_crate addBackpackCargoGlobal ["rhsusf_falconii_coy", 2];

_crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 50];
_crate addMagazineCargoGlobal ["rhsusf_50Rnd_762x51", 10];
_crate addMagazineCargoGlobal ["rhsusf_100Rnd_762x51", 4];
_crate addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_M855_mixed_soft_pouch", 10];
_crate addMagazineCargoGlobal ["rhs_mag_M441_HE", 10];
_crate addMagazineCargoGlobal ["rhs_mag_smaw_SR", 4];
_crate addMagazineCargoGlobal ["rhs_mag_smaw_HEAA", 6];

_crate addWeaponCargoGlobal ["rhs_weap_M136", 2];
_crate addWeaponCargoGlobal ["rhs_weap_m72a7", 2];

_crate additemcargoGlobal ["ToolKit",1];

_crate addItemCargoGlobal ["rhsusf_acc_compm4", 2];
_crate addItemCargoGlobal ["rhsusf_acc_eotech_552", 6];
_crate addItemCargoGlobal ["rhsusf_acc_eotech_xps3", 6];

_crate addItemCargoGlobal ["rhs_mag_m67", 8];
_crate addItemCargoGlobal ["rhs_mag_an_m8hc", 10];
_crate addItemCargoGlobal ["rhs_mag_m18_red", 10];
_crate addItemCargoGlobal ["rhs_mag_m18_green", 10];

_crate addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 10];
_crate addMagazineCargoGlobal ["1Rnd_SmokeGreen_Grenade_shell", 10];
_crate addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 10];
*/

//nul =[this] execVM "supplyBox.sqf";

