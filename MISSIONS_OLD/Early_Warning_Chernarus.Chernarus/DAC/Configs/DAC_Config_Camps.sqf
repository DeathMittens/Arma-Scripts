//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Config_Camps      //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private [
			"_CampTyp","_campBasic","_campAmmo","_campStatic","_campWall","_campObjInit",
			"_campUserObj","_campAddUnit","_campRandomObj","_Unit_Pool_C","_array"
		];
		
			_CampTyp = _this select 0;_array = [];
			
switch (_CampTyp) do
{
//OPFOR--------------------------------------------------------------------------------------------------------------------
	case 0:
	{
		_campBasic     = ["Flag_FD_Red_F",["FirePlace_burning_F",8,5,0],["Land_BagBunker_Small_F",5,0,0],["Logic",10,15,0],0];
		_campAmmo      = [["Box_EAST_Wps_F",10,2,0],["Box_East_WpsLaunch_F",10,0,0],["Box_East_WpsSpecial_F",10,-2,0],["Box_East_Ammo_F",10,-4,0]];
		_campStatic    = [];
		_campAddUnit   = [];
		_campUserObj   = [["Land_Communication_F",5,-5,45]];
		_campRandomObj = [];
		_campWall      = ["Land_BagFence_Long_F",[-10,30],[40,56,0],[5,5,5,5],[1,0.2],[0,0]];
		_campObjInit   = [[],[],[],[],[],[],[]];
	};
//BLUFOR----------------------------------------------------------------------------------------------------------------
	case 1:
	{
		_campBasic     = ["Flag_FD_Blue_F",["FirePlace_burning_F",8,5,0],["Land_BagBunker_Small_F",5,0,0],["Logic",10,15,0],0];
		_campAmmo      = [["Box_NATO_WpsLaunch_F",10,2,0],["Box_NATO_WpsSpecial_F",10,0,0],["Box_NATO_Ammo_F",10,-2,0],["Box_NATO_Wps_F",10,-4,0]];
		_campStatic    = [];
		_campAddUnit   = [];
		_campUserObj   = [["Land_Communication_F",5,-5,45]];
		_campRandomObj = [];
		_campWall      = ["Land_BagFence_Long_F",[-10,30],[40,56,0],[5,5,5,5],[1,0.2],[0,0]];
		_campObjInit   = [[],[],[],[],[],[],[]];
	};
//RESISTANCE--------------------------------------------------------------------------------------------------------------
	case 2:
	{
		_campBasic     = ["Flag_FD_Green_F",["FirePlace_burning_F",8,5,0],["Land_BagBunker_Small_F",5,0,0],["Logic",10,15,0],0];
		_campAmmo      = [["Box_IND_WpsLaunch_F",10,2,0],["Box_IND_WpsSpecial_F",10,0,0],["Box_IND_Ammo_F",10,-2,0],["Box_IND_Wps_F",10,-4,0]];
		_campStatic    = [];
		_campAddUnit   = [];
		_campUserObj   = [["Land_Communication_F",5,-5,45]];
		_campRandomObj = [];
		_campWall      = ["Land_BagFence_Long_F",[-10,30],[40,56,0],[5,5,5,5],[1,0.2],[0,0]];
		_campObjInit   = [[],[],[],[],[],[],[]];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 11:
	{
		_campBasic     = ["NULL"];
		_campAmmo      = [];
		_campStatic    = [];
		_campAddUnit   = [];
		_campUserObj   = [];
		_campRandomObj = [];
		_campWall      = [];
		_campObjInit   = [[],[],[],[],[],[],[]];
	};
//-------------------------------------------------------------------------------------------------------------------------
	Default {
				if(DAC_Basic_Value != 5) then
				{
					DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
					hintc "Error: DAC_Config_Camps > No valid config number";
				};
				if(true) exitwith {};
			};
};

_array = [_campBasic,_campAmmo,_campStatic,_campAddUnit,_campUserObj,_campRandomObj,_campWall,_campObjInit];
_array