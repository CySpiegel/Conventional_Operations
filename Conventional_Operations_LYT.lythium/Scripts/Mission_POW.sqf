/////////////////////Rescue POW////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_thisPOWTrigger = _this select 0; 

_Chance = selectRandom [1, 2, 3]; 
 
 _mrkrs = allMapMarkers select {markerColor _x == "Color6_FD_F"};
_mrkr = _mrkrs select 0;
_DANSCORE = parseNumber (markerText _mrkr) ;  
//////OBJECTIVE/////////////////////////////////////////////////////////////////////////////////////////

sleep 2 ;
_Position = nearestObjects [(getpos _thisPOWTrigger), ["Land_i_Barracks_V1_F", "Land_u_Barracks_V2_F", "Land_i_Barracks_V2_F", "Land_Barracks_01_grey_F", "Land_Barracks_01_dilapidated_F"], 100] select 0;  


//////Garrisons/////////////////////////////////////////////////////////////////////////////////////////


_Pos = selectRandom (_Position buildingPos -1);
 G = [_Pos, East,[selectRandom East_Units_Officers]] call BIS_fnc_spawnGroup;     
_OFC = ((units G) select 0) ;
_OFC disableAI "PATH";
[ 
 _OFC,            
 "Search Officer",           
 "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",  
 "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",  
 "(_this distance _target)<2",       
 "(_this distance _target)<2",       
 { 
 playSound3D [ "a3\missions_f_oldman\data\sound\intel_body\1sec\intel_body_1sec_02.wss", (_this select 0)];  
  
 },             
 {},              
 {  
 
execVM "Scripts\INTL.sqf"; 
 
 },    
 {},              
 [],             
 3,            
 0,             
 true,             
 false             
] remoteExec ["BIS_fnc_holdActionAdd", 0, _OFC]; 
 
_Pos = selectRandom (_Position buildingPos -1);
 G = [_Pos, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
 ((units G) select 0) disableAI "PATH";
 
 _Pos = selectRandom (_Position buildingPos -1);
 G = [_Pos, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     




if (_DANSCORE > 5) then {
_Pos = selectRandom (_Position buildingPos -1);
G = [_Pos, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;   
 ((units G) select 0) disableAI "PATH";
 
  _Pos = selectRandom (_Position buildingPos -1);
 G = [_Pos, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     

};

if (_DANSCORE > 10) then {
_Pos = selectRandom (_Position buildingPos -1);
G = [_Pos, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";

 _Pos = selectRandom (_Position buildingPos -1);
 G = [_Pos, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     

};

//////Gaurds/////////////////////////////////////////////////////////////////////////////////////////
 

_poss = [getpos _Position, 10, 30, 5, 1 , 0] call BIS_fnc_findSafePos; 
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH"; 

if (_DANSCORE > 5) then {
_poss = [getpos _Position, 10, 30, 5, 1 , 0] call BIS_fnc_findSafePos; 
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH"; 
}; 
if (_DANSCORE > 10) then {
_poss = [getpos _Position, 10, 30, 5, 1 , 0] call BIS_fnc_findSafePos; 
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH"; 
}; 
 
//////GROUPS/////////////////////////////////////////////////////////////////////////////////////////


PRL = [(getPos _Position) getPos [30, 50], East, selectRandom East_Groups] call BIS_fnc_spawnGroup;
[PRL, getpos _Position, 50] call BIS_fnc_taskPatrol;

PRL = [(getPos _Position) getPos [30, 50], East, selectRandom East_Groups] call BIS_fnc_spawnGroup;
[PRL, getpos _Position, 100] call BIS_fnc_taskPatrol;


if (_DANSCORE > 5) then {
PRL = [(getPos _Position) getPos [30, 180], East, selectRandom East_Groups] call BIS_fnc_spawnGroup;
[PRL, getpos _Position, 200] call BIS_fnc_taskPatrol;
};

if (_DANSCORE > 10) then {
PRL = [(getPos _Position) getPos [30, 270], East, selectRandom East_Groups] call BIS_fnc_spawnGroup;
[PRL, getpos _Position, 200] call BIS_fnc_taskPatrol;
};
//////Vehicles/////////////////////////////////////////////////////////////////////////////////////////


if (count [(getpos _Position) nearRoads 70] > 0) then {
	
_nearRoad = selectRandom ( (getpos _Position) nearRoads 70 ) ; 
_V = createVehicle [ selectRandom East_Ground_Vehicles_Ambient, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V setDir _dir;
	};

if ((_DANSCORE > 5) && (count [(getpos _Position) nearRoads 70] > 0)) then {
	
_nearRoad = selectRandom ((getpos _Position) nearRoads 70 ) ; 
_V = createVehicle [ selectRandom East_Ground_Vehicles_Ambient, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V setDir _dir;
	};



_trg = createTrigger ["EmptyDetector", getPos _thisPOWTrigger, false];  
_trg setTriggerArea [1000, 1000, 0, false, 200];  
_trgA setTriggerTimeout [2, 2, 2, true];
_trg setTriggerActivation ["WEST", "PRESENT", false];  
_trg setTriggerStatements [  
"this",  "[thisTrigger, 1000] execVM 'Scripts\ZONEs.sqf';", ""]; 


  {
      _nvg = hmd _x;
      _x unassignItem _nvg;
      _x removeItem _nvg;
	  _x addPrimaryWeaponItem "acc_flashlight";
	  _x assignItem "acc_flashlight";
	  _x enableGunLights "ForceOn";
  } foreach (allUnits select {side _x == east}); 


{ if !((side _x) == west) then {
            ZEUS removeCuratorEditableObjects [[_x],true];
}; } foreach allUnits;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



[_Position, 200] execVM "Scripts\INTLitems.sqf";

sleep 2 ;


