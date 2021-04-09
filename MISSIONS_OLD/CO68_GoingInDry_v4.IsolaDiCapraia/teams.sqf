//preset fireteam group colours
//id = ["TEAM1", this] execVM "Teams.sqf";

private ["_type", "_unit"];

_type = _this select 0;
_unit = _this select 1;
	
Sleep 5;
		
switch (_type) do
{

	case "TEAM1":
	{
	_unit assignTeam "RED";
	};

	case "TEAM2":
	{
	_unit assignTeam "Blue";
	};
	
	case "CMD":
	{
	_unit assignTeam "Yellow";
	};

};