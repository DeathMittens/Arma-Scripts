//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Delete_Object     //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private ["_obj","_h","_c","_p"];

_obj = _this select 0;_c = 0;_p = position _obj;
_h = -(((boundingBox _obj select 1) select 2) + 1);

if((typeof _obj) != "Logic") then
{
	while {_c > _h} do
	{
		_obj setpos [(_p select 0),(_p select 1),_c];
		_c = _c - 0.02;
		sleep 0.05;
	};
	deletevehicle _obj;
};