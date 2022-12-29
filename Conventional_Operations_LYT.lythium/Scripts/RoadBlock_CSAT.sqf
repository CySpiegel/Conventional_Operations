

_thisRoadPostTrigger = _this select 0;

_mrkrs = allMapMarkers select {markerColor _x == "Color6_FD_F"};
_mrkr = _mrkrs select 0;
_DANSCORE = parseNumber (markerText _mrkr) ; 



sleep 5;

_TERR = nearestTerrainObjects [(getpos _thisRoadPostTrigger), ["House", "TREE", "SMALL TREE", "BUSH", "ROCK", "ROCKS"], 15]; 
{[_x, true] remoteExec ['hideObjectGlobal', 0];} forEach _TERR ;

_HeavGun =  nearestObjects [(getpos _thisRoadPostTrigger), ["O_G_Mortar_01_F", "O_G_HMG_02_high_F"], 70] select 0;
_Group = createVehicleCrew _HeavGun; 




G = [_thisRoadPostTrigger getPos [(0 + (random 70)),(0 + (random 360))], East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH";   
G = [_thisRoadPostTrigger getPos [(0 + (random 70)),(0 + (random 360))], East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  

if (_DANSCORE > 5) then {
G = [_thisRoadPostTrigger getPos [(0 + (random 70)),(0 + (random 360))], East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH";   
G = [_thisRoadPostTrigger getPos [(0 + (random 70)),(0 + (random 360))], East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
};

if (_DANSCORE > 10) then {
G = [_thisRoadPostTrigger getPos [(0 + (random 70)),(0 + (random 360))], East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH";   
G = [_thisRoadPostTrigger getPos [(0 + (random 70)),(0 + (random 360))], East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
};

_allBuildings = nearestObjects [(getpos _thisRoadPostTrigger), ["Land_BagBunker_Large_F", "Land_BagBunker_Small_F", "Land_Cargo_House_V3_F", "Land_Cargo_House_V1_F"], 100];  
_allPositions = [];  
_allBuildings apply {_allPositions append (_x buildingPos -1)}; 
 

[ "Intel_01", selectRandom _allPositions, [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 
 
 G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH";   
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
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";
};

if (_DANSCORE > 10) then {
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH";   
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";
};



{

_nvg = hmd _x;
 _x unassignItem _nvg;
 _x removeItem _nvg;
	  _x addPrimaryWeaponItem "acc_flashlight";
	  _x assignItem "acc_flashlight";
	  _x enableGunLights "ForceOn";
  } foreach (allUnits select {side _x == east}); 

sleep 10;

_trg = createTrigger ["EmptyDetector", getPos _thisRoadPostTrigger, false];  
_trg setTriggerArea [1000, 1000, 0, false, 200];  
_trgA setTriggerTimeout [2, 2, 2, true];
_trg setTriggerActivation ["WEST", "PRESENT", false];  
_trg setTriggerStatements [  
"this",  "[thisTrigger, 1000] execVM 'Scripts\ZONEs.sqf';", ""]; 

_trg = createTrigger ["EmptyDetector", getpos _thisRoadPostTrigger, false];  
_trg setTriggerArea [120, 120, 0, false, 200];  
_trg setTriggerInterval 6;  
_trg setTriggerActivation ["WEST SEIZED", "PRESENT", false];  
_trg setTriggerStatements [  
"this && {(alive _x) && ((side _x) == EAST) && (position _x inArea thisTrigger)} count allUnits < 3", "  

{ if (((side _x) == east) && (position _x inArea  thisTrigger))then {
_x disableAI 'PATH';
_x disableAI 'ANIM'; 
removeAllWeapons _x;
removeBackpack _x;
_x setCaptive true;
_x switchMove 'AmovPercMstpSsurWnonDnon';

_x addEventHandler ['Killed', { 
[] execVM 'Scripts\DangerPlusSurr.sqf';
removeAllActions (_this select 0) ;
}];

[
  _x,
'Arrest',
'Screens\FOBA\holdAction_secure_ca.paa',
'Screens\FOBA\holdAction_secure_ca.paa',
'_this distance _target < 3',       
'_caller distance _target < 3',  
{},
{},
{
(_this select 0) enableAI 'ANIM';
(_this select 0) enableAI 'PATH';
(_this select 0) switchMove '';
(_this select 0) setBehaviour 'AWARE';
[(_this select 0)] joinSilent player;
				(_this select 0) setCaptive true ;	
removeAllActions (_this select 0);
},
{},
[],
3,
0,
true,
false
] remoteExec ['BIS_fnc_holdActionAdd', 0, _x]; 

[
  _x,
'Release',
'\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa',
'\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa',
'_this distance _target < 3',       
'_caller distance _target < 3',  
{(_this select 0) setDir (position (_this select 0) getDir position player);},
{},
{
(_this select 0) enableAI 'ANIM';
(_this select 0) enableAI 'PATH';
(_this select 0) switchMove '';
(_this select 0) setBehaviour 'AWARE';
removeAllActions (_this select 0);
_x removeAllEventHandlers 'Killed';
( group (_this select 0)) addWaypoint [ player getPos [ (3000 + (random 1000)),(0 + (random 360))], 0];

[] execVM 'Scripts\DangerMinusSurr.sqf';

[(_this select 0),(_this select 2)] remoteExec ['bis_fnc_holdActionRemove',[0,-2] select isDedicated,true];

},
{},
[],
3,
0,
true,
false
] remoteExec ['BIS_fnc_holdActionAdd', 0, _x]; 

}; } foreach allUnits;


_MMarks = allMapMarkers select { markerType _x == ""o_service""};
_M = [_MMarks,  thisTrigger] call BIS_fnc_nearestPosition;

deleteMarker _M ; 

[30] execVM 'Scripts\Reward.sqf';
[thisTrigger, 1000] execVM 'Scripts\QuickRF.sqf';
[] execVM 'Scripts\DangerPlusSurr.sqf';
				[30, 'ROADBLOCK'] execVM 'Scripts\NOtification.sqf' ;


", ""]; 


{ if !((side _x) == west) then {
            ZEUS removeCuratorEditableObjects [[_x],true];
}; } foreach allUnits;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

[_thisRoadPostTrigger, 100] execVM "Scripts\INTLitems.sqf";

sleep 2 ;

