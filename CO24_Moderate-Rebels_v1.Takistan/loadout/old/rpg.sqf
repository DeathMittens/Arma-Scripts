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
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "itemRadio";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
_unit addVest "V_TacVest_khk";
for "_i" from 1 to 9 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
_unit addHeadgear "rhsusf_patrolcap_ocp";
_unit addGoggles "G_Bandanna_oli";

_unit addBackpack "rhs_rpg_empty";
for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};

comment "Add weapons";
_unit addWeapon "rhs_weap_ak74m_fullplum";
_unit addPrimaryWeaponItem "rhs_acc_dtk";
_unit addWeapon "rhs_weap_rpg7";
_unit addSecondaryWeaponItem "rhs_acc_pgo7v";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

_unit addItem "rhs_30Rnd_545x39_AK";
_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";









if (groupID (group _unit) == "NullGroup") then 
{

}
else
{

};

