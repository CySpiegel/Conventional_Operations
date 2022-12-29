
/////////////////////Enemy Armor////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_thisArmorTrigger = _this select 0;


_Chance = selectRandom [1, 2, 3]; 

_ARM = selectRandom ((getpos _thisArmorTrigger) nearRoads 500) ; 

trgARM = 0;

_mrkrs = allMapMarkers select {markerColor _x == "Color6_FD_F"};
_mrkr = _mrkrs select 0;
_DANSCORE = parseNumber (markerText _mrkr) ;  
//////Vehicles/////////////////////////////////////////////////////////////////////////////////////////
	

_nearRoad = selectRandom ( (getpos _ARM) nearRoads 70 ) ; 
_V0 = createVehicle [ selectRandom East_Ground_Vehicles_Heavy, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V0 setDir _dir;
_Group = createVehicleCrew _V0; 
_VC0 = createGroup East;
{[_x] join _VC0} forEach units _Group;

_V0 disableAI "LIGHTS"; 
_V0 setPilotLight true;

_V0 addEventHandler ["Killed", { 
_MMarks = allMapMarkers select { markerType _x == "o_armor"};
_M = [_MMarks, (_this select 0)] call BIS_fnc_nearestPosition;

deleteMarker _M ; 
  
  				[50, "ARMOR PATROL"] execVM "Scripts\NOtification.sqf" ;


[50] execVM "Scripts\Reward.sqf";
[] execVM "Scripts\DangerPlus.sqf";

}];


_nearRoad = selectRandom ( (getpos _ARM) nearRoads 140 ) ; 
_V1 = createVehicle [ selectRandom East_Ground_Vehicles_Heavy, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V1 setDir _dir;
_VC1 = createVehicleCrew _V1; 	
_V1 disableAI "LIGHTS"; 
_V1 setPilotLight true;
{[_x] join _VC0} forEach units _VC1; 


if (_DANSCORE > 5) then {
_nearRoad = selectRandom ( (getpos _ARM) nearRoads 140 ) ; 
_V1 = createVehicle [ selectRandom East_Ground_Vehicles_Heavy, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V1 setDir _dir;
_VC1 = createVehicleCrew _V1; 	
_V1 disableAI "LIGHTS"; 
_V1 setPilotLight true;
{[_x] join _VC0} forEach units _VC1; 

_nearRoad = selectRandom ( (getpos _ARM) nearRoads 70 ) ; 
_V1 = createVehicle [ selectRandom East_Ground_Vehicles_Heavy, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V1 setDir _dir;
_VC1 = createVehicleCrew _V1; 	
_V1 disableAI "LIGHTS"; 
_V1 setPilotLight true;
{[_x] join _VC0} forEach units _VC1; 
	
	};

if (_DANSCORE > 10) then {
	
_nearRoad = selectRandom ( (getpos _ARM) nearRoads 70 ) ; 
_V2= createVehicle [ selectRandom East_Ground_Vehicles_Heavy, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V2 setDir _dir;
_VC2 = createVehicleCrew _V2; 
_V2 disableAI "LIGHTS"; 
_V2 setPilotLight true;
{[_x] join _VC0} forEach units _VC2; 		
	
_nearRoad = selectRandom ( (getpos _ARM) nearRoads 70 ) ; 
_V2= createVehicle [ selectRandom East_Ground_Vehicles_Heavy, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V2 setDir _dir;
_VC2 = createVehicleCrew _V2; 
_V2 disableAI "LIGHTS"; 
_V2 setPilotLight true;
{[_x] join _VC0} forEach units _VC2; 	

	};


_nearRoad2 =_ARM nearRoads 1500 ; 
_nearRoad1 = _ARM nearRoads 800 ; 

_nearRoadleft = _nearRoad2 - _nearRoad1;
_nearRoad0 = selectRandom _nearRoadleft; 
I1_WP_0 = _VC0 addWaypoint [getPos _nearRoad0, 0];
I1_WP_0 SetWaypointType "MOVE";
I1_WP_0 setWaypointBehaviour "SAFE";
I1_WP_0 setWaypointSpeed "LIMITED";

I1_WP_00 = _VC0 addWaypoint [getPos _nearRoad, 0];
I1_WP_00 SetWaypointType "MOVE";
I1_WP_00 setWaypointBehaviour "SAFE";
I1_WP_00 setWaypointSpeed "LIMITED";

I1_WP_1 = _VC0 addWaypoint [getPos _nearRoad, 3];
I1_WP_1 SetWaypointType "CYCLE";
I1_WP_1 setWaypointBehaviour "SAFE";
I1_WP_1 setWaypointSpeed "LIMITED";


sleep 3;


  {
      _nvg = hmd _x;
      _x unassignItem _nvg;
      _x removeItem _nvg;
	  _x addPrimaryWeaponItem "acc_flashlight";
	  _x assignItem "acc_flashlight";
	  _x enableGunLights "ForceOn";
  } foreach (allUnits select {side _x == east}); 

  
  



