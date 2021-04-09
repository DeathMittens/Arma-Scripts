//to prevent MP / JIP issues
waitUntil {!isNull player};

_unit = _this select 0;

// Common gear

_unit removeWeapon "arifle_SUD_AKMS";
_unit removemagazines "30Rnd_762x39_AKM";

removebackpack _unit;
_unit addBackpack "B_FieldPack_khk";

_unit addMagazines ["75rnd_545x39_RPK107",8];
_unit addWeapon "LMG_SUD_RPK107";

(unitBackpack _unit) addmagazinecargo ["PG7V_F",2];
(unitBackpack _unit) addmagazinecargo ["30Rnd_762x39_AKM",3];