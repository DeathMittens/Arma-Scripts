//ammobox.sqf


if (!isServer) exitWith {};



_crate = _this select 0;

_crate allowdamage false;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;


_crate addMagazineCargoGlobal ["30rnd_762x39_AKM",30];
_crate addMagazineCargoGlobal ["30rnd_545x39_AK107",30];

_crate addMagazineCargoGlobal ["hlc_45Rnd_762x39_m_rpk",20];

_crate addMagazineCargoGlobal ["10Rnd_762x54_SVU107",10];

_crate addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",15];
_crate addMagazineCargoGlobal ["RPG7_PG7V_AA",16];
_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag",25];
_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red",10];

_crate addMagazineCargoGlobal ["hlc_30Rnd_762x39_b_ak",20];

_crate addWeaponCargoGlobal ["arifle_SUD_AK74M",8];
_crate addWeaponCargoGlobal ["launch_RPG7V",3];
_crate addWeaponCargoGlobal ["RH_M16A2",2];

_crate addItemCargoGlobal ["optic_SUD_PSO1",2];
_crate addItemCargoGlobal ["optic_sud_1p29",2];
_crate addItemCargoGlobal ["optic_sud_krechet",4];
_crate addItemCargoGlobal ["ACRE_PRC148",4];
_crate addItemCargoGlobal ["ACRE_PRC343",8];

_crate addMagazineCargoGlobal ["Chemlight_red",10];
_crate addMagazineCargoGlobal ["Chemlight_blue",10];
_crate addMagazineCargoGlobal ["Chemlight_green",10];
_crate addMagazineCargoGlobal ["Chemlight_yellow",10];