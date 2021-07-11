//_nul = [this] execVM "cache.sqf";
if (!isServer) exitWith {};

_crate = _this select 0;

clearItemCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
clearWeaponCargoGlobal _crate;

_crate addMagazineCargoGlobal ["rhs_rpg7_PG7VL_mag", 20];
_crate addMagazineCargoGlobal ["rhs_30Rnd_545x39_7N6_AK", 20];
_crate addMagazineCargoGlobal ["rhs_100Rnd_762x54mmR", 20];
_crate addItemCargoGlobal ["DemoCharge_Remote_Mag", 4];


