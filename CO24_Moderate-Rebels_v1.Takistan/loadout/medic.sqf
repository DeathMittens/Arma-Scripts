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

_unit addHeadgear "rhssaf_helmet_m97_olive_nocamo";

_unit addMagazine "rhssaf_30Rnd_762x39mm_M67";
_unit addWeapon "rhs_weap_m92";

{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch"];

// Uniform
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
{_unit addItemToUniform "ACE_packingBandage"} count [1,2,3,4];
{_unit addItemToUniform "ACE_morphine"} count [1,2];
{_unit addItemToUniform "ACE_tourniquet"} count [1];
{_unit addItemToUniform "rhssaf_30Rnd_762x39mm_M67"} count [1,2];

// Vest
{_unit addItemToVest "rhssaf_mag_brd_m83_green"} count [1];
{_unit addItemToVest "rhssaf_mag_brd_m83_red"} count [1];
{_unit addItemToVest "rhssaf_mag_brd_m83_white"} count [1];
{_unit addItemToVest "rhssaf_mag_br_m75"} count [1,2];
{_unit addItemToVest "rhssaf_30Rnd_762x39mm_M67"} count [1,2];

// Backpack
{_unit addItemToBackpack "rhssaf_30Rnd_762x39mm_M67"} count [1,2,3,4,5];


{_unit addItemToBackpack "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
{_unit addItemToBackpack "ACE_packingBandage"} count [1,2,3,4,5,6,7,8];

{_unit addItemToBackpack "ACE_salineIV_250"} count [1,2,3,4];
{_unit addItemToBackpack "ACE_bloodIV_500"} count [1,2,3,4];
{_unit addItemToBackpack "ACE_bloodIV"} count [1,2,3,4];
	
{_unit addItemToBackpack "ACE_splint"} count [1,2];
{_unit addItemToBackpack "ACE_tourniquet"} count [1,2];

{_unit addItemToBackpack "ACE_morphine"} count [1,2,3,4,5,6,7,8];
{_unit addItemToBackpack "ACE_epinephrine"} count [1,2,3,4,5,6,7,8];


// radios
sleep 1;
_unit addItem "ACRE_PRC343";
//_unit additem "ACRE_PRC148";


/*
if (groupID (group _unit) == "NullGroup") then 
{

}
else
{

};
*/
