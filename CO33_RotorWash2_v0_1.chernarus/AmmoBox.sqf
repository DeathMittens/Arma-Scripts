//_nul = [this] execVM "ammoBox.sqf";
if (!isServer) exitWith {};

_crate = _this select 0;


clearItemCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
clearWeaponCargoGlobal _crate;

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

_crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 30];
_crate addMagazineCargoGlobal ["rhsusf_50Rnd_762x51", 6];
_crate addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_M855_mixed_soft_pouch", 4];
_crate addMagazineCargoGlobal ["rhs_mag_M441_HE", 8];
_crate addMagazineCargoGlobal ["rhs_mag_smaw_SR", 1];
_crate addMagazineCargoGlobal ["rhs_mag_smaw_HEAA", 2];

_crate addWeaponCargoGlobal ["rhs_weap_M136", 1];
_crate addWeaponCargoGlobal ["rhs_weap_m72a7", 1];

_crate additemcargoGlobal ["ToolKit",1];

_crate addItemCargoGlobal ["rhsusf_acc_compm4", 2];
_crate addItemCargoGlobal ["rhsusf_acc_eotech_552", 6];
_crate addItemCargoGlobal ["rhsusf_acc_eotech_xps3", 6];

_crate addItemCargoGlobal ["rhs_mag_m67", 6];
_crate addItemCargoGlobal ["rhs_mag_an_m8hc", 8];
_crate addItemCargoGlobal ["rhs_mag_m18_red", 8];
_crate addItemCargoGlobal ["rhs_mag_m18_green", 8];

_crate addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 6];
_crate addMagazineCargoGlobal ["1Rnd_SmokeGreen_Grenade_shell", 6];
_crate addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 6];

//nul =[this] execVM "supplyBox.sqf";

