//_nul = [this] execVM "vehicleGear.sqf";
if (!isServer) exitWith {};

_crate = _this select 0;

/*
clearItemCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
*/

_crate addItemCargoGlobal ["ACE_fieldDressing", 20];
_crate addItemCargoGlobal ["ACE_packingBandage", 10];
_crate addItemCargoGlobal ["ACE_elasticBandage", 10];
_crate addItemCargoGlobal ["ACE_morphine", 10];
_crate addItemCargoGlobal ["ACE_epinephrine", 10];
_crate addItemCargoGlobal ["ACE_bloodIV_500", 6];
_crate addItemCargoGlobal ["ACE_personalAidKit", 2];


_crate addMagazineCargoGlobal ["rhsusf_m112_mag", 4];
_crate addItemCargoGlobal ["ACE_Clacker", 1];

_crate addItemCargoGlobal ["ACRE_PRC148", 1];
_crate addItemCargoGlobal ["ACRE_PRC117F", 1];

_crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 20];
_crate addMagazineCargoGlobal ["rhsusf_50Rnd_762x51", 6];
_crate addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_M855_mixed_soft_pouch", 4];
_crate addMagazineCargoGlobal ["rhs_mag_M441_HE", 8];
_crate addMagazineCargoGlobal ["rhs_mag_smaw_SR", 1];
_crate addMagazineCargoGlobal ["rhs_mag_smaw_HEAA", 2];

_crate addWeaponCargoGlobal ["rhs_weap_M136", 1];
_crate addWeaponCargoGlobal ["rhs_weap_m72a7", 1];

_crate additemcargoGlobal ["ToolKit",1];

_crate addItemCargoGlobal ["rhsusf_acc_compm4", 2];
_crate addItemCargoGlobal ["rhsusf_acc_eotech_552", 2];
_crate addItemCargoGlobal ["rhsusf_acc_eotech_xps3", 2];

// ADD:
// SMAW AMMO rhs_mag_smaw_HEAA rhs_mag_smaw_SR
// SAW AMMO rhsusf_100Rnd_556x45_M855_mixed_soft_pouch
// GL rhs_mag_M441_HE
// Optic options
// rhsusf_acc_compm4


/*
_crate addMagazineCargoGlobal ["hlc_20Rnd_762x51_B_fal", 20];
_crate addMagazineCargoGlobal ["hlc_100Rnd_762x51_B_M60E4", 6];
_crate addMagazineCargoGlobal ["hlc_20Rnd_762x51_B_M14", 6];

_crate addMagazineCargoGlobal ["SmokeShell",10];
_crate addMagazineCargoGlobal ["SmokeShellRed",4];
_crate addMagazineCargoGlobal ["SmokeShellGreen",4];

_crate addWeaponCargoGlobal ["rhs_weap_m72a7",1];
_crate addWeaponCargoGlobal ["hlc_rifle_SLRchopmod",1];
_crate addWeaponCargoGlobal ["hlc_rifle_SLR",1];

_crate addBackpackCargoGlobal ["B_AssaultPack_tna_F",1];
*/
//_crate addWeaponCargoGlobal ["rhs_weap_rpg26",2];

//_crate additemcargoGlobal ["ToolKit",1];

//_crate addBackpackCargoGlobal ["tf_rt1523g", 1];
//_crate addItemCargoGlobal ["ACRE_PRC148", 1];


//nul =[this] execVM "vehicleGear.sqf";

