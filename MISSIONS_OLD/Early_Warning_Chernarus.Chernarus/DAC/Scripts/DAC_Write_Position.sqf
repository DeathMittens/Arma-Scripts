//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Write_Position    //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private ["_oldArray","_newArray","_n","_entry"];

_oldArray = _this;_newArray = [];_n = 0;_entry = [];

while {_n < count _oldArray} do
{
	_entry = call compile (_oldArray select _n);
	if(format["%1",_entry] != "<null>") then
	{
		if(count _entry == 2) then
		{
			_newArray set [count _newArray,[format["%1",_entry select 0],format["%1",_entry select 1]]];
			_n = _n + 1;
		};
	};
};
_newArray
