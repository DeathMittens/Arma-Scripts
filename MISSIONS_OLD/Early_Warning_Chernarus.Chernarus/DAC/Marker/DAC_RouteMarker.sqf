//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.0 - 2010    //
//--------------------------//
//    DAC_RouteMarker       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_group","_wppos","_newpos","_newbeh","_side","_leader","_md","_np","_wait","_go","_ison",
			"_m","_ma","_r","_d","_n","_check","_rf","_sz","_t","_v","_l","_s","_pos","_rn","_run"
		];
		
_run = 0;_go = true;_ison = 0;_pos = [];

waituntil {(getdir DAC_StartDummy) > 170};
sleep 3;

{[_x,(_this select 0)] spawn DAC_fLeaderMarker}foreach units (_this select 0);

while {_go} do
{
	switch (_run) do
	{
		case 0:	{
					while {_run == 0} do
					{
						sleep (1 + random 1);
						if (DAC_Marker > 0 && {((DAC_Marker_Val select 7) select 0) > 0} && {((DAC_Marker_Val select 7) select 1) > 0}) then {_run = 1};
					};
				};
		case 1:	{
					_group = _this select 0;_side = _this select 1;_leader = leader _group;
					_check = true;_wppos = [0,0];_newpos = [0,0];
					_rf = ((DAC_Marker_Val select 6) select 1);_sz = ((DAC_Marker_Val select 7) select 0);
					_t = 0;_v = 0;_rn = _rf;_wait = time + 5;
					waituntil {(time > _wait) || ((count (waypoints _leader)) > 1)};
					if(((count (waypoints _leader)) > 1) && ((_leader in DAC_East_Units) || (_leader in DAC_West_Units))) then
					{
						_m  = format["_mwp%1%2",_group,(round time)];_ma = createmarkerlocal [_m, position (units _group select 0)];
						_ma setMarkerShapelocal "RECTANGLE";_ma setMarkerSizelocal [1,1];_ma setMarkerColorlocal "ColorGreen";
						_l  = format["_nwp%1",_group];_na = createmarkerlocal [_l, position (units _group select 0)];_ison = 0;
						_na setMarkerShapelocal "ELLIPSE";_na setMarkerSizelocal [((DAC_Marker_Val select 7) select 1),((DAC_Marker_Val select 7) select 1)];_na setMarkerColorlocal "ColorBlack";

						while {_check} do
						{
							sleep (_rn);
							_newpos = getwppos[_group,3];_newbeh = ((getwppos[_group,1]) select 0);
							if(!(((_wppos select 0) + (_wppos select 1)) == ((_newpos select 0) + (_newpos select 1)))) then
							{
								_wppos  = _newpos;_ison = 0;
								switch (_newbeh) do
								{
									case 10:{
												_ma setMarkerColorlocal ((DAC_Marker_Val select 14) select 5);
												_na setMarkerColorlocal ((DAC_Marker_Val select 14) select 6);
												_na setMarkerShapelocal "ELLIPSE";
												_na setMarkerBrushlocal "Solid";
												_na setmarkerposlocal _wppos;_t = 0;_v = 0;
												_na setMarkerSizelocal [((DAC_Marker_Val select 7) select 1),((DAC_Marker_Val select 7) select 1)];_rn = _rf;
											};
									case 20:{
												_ma setMarkerColorlocal "ColorYellow";
												_na setMarkerColorlocal "ColorYellow";
												_na setMarkerShapelocal "ELLIPSE";
												_na setMarkerBrushlocal "Solid";
												_na setmarkerposlocal _wppos;_t = 1;_v = 0;
												_s = ((getwppos[_group,1]) select 1);
												_na setMarkerSizelocal [_s,_s];_rn = _rf;
											};
									case 30:{
												_ma setMarkerColorlocal "ColorRed";
												_na setMarkerColorlocal "ColorRed";
												_na setMarkerShapelocal "ELLIPSE";
												_na setMarkerBrushlocal "Solid";
												_na setmarkerposlocal _wppos;_t = 2;_v = 0;
												_na setMarkerSizelocal [(_sz * 4),(_sz * 4)];_rn = _rf;
											};
									case 40:{
												_ma setMarkerColorlocal "ColorWhite";
												_na setMarkerColorlocal "ColorYellow";
												_na setMarkerShapelocal "RECTANGLE";
												_na setMarkerBrushlocal "Solid";
												_md = 0;_v = 0;_na setMarkerdirlocal _md;_t = 3;
												if(_ison == 0) then {_pos = position (leader _group);_ison = 1};
												_na setMarkerSizelocal [(((getwppos[_group,1]) select 1)/2),2];
												_ma setMarkerSizelocal [(((getwppos[_group,1]) select 1)/2),1];
												_np = 0;_rn = (_rf / 2);
											};
									case 50:{
												_ma setMarkerColorlocal "ColorWhite";
												_na setMarkerColorlocal "ColorYellow";
												_na setMarkerShapelocal "ELLIPSE";
												_na setMarkerBrushlocal "Solid";
												_na setmarkerposlocal _wppos;_t = 4;_v = 0;
												_na setMarkerSizelocal [(_sz * 4),(_sz * 4)];_rn = _rf;
											};
									case 60:{
												_ma setMarkerColorlocal "ColorBlue";
												_na setMarkerColorlocal "ColorBlue";
												_na setMarkerShapelocal "ELLIPSE";
												_na setMarkerBrushlocal "Solid";
												_na setmarkerposlocal _wppos;_t = 5;_v = 0;
												_na setMarkerSizelocal [(_sz * 4),(_sz * 4)];_rn = _rf;
											};
									case 70:{
												_ma setMarkerColorlocal "ColorGreen";
												_na setMarkerColorlocal "ColorBlack";
												_na setMarkerShapelocal "ELLIPSE";
												_na setMarkerBrushlocal "DiagGrid";
												_na setMarkerPoslocal getwppos[_group,2];
												_md = random 360;_v = 0;_pos = _wppos;_na setMarkerdirlocal _md;_t = 6;
												_na setMarkerSizelocal [((getwppos[_group,1]) select 1),(((getwppos[_group,1]) select 1) / 10)];
												_ma setMarkerSizelocal [((getwppos[_group,1]) select 1),5];
												_np = 0;_rn = (_rf / 2);
											};
									Default {};
								};
							};
							if(({alive _x} count units _group) == 0) then
							{
								deletemarkerlocal _na;deletemarkerlocal _ma;_check = false;_go = false;
								sleep 1;
							}
							else
							{
								if((DAC_Marker == 0) || ((((DAC_Marker_Val select 7) select 0) == 0) && (((DAC_Marker_Val select 7) select 1) == 0))) then
								{
									deletemarkerlocal _na;deletemarkerlocal _ma;_check = false;_run = 0;
								}
								else
								{
									if(((count (waypoints _leader)) > 1) && ((_leader in DAC_East_Units) || (_leader in DAC_West_Units))) then
									{
										if((alive _leader) && (_group == group _leader)) then
										{
											if(_t != 6) then
											{
												if(_ison == 0) then
												{
													_d = ((_wppos distance [(position _leader select 0),(position _leader select 1),0]) / 2);
													_r = ((_wppos select 0) - (position _leader select 0)) atan2 ((_wppos select 1) - (position _leader select 1));
												}
												else
												{
													_d = ((_pos distance [(position _leader select 0),(position _leader select 1),0]) / 2);
													_r = ((_pos select 0) - (position _leader select 0)) atan2 ((_pos select 1) - (position _leader select 1));
												};
												_n = [(position _leader select 0) + (Sin (_r) * _d),(position _leader select 1) + (Cos (_r) * _d),0];
												_ma setMarkerSizelocal [_d,_sz];_ma setMarkerPoslocal _n;_ma setMarkerDirlocal (_r + 90);
												if(_t == 1) then {if(_v < _s) then {_v = _v + 2;_na setMarkerSizelocal [_v,_v]} else {_v = 1;_na setMarkerSizelocal [_v,_v]}};
												if(_t == 2) then {if(_v == 0) then {_v = 1;_ma setMarkerSizelocal [_d,_sz];_na setMarkerSizelocal [5,5]} else {_v = 0;_ma setMarkerSizelocal [_d,(_sz + (_sz / 2))];_na setMarkerSizelocal [7,7];sleep 0.5}};
												if(_t == 4) then {_na setMarkerPoslocal _n;_na setMarkerDirlocal (_r + 90);if(_v < _d) then {_v = _v + (_d / 5);_na setMarkerSizelocal [_v,(_sz + 2)]} else {_v = 1;_na setMarkerPoslocal _wppos;_na setMarkerSizelocal [8,8];sleep 0.5}};
												if(_t == 3) then {_np = [(_pos select 0) + (Sin (_md) * (((getwppos[_group,1]) select 1)/2)),(_pos select 1) + (Cos (_md) * (((getwppos[_group,1]) select 1)/2)),0];_na setMarkerPoslocal _np;_na setMarkerDirlocal (_md + 90);_md = _md + 3};
											}
											else
											{
												_d = ((getwppos[_group,2] distance [(position _leader select 0),(position _leader select 1),0]) / 2);
												_r = ((getwppos[_group,2] select 0) - (position _leader select 0)) atan2 ((getwppos[_group,2] select 1) - (position _leader select 1));
												_n = [(position _leader select 0) + (Sin (_r) * _d),(position _leader select 1) + (Cos (_r) * _d),0];
												_ma setMarkerSizelocal [_d,_sz];_ma setMarkerPoslocal _n;_ma setMarkerDirlocal (_r + 90);
												_na setMarkerDirlocal _md;_md = _md + 2;
											};
										}
										else
										{
											_ma setMarkerColorlocal "ColorWhite";
											_na setMarkerColorlocal "ColorWhite";
											waituntil {((DAC_Marker == 0) || (({alive _x} count units _group) == 0) || ((!(leader _group == _leader)) || ((format["%1",group _leader] == "<NULL-group>") && (({alive _x} count units _group) == 0))))};
											if(DAC_Marker == 0) then
											{
												deletemarkerlocal _na;deletemarkerlocal _ma;_check = false;_run = 0;
											}
											else
											{
												if((({alive _x} count units _group) == 0) || ((({alive _x} count units _group) == 0) && (format["%1",group _leader] == "<NULL-group>"))) then
												{
													deletemarkerlocal _na;deletemarkerlocal _ma;_check = false;_go = false;
													sleep 1;
												}
												else
												{
													_leader = leader _group;_wppos = [0,0];
													sleep 1;
												};
											};
										};
									}
									else
									{
										deletemarkerlocal _na;deletemarkerlocal _ma;_check = false;_go = false;
									};
								};
							};
						};
					}
					else
					{
						deletemarkerlocal _na;deletemarkerlocal _ma;_check = false;_go = false;
					};
				};
	};
};