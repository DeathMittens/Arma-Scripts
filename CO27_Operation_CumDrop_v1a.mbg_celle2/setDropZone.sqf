// setDropZone.sqf
// Command / leaders set and update the HALO drop zone

/*
this addAction ["<t color='#FF0000'>Drop Zone 1</t>","setDropZone.sqf",["1"],1,false,true,"","_this distance _target < 15"];
this addAction ["<t color='#FFFF00'>Drop Zone 2</t>","setDropZone.sqf",["2"],1,false,true,"","_this distance _target < 15"];
this addAction ["<t color='#00FF00'>Drop Zone 3</t>","setDropZone.sqf",["3"],1,false,true,"","_this distance _target < 15"];
this addAction ["<t color='#0000FF'>Drop Zone 4</t>","setDropZone.sqf",["4"],1,false,true,"","_this distance _target < 15"];
this addAction ["<t color='#00FFFF'>Drop Zone 5</t>","setDropZone.sqf",["5"],1,false,true,"","_this distance _target < 15"];

Red: #FF0000
Yellow: #FFFF00
Green: #00FF00
Blue: #0000FF
cyan: #00FFFF
*/

_dropZone = _this select 3 select 0; // Input Argument


_className = gettext (configFile >> "cfgVehicles" >> typeOf player >> "displayName");

if (_className == "Officer" || _className == "Squad Leader" ) then {
	DropZone = _dropZone;

	publicVariable "DropZone";
	hintSilent format ["Set to Drop Zone %1", _dropZone];

} else {

	hintSilent "Only the Commander or Squad Leaders can set the drop zone.";
}