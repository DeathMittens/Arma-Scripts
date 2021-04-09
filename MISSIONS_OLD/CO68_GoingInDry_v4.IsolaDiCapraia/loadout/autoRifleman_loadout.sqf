//to prevent MP / JIP issues
//waitUntil {!isNull player};

_unit = _this select 0;

// Common gear

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;


_unit forceAddUniform "CUP_U_B_USMC_MARPAT_WDL_TwoKneepads";
for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
_unit addItemToUniform "RH_15Rnd_9x19_M9";
_unit addVest "CUP_V_B_MTV_MG";
_unit addItemToVest "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
_unit addBackpack "CUP_B_USMC_AssaultPack";
for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";};
_unit addHeadgear "CUP_H_USMC_Goggles_HelmetWDL";
_unit addItem "ACE_epinephrine";

_unit addWeapon "CUP_lmg_m249_pip1";
_unit addPrimaryWeaponItem "RH_compM2l";
_unit addWeapon "RH_m9";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadioAcreFlagged";
_unit linkItem "CUP_NVG_PVS7";


sleep 2;
_unit addItem "ItemRadio";


if (groupID (group _unit) == "NullGroup") then 
{



}
else
{



};

