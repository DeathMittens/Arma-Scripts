if(!isServer) exitWith{};

_LHDspawn = _this select 0;
_LHDdir = getdir _LHDspawn;
_LHDspawnpoint = getposasl _LHDspawn;
deletevehicle _LHDspawn;
_parts = 
[
	"Land_LHD_house_1",
	"Land_LHD_house_2",
	"Land_LHD_elev_R",
	"Land_LHD_1",
	"Land_LHD_2",
	"Land_LHD_3",
	"Land_LHD_4",
	"Land_LHD_5",
	"Land_LHD_6"
];
{
	_dummy = _x createvehicle _LHDspawnpoint;
	_dummy setdir _LHDdir;
	_dummy setpos _LHDspawnpoint;
}foreach _parts;


//Usage
//Place a ship in the editor with the following in it's init
//res=[this]execVM"CreateLHD.sqf"