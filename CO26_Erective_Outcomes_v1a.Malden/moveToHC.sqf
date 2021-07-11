/*
 * Purpose: Move a unit/group to the headless client
 *          AFTER the mission launches
 * 
 * Mission: Arma3 Headless Client Tutorial
 *  Author: Monsoon
 *   Email: rweezera@hotmail.com
 *
 */

if(!isServer) exitWith{};      //only execute on the server
if(!isMultiplayer) exitWith{}; //only execute in a MP environment

waitUntil{time > 2};

_unit = _this select 0;        //get the unit or group to transfer
_HC   = _this select 1;        //name of the headless client to transfer to

if(isNull _HC) exitWith{ //if no HC present, skip the transfer
	diag_log format["HC: Headless client NOT present, keeping %1 on the server.",_unit];
};  

_HCid      = owner _HC;        //get the ID of the HC
_unitGroup = group _unit;      //get the group of the passed unit/group

// Use one of the below options (comment the other out)
// depending on which version of Arma3 you are running
// see this thread for details:
// http://forums.bistudio.com/showthread.php?183918-Dedicated-Client-Headless-Client-feedback-(dev-branch)/page16

///////////////////////////////////
// USE WITH ARMA3 VERSION  < 1.4 //
///////////////////////////////////
_nMoved    = 0;
{ 
	if(_x setOwner _HCid) then{
		_nMoved = _nMoved + 1;
	};
}forEach (units _unitGroup);
diag_log format["HC: Successfully transfered %1/%2 units to %3 (id:%4)",
				_nMoved,count (units _unitGroup),_HC,_HCid];

/*
///////////////////////////////////
// USE WITH ARMA3 VERSION >= 1.4 //
///////////////////////////////////
if(_unitGroup setOwnerGroup _HCid) then{
	diag_log format["HC: Successfully transfered group %1 to %3",_unitGroup,_HC];
}else{
	diag_log format["HC: Failed to transfered group %1 to %3",_unitGroup,_HC];
};
*/
