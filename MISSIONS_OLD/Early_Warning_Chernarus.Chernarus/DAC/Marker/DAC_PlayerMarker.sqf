//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_PlayerMarker      //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private ["_i","_m","_ma","_s","_side","_mColor","_check","_pl"];

_i = 0;_m = "";_ma = "";_s = 0;
_side = ["EAST","WEST","GUER","CIV"];_check = [];
_mColor = ["ColorRed","ColorBlue","ColorYellow","ColorGreen"];

{
	_m = format["m%1",_x];_ma = createmarkerlocal [_m, [0,0]];_ma setmarkersizelocal [0.5,0.5];
	_ma setMarkerTypelocal "o_inf";_ma setMarkerColorlocal "ColorWhite";
}	foreach DAC_Players;

waituntil {DAC_Basic_Value > 0};

player setVariable ["respawn_var", 0, true];

while{time > 1} do
{
	_i = 0;
	while{_i < count DAC_Players} do
	{
		_pl = DAC_Players select _i;
		if(!isNil "_pl") then
		{
			if(alive _pl) then
			{
				if(isNil {_pl getVariable "respawn_var"}) then
				{
					(_pl setVariable ["respawn_var", 0, true];
				}
				else
				{
					if(_pl in _check) then
					{
						if((_pl getVariable "respawn_var") == 1) then
						{
							_check = _check - [_pl];
							_pl setVariable ["respawn_var", 0, true];
							deletemarkerlocal format["d%1",_pl];
						};
					};
					_s = _side find format["%1",side _pl];
					if(_s >= 0) then
					{
						(format["m%1",_pl]) setmarkerposlocal (position _pl);
						(format["m%1",_pl]) setMarkerTextlocal format["%1",name _pl];
						(format["m%1",_pl]) setMarkerColorlocal (_mColor select _s);
					};
				};
			}
			else
			{
				if(!(_pl in _check)) then
				{
					_check set [count _check,_pl];
					_m = format["d%1",_pl];_ma = createmarkerlocal [_m, position _pl];_ma setmarkersizelocal [0.5,0.5];
					_ma setMarkerTypelocal "o_inf";_ma setMarkerColorlocal "ColorRed";
				};
			};
		};
		_i = _i + 1;
	};
	sleep 0.5;
};