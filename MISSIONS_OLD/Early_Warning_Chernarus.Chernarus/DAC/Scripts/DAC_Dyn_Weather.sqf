//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.0 - 2010    //
//--------------------------//
//    DAC_Dyn_Weather       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_weatherDistanceTime","_weatherChangeTime","_weatherMaxCas","_weatherMaxFog","_oldWeather",
			"_oldfog","_run","_timefact","_waittime","_code","_go"
		];

waituntil {(DAC_Basic_Value > 0)};

_weatherDistanceTime = _this select 0;_weatherChangeTime = _this select 1;_weatherMaxCas = _this select 2;
_weatherMaxFog = _this select 3;DAC_ChangeWeather = 0;DAC_Weather = overcast;DAC_Fog = fog;DAC_Rain = rain;
_oldWeather = DAC_Weather;_oldfog = DAC_Fog;_run = 1;_waittime = 0;
_code = _this select 4;_go = 1;

if((_weatherDistanceTime == 0) || (_weatherChangeTime == 0)) then {_run = 0};

if(_code == 3) then {_run = 5};

while {_run > 0} do
{
	switch (_run) do
	{
		case 1:	{
					if(!(isServer)) then
					{
						sleep _weatherDistanceTime;
						waituntil {(_oldWeather != DAC_Weather)};
						_oldWeather = DAC_Weather;
						sleep 1;
						_run = 3;
					}
					else
					{
						sleep (_weatherDistanceTime + 3);
						_run = 2;
					};
				};
		case 2:	{
					DAC_Weather = random _weatherMaxCas;DAC_Fog = random _weatherMaxFog;DAC_Rain = random 1;
					_oldWeather = DAC_Weather;_oldfog = DAC_Fog;
					publicvariable "DAC_Weather";publicvariable "DAC_Fog";publicvariable "DAC_Rain";
					sleep 1;
					_run = 3;
				};
		case 3:	{
					_waittime = daytime + (_weatherChangeTime / 4000);
					_weatherChangeTime setovercast DAC_Weather;
					_weatherChangeTime setrain DAC_Rain;
					_go = 1;
					while {_go > 0} do
					{
						sleep (1 + (random 1));
						if(daytime > _waittime) then {_go = 0;_run = 4};
					};
				};
		case 4:	{
					if(isServer) then
					{
						sleep 3;
						DAC_ChangeWeather = 2;publicvariable "DAC_ChangeWeather";
					}
					else
					{
						waituntil {(DAC_ChangeWeather == 2)};
					};
					
					(_weatherChangeTime / 2) setfog DAC_Fog;
					sleep 1;
					DAC_ChangeWeather = 0;
					_waittime = daytime + (_weatherDistanceTime / 4000);
					while {(daytime < _waittime)} do
					{
						sleep (1 + (random 1));
					};
					if(isServer) then
					{
						sleep 5;
						_run = 2;
					}
					else
					{
						waituntil {(_oldWeather != DAC_Weather)};
						_oldWeather = DAC_Weather;
						sleep 1;
						_run = 3;
					};
				};
		case 5:	{
					DAC_Weather = -1;
					waituntil {(DAC_Weather >= 0)};
					_oldWeather = DAC_Weather;
					_run = 3;
				};
		Default{};
	};
};