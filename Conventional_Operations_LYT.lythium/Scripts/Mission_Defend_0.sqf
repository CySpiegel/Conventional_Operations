waitUntil {
    sleep 120;
    (count (allMapMarkers select {
        markertype _x == "loc_Bunker"
    }) > 0)
};

sleep 10;

_BunkMarks = allMapMarkers select {
    markertype _x == "loc_Bunker" && markerAlpha _x == 0.003
};
{
    deleteMarker _x;
} forEach _BunkMarks;

_mrkrs = allMapMarkers select {
    markerColor _x == "Color6_FD_F"
};
_mrkr = _mrkrs select 0;
_DANscore = parseNumber (markertext _mrkr);

_time = 900;
if (_DANscore > 3) then {
    _time = 700;
};
if (_DANscore > 9) then {
    _time = 500;
};
if (_DANscore > 12) then {
    _time = 300;
};
sleep _time;

private _headlessClients = entities "HeadlessClient_F";
private _humanplayers = allplayers - _headlessClients;

if (count _humanplayers > 0) then {
    _allZoneMarks = allMapMarkers select {
        markertype _x == "loc_Power" || markertype _x == "o_support" || markertype _x == "n_support" || markertype _x == "loc_Ruin" || markertype _x == "n_installation" || markertype _x == "o_installation"
    };
    _AssltDestMrks = allMapMarkers select {
        markertype _x == "b_installation" && (markerColor _x == "ColorYellow" or markerColor _x == "colorblufor" or markerColor _x == "colorwest")
    };
    
    _DSTall = [];
    
    {
        for "_i" from 0 to count _AssltDestMrks -1 do {
            _DSTach = getmarkerPos ((_AssltDestMrks) select _i) distanceSqr (getmarkerPos _x);
            _DSTall append [_DSTach];
        };
    } forEach _allZoneMarks;
    
    _DSTall sort true;
    _DSneeded = _DSTall select 0;
    _OBJmrk = [];
    _Destmrk = [];
    
    {
        for "_i" from 0 to count _AssltDestMrks -1 do {
            _DSTach = getmarkerPos ((_AssltDestMrks) select _i) distanceSqr (getmarkerPos _x);
            if (_DSTach == _DSneeded) then {
                _Destmrk append [((_AssltDestMrks) select _i)]
            };
            if (_DSTach == _DSneeded) then {
                _OBJmrk append [_x]
            };
        };
    } forEach _allZoneMarks;
    
    _OBJ = _OBJmrk select 0;
    _Dest = _Destmrk select 0;
    
    _CNTR = (nearestobjects [(getmarkerPos _Dest), ["land_Cargo_HQ_V3_F", "land_Cargo_HQ_V1_F", "land_Cargo_House_V1_F", "land_Cargo_House_V3_F", "House"], 300]) select 0;
    
    ENMASSmarkername = "AssltDest" + (str ((getPos Thecommander) getPos [(10 + (random 150)), (0 + (random 360))]));
    publicVariable "ENMASSmarkername";
    
    createMarker [ENMASSmarkername, (getPos _CNTR)];
    ENMASSmarkername setMarkertype "mil_marker_noShadow";
    ENMASSmarkername setMarkerColor "coloropfor";
    ENMASSmarkername setMarkersize [2.5, 2.5];
    ENMASSmarkername setMarkerAlpha 0.5;
    
    [parsetext "<t color='#FF3619' font='PuristaBold' align = 'right' shadow = '1' size='3'>! WARNinG !</t><br /><t color='#FF3619' align = 'right' shadow = '1' size='1.6'>Friendly Objective is Under Attack</t>", [0, 0.5, 1, 1], nil, 13, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];
    sleep 1.5;
    
    //{openMap true;} remoteExec ["call", 0];
    //[markersize ENMASSmarkername, markerPos ENMASSmarkername, 1 ] remoteExecCall ["BIS_fnc_zoomOnArea", 0];
    
    [_CNTR] execVM "Scripts\Vehiinsert_CSAT.sqf";
    [_CNTR] execVM "Scripts\Heliinsert_CSAT.sqf";
    _PRL = [(getmarkerPos _OBJ) getPos [(20 + (random 50)), (0 + (random 360))], east, [selectRandom east_units, selectRandom east_units, selectRandom east_units, selectRandom east_units, selectRandom east_units, selectRandom east_units]] call BIS_fnc_spawngroup;
    _WP_1 = _PRL addWaypoint [getmarkerPos _Dest, 0];
    _WP_1 setwaypointType "move";
    
    sleep 10;
    
    if (_DANscore > 5) then {
        [_CNTR] execVM "Scripts\Vehiinsert_CSAT.sqf";
        [_CNTR] execVM "Scripts\Heliinsert_CSAT.sqf";
        _PRL = [(getmarkerPos _OBJ) getPos [(20 + (random 50)), (0 + (random 360))], east, [selectRandom east_units, selectRandom east_units, selectRandom east_units, selectRandom east_units, selectRandom east_units, selectRandom east_units]] call BIS_fnc_spawngroup;
        _WP_1 = _PRL addWaypoint [getmarkerPos _Dest, 0];
        _WP_1 setwaypointType "move";
    };
    
    sleep 10;
    
    if (_DANscore > 9) then {
        [_CNTR] execVM "Scripts\Vehiinsert_CSAT_3.sqf";
        [_CNTR] execVM "Scripts\Vehiinsert_CSAT.sqf";
        [_CNTR] execVM "Scripts\Heliinsert_CSAT.sqf";
        _PRL = [(getmarkerPos _OBJ) getPos [(20 + (random 50)), (0 + (random 360))], east, [selectRandom east_units, selectRandom east_units, selectRandom east_units, selectRandom east_units, selectRandom east_units, selectRandom east_units]] call BIS_fnc_spawngroup;
        _WP_1 = _PRL addWaypoint [getmarkerPos _Dest, 0];
        _WP_1 setwaypointType "move";
    };
    
    sleep 10;
    
    if (_DANscore > 12) then {
        [_CNTR] execVM "Scripts\Vehiinsert_CSAT_3.sqf";
        [_CNTR] execVM "Scripts\Vehiinsert_CSAT.sqf";
        [_CNTR] execVM "Scripts\Heliinsert_CSAT.sqf";
        _PRL = [(getmarkerPos _OBJ) getPos [(20 + (random 50)), (0 + (random 360))], east, [selectRandom east_units, selectRandom east_units, selectRandom east_units, selectRandom east_units, selectRandom east_units, selectRandom east_units]] call BIS_fnc_spawngroup;
        _WP_1 = _PRL addWaypoint [getmarkerPos _Dest, 0];
        _WP_1 setwaypointType "move";
    };
};

sleep 10;

_AssMarks = allMapMarkers select {
    markertype _x == "mil_marker_noShadow" && markerAlpha _x == 0.5
};
{
    deleteMarker _x;
} forEach _AssMarks;

[] execVM "Scripts\Mission_Defend_0.sqf";