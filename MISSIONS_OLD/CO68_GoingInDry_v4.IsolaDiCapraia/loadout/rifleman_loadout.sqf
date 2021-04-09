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
_unit addVest "CUP_V_B_MTV_PistolBlack";
for "_i" from 1 to 9 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
_unit addItemToVest "RH_15Rnd_9x19_M9";
_unit addHeadgear "CUP_H_USMC_HelmetWDL";

_unit addWeapon "RH_M16A4";
_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_camo";
//_unit addPrimaryWeaponItem "RH_ta01nsn";
_unit addWeapon "RH_m9";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "CUP_NVG_PVS7";
_unit addItem "ACE_epinephrine";

sleep 2;

_unit addItem "ItemRadio";

if (groupID (group _unit) == "NullGroup") then 
{



}
else
{



};

