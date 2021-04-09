//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.0 - 2010    //
//--------------------------//
//    DAC_InitMarker        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_MTrigger","_i","_s","_v","_z","_u","_r","_l","_t","_g","_Mgroup","_MSides","_MUSide","_MCM","_gM","_gT"];

_MTrigger = _this select 0;

_MSides  = ["East","West","Resistance","Civilian"];_MUSide = [];
_MCM     = (DAC_Marker_Val select 2);_gT = 0;_i = 0;

while{_i < count _MSides} do
{
	_u = _MCM select _i;
	if(_u == 0) then {_MUSide set [count _MUSide,(_MSides select _i)]};
	_i = _i + 1;
};

sleep 1;

_i = 0;_s = [];_v = [];_z = objNull;_u = objNull;_r = [];_g = [];_gM = DAC_Marker;

if((isServer) && (({((isPlayer _x) && (local _x))} count DAC_Players) == 0)) then
{
	//exit;
}
else
{
	if(DAC_Marker > 0) then	{DAC_Marker_Val = [DAC_Marker] call DAC_fConfigMarker};
	while {true} do
	{
		if((_gM != DAC_Marker) || (DAC_Marker == 0)) then
		{
			if(DAC_Marker == 0) then
			{
				_i = 0;_s = [];_v = [];_z = objNull;_u = objNull;_r = [];_g = [];
				while {DAC_Marker == 0} do
				{
					sleep 1;
				};
				DAC_Marker_Val = [DAC_Marker] call DAC_fConfigMarker;_gM = DAC_Marker;
			}
			else
			{
				_i = 0;_s = [];_v = [];_z = objNull;_u = objNull;_r = [];_g = [];
				DAC_Marker_Val = [DAC_Marker] call DAC_fConfigMarker;_gM = DAC_Marker;
			};
		}
		else
		{
			if(({_x > 0} count (DAC_Marker_Val select 2)) == 0) then
			{
				sleep 0.5;
			}
			else
			{
				_l = List _MTrigger;
				sleep 0.1;
				waituntil{DAC_NewZone == 0};
				while {_i < count _l} do
				{
					_u = _l select _i;
					if((format["%1",typeof _u] == "Logic")
					|| (format["%1",typeof _u] == "birdscube")
					|| (format["%1",_u] == "<NULL-object>")
					|| (format["%1",side (driver _u)] in _MUSide)) then
					{
						_i = _i + 1;
					}
					else
					{
						if(DAC_NewZone == 0) then
						{
							if((count (crew _u)) > 0) then
							{
								_Mgroup = group ((crew _u) select 0);
								if(!(_Mgroup in DAC_Marker_Array)) then
								{
									if(({alive _x} count units _Mgroup) > 0) then
									{
										if(({_Mgroup in _x} count [DAC_GroupPoolE,DAC_GroupPoolW,DAC_GroupPoolR,DAC_GroupPoolC]) == 0) then
										{
											DAC_Marker_Array set [count DAC_Marker_Array,_Mgroup];
											if(driver _u == _u) then
											{
												[((crew _u) select 0),1,_Mgroup] spawn DAC_fUnitMarker;
											}
											else
											{
												[((crew _u) select 0),3,_Mgroup] spawn DAC_fUnitMarker;
											};
										};
									};
								}
								else
								{
									if((({alive _x} count units _Mgroup) == 0) || (({_Mgroup in _x} count [DAC_GroupPoolE,DAC_GroupPoolW,DAC_GroupPoolR,DAC_GroupPoolC]) > 0)) then {DAC_Marker_Array = DAC_Marker_Array - [_Mgroup]}
								};
							};
							_i = _i + 1;
							sleep 0.01;
						}
						else
						{
							waituntil{DAC_NewZone == 0};
							_i = count _l;
						};
					};
				};
				if((!(DAC_InSpawn)) && (DAC_NewZone == 0)) then
				{
					_si = 0;
					while{_si < count DAC_Marker_Array} do
					{
						if(DAC_NewZone == 0) then
						{
							_Mgroup = DAC_Marker_Array select _si;
							if((({alive _x} count units _Mgroup) == 0) || (({_Mgroup in _x} count [DAC_GroupPoolE,DAC_GroupPoolW,DAC_GroupPoolR,DAC_GroupPoolC]) > 0)) then {DAC_Marker_Array = DAC_Marker_Array - [_Mgroup]} else {_si = _si + 1};
						}
						else
						{
							_si = count DAC_Marker_Array;
						};
					};
				};
				_i = 0;
			};
		};
	};
};