if (!isServer) exitWith {};

_crate = _this select 0;

//_crate allowdamage false;
//clearWeaponCargoGlobal _crate;
//clearItemCargoGlobal _crate;
//clearMagazineCargoGlobal _crate;
//clearBackpackCargoGlobal _crate;


_crate addItemCargoGlobal ["ACE_fieldDressing", 20];
_crate addItemCargoGlobal ["ACE_Morphine", 8];
_crate addItemCargoGlobal ["ACE_epinephrine", 8];
_crate addItemCargoGlobal ["ACE_bloodIV", 4];


_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag",20];


//nul =[this] execVM "vehicleGear.sqf";

