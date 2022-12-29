
if ( COMMSDIS == 0 ) then {

_CNTR = _this select 0;
_RADS = _this select 1;



_Chance = selectRandom [1, 2, 3, 4]; 


_GRPs = (allGroups select {side _x == east && getPos ((units _x) select 0) distance _CNTR < _RADS});
_GRPCNT = count _GRPs;
_GRPCNTNEW = round ( _GRPCNT / 2 );
_GRPsALLNEW = _GRPs call BIS_fnc_arrayShuffle;
_GRPsSEL = _GRPsALLNEW select [0, _GRPCNTNEW];
_AllWs = {waypoints _x } foreach _GRPsSEL; 
 
 {{ _x enableAI "PATH"} foreach Units _x;} foreach _GRPsSEL;

{
for "_i" from count waypoints _x - 1 to 0 step -1 do
{deleteWaypoint [_x, _i];};
} foreach _GRPsSEL;

sleep 2 ;

{_x addWaypoint [position _CNTR, 0]; } foreach _GRPsSEL;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



 	   _allZoneMarks = allMapMarkers select {markerType _x == "n_installation" || markerType _x == "o_installation" || markerType _x == "o_plane" || markerType _x == "o_antiair" || markerType _x == "o_unknown" || markerType _x == "o_service" || markerType _x == "o_armor" || markerType _x == "loc_mine" || markerType _x == "loc_Power" || markerType _x == "o_recon" || markerType _x == "o_support" || markerType _x == "o_maint" || markerType _x == "n_support" || markerType _x == "loc_Ruin" } ;  
       _M = [_allZoneMarks,  _CNTR] call BIS_fnc_nearestPosition ;

_azimuth = (getPos _CNTR) getDir (getMarkerPos _M);


PRL = [(getPos _CNTR) getPos [(300 + (random 300)), (_azimuth + (random 20))] , East, [selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
WP_1 = PRL addWaypoint [(getPos _CNTR), 0]; 
WP_1 SetWaypointType "MOVE"; 


if (_RADS > 1200) then {
PRL = [(getPos _CNTR) getPos [(300 + (random 300)), (_azimuth + (random 20))] , East, [selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
WP_1 = PRL addWaypoint [(getPos _CNTR), 0]; 
WP_1 SetWaypointType "MOVE"; 
};

if (_RADS > 1700) then {
PRL = [(getPos _CNTR) getPos [(300 + (random 300)), (_azimuth - (random 20))] , East, [selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
WP_1 = PRL addWaypoint [(getPos _CNTR), 0]; 
WP_1 SetWaypointType "MOVE"; 
};



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

[_CNTR] execVM "Scripts\VehiInsert_CSAT.sqf";

sleep 30 ;
if (_RADS > 1200) then {
[_CNTR] execVM "Scripts\HeliInsert_CSAT.sqf";
[_CNTR] execVM "Scripts\VehiInsert_CSAT.sqf";
};

sleep 30 ;
if (_RADS > 1700) then {
[_CNTR] execVM "Scripts\HeliInsert_CSAT.sqf";
[_CNTR] execVM "Scripts\VehiInsert_CSAT.sqf";
};



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_RADS > 1700) then {
[_CNTR] execVM "Scripts\VehiInsert_CSAT_3.sqf";
};


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

};

sleep 30 ;

	{ removeFromRemainsCollector [_x]; } foreach (allUnits select { side _x != west }) ;
	{ removeFromRemainsCollector [_x]; } foreach (vehicles select { side (driver  _x) != west }) ; 


sleep 3 ; 

	{ addToRemainsCollector [_x]; } foreach (allUnits select { side _x != west }) ;
	{ addToRemainsCollector [_x]; } foreach (vehicles select { side (driver  _x) != west }) ; 












