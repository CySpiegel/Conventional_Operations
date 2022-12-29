
_thisBaseTrigger = _this select 0;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_mrkrs = allMapMarkers select {markerColor _x == "Color6_FD_F"};
_mrkr = _mrkrs select 0;
_DANSCORE = parseNumber (markerText _mrkr) ;  


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (count ( nearestobjects [getPos _thisBaseTrigger, ["Land_HelipadCircle_F","Land_HelipadCivil_F","Heli_H_rescue","Land_HelipadRescue_F","Land_HelipadSquare_F","HeliHRescue","Heli_H_civil","HeliHCivil","HeliH"], 500]) > 0) then { 
_HPAD = nearestobjects [getPos _thisBaseTrigger, ["Land_HelipadCircle_F","Land_HelipadCivil_F","Heli_H_rescue","Land_HelipadRescue_F","Land_HelipadSquare_F","HeliHRescue","Heli_H_civil","HeliHCivil","HeliH"], 500] select 0;
_V = createVehicle [ selectRandom East_Air_Heli, getpos _HPAD, [], 0, "NONE"]; 
_V setVehicleLock "LOCKED";
_dir =  getDir _HPAD;
_V setDir _dir; 

sleep 3;

_V addEventHandler ["Killed", {  
["ScoreAdded", ["Enemy Aircraft Sabotaged", 20]] remoteExec ["BIS_fnc_showNotification", 0];
[20] execVM "Scripts\Reward.sqf";
 playMusic "EventTrack01_F_Curator"; 
 execVM 'Scripts\HeliDis.sqf';
}];
} ;

if (count ( nearestobjects [getPos _thisBaseTrigger, ["Land_Ss_hangar", "Land_Ss_hangard", "Land_Mil_hangar_EP1", "Land_Airport_01_hangar_F", "Land_TentHangar_V1_F", "Land_Hangar_F"], 500]) > 0) then { 
_HPAD = nearestobjects [getPos _thisBaseTrigger, ["Land_Ss_hangar", "Land_Ss_hangard", "Land_Mil_hangar_EP1", "Land_Airport_01_hangar_F", "Land_TentHangar_V1_F", "Land_Hangar_F"], 500] select 0;

_V = createVehicle [ selectRandom East_Air_Jet, [(0 + (random 50)), (0 + (random 50)), 100], [], 0, "NONE"]; 
_V setVehicleLock "LOCKED";
_dir =  getDir _HPAD;
_V setDir _dir; 
_V setPos (getpos _HPAD) ;
sleep 3;

_PRL = [_HPAD getPos [(10 +(random 20)), (0 + (random 360))], East, [selectRandom East_Units, selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[_PRL, _HPAD getPos [(10 +(random 20)), (0 + (random 360))], 50] call BIS_fnc_taskPatrol;

_V addEventHandler ["Killed", {  
["ScoreAdded", ["Enemy Aircraft Sabotaged", 20]] remoteExec ["BIS_fnc_showNotification", 0];
[20] execVM "Scripts\Reward.sqf";
 playMusic "EventTrack01_F_Curator"; 

}];
} ;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////Assault////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_DANSCORE > 5) then {
			_AssltDestMrks = allMapMarkers select {markerType _x == "b_installation"  && (markerColor _x == "ColorYellow" or  markerColor _x == "colorBLUFOR" or markerColor _x == "colorWEST")};  
			_StrtM = [_AssltDestMrks,  _thisBaseTrigger] call BIS_fnc_nearestPosition;
[_thisBaseTrigger, _StrtM] execVM "Scripts\VehiInsert_CSAT_2.sqf";			

};

if (_DANSCORE > 10) then {
			_AssltDestMrks = allMapMarkers select {markerType _x == "b_installation"  && (markerColor _x == "ColorYellow" or  markerColor _x == "colorBLUFOR" or markerColor _x == "colorWEST")};  
			_StrtM = [_AssltDestMrks,  _thisBaseTrigger] call BIS_fnc_nearestPosition;
[_thisBaseTrigger, _StrtM] execVM "Scripts\VehiInsert_CSAT_2.sqf";	
};


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if ( ARMDIS == 0 ) then {
	
if (count ((getpos _thisBaseTrigger) nearRoads 300) > 0) then {
	
_nearRoad = selectRandom ( (getpos _thisBaseTrigger) nearRoads 300 ) ; 
_V = createVehicle [ selectRandom East_Ground_Vehicles_Light, (_nearRoad getRelPos [0, 0]), [], 2, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V setDir _dir;
_Group = createVehicleCrew _V; 
_VC = createGroup East;
{[_x] join _VC} forEach units _Group;

sleep 3;
_Wposs0 = [_V, 70, 700, 1, 0, 1, 0] call BIS_fnc_findSafePos; 
_nearRoad0 = ( _Wposs0 nearRoads 500 ) select 0; 
I1_WP_0 = _VC addWaypoint [getPos _nearRoad0, 0];
I1_WP_0 SetWaypointType "MOVE";
I1_WP_0 setWaypointBehaviour "SAFE";
I1_WP_0 setWaypointSpeed "LIMITED";

I1_WP_00 = _VC addWaypoint [getPos _nearRoad, 0];
I1_WP_00 SetWaypointType "MOVE";
I1_WP_00 setWaypointBehaviour "SAFE";
I1_WP_00 setWaypointSpeed "LIMITED";

I1_WP_1 = _VC addWaypoint [getPos _nearRoad0, 3];
I1_WP_1 SetWaypointType "CYCLE";
I1_WP_1 setWaypointBehaviour "SAFE";
I1_WP_1 setWaypointSpeed "LIMITED";

_nearRoad = selectRandom ( (getpos _thisBaseTrigger) nearRoads 300 ) ; 
_V = createVehicle [ selectRandom East_Ground_Vehicles_Heavy, (_nearRoad getRelPos [0, 0]), [], 2, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V setDir _dir;
_Group = createVehicleCrew _V; 
_VC = createGroup East;
{[_x] join _VC} forEach units _Group;

sleep 3;
_Wposs0 = [_V, 70, 700, 1, 0, 1, 0] call BIS_fnc_findSafePos; 
_nearRoad0 = ( _Wposs0 nearRoads 500 ) select 0; 
I1_WP_0 = _VC addWaypoint [getPos _nearRoad0, 0];
I1_WP_0 SetWaypointType "MOVE";
I1_WP_0 setWaypointBehaviour "SAFE";
I1_WP_0 setWaypointSpeed "LIMITED";

I1_WP_00 = _VC addWaypoint [getPos _nearRoad, 0];
I1_WP_00 SetWaypointType "MOVE";
I1_WP_00 setWaypointBehaviour "SAFE";
I1_WP_00 setWaypointSpeed "LIMITED";

I1_WP_1 = _VC addWaypoint [getPos _nearRoad0, 3];
I1_WP_1 SetWaypointType "CYCLE";
I1_WP_1 setWaypointBehaviour "SAFE";
I1_WP_1 setWaypointSpeed "LIMITED";


_nearRoad = selectRandom ( (getpos _thisBaseTrigger) nearRoads 300 ) ; 
_V = createVehicle [ selectRandom East_Ground_Vehicles_Heavy, (_nearRoad getRelPos [0, 0]), [], 2, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V setDir _dir;
_Group = createVehicleCrew _V; 
_VC = createGroup East;
{[_x] join _VC} forEach units _Group;

sleep 3;
_Wposs0 = [_V, 70, 700, 1, 0, 1, 0] call BIS_fnc_findSafePos; 
_nearRoad0 = ( _Wposs0 nearRoads 500 ) select 0; 
I1_WP_0 = _VC addWaypoint [getPos _nearRoad0, 0];
I1_WP_0 SetWaypointType "MOVE";
I1_WP_0 setWaypointBehaviour "SAFE";
I1_WP_0 setWaypointSpeed "LIMITED";

I1_WP_00 = _VC addWaypoint [getPos _nearRoad, 0];
I1_WP_00 SetWaypointType "MOVE";
I1_WP_00 setWaypointBehaviour "SAFE";
I1_WP_00 setWaypointSpeed "LIMITED";

I1_WP_1 = _VC addWaypoint [getPos _nearRoad0, 3];
I1_WP_1 SetWaypointType "CYCLE";
I1_WP_1 setWaypointBehaviour "SAFE";
I1_WP_1 setWaypointSpeed "LIMITED";

	
if (_DANSCORE > 5) then {
_nearRoad = selectRandom ( (getpos _thisBaseTrigger) nearRoads 300 ) ; 
_V = createVehicle [ selectRandom East_Ground_Vehicles_Light, (_nearRoad getRelPos [0, 0]), [], 2, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V setDir _dir;
_Group = createVehicleCrew _V; 
_VC = createGroup East;
{[_x] join _VC} forEach units _Group;

sleep 3;
_Wposs0 = [_V, 70, 700, 1, 0, 1, 0] call BIS_fnc_findSafePos; 
_nearRoad0 = ( _Wposs0 nearRoads 500 ) select 0; 
I1_WP_0 = _VC addWaypoint [getPos _nearRoad0, 0];
I1_WP_0 SetWaypointType "MOVE";
I1_WP_0 setWaypointBehaviour "SAFE";
I1_WP_0 setWaypointSpeed "LIMITED";

I1_WP_00 = _VC addWaypoint [getPos _nearRoad, 0];
I1_WP_00 SetWaypointType "MOVE";
I1_WP_00 setWaypointBehaviour "SAFE";
I1_WP_00 setWaypointSpeed "LIMITED";

I1_WP_1 = _VC addWaypoint [getPos _nearRoad0, 3];
I1_WP_1 SetWaypointType "CYCLE";
I1_WP_1 setWaypointBehaviour "SAFE";
I1_WP_1 setWaypointSpeed "LIMITED";

_nearRoad = selectRandom ( (getpos _thisBaseTrigger) nearRoads 300 ) ; 
_V = createVehicle [ selectRandom East_Ground_Vehicles_Heavy, (_nearRoad getRelPos [0, 0]), [], 2, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V setDir _dir;
_Group = createVehicleCrew _V; 
_VC = createGroup East;
{[_x] join _VC} forEach units _Group;

sleep 3;
_Wposs0 = [_V, 70, 700, 1, 0, 1, 0] call BIS_fnc_findSafePos; 
_nearRoad0 = ( _Wposs0 nearRoads 500 ) select 0; 
I1_WP_0 = _VC addWaypoint [getPos _nearRoad0, 0];
I1_WP_0 SetWaypointType "MOVE";
I1_WP_0 setWaypointBehaviour "SAFE";
I1_WP_0 setWaypointSpeed "LIMITED";

I1_WP_00 = _VC addWaypoint [getPos _nearRoad, 0];
I1_WP_00 SetWaypointType "MOVE";
I1_WP_00 setWaypointBehaviour "SAFE";
I1_WP_00 setWaypointSpeed "LIMITED";

I1_WP_1 = _VC addWaypoint [getPos _nearRoad0, 3];
I1_WP_1 SetWaypointType "CYCLE";
I1_WP_1 setWaypointBehaviour "SAFE";
I1_WP_1 setWaypointSpeed "LIMITED";


_nearRoad = selectRandom ( (getpos _thisBaseTrigger) nearRoads 300 ) ; 
_V = createVehicle [ selectRandom East_Ground_Vehicles_Heavy, (_nearRoad getRelPos [0, 0]), [], 2, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V setDir _dir;
_Group = createVehicleCrew _V; 
_VC = createGroup East;
{[_x] join _VC} forEach units _Group;

sleep 3;
_Wposs0 = [_V, 70, 700, 1, 0, 1, 0] call BIS_fnc_findSafePos; 
_nearRoad0 = ( _Wposs0 nearRoads 500 ) select 0; 
I1_WP_0 = _VC addWaypoint [getPos _nearRoad0, 0];
I1_WP_0 SetWaypointType "MOVE";
I1_WP_0 setWaypointBehaviour "SAFE";
I1_WP_0 setWaypointSpeed "LIMITED";

I1_WP_00 = _VC addWaypoint [getPos _nearRoad, 0];
I1_WP_00 SetWaypointType "MOVE";
I1_WP_00 setWaypointBehaviour "SAFE";
I1_WP_00 setWaypointSpeed "LIMITED";

I1_WP_1 = _VC addWaypoint [getPos _nearRoad0, 3];
I1_WP_1 SetWaypointType "CYCLE";
I1_WP_1 setWaypointBehaviour "SAFE";
I1_WP_1 setWaypointSpeed "LIMITED";


};


if (_DANSCORE > 10) then {
_nearRoad = selectRandom ( (getpos _thisBaseTrigger) nearRoads 300 ) ; 
_V = createVehicle [ selectRandom East_Ground_Vehicles_Light, (_nearRoad getRelPos [0, 0]), [], 2, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V setDir _dir;
_Group = createVehicleCrew _V; 
_VC = createGroup East;
{[_x] join _VC} forEach units _Group;

sleep 3;
_Wposs0 = [_V, 70, 700, 1, 0, 1, 0] call BIS_fnc_findSafePos; 
_nearRoad0 = ( _Wposs0 nearRoads 500 ) select 0; 
I1_WP_0 = _VC addWaypoint [getPos _nearRoad0, 0];
I1_WP_0 SetWaypointType "MOVE";
I1_WP_0 setWaypointBehaviour "SAFE";
I1_WP_0 setWaypointSpeed "LIMITED";

I1_WP_00 = _VC addWaypoint [getPos _nearRoad, 0];
I1_WP_00 SetWaypointType "MOVE";
I1_WP_00 setWaypointBehaviour "SAFE";
I1_WP_00 setWaypointSpeed "LIMITED";

I1_WP_1 = _VC addWaypoint [getPos _nearRoad0, 3];
I1_WP_1 SetWaypointType "CYCLE";
I1_WP_1 setWaypointBehaviour "SAFE";
I1_WP_1 setWaypointSpeed "LIMITED";

_nearRoad = selectRandom ( (getpos _thisBaseTrigger) nearRoads 300 ) ; 
_V = createVehicle [ selectRandom East_Ground_Vehicles_Heavy, (_nearRoad getRelPos [0, 0]), [], 2, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V setDir _dir;
_Group = createVehicleCrew _V; 
_VC = createGroup East;
{[_x] join _VC} forEach units _Group;

sleep 3;
_Wposs0 = [_V, 70, 700, 1, 0, 1, 0] call BIS_fnc_findSafePos; 
_nearRoad0 = ( _Wposs0 nearRoads 500 ) select 0; 
I1_WP_0 = _VC addWaypoint [getPos _nearRoad0, 0];
I1_WP_0 SetWaypointType "MOVE";
I1_WP_0 setWaypointBehaviour "SAFE";
I1_WP_0 setWaypointSpeed "LIMITED";

I1_WP_00 = _VC addWaypoint [getPos _nearRoad, 0];
I1_WP_00 SetWaypointType "MOVE";
I1_WP_00 setWaypointBehaviour "SAFE";
I1_WP_00 setWaypointSpeed "LIMITED";

I1_WP_1 = _VC addWaypoint [getPos _nearRoad0, 3];
I1_WP_1 SetWaypointType "CYCLE";
I1_WP_1 setWaypointBehaviour "SAFE";
I1_WP_1 setWaypointSpeed "LIMITED";


_nearRoad = selectRandom ( (getpos _thisBaseTrigger) nearRoads 300 ) ; 
_V = createVehicle [ selectRandom East_Ground_Vehicles_Heavy, (_nearRoad getRelPos [0, 0]), [], 2, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V setDir _dir;
_Group = createVehicleCrew _V; 
_VC = createGroup East;
{[_x] join _VC} forEach units _Group;

sleep 3;
_Wposs0 = [_V, 70, 700, 1, 0, 1, 0] call BIS_fnc_findSafePos; 
_nearRoad0 = ( _Wposs0 nearRoads 500 ) select 0; 
I1_WP_0 = _VC addWaypoint [getPos _nearRoad0, 0];
I1_WP_0 SetWaypointType "MOVE";
I1_WP_0 setWaypointBehaviour "SAFE";
I1_WP_0 setWaypointSpeed "LIMITED";

I1_WP_00 = _VC addWaypoint [getPos _nearRoad, 0];
I1_WP_00 SetWaypointType "MOVE";
I1_WP_00 setWaypointBehaviour "SAFE";
I1_WP_00 setWaypointSpeed "LIMITED";

I1_WP_1 = _VC addWaypoint [getPos _nearRoad0, 3];
I1_WP_1 SetWaypointType "CYCLE";
I1_WP_1 setWaypointBehaviour "SAFE";
I1_WP_1 setWaypointSpeed "LIMITED";

};


_nearRoad = selectRandom ( (getpos _thisBaseTrigger) nearRoads 300 ) ; 
_V = createVehicle [ selectRandom East_Ground_Vehicles_Ambient, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V setDir _dir;

_nearRoad = selectRandom ( (getpos _thisBaseTrigger) nearRoads 300 ) ; 
_V = createVehicle [ selectRandom East_Ground_Vehicles_Ambient, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V setDir _dir;

_nearRoad = selectRandom ( (getpos _thisBaseTrigger) nearRoads 300 ) ; 
_V = createVehicle [ selectRandom East_Ground_Vehicles_Ambient, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V setDir _dir;

_nearRoad = selectRandom ( (getpos _thisBaseTrigger) nearRoads 300 ) ; 
_V = createVehicle [ selectRandom East_Ground_Vehicles_Ambient, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V setDir _dir;

}; };


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units G) select 0) disableAI "PATH";
_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 

_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units G) select 0) disableAI "PATH";
_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 

_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 

_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 

_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units G) select 0) disableAI "PATH";
_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 


if (_DANSCORE > 5) then {
_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units G) select 0) disableAI "PATH";
_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 

_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units G) select 0) disableAI "PATH";
_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 

_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 

_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 

_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units G) select 0) disableAI "PATH";
_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
};


if (_DANSCORE > 10) then {
_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units G) select 0) disableAI "PATH";
_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 

_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units G) select 0) disableAI "PATH";
_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 

_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 

_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 

_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units G) select 0) disableAI "PATH";
_poss = [(getpos _thisBaseTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
};

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_CRT = [
"Box_IND_WpsSpecial_F",
"Box_East_WpsSpecial_F",
"Box_IND_Support_F",
"Box_East_Support_F",
"Box_CSAT_Equip_F",
"Box_AAF_Equip_F",
"Box_East_WpsLaunch_F",
"Box_IND_WpsLaunch_F",
"Box_East_AmmoOrd_F",
"Box_East_Ammo_F",
"Box_IND_Ammo_F",
"Box_IND_AmmoOrd_F",
"Box_East_Wps_F",
"Box_IND_Wps_F"
];

_poss = [(getpos _thisBaseTrigger), 10, 20, 4, 0.1 , 0] call BIS_fnc_findSafePos;
_VLAMP = createVehicle [ "Land_LampAirport_F", _poss, [], 5, "NONE"];

_V = createVehicle [(selectRandom _CRT), _VLAMP getPos [(0 + (random 50)),(0 + (random 350))], [], 0, "NONE"]; 
_V = createVehicle [(selectRandom _CRT), _VLAMP getPos [(0 + (random 50)),(0 + (random 350))], [], 0, "NONE"]; 
_V = createVehicle [(selectRandom _CRT), _VLAMP getPos [(0 + (random 50)),(0 + (random 350))], [], 0, "NONE"]; 
_V = createVehicle [(selectRandom _CRT), _VLAMP getPos [(0 + (random 50)),(0 + (random 350))], [], 0, "NONE"]; 
_V = createVehicle [(selectRandom _CRT), _VLAMP getPos [(0 + (random 50)),(0 + (random 350))], [], 0, "NONE"]; 
_V = createVehicle [(selectRandom _CRT), _VLAMP getPos [(0 + (random 50)),(0 + (random 350))], [], 0, "NONE"]; 

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


_allBuildings = nearestObjects [(getpos _thisBaseTrigger), ["Land_MilOffices_V1_F", "Land_Cargo_Tower_V3_F", "Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V1_F", "Land_Cargo_HQ_V3_F", "Land_Cargo_HQ_V2_F", "Land_Cargo_HQ_V1_F"], 300];  

_HQ = selectRandom _allBuildings;
_dir = getDirVisual _HQ;
[ "Intel_01", (selectRandom (_HQ buildingPos -1)), [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 

_HQ = selectRandom _allBuildings;
_dir = getDirVisual _HQ;
[ "Intel_01", (selectRandom (_HQ buildingPos -1)), [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 

_HQ = selectRandom _allBuildings;
_dir = getDirVisual _HQ;
[ "Intel_01", (selectRandom (_HQ buildingPos -1)), [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 

_HQ = selectRandom _allBuildings;
_dir = getDirVisual _HQ;
[ "Intel_01", (selectRandom (_HQ buildingPos -1)), [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 

_HQ = selectRandom _allBuildings;
_dir = getDirVisual _HQ;
[ "Intel_01", (selectRandom (_HQ buildingPos -1)), [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 

_HQ = selectRandom _allBuildings;
_dir = getDirVisual _HQ;
[ "Intel_01", (selectRandom (_HQ buildingPos -1)), [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 

if (_DANSCORE > 5) then {
	_HQ = selectRandom _allBuildings;
_dir = getDirVisual _HQ;
[ "Intel_01", (selectRandom (_HQ buildingPos -1)), [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 

	_HQ = selectRandom _allBuildings;
_dir = getDirVisual _HQ;
[ "Intel_01", (selectRandom (_HQ buildingPos -1)), [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 
};

if (_DANSCORE > 10) then {
_HQ = selectRandom _allBuildings;
_dir = getDirVisual _HQ;
[ "Intel_01", (selectRandom (_HQ buildingPos -1)), [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 
	
_HQ = selectRandom _allBuildings;
_dir = getDirVisual _HQ;
[ "Intel_01", (selectRandom (_HQ buildingPos -1)), [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 
};


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_allPositions = [];  
_allBuildings apply {_allPositions append (_x buildingPos -1)};  


G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
  
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     

if (_DANSCORE > 5) then {
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
 
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;    
};

if (_DANSCORE > 10) then {
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
 
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;    
};

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_HeavGuns =  nearestObjects [(getpos _thisBaseTrigger), ["O_G_HMG_02_high_F", "O_G_Mortar_01_F"], 300];

{
_Group = createVehicleCrew _x; 
_VC = createGroup East;
{[_y] join _VC} forEach units _Group;
{_x setUnitLoadout selectRandom East_Units;} forEach units _VC;
} forEach _HeavGuns;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (count nearestObjects [(getpos _thisBaseTrigger), ["Land_BagBunker_Large_F", "Land_BagBunker_Small_F", "Land_Cargo_House_V3_F", "Land_Cargo_House_V1_F", "Land_Cargo_Patrol_V3_F", "Land_Cargo_Patrol_V2_F", "Land_Cargo_Patrol_V1_F"], 300] > 0) then {

_allBuildings = nearestObjects [(getpos _thisBaseTrigger), ["Land_BagBunker_Large_F", "Land_BagBunker_Small_F", "Land_Cargo_House_V3_F", "Land_Cargo_House_V1_F", "Land_Cargo_Patrol_V3_F", "Land_Cargo_Patrol_V2_F", "Land_Cargo_Patrol_V1_F"], 300];  
_allPositions = [];  
_allBuildings apply {_allPositions append (_x buildingPos -1)}; 

G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     

G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";

if (_DANSCORE > 5) then {
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
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
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     

G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";
};
};

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
{

_nvg = hmd _x;
 _x unassignItem _nvg;
 _x removeItem _nvg;
	  _x addPrimaryWeaponItem "acc_flashlight";
	  _x assignItem "acc_flashlight";
	  _x enableGunLights "ForceOn";
  } foreach (allUnits select {side _x == east}); 
  
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 sleep 10 ;
 
 _trg = createTrigger ["EmptyDetector", getPos _thisBaseTrigger, false];  
_trg setTriggerArea [1000, 1000, 0, false, 200];  
_trgA setTriggerTimeout [2, 2, 2, true];
_trg setTriggerActivation ["WEST", "PRESENT", false];  
_trg setTriggerStatements [  
"this",  "[thisTrigger, 2000] execVM 'Scripts\ZONEs.sqf';", ""]; 
 
 
   
_trg = createTrigger ["EmptyDetector", getPos _thisBaseTrigger, false];  
_trg setTriggerArea [300, 300, 0, false, 200];  
_trg setTriggerTimeout [1, 1, 1, true];
_trg setTriggerActivation ["WEST SEIZED", "PRESENT", false];  
_trg setTriggerStatements [  
"this",  "  

[parseText '<t color=""#1AA3FF"" font=""PuristaBold"" align = ""right"" shadow = ""1"" size=""3"">SITREP</t><br /><t color=""#959393"" align = ""right"" shadow = ""1"" size=""1.5"">Friendly Forces Dominating the Battle,</t><br /><t color=""#959393"" align = ""right"" shadow = ""1"" size=""1.5"">Keep Up the Fight, We will Capture and Secure the Outpost,</t>', [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ['BIS_fnc_textTiles', 0];
_allMarks = allMapMarkers select {markerColor _x == 'colorOPFOR' && markerType _x == 'n_support'};  
_FOBMrk = [_allMarks,  thisTrigger] call BIS_fnc_nearestPosition;
openMap true;
 [markerSize _FOBMrk, markerPos _FOBMrk, 0.5] call BIS_fnc_zoomOnArea;
				 
					TRG = createTrigger ['EmptyDetector', getPos thisTrigger, false];  
					TRG setTriggerArea [300, 300, 0, false, 200];  
					TRG setTriggerActivation ['WEST SEIZED', 'PRESENT', true];  
					TRG setTriggerStatements [  
					""this"",  """", """"]; 

				[thisTrigger] execVM 'Scripts\Outpost_CSAT_CAPTURE_West.sqf';

", ""]; 
 
 
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
{ if !((side _x) == west) then {
            ZEUS removeCuratorEditableObjects [[_x],true];
}; } foreach allUnits;
 
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

[_thisBaseTrigger, 300] execVM "Scripts\INTLitems.sqf";


sleep 2 ;
