if (!isServer) exitWith {};

_crate = _this select 0;

//_crate allowdamage false;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;


_crate addItemCargoGlobal ["ACE_fieldDressing", 40];
_crate addItemCargoGlobal ["ACE_Morphine", 15];
_crate addItemCargoGlobal ["ACE_epinephrine", 15];
_crate addItemCargoGlobal ["ACE_bloodIV", 5];


_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag",30];
_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red",10];
_crate addMagazineCargoGlobal ["RH_20Rnd_762x51_M80A1",10];
_crate addMagazineCargoGlobal ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M",8];
_crate addMagazineCargoGlobal ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",8];

_crate addMagazineCargoGlobal ["HandGrenade",10];
_crate addMagazineCargoGlobal ["SmokeShell",10];

_crate addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",12];

_crate addMagazineCargoGlobal ["CUP_SMAW_HEAA_M",4];
_crate addMagazineCargoGlobal ["CUP_SMAW_HEDP_M",2];

_crate addItemCargoGlobal ["ACRE_PRC148",2];
_crate addItemCargoGlobal ["ACRE_PRC343",4];


_crate addItemCargoGlobal ["RH_compM2",4];
_crate addItemCargoGlobal ["CUP_optic_CompM4",4];
_crate addItemCargoGlobal ["RH_eotech553",4];
_crate addItemCargoGlobal ["CUP_optic_CompM2_Black",4];
_crate addItemCargoGlobal ["RH_compm4s",4];



//nul =[this] execVM "ammobox.sqf";

