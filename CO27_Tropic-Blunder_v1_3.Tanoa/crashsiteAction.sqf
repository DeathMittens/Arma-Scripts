//Heli Intel objective trigger
// this addAction ["<t color='#FF0000'>Photograph Evidence</t>", "crashsiteAction.sqf"];

//hint "crash Site Action";

_unit = player;
_unitsArray = ["s1","s2","s3","s4","s5"];

if (str(_unit) in _unitsArray) then {
	hint "Recon team can not secure the intel.";

} else {
	hint "Intel Secured.";
	crashObj=true;
	publicVariable "crashObj";
	//publicVariableServer "crashObj";

};


//this addEventHandler["HandleDamage", {}]; this addAction ["Secure Objective","SecureObjective.sqf",[],1,false,true,"","_this distance _target < 2"];


//this allowdamage false; this addAction ["<t color='#FF0000'>Secure Intel</t>","crashsiteAction.sqf",[],1,false,true,"","_this distance _target < 10"];




