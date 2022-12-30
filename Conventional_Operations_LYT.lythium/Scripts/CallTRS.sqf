_CAST = screentoWorld [0.5, 0.5];
if ((getPosATL laserTarget player) select 0 != 0) then {
    _CAST = getPosATL laserTarget player;
};

_AA = nearestobjects [_CAST, ["O_SAM_System_01_F", "O_SAM_System_04_F", "O_radar_System_02_F"], 3500];

if (count ( nearestobjects [player, ["B_radar_System_01_F", "I_E_radar_System_01_F"], 40000]) > 0) then 
{
    if ({ alive _x } count _AA == 0 ) then 
	{
        _GSHPs = nearestobjects [player, [F_Heli_03], 40000] select {
            count (fullCrew [_x, "cargo", false]) == 0 && alive _x == true && count (waypoints group ((crew _x) select 0)) == 1 && driver _x != objNull
        };
        
        _GSHP = _GSHPs select 0;
        _GSHPgroup = group (driver _GSHP);
        
        _CASD = createMarker [str _CAST, _CAST];
        _CASD setMarkertype "mil_marker_noShadow";
        _CASD setMarkerColor "colorblufor";
        _CASD setMarkerAlpha 0.7;
        _CASD setMarkertext "Extraction";
        
        playSound3D ["A3\dubbing_f\modules\supports\transport_request.ogg", player];
        sleep 10;
        
        sleep 1;
        
        _GSHPgroup setBehaviourstrong "CARELESS";
        _GSHPgroup setCombatMode "YELLOW";
        _GSHP = vehicle ((units _GSHPgroup) select 0);
        _GSHP setDammage 0;
        _GSHP setvehicleAmmo 1;
        _GSHP engineOn true;
        _GSHP flyinHeight 100;
        
        _GSHP disableAI "LIGHTS";
        _GSHP setPilotLight true;
        _GSHP setCollisionLight true;
        
        _WP = _GSHPgroup addWaypoint [_CAST, 0];
        _WP setwaypointType "move";
        _WP setwaypointBehaviour "CARELESS";
        _WP setwaypointForceBehaviour true;
        _WP setwaypointStatements ["true", "(vehicle this) land 'GET in';
        "];
        
        playSound3D ["A3\dubbing_f\modules\supports\transport_acknowledged.ogg", player];
        
        sleep 5;
        _GRPs = (allgroups select {
            side _x == west
        });
        {
            player hcsetgroup [_x];
        } forEach _GRPs;
        sleep 180;
        
        deleteMarker _CASD;
    } else {
        _cost = 60;
        _mrkrs = allMapMarkers select {
            markerColor _x == "Color2_FD_F"
        };
        _mrkr = _mrkrs select 0;
        _Money = parseNumber (markertext _mrkr);
        
        if (_Money >= _cost) then {
            _NewMoney = _Money - _cost;
            _mrkr setMarkertext str _NewMoney;
            
            _CASD = createMarker [str _CAST, _CAST];
            _CASD setMarkertype "mil_marker_noShadow";
            _CASD setMarkerColor "colorblufor";
            _CASD setMarkerAlpha 1;
            _CASD setMarkertext "Extraction";
            
            _CASstrtMrks = allMapMarkers select {
                markertype _x == "b_installation" && markertext _x == "FOB"
            };
            _CASstrt = [_CASstrtMrks, player] call BIS_fnc_nearestposition;
            
            playSound3D ["A3\dubbing_f\modules\supports\transport_request.ogg", player];
            sleep 10;
            
            _CAS_group_Veh = createvehicle [F_Heli_03, (getmarkerPos _CASstrt), [], 0, "FLY"];
            sleep 0.5;
            _CAS_group = createvehiclecrew _CAS_group_Veh;
            
            sleep 1;
            
            _CAS_group setBehaviourstrong "CARELESS";
            _CAS_group setCombatMode "YELLOW";
            _CAS_group_Veh = vehicle ((units _CAS_group) select 0);
            _CAS_group_Veh engineOn true;
            _CAS_group_Veh flyinHeight 100;
            
            _CAS_group_Veh disableAI "LIGHTS";
            _CAS_group_Veh setPilotLight true;
            _CAS_group_Veh setCollisionLight true;
            
            _WP = _CAS_group addWaypoint [_CAST, 0];
            _WP setwaypointType "move";
            _WP setwaypointBehaviour "CARELESS";
            _WP setwaypointForceBehaviour true;
            _WP setwaypointStatements ["true", "(vehicle this) land 'GET in';"];
            
            playSound3D ["A3\dubbing_f\modules\supports\transport_acknowledged.ogg", player];
            
            sleep 5;
            _GRPs = (allgroups select {
                side _x == west
            });
            {
                player hcsetgroup [_x];
            } forEach _GRPs;
            sleep 180;
            
            deleteMarker _CASD;
        } else {
            hint "not enough resources";
        };
    };
} else {
    hint "AntiAir threats Found";
};
} else {
hint "No Air Control System Found";
};