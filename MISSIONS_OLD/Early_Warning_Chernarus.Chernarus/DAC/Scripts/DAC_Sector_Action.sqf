//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.0 - 2010    //
//--------------------------//
//    DAC_Sector_Action.sqf //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private   ["_sector","_string","_action","_var"];

_sector = _this select 0;_string = _this select 1;_action = true;_var = 0;

_sector setVariable ["SectorStatus", 0, true];

sleep 5;

while{_action} do
{
	_var = _sector getVariable "SectorStatus";
	if(_var == 3) then
	{
		call compile _string;_action = false;
	};
	sleep 1;
};