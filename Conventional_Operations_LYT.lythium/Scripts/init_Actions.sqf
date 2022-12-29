 
 
 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
 _FOBC = nearestObjects [position player, ["B_Slingload_01_Cargo_F"], 40000];
{
[_x,[
	"<img size=2 color='#7CC2FF' image='Screens\FOBA\b_hq.paa'/><t font='PuristaBold' color='#7CC2FF'>UnPack FOB",
	"Scripts\FOBUNPACK.sqf",
	nil,
	0,
	true,
	true,
	"",
	"true", // _target, _this, _originalTarget
	40,
	false,
	"",
	""
]] remoteExec ["addAction",0,true];	
 } foreach _FOBC;
 
  _FOBC = nearestObjects [position player, ["B_Slingload_01_Repair_F"], 40000];
{
[_x,[
	"<img size=2 color='#7CC2FF' image='Screens\FOBA\b_hq.paa'/><t font='PuristaBold' color='#7CC2FF'>UnPack OP",
	"Scripts\OPUNPACK.sqf",
	nil,
	0,
	true,
	true,
	"",
	"true", // _target, _this, _originalTarget
	40,
	false,
	"",
	""
]] remoteExec ["addAction",0,true];
 } foreach _FOBC;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_objectLocT = allMapMarkers select { markerType _x == "loc_Transmitter" };
	{
		
_TWR = nearestobjects [(getMarkerPos _x), ["Land_TTowerBig_2_F", "Land_TTowerBig_1_F"], 200] select 0;
_TWR removeAllEventHandlers "Killed";
_TWR addEventHandler ["Killed", { 
_MMarks = allMapMarkers select { markerType _x == "loc_Transmitter"};
_M = [_MMarks, (_this select 0)] call BIS_fnc_nearestPosition;
deleteMarker _M ; 
  
[] execVM "Scripts\DangerMinus.sqf";
[] execVM "Scripts\ReputationMinus.sqf";
[] execVM "Scripts\ReputationMinus.sqf";
  
[30, "RADIO TOWER"] execVM "Scripts\NOtification.sqf" ;

[30] execVM "Scripts\Reward.sqf";
 execVM "Scripts\COMDIS.sqf";
}];
	
    } forEach _objectLocT;	

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


_objectLocT = allMapMarkers select { markerType _x == "b_installation" && markerColor _x == "ColorWEST"};

	{
		
_trg = createTrigger ["EmptyDetector", (getMarkerPos _x), false];  
_trg setTriggerArea [200, 200, 0, false, 200];  
_trg setTriggerTimeout [1, 1, 1, true];
_trg setTriggerActivation ["EAST SEIZED", "PRESENT", false];  
_trg setTriggerStatements [  
"this",  "  

[parseText '<t color=""#FF3619"" font=""PuristaBold"" align = ""right"" shadow = ""1"" size=""3"">SITREP</t><br /><t color=""#7c7c7c""  align = ""right"" shadow = ""1"" size=""1.5"">Enemy Forces Dominating the Urban Battle,</t><br /><t color=""#7c7c7c"" align = ""right"" shadow = ""1"" size=""1.5"">Keep Up the Fight, We Must Defend and Take Back the City, </t>', [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ['BIS_fnc_textTiles', 0];
_allMarks = allMapMarkers select {markerColor _x == 'ColorWEST' && markerType _x == 'b_installation'};  
_FOBMrk = [_allMarks,  thisTrigger] call BIS_fnc_nearestPosition;
openMap true;
 [markerSize _FOBMrk, markerPos _FOBMrk, 0.5] call BIS_fnc_zoomOnArea;				
				
				_trg = createTrigger ['EmptyDetector', getPos thisTrigger, false];  
				_trg setTriggerArea [200, 200, 0, false, 200];  
				_trg setTriggerTimeout [90, 90, 90, true];
				_trg setTriggerActivation ['EAST SEIZED', 'PRESENT', true];  
				_trg setTriggerStatements [  
				""this"",  ""  

				[playerSide, 'HQ'] commandChat 'all Forces Fall Back. We Lost the CITY,...';

				_allMarks = allMapMarkers select {markerColor _x == 'ColorWEST' && markerType _x == 'b_installation'};  
				_FOBMrk = [_allMarks,  thisTrigger] call BIS_fnc_nearestPosition;
				deleteMarker _FOBMrk ; 

				_markerName = 'City' + (str (getPos thisTrigger));  
				_mrkr = createMarker [_markerName, (getPos thisTrigger)] ;
				_mrkr setMarkerType 'o_installation'; 
				_mrkr setMarkerColor 'colorOPFOR';
				_mrkr setMarkerSize [1.2, 1.2]; 

				[thisTrigger] execVM 'Scripts\City_CSAT_CAPTURE_F.sqf';

				"", """"]; 


", ""];				

    } forEach _objectLocT;	

_objectLocT = allMapMarkers select { markerType _x == "b_installation" && markerColor _x == "colorBLUFOR"};

	{

_trg = createTrigger ["EmptyDetector", (getMarkerPos _x), false];  
_trg setTriggerArea [120, 120, 0, false, 200];  
_trg setTriggerTimeout [1, 1, 1, true];
_trg setTriggerActivation ["EAST SEIZED", "PRESENT", false];  
_trg setTriggerStatements [  
"this",  "  

[parseText '<t color=""#FF3619"" font=""PuristaBold"" align = ""right"" shadow = ""1"" size=""3"">SITREP</t><br /><t color=""#7c7c7c""  align = ""right"" shadow = ""1"" size=""1.5"">Enemy Forces Dominating the Battle,</t><br /><t color=""#7c7c7c"" align = ""right"" shadow = ""1"" size=""1.5"">Keep Up the Fight, We Must Defend and Take Back the Outpost, </t>', [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ['BIS_fnc_textTiles', 0];
_allMarks = allMapMarkers select {markerColor _x == 'colorBLUFOR' && markerType _x == 'b_installation'};  
_FOBMrk = [_allMarks,  thisTrigger] call BIS_fnc_nearestPosition;
openMap true;
 [markerSize _FOBMrk, markerPos _FOBMrk, 0.5] call BIS_fnc_zoomOnArea;				
				
				_trg = createTrigger ['EmptyDetector', getPos thisTrigger, false];  
				_trg setTriggerArea [200, 200, 0, false, 200];  
				_trg setTriggerTimeout [60, 60, 60, true];
				_trg setTriggerActivation ['EAST SEIZED', 'PRESENT', true];  
				_trg setTriggerStatements [  
				""this"",  ""  

				[playerSide, 'HQ'] commandChat 'all Forces Fall Back. We Lost the OUTPOST,...';

				_allMarks = allMapMarkers select {markerColor _x == 'colorBLUFOR' && markerType _x == 'b_installation'};  
				_FOBMrk = [_allMarks,  thisTrigger] call BIS_fnc_nearestPosition;
				deleteMarker _FOBMrk ; 

				_markerName = 'Outpost' + (str (getPos thisTrigger));  
				_mrkr = createMarker [_markerName, (getPos thisTrigger)] ;
				_mrkr setMarkerType 'o_support'; 
				_mrkr setMarkerColor 'colorOPFOR';
				_mrkr setMarkerSize [1.2, 1.2]; 

				[thisTrigger] execVM 'Scripts\Outpost_CSAT_CAPTURE_F.sqf';

				"", """"]; 


", ""];				

    } forEach _objectLocT;	
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
[] spawn {  
  while { sleep 5 ; alive TheCommander } do{  
_MOBRESMarks = allMapMarkers select {markerType _x == "b_unknown" && markerColor _x == "ColorYellow" && markerAlpha _x == 0.7};
	{deleteMarker _x} forEach _MOBRESMarks ;
_MOBRESVeh = vehicles select {(typeOf _x == F_Truck_05 or typeOf _x == F_Heli_04) && alive _x } ;	
{
_markerName = "respawn_west" + (str (getPos _x));  
_mrkr = createMarkerLocal [_markerName, getPos _x];  
_mrkr setMarkerTypeLocal "b_unknown";
_mrkr setMarkerColorLocal "ColorYellow";
_mrkr setMarkerTextLocal "RESPAWN";
_mrkr setMarkerSizeLocal [1, 1]; 
_mrkr setMarkerAlpha 0.7; 
} foreach _MOBRESVeh;

 sleep 1;  
  };  
};


_MOBSER = nearestobjects [(position player),[F_Truck_04],40000] ;
{
[_x, -1, west, "LIGHT"] execVM "R3F_LOG\USER_FUNCT\init_creation_factory.sqf" ;

} forEach _MOBSER ;

_MOBARS = nearestobjects [(position player),[F_Truck_03],40000] ;
{
	
[_x,[
	"<img size=2 color='#FFE258' image='Screens\FOBA\mg_ca.paa'/><t font='PuristaBold' color='#FFE258'>ARSENAL",
	{["Open", true] spawn BIS_fnc_arsenal;},
	nil,
	3,
	true,
	true,
	"",
	"", // _target, _this, _originalTarget
	15,
	false,
	"",
	""
]] remoteExec ["addAction",0,true];

} forEach _MOBARS ;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_VEHs = nearestobjects [(position player),[
F_Heli_01,
F_Heli_02,
F_Heli_03,
F_Heli_04,
F_Heli_05
],40000] ;

{(group (driver _x)) setVariable ["Vcm_Disable",true]; } forEach _VEHs ; 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_objectLoc = nearestobjects [position player, ["rhsusf_stryker_m1126_m2_d", "rhsusf_stryker_m1126_mk19_d", "rhsusf_stryker_m1134_d"], 40000]; 
{[_x,["Tan",1]] call BIS_fnc_initVehicle;} forEach _objectLoc;

_TVC = nearestobjects [position player, ["rhsusf_mrzr4_d"], 40000]; 
if (((markerText "Friendly_Handle" == "United States Armed Forces _ Woodland _ CUP + RHS") or (markerText "Friendly_Handle" == "United States Armed Forces _ Woodland _ RHS")) && (count _TVC > 0)) then {[_x,["mud_olive",1]] call BIS_fnc_initVehicle;} forEach _TVC;
 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{ _LOG = nearestObjects [position player, ["Sign_Pointer_Blue_F" , "LocationVillage_F", "Land_InvisibleBarrier_F", "LocationCityCapital_F", "LocationCity_F", "Sign_Pointer_Blue_F" , "LocationVillage_F", "LocationEvacPoint_F", "LocationArea_F"], 40000]; {deleteVehicle _x} forEach _LOG ; } remoteExec ["call", 0];

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




