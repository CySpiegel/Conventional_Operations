
/*
	Author: Genesis

	Description:
		Generates flanking waypoints.

	Parameter(s):
		0: OBJECT - Group leader who will generate waypoints
		1: OPTIONAL: STRING - Movetype, avilable options: "Assault", "High", "Low", "Retreat", "Flank", "FlankL"

	Returns:
		NOTHING
*/

params ["_leader", "_moveType"];

private _grp = group _leader;
if (_grp getVariable ["VCM_NOFLANK",false]) exitWith {};

if (side ((units _grp) select 0) == west) exitWith {};

//Lets define types of attack we can do.
private _wayPointType = selectRandom ["Assault","High","Low","Retreat","Flank","FlankL"];

private _nearestEnemy = _leader findNearestEnemy _leader;
if (isNull _nearestEnemy) then
{
	_nearestEnemy = _leader call VCM_fnc_ClstEmy;	
};

if (isNil "_nearestEnemy" || _nearestEnemy isEqualTo [0,0,0]) exitWith {};
if ((vehicle _nearestEnemy) isKindOf "Air") exitWith {};

if ((count (waypoints _grp)) >= 3) exitWith {};

private _wType = waypointType [_grp, (currentWaypoint _grp)];
if !(_wType isEqualTo "MOVE" || _wType isEqualTo "") exitWith {};

while {(count (waypoints _grp)) > 1} do
{
 deleteWaypoint ((waypoints _grp) select 0);
 sleep 0.25;
};

switch (_wayPointType) do {
    case "Assault": 
		{
			private _waypoint0 = _grp addwaypoint [(getpos _nearestEnemy),0];
			_waypoint0 setwaypointtype "MOVE";
			_waypoint0 setWaypointSpeed "FULL";
			_grp setCurrentWaypoint [_grp,(_waypoint0 select 1)];			
			private _waypoint0 = _grp addwaypoint [(getpos _nearestEnemy),0];
			_waypoint0 setwaypointtype "MOVE";			
			_waypoint0 setWaypointSpeed "FULL";
		};
    case "High": 
		{
			private _highP = ([_leader,500,50,false] call VCM_fnc_Heights) select 0 select 1;
			private _finalP = [[[_highP, 50]],["water"]] call BIS_fnc_randomPos;
			_finalP set [2,0];
			private _waypoint0 = _grp addwaypoint [_finalP,0];
			_waypoint0 setwaypointtype "MOVE";
			_waypoint0 setWaypointSpeed "FULL";
			_grp setCurrentWaypoint [_grp,(_waypoint0 select 1)];			
			private _waypoint0 = _grp addwaypoint [_finalP,0];
			_waypoint0 setwaypointtype "MOVE";	
			_waypoint0 setWaypointSpeed "FULL";
		}; 
    case "Low": 
		{
			private _highP = ([_leader,500,50,true] call VCM_fnc_Heights) select 0 select 1;
			private _finalP = [[[_highP, 50]],["water"]] call BIS_fnc_randomPos;
			_finalP set [2,0];
			private _waypoint0 = _grp addwaypoint [_finalP,0];
			_waypoint0 setwaypointtype "MOVE";
			_waypoint0 setWaypointSpeed "FULL";
			_grp setCurrentWaypoint [_grp,(_waypoint0 select 1)];			
			private _waypoint0 = _grp addwaypoint [_finalP,0];
			_waypoint0 setwaypointtype "MOVE";	
			_waypoint0 setWaypointSpeed "FULL";			
		}; 
    case "Retreat": 
		{
			private _MovePosition = [_nearestEnemy,(_nearestEnemy distance2D _leader),([_nearestEnemy, _leader] call BIS_fnc_dirTo)] call BIS_fnc_relPos;
			private _finalP = [[[_MovePosition, 50]],["water"]] call BIS_fnc_randomPos;
			_finalP set [2,0];
			private _waypoint0 = _grp addwaypoint [_finalP,0];
			_waypoint0 setwaypointtype "MOVE";
			_waypoint0 setWaypointSpeed "FULL";
			_grp setCurrentWaypoint [_grp,(_waypoint0 select 1)];			
			private _waypoint0 = _grp addwaypoint [_finalP,0];
			_waypoint0 setwaypointtype "MOVE";	
			_waypoint0 setWaypointSpeed "FULL";
		}; 
    case "Flank": 
		{
			private _myEnemyPos = getpos _nearestEnemy;
			private _dist = ((random 100) + 100);
			private _dir = random 360;
			private _positions = [(_myEnemyPos select 0) + (sin _dir) * _dist, (_myEnemyPos select 1) + (cos _dir) * _dist, 0];
			private _myPlaces = selectBestPlaces [_myEnemyPos, 250,"((6*hills + 2*forest + 4*houses + 2*meadow) - sea + (2*trees)) - (1000*deadbody)", 100, 5];
			if (_myPlaces isEqualTo []) then {_myPlaces = [_positions];};
			private _RandomArray = _myPlaces call BIS_fnc_selectrandom;
			private _RandomLocation = _RandomArray select 0;
			_RandomLocation set [2,0];
			private _finalP = [[[_RandomLocation, 50]],["water"]] call BIS_fnc_randomPos;
			_finalP set [2,0];
			_waypoint0 = _grp addwaypoint [_finalP,0];	
			_waypoint0 setWaypointSpeed "FULL";
			_grp setCurrentWaypoint [_grp,(_waypoint0 select 1)];
			_waypoint0 = _grp addwaypoint [_myEnemyPos,0];	
			_waypoint0 setWaypointSpeed "FULL";			
		}; 
    case "FlankL": 
		{
			private _myEnemyPos = getpos _nearestEnemy;
			private _dist = ((random 100) + 100);
			private _dir = random 360;
			private _leaderPos = getpos _leader;
			private _positions = [(_myEnemyPos select 0) + (sin _dir) * _dist, (_myEnemyPos select 1) + (cos _dir) * _dist, 0];
			private _positionsL = [(_leaderPos select 0) + (sin _dir) * _dist, (_leaderPos select 1) + (cos _dir) * _dist, 0];
			private _myPlaces = selectBestPlaces [_myEnemyPos, 250,"((6*hills + 2*forest + 4*houses + 2*meadow) - sea + (2*trees)) - (1000*deadbody)", 100, 5];
			private _myPlacesL = selectBestPlaces [_leaderPos, 250,"((6*hills + 2*forest + 4*houses + 2*meadow) - sea + (2*trees)) - (1000*deadbody)", 100, 5];
			if (_myPlaces isEqualTo []) then {_myPlaces = [_positions];};
			if (_myPlacesL isEqualTo []) then {_myPlaces = [_positionsL];};
			private _RandomArray = _myPlaces call BIS_fnc_selectrandom;
			private _RandomArray2 = _myPlacesL call BIS_fnc_selectrandom;
			private _RandomLocation = _RandomArray select 0;
			private _RandomLocationL = _RandomArray2 select 0;
			_RandomLocation set [2,0];
			_RandomLocationL set [2,0];
			private _finalP = [[[_RandomLocationL, 50]],["water"]] call BIS_fnc_randomPos;
			private _finalP2 = [[[_RandomLocation, 50]],["water"]] call BIS_fnc_randomPos;
			_finalP set [2,0];
			_finalP2 set [2,0];
			_waypoint0 = _grp addwaypoint [_finalP,0];	
			_waypoint0 setWaypointSpeed "FULL";			
			_waypoint0 = _grp addwaypoint [_finalP2,0];	
			_waypoint0 setWaypointSpeed "FULL";
			_grp setCurrentWaypoint [_grp,(_waypoint0 select 1)];
			_waypoint0 = _grp addwaypoint [_myEnemyPos,0];	
			_waypoint0 setWaypointSpeed "FULL";			
		}; 
};