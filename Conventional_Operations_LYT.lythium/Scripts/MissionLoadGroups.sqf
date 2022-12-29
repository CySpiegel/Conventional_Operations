_GroupMarks = allMapMarkers select {markerType _x == "b_unknown" && markerColor _x == "Color6_FD_F"};
	{
_GRP = [(getMarkerpos _x), WEST, (parseSimpleArray (markerText _x))] call BIS_fnc_spawnGroup ; 
LoadGroup = createGroup West;
publicVariable "LoadGroup";
{[_x] join LoadGroup} forEach units _GRP;
_L = (units LoadGroup) select 0;

		{_nvg = hmd _x;
 _x unassignItem _nvg;
 _x removeItem _nvg;
 _x linkItem "NVGoggles_OPFOR";} foreach units LoadGroup;
 
 { {
[_x,"MENU_COMMS_SUPPLYDROP",nil,nil,""] call BIS_fnc_addCommMenuItem;
[_x,"MENU_COMMS_UAV_RECON",nil,nil,""] call BIS_fnc_addCommMenuItem;
[_x,"MENU_COMMS_CAS_HELI",nil,nil,""] call BIS_fnc_addCommMenuItem;	
[_x,"MENU_COMMS_ARTI",nil,nil,""] call BIS_fnc_addCommMenuItem;	} foreach Units LoadGroup; } remoteExec ["call", 0];

if (markerText "Revive_Handlen" == "Activate") then {{[_x] call AIS_System_fnc_loadAIS;} forEach Units LoadGroup;};


{	{[_x] execVM "Scripts\LDTInit.sqf" ;} forEach Units LoadGroup ;  } remoteExec ["call", 2];


TheCommander hcSetGroup [LoadGroup];
}forEach _GroupMarks;

sleep 2 ;

{deleteMarker _x; } forEach _GroupMarks;

sleep 25 ;

{	{[_x] execVM "Scripts\LDTInit.sqf" ;} forEach (allUnits select {side _x == west}) ; } remoteExec ["call", 2];