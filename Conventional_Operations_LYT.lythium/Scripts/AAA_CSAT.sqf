
_thisAAATrigger = _this select 0; 
_mrkrs = allMapMarkers select {markerColor _x == "Color6_FD_F"};
_mrkr = _mrkrs select 0;
_DANSCORE = parseNumber (markerText _mrkr) ;  

_Buildings = nearestObjects [_thisAAATrigger, ["HOUSE", "Strategic"], 70] ;  
_allPositionBuildings = _Buildings select {count (_x buildingPos -1) > 0}; 
_allPositions = [];  
_allPositionBuildings apply {_allPositions append (_x buildingPos -1)};  

_G = [ selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units _G) select 0) disableAI "PATH";  
_G = [ selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units _G) select 0) disableAI "PATH"; 
_G = [ selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
_G = [ selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units _G) select 0) disableAI "PATH"; 

PRL = [_thisAAATrigger getpos [(20 + (random 20)), (0 + (random 350))], East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, _thisAAATrigger getpos [(20 + (random 20)), (0 + (random 350))], 50] call BIS_fnc_taskPatrol;


if (_DANSCORE > 5) then {
PRL = [_thisAAATrigger getpos [(0 + (random 20)), (0 + (random 350))], East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, _thisAAATrigger getpos [(0 + (random 20)), (0 + (random 350))], 150] call BIS_fnc_taskPatrol;

_G = [ selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
_G = [ selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units _G) select 0) disableAI "PATH"; 
};

if (_DANSCORE > 10) then {
PRL = [_thisAAATrigger getpos [(0 + (random 20)), (0 + (random 350))], East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, _thisAAATrigger getpos [(0 + (random 20)), (0 + (random 350))], 200] call BIS_fnc_taskPatrol;

_G = [ selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
_G = [ selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units _G) select 0) disableAI "PATH"; 
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
[_thisAAATrigger, 100] execVM "Scripts\INTLitems.sqf";

{
_nvg = hmd _x;
 _x unassignItem _nvg;
 _x removeItem _nvg;
	  _x addPrimaryWeaponItem "acc_flashlight";
	  _x assignItem "acc_flashlight";
	  _x enableGunLights "ForceOn";
  } foreach (allUnits select {side _x == east}); 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
