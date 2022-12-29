// Enemy Armor////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_thisArmorTrigger = _this select 0;

_Chance = selectRandom [1, 2, 3];

_ARM = selectRandom ((getPos _thisArmorTrigger) nearRoads 500);

trgARM = 0;

_mrkrs = allMapMarkers select {
    markerColor _x == "Color6_FD_F"
};
_mrkr = _mrkrs select 0;
_DANscore = parseNumber (markertext _mrkr);
// vehicles/////////////////////////////////////////////////////////////////////////////////////////

_nearRoad = selectRandom ((getPos _ARM) nearRoads 70);
_V0 = createvehicle [ selectRandom east_Ground_vehicles_Heavy, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"];
_nextRoad = (roadsConnectedto _nearRoad) select 0;
_dir = _nearRoad getDir _nextRoad;
_V0 setDir _dir;
_group = createvehiclecrew _V0;
_VC0 = creategroup east;
{
    [_x] join _VC0
} forEach units _group;

_V0 disableAI "LIGHTS";
_V0 setPilotLight true;

_V0 addEventHandler ["Killed", {
    _MMarks = allMapMarkers select {
        markertype _x == "o_armor"
    };
    _M = [_MMarks, (_this select 0)] call BIS_fnc_nearestposition;
    
    deleteMarker _M;
    
    [50, "ARMor PATROL"] execVM "Scripts\notification.sqf";
    
    [50] execVM "Scripts\Reward.sqf";
    [] execVM "Scripts\DangerPlus.sqf";
}];

_nearRoad = selectRandom ((getPos _ARM) nearRoads 140);
_V1 = createvehicle [ selectRandom east_Ground_vehicles_Heavy, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"];
_nextRoad = (roadsConnectedto _nearRoad) select 0;
_dir = _nearRoad getDir _nextRoad;
_V1 setDir _dir;
_VC1 = createvehiclecrew _V1;
_V1 disableAI "LIGHTS";
_V1 setPilotLight true;
{
    [_x] join _VC0
} forEach units _VC1;

if (_DANscore > 5) then {
    _nearRoad = selectRandom ((getPos _ARM) nearRoads 140);
    _V1 = createvehicle [ selectRandom east_Ground_vehicles_Heavy, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"];
    _nextRoad = (roadsConnectedto _nearRoad) select 0;
    _dir = _nearRoad getDir _nextRoad;
    _V1 setDir _dir;
    _VC1 = createvehiclecrew _V1;
    _V1 disableAI "LIGHTS";
    _V1 setPilotLight true;
    {
        [_x] join _VC0
    } forEach units _VC1;
    
    _nearRoad = selectRandom ((getPos _ARM) nearRoads 70);
    _V1 = createvehicle [ selectRandom east_Ground_vehicles_Heavy, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"];
    _nextRoad = (roadsConnectedto _nearRoad) select 0;
    _dir = _nearRoad getDir _nextRoad;
    _V1 setDir _dir;
    _VC1 = createvehiclecrew _V1;
    _V1 disableAI "LIGHTS";
    _V1 setPilotLight true;
    {
        [_x] join _VC0
    } forEach units _VC1;
};

if (_DANscore > 10) then {
    _nearRoad = selectRandom ((getPos _ARM) nearRoads 70);
    _V2= createvehicle [ selectRandom east_Ground_vehicles_Heavy, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"];
    _nextRoad = (roadsConnectedto _nearRoad) select 0;
    _dir = _nearRoad getDir _nextRoad;
    _V2 setDir _dir;
    _VC2 = createvehiclecrew _V2;
    _V2 disableAI "LIGHTS";
    _V2 setPilotLight true;
    {
        [_x] join _VC0
    } forEach units _VC2;
    
    _nearRoad = selectRandom ((getPos _ARM) nearRoads 70);
    _V2= createvehicle [ selectRandom east_Ground_vehicles_Heavy, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"];
    _nextRoad = (roadsConnectedto _nearRoad) select 0;
    _dir = _nearRoad getDir _nextRoad;
    _V2 setDir _dir;
    _VC2 = createvehiclecrew _V2;
    _V2 disableAI "LIGHTS";
    _V2 setPilotLight true;
    {
        [_x] join _VC0
    } forEach units _VC2;
};

_nearRoad2 =_ARM nearRoads 1500;
_nearRoad1 = _ARM nearRoads 800;

_nearRoadleft = _nearRoad2 - _nearRoad1;
_nearRoad0 = selectRandom _nearRoadleft;
I1_WP_0 = _VC0 addWaypoint [getPos _nearRoad0, 0];
I1_WP_0 setwaypointType "move";
I1_WP_0 setwaypointBehaviour "SAFE";
I1_WP_0 setwaypointSpeed "LIMITED";

I1_WP_00 = _VC0 addWaypoint [getPos _nearRoad, 0];
I1_WP_00 setwaypointType "move";
I1_WP_00 setwaypointBehaviour "SAFE";
I1_WP_00 setwaypointSpeed "LIMITED";

I1_WP_1 = _VC0 addWaypoint [getPos _nearRoad, 3];
I1_WP_1 setwaypointType "CYCLE";
I1_WP_1 setwaypointBehaviour "SAFE";
I1_WP_1 setwaypointSpeed "LIMITED";

sleep 3;

{
    _nvg = hmd _x;
    _x unassignItem _nvg;
    _x removeItem _nvg;
    _x addprimaryWeaponItem "acc_flashlight";
    _x assignItem "acc_flashlight";
    _x enableGunLights "forceOn";
} forEach (allunits select {
    side _x == east
});