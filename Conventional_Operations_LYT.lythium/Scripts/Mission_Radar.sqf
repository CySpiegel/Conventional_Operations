
/////////////////////Destroy RADAR////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_thisRadarTrigger = _this select 0;

_Chance = selectRandom [1, 2, 3]; 

_mrkrs = allMapMarkers select {markerColor _x == "Color6_FD_F"};
_mrkr = _mrkrs select 0;
_DANSCORE = parseNumber (markerText _mrkr) ;  

sleep 2;

_RDR = nearestobjects [(getpos _thisRadarTrigger), ["Land_Radar_F"], 400] select 0;
 
_allBuildings = nearestObjects [(getpos _RDR), ["House"], 200];  
_allPositions = [];  
_allBuildings apply {_allPositions append (_x buildingPos -1)};  

G = [selectRandom _allPositions, East,[selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;     
 ((units G) select 0) disableAI "PATH";

if (_DANSCORE> 5) then {
G = [selectRandom _allPositions, East,[selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;     
};
if (_DANSCORE > 10) then {
G = [selectRandom _allPositions, East,[selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";
};


//////Gaurds/////////////////////////////////////////////////////////////////////////////////////////



_allBuildings = nearestObjects [(getpos _thisRadarTrigger), ["Land_BagBunker_Large_F", "Land_BagBunker_Small_F", "Land_Cargo_House_V3_F", "Land_MilOffices_V1_F", "Land_Cargo_Tower_V3_F", "Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V1_F" ], 100];  
_allPositions = [];  
_allBuildings apply {_allPositions append (_x buildingPos -1)}; 
 

[ "Intel_01", selectRandom _allPositions, [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 
 
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH";   
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";

if (_DANSCORE > 5) then {
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH";   
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
};

if (_DANSCORE > 10) then {
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH";   
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
};
//////Gaurds/////////////////////////////////////////////////////////////////////////////////////////
 

_poss = [(getpos _RDR), 30, 50, 5, 1 , 0] call BIS_fnc_findSafePos; 
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH"; 

if (_DANSCORE > 5) then {
_poss = [(getpos _RDR), 30, 50, 5, 1 , 0] call BIS_fnc_findSafePos; 
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH"; 
}; 
if (_DANSCORE > 10) then {
_poss = [(getpos _RDR), 30, 50, 5, 1 , 0] call BIS_fnc_findSafePos; 
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH"; 
}; 

//////GROUPS/////////////////////////////////////////////////////////////////////////////////////////


	_poss = [(getpos _RDR), 30, 50, 5, 1 , 0] call BIS_fnc_findSafePos; 
PRL = [_poss, East, selectRandom East_Groups] call BIS_fnc_spawnGroup;
[PRL, _poss, 50] call BIS_fnc_taskPatrol;

if (_DANSCORE > 5) then {
	_poss = [(getpos _RDR), 30, 50, 5, 1 , 0] call BIS_fnc_findSafePos; 
PRL = [_poss, East, selectRandom East_Groups] call BIS_fnc_spawnGroup;
[PRL, _poss, 100] call BIS_fnc_taskPatrol;
};


//////Trigger/////////////////////////////////////////////////////////////////////////////////////////

_trg = createTrigger ["EmptyDetector", getPos _thisRadarTrigger, false];  
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


[_RDR, 200] execVM "Scripts\INTLitems.sqf";

sleep 2 ;


