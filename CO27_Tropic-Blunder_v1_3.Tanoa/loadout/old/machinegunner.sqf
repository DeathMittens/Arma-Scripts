//to prevent MP / JIP issues
//waitUntil {!isNull player};

_unit = _this select 0;

// Common gear

comment "Exported from Arsenal by Death Mittens";

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add containers";
_unit forceAddUniform "LOP_U_UKR_Fatigue_Multicam";
for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
_unit addItemToUniform "itemRadio";
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
_unit addVest "V_TacVest_khk";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_100Rnd_762x54mmR";};
_unit addBackpack "rhs_sidor";
//_unit addItemToBackpack "rhs_100Rnd_762x54mmR";
_unit addHeadgear "rhsusf_patrolcap_ocp";
_unit addGoggles "G_Bandanna_oli";

comment "Add weapons";
_unit addWeapon "rhs_weap_pkm";

_unit addItem "rhs_100Rnd_762x54mmR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";






if (groupID (group _unit) == "NullGroup") then 
{

}
else
{

};

