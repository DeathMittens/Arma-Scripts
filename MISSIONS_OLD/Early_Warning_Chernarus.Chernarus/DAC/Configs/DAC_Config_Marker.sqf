//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.0 - 2010    //
//--------------------------//
//    DAC_Config_Marker     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_MarkerConfig","_MarkerSet","_s","_setShowZones","_setShowWPs","_setShowUnit","_setGroupType",
			"_setMarkerText","_setMarkerDel","_setMarkerRefresh","_setSizeWpLine","_setSizeLeaderLine",
			"_setSizeZoneLine","_setSizeCampLine","_setSizeZoneBorder","_setArtiMarker","_setCampMarker",
			"_setMarkerClass","_setSideColor","_MarkerValues"
		];

_MarkerSet = 	[
					"_setShowZones","_setShowWPs","_setShowUnit","_setGroupType","_setMarkerText",
					"_setMarkerDel","_setMarkerRefresh","_setSizeWpLine","_setSizeLeaderLine",
					"_setSizeZoneLine","_setSizeCampLine","_setSizeZoneBorder","_setArtiMarker",
					"_setCampMarker","_setSideColor","_setMarkerClass"
				];

					_MarkerConfig = _this select 0;_MarkerValues = [0];_s = 0;

if(_MarkerConfig == 0) exitwith {};

switch (_MarkerConfig) do
{
//-----------------------------------------------------------------------------------------------
	case 1:	
	{		
				_setShowZones 		= 2;
				_setShowWPs 		= 1;
				_setShowUnit 		= [1,1,1,1];
				_setGroupType 		= 1;
				_setMarkerText		= ["if(format[""%1"",_group] == ""<NULL-group>"") then {format[""<--- %1"",typeof _unit]} else {format[""%1"",count units _group]}"];
				_setMarkerDel 		= 0;
				_setMarkerRefresh 	= [0.1,0.1];
				_setSizeWpLine 		= [0,0];
				_setSizeLeaderLine 	= 1;
				_setSizeZoneLine 	= 1;
				_setSizeCampLine 	= 4;
				_setSizeZoneBorder 	= 1;
				_setArtiMarker 		= 1;
				_setCampMarker 		= 2;
				_setSideColor 		= [
										"ColorRed",
										"ColorBlue",
										"ColorYellow",
										"ColorGreen",
										"ColorWhite",
										"ColorBlack",
										"ColorGreen",
										"ColorBlack"
									  ];
				_setMarkerClass		= [
										[
											["STATICWEAPON","mil_dot",[0.5,0.5],1]
										],
										[
											["MAN","mil_triangle",[0.6,0.6],1]
										],
										[
											["CAR","mil_box",[0.5,0.8],1],
											["TRUCK","mil_box",[0.5,0.9],1]
										],
										[
											["TANK","mil_box",[0.6,1.2],1],
											["APC","mil_box",[0.6,1.2],1]
										],
										[
											["MOTORCYCLE","mil_dot",[0.3,0.7],1]
										],
										[
											["AIR","mil_triangle",[0.7,1.5],1],
											["HELICOPTER","mil_triangle",[0.7,1.5],1],
											["PLANE","mil_triangle",[0.9,1.5],1],
											["ParachuteBase","mil_triangle",[0.9,0.3],1]
										],
										[
											["SHIP","mil_dot",[0.9,1.3],1]
										],
										[
											["OTHER","mil_dot",[0.7,0.7],1]
										]
									  ];
	};
//-----------------------------------------------------------------------------------------------
	case 2:	
	{		
				_setShowZones 		= 2;
				_setShowWPs 		= 1;
				_setShowUnit 		= [1,1,1,1];
				_setGroupType 		= 1;
				_setMarkerText		= [];
				_setMarkerDel 		= 0;
				_setMarkerRefresh 	= [0.3,0.3];
				_setSizeWpLine 		= [2,10];
				_setSizeLeaderLine 	= 0;
				_setSizeZoneLine 	= 0;
				_setSizeCampLine 	= 0;
				_setSizeZoneBorder 	= 1;
				_setArtiMarker 		= 1;
				_setCampMarker 		= 2;
				_setSideColor 		= [
										"ColorRed",
										"ColorBlue",
										"ColorYellow",
										"ColorGreen",
										"ColorWhite",
										"ColorBlack",
										"ColorGreen",
										"ColorBlack"
									  ];
				_setMarkerClass		= [
										[
											["STATICWEAPON","o_recon",[0.6,0.6],0]
										],
										[
											["MAN","o_inf",[0.5,0.5],0]
										],
										[
											["CAR","o_motor_inf",[0.6,0.6],0],
											["TRUCK","o_motor_inf",[0.8,0.8],0]
										],
										[
											["TANK","o_armor",[0.9,0.9],0],
											["APC","o_armor",[0.9,0.9],0]
										],
										[
											["MOTORCYCLE","o_mech_inf",[0.3,0.3],0]
										],
										[
											["AIR","o_air",[1,1],0]
										],
										[
											["SHIP","o_uav",[1,1],0]
										],
										[
											["OTHER","empty",[0.6,0.6],0]
										]
									  ];
	};
//-----------------------------------------------------------------------------------------------
	case 3:
	{		
				_setShowZones 		= 2;
				_setShowWPs 		= 1;
				_setShowUnit 		= [1,1,1,1];
				_setGroupType 		= 0;
				_setMarkerText		= ["if(isPlayer _unit) then {format[""%1"",_unit]}"];
				_setMarkerDel 		= 1;
				_setMarkerRefresh 	= [0.2,0.2];
				_setSizeWpLine 		= [0.7,8];
				_setSizeLeaderLine 	= 0.4;
				_setSizeZoneLine 	= 2;
				_setSizeCampLine 	= 2.5;
				_setSizeZoneBorder 	= 4;
				_setArtiMarker 		= 1;
				_setCampMarker 		= 2;
				_setSideColor 		= [
										"ColorRed",
										"ColorBlue",
										"ColorYellow",
										"ColorGreen",
										"ColorWhite",	
										"ColorBlack",
										"ColorGreen",
										"ColorBlack"
									  ];
				_setMarkerClass		= [
										[
											["STATICWEAPON","mil_dot",[0.5,0.5],1]
										],
										[
											["MAN","mil_triangle",[0.4,0.4],1]
										],
										[
											["CAR","mil_box",[0.5,0.8],1],
											["TRUCK","mil_box",[0.5,0.9],1]
										],
										[
											["TANK","mil_box",[0.6,1.2],1],
											["APC","mil_box",[0.6,1.2],1]
										],
										[
											["MOTORCYCLE","mil_dot",[0.3,0.7],1]
										],
										[
											["AIR","mil_box",[0.5,1],1],
											["HELICOPTER","mil_box",[0.5,1],1],
											["PLANE","mil_triangle",[0.9,1.5],1],
											["ParachuteBase","mil_triangle",[0.9,0.3],1]
										],
										[
											["SHIP","mil_dot",[0.9,1.3],1]
										],
										[
											["OTHER","mil_dot",[0.7,0.7],1]
										]
									  ];
	};
//-----------------------------------------------------------------------------------------------
	case 4:	
	{		
				_setShowZones 		= 2;
				_setShowWPs 		= 1;
				_setShowUnit 		= [1,1,1,1];
				_setGroupType 		= 1;
				_setMarkerText		= ["if(isPlayer _unit) then {format[""%1"",_unit]} else {if(format[""%1"",_group] == ""<NULL-group>"") then {format[""<--- %1"",typeof _unit]} else {format[""%1"",count units _group]}}"];
				_setMarkerDel 		= 1;
				_setMarkerRefresh 	= [0.3,0.3];
				_setSizeWpLine 		= [0.8,10];
				_setSizeLeaderLine 	= 0;
				_setSizeZoneLine 	= 0;
				_setSizeCampLine 	= 2;
				_setSizeZoneBorder 	= 3;
				_setArtiMarker 		= 1;
				_setCampMarker 		= 2;
				_setSideColor 		= [
										"ColorRed",
										"ColorBlue",
										"ColorYellow",
										"ColorGreen",
										"ColorWhite",
										"ColorBlack",
										"ColorGreen",
										"ColorBlack"
									  ];
				_setMarkerClass		= [
										[
											["STATICWEAPON","o_recon",[0.6,0.6],0]
										],
										[
											["MAN","o_inf",[0.5,0.5],0]
										],
										[
											["CAR","o_motor_inf",[0.6,0.6],0],
											["TRUCK","o_motor_inf",[0.8,0.8],0]
										],
										[
											["TANK","o_armor",[0.9,0.9],0],
											["APC","o_armor",[0.9,0.9],0]
										],
										[
											["MOTORCYCLE","o_mech_inf",[0.3,0.3],0]
										],
										[
											["AIR","o_air",[1,1],0]
										],
										[
											["SHIP","o_uav",[1,1],0]
										],
										[
											["OTHER","empty",[0.6,0.6],0]
										]
									  ];
	};
//-----------------------------------------------------------------------------------------------
	case 5:	
	{		
				_setShowZones 		= 2;
				_setShowWPs 		= 1;
				_setShowUnit 		= [1,1,1,1];
				_setGroupType 		= 1;
				_setMarkerText		= ["if(isPlayer _unit) then {format[""%1"",_unit]} else {if(format[""%1"",_group] == ""<NULL-group>"") then {format[""<--- %1"",typeof _unit]} else {format[""%1"",count units (group _unit)]}}"];
				_setMarkerDel 		= 1;
				_setMarkerRefresh 	= [0.3,0.3];
				_setSizeWpLine 		= [0.5,6];
				_setSizeLeaderLine 	= 0;
				_setSizeZoneLine 	= 1;
				_setSizeCampLine 	= 2;
				_setSizeZoneBorder 	= 3;
				_setArtiMarker 		= 1;
				_setCampMarker 		= 2;
				_setSideColor 		= [
										"ColorRed",
										"ColorBlue",
										"ColorYellow",
										"ColorGreen",
										"ColorWhite",
										"ColorBlack",
										"ColorGreen",
										"ColorBlack"
									  ];
				_setMarkerClass		= [
										[
											["STATICWEAPON","o_recon",[0.6,0.6],0]
										],
										[
											["MAN","o_inf",[0.5,0.5],0]
										],
										[
											["CAR","o_motor_inf",[0.6,0.6],0],
											["TRUCK","o_motor_inf",[0.8,0.8],0]
										],
										[
											["TANK","o_armor",[0.9,0.9],0],
											["APC","o_armor",[0.9,0.9],0]
										],
										[
											["MOTORCYCLE","o_mech_inf",[0.3,0.3],0]
										],
										[
											["AIR","o_air",[1,1],0]
										],
										[
											["SHIP","o_uav",[1,1],0]
										],
										[
											["OTHER","empty",[0.6,0.6],0]
										]
									  ];
	};
//-----------------------------------------------------------------------------------------------
	case 6:	
	{		
				_setShowZones 		= 2;
				_setShowWPs 		= 0;
				_setShowUnit 		= [1,1,1,1];
				_setGroupType 		= 1;
				_setMarkerText		= ["if(isPlayer _unit) then {format[""%1"",_unit]} else {if(format[""%1"",_group] == ""<NULL-group>"") then {format[""<--- %1"",typeof _unit]} else {format[""%1"",count units (group _unit)]}}"];
				_setMarkerDel 		= 1;
				_setMarkerRefresh 	= [0.3,0.3];
				_setSizeWpLine 		= [0.5,6];
				_setSizeLeaderLine 	= 0;
				_setSizeZoneLine 	= 1;
				_setSizeCampLine 	= 2;
				_setSizeZoneBorder 	= 1;
				_setArtiMarker 		= 1;
				_setCampMarker 		= 2;
				_setSideColor 		= [
										"ColorRed",
										"ColorBlue",
										"ColorYellow",
										"ColorGreen",
										"ColorWhite",
										"ColorBlack",
										"ColorGreen",
										"ColorBlack"
									  ];
				_setMarkerClass		= [
										[
											["STATICWEAPON","o_recon",[0.6,0.6],0]
										],
										[
											["MAN","o_inf",[0.5,0.5],0]
										],
										[
											["CAR","o_motor_inf",[0.6,0.6],0],
											["TRUCK","o_motor_inf",[0.8,0.8],0]
										],
										[
											["TANK","o_armor",[0.9,0.9],0],
											["APC","o_armor",[0.9,0.9],0]
										],
										[
											["MOTORCYCLE","o_mech_inf",[0.3,0.3],0]
										],
										[
											["AIR","o_air",[1,1],0]
										],
										[
											["SHIP","o_uav",[1,1],0]
										],
										[
											["OTHER","empty",[0.6,0.6],0]
										]
									  ];
	};
//-----------------------------------------------------------------------------------------------
	case 7:
	{		
				_setShowZones 		= 2;
				_setShowWPs 		= 0;
				_setShowUnit 		= [1,1,1,1];
				_setGroupType 		= 0;
				_setMarkerText		= ["if(isPlayer _unit) then {format[""%1"",_unit]}"];
				_setMarkerDel 		= 1;
				_setMarkerRefresh 	= [0.3,0.3];
				_setSizeWpLine 		= [0.5,6];
				_setSizeLeaderLine 	= 0.3;
				_setSizeZoneLine 	= 2;
				_setSizeCampLine 	= 2.5;
				_setSizeZoneBorder 	= 3;
				_setArtiMarker 		= 1;
				_setCampMarker 		= 2;
				_setSideColor 		= [
										"ColorRed",
										"ColorBlue",
										"ColorYellow",
										"ColorGreen",
										"ColorWhite",	
										"ColorBlack",
										"ColorGreen",
										"ColorBlack"
									  ];
				_setMarkerClass		= [
										[
											["STATICWEAPON","mil_dot",[0.5,0.5],1]
										],
										[
											["MAN","mil_triangle",[0.4,0.4],1]
										],
										[
											["CAR","mil_box",[0.5,0.8],1],
											["TRUCK","mil_box",[0.5,0.9],1]
										],
										[
											["TANK","mil_box",[0.6,1.2],1],
											["APC","mil_box",[0.6,1.2],1]
										],
										[
											["MOTORCYCLE","mil_dot",[0.3,0.7],1]
										],
										[
											["AIR","mil_box",[0.5,1],1],
											["HELICOPTER","mil_box",[0.5,1],1],
											["PLANE","mil_triangle",[0.9,1.5],1],
											["ParachuteBase","mil_triangle",[0.9,0.3],1]
										],
										[
											["SHIP","mil_dot",[0.9,1.3],1]
										],
										[
											["OTHER","mil_dot",[0.7,0.7],1]
										]
									  ];
	};
//-----------------------------------------------------------------------------------------------
	case 8:	
	{		
				_setShowZones 		= 2;
				_setShowWPs 		= 0;
				_setShowUnit 		= [0,0,0,0];
				_setGroupType 		= 1;
				_setMarkerText		= ["if(isPlayer _unit) then {format[""%1"",_unit]} else {if(format[""%1"",_group] == ""<NULL-group>"") then {format[""<--- %1"",typeof _unit]} else {format[""%1"",count units (group _unit)]}}"];
				_setMarkerDel 		= 1;
				_setMarkerRefresh 	= [0.3,0.3];
				_setSizeWpLine 		= [0,0];
				_setSizeLeaderLine 	= 0;
				_setSizeZoneLine 	= 1;
				_setSizeCampLine 	= 2;
				_setSizeZoneBorder 	= 4;
				_setArtiMarker 		= 1;
				_setCampMarker 		= 2;
				_setSideColor 		= [
										"ColorRed",
										"ColorBlue",
										"ColorYellow",
										"ColorGreen",
										"ColorWhite",
										"ColorBlack",
										"ColorGreen",
										"ColorBlack"
									  ];
				_setMarkerClass		= [
										[
											["STATICWEAPON","o_recon",[0.6,0.6],0]
										],
										[
											["MAN","o_inf",[0.5,0.5],0]
										],
										[
											["CAR","o_motor_inf",[0.6,0.6],0],
											["TRUCK","o_motor_inf",[0.8,0.8],0]
										],
										[
											["TANK","o_armor",[0.9,0.9],0],
											["APC","o_armor",[0.9,0.9],0]
										],
										[
											["MOTORCYCLE","o_mech_inf",[0.3,0.3],0]
										],
										[
											["AIR","o_air",[1,1],0]
										],
										[
											["SHIP","o_uav",[1,1],0]
										],
										[
											["OTHER","empty",[0.6,0.6],0]
										]
									  ];
	};
//-----------------------------------------------------------------------------------------------
	case 9:	
	{		
				_setShowZones 		= 2;
				_setShowWPs 		= 0;
				_setShowUnit 		= [0,0,0,0];
				_setGroupType 		= 0;
				_setMarkerText		= ["if(isPlayer _unit) then {format[""%1"",_unit]} else {if(format[""%1"",_group] == ""<NULL-group>"") then {format[""<--- %1"",typeof _unit]} else {format[""%1"",count units (group _unit)]}}"];
				_setMarkerDel 		= 1;
				_setMarkerRefresh 	= [0.3,0.3];
				_setSizeWpLine 		= [0,0];
				_setSizeLeaderLine 	= 0;
				_setSizeZoneLine 	= 2;
				_setSizeCampLine 	= 2;
				_setSizeZoneBorder 	= 2;
				_setArtiMarker 		= 1;
				_setCampMarker 		= 2;
				_setSideColor 		= [
										"ColorRed",
										"ColorBlue",
										"ColorYellow",
										"ColorGreen",
										"ColorWhite",
										"ColorBlack",
										"ColorGreen",
										"ColorBlack"
									  ];
				_setMarkerClass		= [
										[
											["STATICWEAPON","o_recon",[0.6,0.6],0]
										],
										[
											["MAN","o_inf",[0.5,0.5],0]
										],
										[
											["CAR","o_motor_inf",[0.6,0.6],0],
											["TRUCK","o_motor_inf",[0.8,0.8],0]
										],
										[
											["TANK","o_armor",[0.9,0.9],0],
											["APC","o_armor",[0.9,0.9],0]
										],
										[
											["MOTORCYCLE","o_mech_inf",[0.3,0.3],0]
										],
										[
											["AIR","o_air",[1,1],0]
										],
										[
											["SHIP","o_uav",[1,1],0]
										],
										[
											["OTHER","empty",[0.6,0.6],0]
										]
									  ];
	};
//-----------------------------------------------------------------------------------------------
	case 10:	
	{		
				_setShowZones 		= 2;
				_setShowWPs 		= 2;
				_setShowUnit 		= [1,1,1,1];
				_setGroupType 		= 1;
				_setMarkerText		= ["if(isPlayer _unit) then {format[""%1"",_unit]} else {if(format[""%1"",_group] == ""<NULL-group>"") then {format[""<--- %1"",typeof _unit]} else {format[""%1"",count units (group _unit)]}}"];
				_setMarkerDel 		= 1;
				_setMarkerRefresh 	= [0.3,0.3];
				_setSizeWpLine 		= [0.5,6];
				_setSizeLeaderLine 	= 0;
				_setSizeZoneLine 	= 1;
				_setSizeCampLine 	= 2;
				_setSizeZoneBorder 	= 3;
				_setArtiMarker 		= 1;
				_setCampMarker 		= 2;
				_setSideColor 		= [
										"ColorRed",
										"ColorBlue",
										"ColorYellow",
										"ColorGreen",
										"ColorWhite",
										"ColorBlack",
										"ColorGreen",
										"ColorBlack"
									  ];
				_setMarkerClass		= [
										[
											["STATICWEAPON","o_recon",[0.6,0.6],0]
										],
										[
											["MAN","o_inf",[0.5,0.5],0]
										],
										[
											["CAR","o_motor_inf",[0.6,0.6],0],
											["TRUCK","o_motor_inf",[0.8,0.8],0]
										],
										[
											["TANK","o_armor",[0.9,0.9],0],
											["APC","o_armor",[0.9,0.9],0]
										],
										[
											["MOTORCYCLE","o_mech_inf",[0.3,0.3],0]
										],
										[
											["AIR","o_air",[1,1],0]
										],
										[
											["SHIP","o_uav",[1,1],0]
										],
										[
											["OTHER","empty",[0.6,0.6],0]
										]
									  ];
	};
//-----------------------------------------------------------------------------------------------
	case 11:	
	{		
				_setShowZones 		= 1;
				_setShowWPs 		= 1;
				_setShowUnit 		= [1,1,1,1];
				_setGroupType 		= 1;
				_setMarkerText		= ["if(isPlayer _unit) then {format[""%1"",_unit]} else {if(format[""%1"",_group] == ""<NULL-group>"") then {format[""<--- %1"",typeof _unit]} else {format[""%1"",count units (group _unit)]}}"];
				_setMarkerDel 		= 1;
				_setMarkerRefresh 	= [0.3,0.3];
				_setSizeWpLine 		= [0,0];
				_setSizeLeaderLine 	= 0;
				_setSizeZoneLine 	= 0;
				_setSizeCampLine 	= 0;
				_setSizeZoneBorder 	= 5;
				_setArtiMarker 		= 0;
				_setCampMarker 		= 0;
				_setSideColor 		= [
										"ColorRed",
										"ColorBlue",
										"ColorYellow",
										"ColorGreen",
										"ColorWhite",
										"ColorBlack",
										"ColorGreen",
										"ColorBlack"
									  ];
				_setMarkerClass		= [
										[
											["STATICWEAPON","o_recon",[0.6,0.6],0]
										],
										[
											["MAN","o_inf",[0.5,0.5],0]
										],
										[
											["CAR","o_motor_inf",[0.6,0.6],0],
											["TRUCK","o_motor_inf",[0.8,0.8],0]
										],
										[
											["TANK","o_armor",[0.9,0.9],0],
											["APC","o_armor",[0.9,0.9],0]
										],
										[
											["MOTORCYCLE","o_mech_inf",[0.3,0.3],0]
										],
										[
											["AIR","o_air",[1,1],0]
										],
										[
											["SHIP","o_uav",[1,1],0]
										],
										[
											["OTHER","empty",[0.6,0.6],0]
										]
									  ];
	};
//-----------------------------------------------------------------------------------------------
	Default 
	{
				if(DAC_Basic_Value != 5) then
				{
					DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
					hintc "Error: DAC_Config_Waypoints > No valid config number";
				};
				if(true) exitwith {};
	};
};

while{_s < count _MarkerSet} do
{
	_MarkerValues set[_s, (call compile (_MarkerSet select _s))];
	_s = _s + 1;
};
_MarkerValues