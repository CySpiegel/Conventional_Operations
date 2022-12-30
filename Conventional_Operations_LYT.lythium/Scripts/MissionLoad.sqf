_missionTag = missionname;
_missionTag = [_missionTag] call BIS_fnc_filterstring;

private _MarkerDataname = _missionTag + "_markers";
private _vehicleDataname = _missionTag + "_vehicles";
private _ObjectDataname = _missionTag + "_Objects";
private _Markertimename = _missionTag + "_time";

// private _date = profileNamespace getVariable _Markertimename;
if (!isnil "_date") then {
    setDate _date;
};

// sleep 2;

private _getVariableMark = profileNamespace getVariable _MarkerDataname;

_allMarknames = keys _getVariableMark;

{
_M = _x;
    _MrkAtts = _getVariableMark get _x;
    _MPos = _MrkAtts get "pos";
    _Mtype = _MrkAtts get "type";
    _Msize = _MrkAtts get "size";
    _Mtext = _MrkAtts get "text";
    _MBrush = _MrkAtts get "brush";
    _MShape = _MrkAtts get "shape";
    _MDir = _MrkAtts get "dir";
    _Mcolor = _MrkAtts get "color";
    _MAlpha = _MrkAtts get "alpha";
    
    _mrkr = createMarkerlocal [_M, [0, 0, 0]];
    _mrkr setMarkerPosLocal _MPos;
    _mrkr setMarkertypeLocal _Mtype;
    _mrkr setMarkerBrushLocal _MBrush;
    _mrkr setMarkerShapeLocal _MShape;
    _mrkr setMarkersizeLocal _Msize;
    _mrkr setMarkertextLocal _Mtext;
    _mrkr setMarkerDirLocal _MDir;
    _mrkr setMarkerColor _Mcolor;
    _mrkr setMarkerAlpha _MAlpha;
} forEach _allMarknames;

// sleep 2;

private _getVariableVeh = profileNamespace getVariable _vehicleDataname;

_allVehnames = keys _getVariableVeh;

{
    _VehAtts = _getVariableVeh get _x;
    _posASL = _VehAtts get "posASL";
    _type = _VehAtts get "type";
    _DirUp = _VehAtts get "vectorDirandUp";
    
    _NewVeh = createvehicle [_type, [0, 0, (500 + random 2000)], [], 0, "CAN_COLLIDE"];
    
    _NewVeh setvectorDirAndUp _DirUp;
    _NewVeh setPosASL _posASL;
    
    _vehicleConfig = (configFile >> "Cfgvehicles" >> typeOf _NewVeh);
    _crewtype = [west, _vehicleConfig] call BIS_fnc_selectcrew;
    _crewFull = createvehiclecrew _NewVeh;
    _crewSelCnt = count (units _crewFull) - 1;
    deletevehicleCrew _NewVeh;
    sleep 1;
    _group = creategroup west;
    for "_x" from 0 to _crewSelCnt do {
        _unit = _group createUnit [_crewtype, [0, 0, 0], [], 0, "CAN_COLLIDE"];
    };
    {
        _x moveInAny _NewVeh
    } forEach units _group;
    {
        [_x] joinSilent _group
    } forEach units _group;
} forEach _allVehnames;

_VEHs = nearestobjects [(position player), [
    F_Heli_01,
    F_Heli_02,
    F_Heli_03,
    F_Heli_04,
    F_Heli_05
], 40000];

{
    (group (driver _x)) setVariable ["Vcm_Disable", true];
} forEach _VEHs;
// sleep 2;

private _getVariableStatic = profileNamespace getVariable _ObjectDataname;

_allVehnames = keys _getVariableStatic;

{
    _StcAtts = _getVariableStatic get _x;
    _posASL = _StcAtts get "posASL";
    _type = _StcAtts get "type";
    _DirUp = _StcAtts get "vectorDirandUp";
    
    _NewVeh = createvehicle [_type, [0, 0, (500 + random 2000)], [], 0, "CAN_COLLIDE"];
    _NewVeh setvectorDirAndUp _DirUp;
    _NewVeh setPosASL _posASL;
} forEach _allVehnames;

// sleep 2;
MissionloadedLitterally = 1;
publicVariable "MissionloadedLitterally";
