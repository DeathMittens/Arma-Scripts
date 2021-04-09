//nul =[this] execVM "ammobox.sqf";
if (!isServer) exitWith {};


_crate = _this select 0;

_crate allowdamage false;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;


_crate addbackpackCargoGlobal ["B_AssaultPack_blk",8];
_crate addmagazinecargoGlobal ["20Rnd_762x51_Mag",25];
_crate additemcargoGlobal ["FirstAidKit",20];
_crate additemcargoGlobal ["optic_Holosight",8];
_crate additemcargoGlobal ["H_MilCap_mcamo",5];
_crate additemcargoGlobal ["ItemGPS",12];
_crate additemcargoGlobal ["optic_Arco",4];
_crate additemcargoGlobal ["H_Cap_headphones",5];
_crate addweaponcargoGlobal ["srifle_EBR_F",6];
_crate addweaponcargoGlobal ["arifle_TRG21_F",8];
_crate additemcargoGlobal ["NVgoggles",20];
_crate additemcargoGlobal ["acc_pointer_IR",20];
_crate additemcargoGlobal ["acc_flashlight",20];
_crate additemcargoGlobal ["Binocular", 20];
_crate addmagazinecargoGlobal ["30Rnd_556x45_Stanag", 50]; 
_crate additemcargoGlobal ["acre_prc148_uhf",4]; 
_crate additemcargoGlobal ["acre_prc343",8];


