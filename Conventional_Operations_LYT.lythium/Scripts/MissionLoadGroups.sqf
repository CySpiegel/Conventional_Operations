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

if (markerText "Revive_Handle" == "Activate") then {{[_x] call AIS_System_fnc_loadAIS;} forEach Units LoadGroup;};

{	{[_x] execVM "Scripts\LDTInit.sqf" ;} forEach Units LoadGroup ;  } remoteExec ["call", 2];



{
[ _x,
"<img size=2 color='#f37c00' image='\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\repair_ca.paa'/><t font='PuristaBold' color='#f37c00'>REPAIR Vehicles",
"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\repair_ca.paa",
"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\repair_ca.paa",
	"_this distance _target < 5",			
	"_caller distance _target < 5",	
{(_this select 0) playMove "AinvPknlMstpSnonWnonDnon_medic_1" ; },
{},
{
[(_this select 0)] execVM "Scripts\REPAIRVEH.sqf" ;
},
{},
[],
10,
1,
false,
false
] remoteExec ["BIS_fnc_holdActionAdd",0,true]; 
} forEach (Units LoadGroup select { (typeOf _x == F_Assault_Eng)  || (typeOf _x == "B_G_engineer_F")  || (typeOf _x == F_Recon_Eng)   || (typeOf _x == "B_CTRG_soldier_engineer_exp_F")} ) ;

{
[ _x,
"<img size=2 color='#FFE258' image='Screens\FOBA\mg_ca.paa'/><t font='PuristaBold' color='#FFE258'>REARM Infantry",
"Screens\FOBA\mg_ca.paa",
"Screens\FOBA\mg_ca.paa",
	"_this distance _target < 5",			
	"_caller distance _target < 5",	
{(_this select 0) playMove "AinvPknlMstpSnonWnonDnon_medic_1" ; },
{},
{
[(_this select 0)] execVM "Scripts\REARM.sqf" ;
},
{},
[],
5,
1,
false,
false
] remoteExec ["BIS_fnc_holdActionAdd",0,true];   
} forEach (Units LoadGroup select { (typeOf _x == F_Assault_Amm)  || (typeOf _x == "B_G_Soldier_A_F") } ) ;

{
[_x,[
	"<img size=2 color='#0bff00' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa'/><t font='PuristaBold' color='#0bff00'>HEAL Infantry",
{
(_this select 0) playMove "AinvPknlMstpSnonWnonDnon_medic_1" ; 
[(_this select 0)] execVM "Scripts\HEAL.sqf" ;
},
	nil,
	0,
	true,
	true,
	"",
	"_this distance _target < 5", // _target, _this, _originalTarget
	5,
	false,
	"",
	""
]] remoteExec ["addAction",0,true];
} forEach (Units LoadGroup select { (typeOf _x == F_Recon_Med)  || (typeOf _x == F_Assault_Med)  || (typeOf _x == "B_G_medic_F")  || (typeOf _x == "B_CTRG_soldier_M_medic_F") } ) ;

TheCommander hcSetGroup [LoadGroup];
}forEach _GroupMarks;

sleep 2 ;

{deleteMarker _x; } forEach _GroupMarks;

sleep 25 ;

{	{[_x] execVM "Scripts\LDTInit.sqf" ;} forEach (allUnits select {side _x == west}) ; } remoteExec ["call", 2];