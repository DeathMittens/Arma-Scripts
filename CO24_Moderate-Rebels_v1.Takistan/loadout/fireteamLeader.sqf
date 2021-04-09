//to prevent MP / JIP issues
//waitUntil {!isNull player};

_unit = _this select 0;

// Common gear


comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
//removeUniform _unit;
//removeVest _unit;
//removeBackpack _unit;
removeHeadgear _unit;
//removeGoggles _unit;

_unit addHeadgear "rhssaf_helmet_m97_digital";

_unit addMagazine "rhsgref_30rnd_556x45_m21";
_unit addWeapon "rhs_weap_m21a";

_unit addWeapon "Binocular";

{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch"];

// Uniform
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
{_unit addItemToUniform "ACE_packingBandage"} count [1,2,3,4];
{_unit addItemToUniform "ACE_morphine"} count [1,2];
{_unit addItemToUniform "ACE_tourniquet"} count [1];
{_unit addItemToUniform "rhsgref_30rnd_556x45_m21"} count [1,2];

// Vest
{_unit addItemToVest "rhssaf_mag_brd_m83_green"} count [1];
{_unit addItemToVest "rhssaf_mag_brd_m83_red"} count [1];
{_unit addItemToVest "rhssaf_mag_brd_m83_white"} count [1];
{_unit addItemToVest "rhssaf_mag_br_m75"} count [1,2];
{_unit addItemToVest "rhsgref_30rnd_556x45_m21"} count [1,2];

// Backpack
{_unit addItemToBackpack "rhsgref_30rnd_556x45_m21"} count [1,2,3,4,5];

// radios
sleep 1;
_unit addItem "ACRE_PRC343";
_unit additem "ACRE_PRC148";




/*
if (groupID (group _unit) == "NullGroup") then 
{

}
else
{

};
*/
