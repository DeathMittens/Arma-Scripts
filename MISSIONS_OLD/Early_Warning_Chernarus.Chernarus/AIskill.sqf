while {true} do 
    {
{ if (side _x == resistance) then 
    { 
    _x setskill ["aimingAccuracy",0.3]; 
    _x setskill ["aimingShake",0.2]; 
    _x setskill ["aimingSpeed",0.5]; 
    }; 
} foreach allunits;
sleep 20;
};