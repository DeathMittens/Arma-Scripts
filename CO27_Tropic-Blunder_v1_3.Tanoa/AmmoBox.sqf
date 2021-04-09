if (!isServer) exitWith {};

_crate = _this select 0;


clearItemCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
clearWeaponCargoGlobal _crate;

_crate addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 80];
_crate addMagazineCargoGlobal ["rhs_mag_20Rnd_SCAR_762x51_m80a1_epr", 40];
_crate addMagazineCargoGlobal ["rhsusf_50Rnd_762x51", 20];
_crate addMagazineCargoGlobal ["rhsusf_100Rnd_762x51_m61_ap", 10];
_crate addMagazineCargoGlobal ["rhs_mag_M433_HEDP", 20];


//nul =[this] execVM "supplyBox.sqf";

