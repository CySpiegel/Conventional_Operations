
_AMMBX = _this select 0 ;

_Unts = nearestObjects [_AMMBX,["Man"], 70] select {(side _x == west) && (alive _x == true)} ;

	{
  _x setDamage 0; 
  _x setVariable ["ais_unconscious", false, true];

  _x setVariable ["ais_fireDamage", 0]; 
 
 [_x] remoteExecCall ["AIS_System_fnc_restoreFaks", _x, false]; 
 
  [true] remoteExec ['showHud', _x]; 
   [true] remoteExecCall ["AIS_Effects_fnc_toggleRadio", _x, false]; 
 
  _x stop false; 
 {_x enableAI _x; nil} count ["MOVE","TARGET","AUTOTARGET","ANIM","AUTOCOMBAT"]; 
  
 [_x, false] remoteExecCall ["AIS_System_fnc_unconcsiousRemote", 0];  
 [_x, false] remoteExec ["setCaptive", 0, false]; 
  
 ["GetOutMan"] remoteExec ["removeAllEventHandlers", _x, false];
 
	[_x, _x] remoteExec ['ace_medical_treatment_fnc_fullHeal', _x, false]; 

	} forEach _Unts ; 