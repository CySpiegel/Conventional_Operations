sleep 18;

_OAA = nearestobjects [position player, ["O_radar_System_02_F", "O_SAM_System_04_F"], 40000];

{
    deletevehicleCrew vehicle _x;
} forEach _OAA;

[parsetext "<t color='#1AA3FF' font='PuristaBold' align = 'right' shadow = '1' size='2.5'>+ Enemy AntiAir Sites Disabled</t><br /><t align = 'right' shadow = '1' size='1.5'>for the Next Hour</t>", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];

sleep 3600;

{
    _gRPcrew = createvehiclecrew _x;
    _group = creategroup east;
    {
        [_x] join _group
    } forEach units _gRPcrew;
} forEach _OAA;