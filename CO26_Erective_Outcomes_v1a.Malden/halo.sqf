// halo.sqf
// Teleport player to the set drop zone location.

if (!isMultiplayer) then { // Debug
	systemChat "Debug: halo.sqf";
	systemChat format ["Debug: HALO at Drop Zone %1", DropZone];
};

enableCamShake false; // Stop C-130 screen shake
resetCamShake;

_dropZone = DropZone;
_xx = 0;
_yy = 0;
_zz = 3000;

switch (_dropZone) do {
	case "1": {
		_xx = (getMarkerPos "drop1") select 0;
		_yy = (getMarkerPos "drop1") select 1;
	};
	case "2": {
		_xx = (getMarkerPos "drop2") select 0;
		_yy = (getMarkerPos "drop2") select 1;
	};
	case "3": {
		_xx = (getMarkerPos "drop3") select 0;
		_yy = (getMarkerPos "drop3") select 1;
	};
	case "4": {
		_xx = (getMarkerPos "drop4") select 0;
		_yy = (getMarkerPos "drop4") select 1;
	};
	case "5": {
		_xx = (getMarkerPos "drop5") select 0;
		_yy = (getMarkerPos "drop5") select 1;
	};

	case default {
		_xx = (getMarkerPos "drop1") select 0;
		_yy = (getMarkerPos "drop1") select 1;
	};
};

// random [min, mid, max] - Random spread from drop zone
_xSpread = random[-300,0,300]; 
_ySpread = random[-300,0,300];
_xx = _xx + _xSpread;
_yy = _yy + _ySpread;
_dropPos = [_xx, _yy, _zz];

if (!isMultiplayer) then { // Debug
	systemChat (str _dropPos);
};

player setPosASL _dropPos;

// Check player is wearing parachute
if (backpack player != "B_Parachute") then {
	player addBackpack "B_Parachute";
	hintSilent "Added parachute";
};