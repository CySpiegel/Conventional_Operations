/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
  while { true } do{  
{
 _x setDamage 0; 
  _x setVariable ["ais_stabilized", true, true];
  _x setVariable ["ais_unconscious", false, true];

  _x setVariable ["ais_fireDamage", 0]; 
 
 [_x] remoteExecCall ["AIS_System_fnc_restoreFaks", _x, false]; 
 
  [true] remoteExec ["showHud", _x]; 
   [true] remoteExecCall ["AIS_Effects_fnc_toggleRadio", _x, false]; 
 
  _x stop false; 
 _x enableAI "MOVE";    
 _x enableAI "TARGET"; 
 _x enableAI "AUTOTARGET"; 
 _x enableAI "ANIM"; 
 _x enableAI "AUTOCOMBAT";  
 
		_x call AIS_Effects_fnc_removeinjuredMarker;
			[_x, 50] call AIS_system_fnc_reveal;

 [_x, false] remoteExec ["setCaptive", 0, false]; 
  
 ["GetOutMan"] remoteExec ["removeAllEventHandlers", _x, false];
 
	[_x, _x] remoteExec ["ace_medical_treatment_fnc_fullHeal", _x, false]; 
	
	
  } forEach (allUnits select {((side _x == civilian) || (side _x == west)) && (count ( nearestobjects [_x ,["Land_Medevac_house_V1_F", "Land_Medevac_HQ_V1_F", "B_Slingload_01_Medevac_F", "Land_MedicalTent_01_MTP_closed_F", "Land_MedicalTent_01_white_IDAP_med_closed_F"],20]) > 0)}) ; 

 sleep 30;  
  };  
};

[] spawn {  
  while { true } do{  
{
  _x setDamage 0; 
 	
	} forEach (vehicles select {(side (driver  _x) == west) && (count ( nearestobjects [_x ,[F_Truck_04, "B_Slingload_01_Repair_F"],50]) > 0)}) ; 

 sleep 30;  
  };  
};

[] spawn {  
  while { true } do{  
{
_x setVehicleAmmo 1;
 	
	} forEach (vehicles select {(side (driver  _x) == west) && (count ( nearestobjects [_x ,[F_Truck_03, "B_Slingload_01_Ammo_F", "Box_NATO_AmmoVeh_F"],50]) > 0)}) ; 

 sleep 30;  
  };  
};



[] spawn {  
  while { true } do{  
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

 sleep 5;  
  };  
};



_MOBSER = nearestobjects [(position player),[F_Truck_04],40000] ;
{
	{ [_x, -1, west, "LIGHT"] execVM "R3F_LOG\USER_FUNCT\init_creation_factory.sqf" ; } remoteExec ["call", 0]; 

} forEach _MOBSER ;

_MOBARS = nearestobjects [(position player),[F_Truck_03],40000] ;
{

[ _x,
"<img size=2 color='#FFE258' image='Screens\FOBA\mg_ca.paa'/><t font='PuristaBold' color='#FFE258'>ARSENAL",
"Screens\FOBA\mg_ca.paa",
"Screens\FOBA\mg_ca.paa",
	"_this distance _target < 10",			
	"_caller distance _target < 10",	
{},
{},
{
	
	if (isClass (configfile >> "ace_arsenal_loadoutsDisplay") == true ) then {
		[player, player, true] call ace_arsenal_fnc_openBox;
	} else {
		["Open", true] spawn BIS_fnc_arsenal;
	};
},
{},
[],
1,
1,
false,
false
] remoteExec ["BIS_fnc_holdActionAdd",0,true];   

[ _x,
"<img size=2 color='#FFE258' image='Screens\FOBA\mg_ca.paa'/><t font='PuristaBold' color='#FFE258'>REARM Infantry",
"Screens\FOBA\mg_ca.paa",
"Screens\FOBA\mg_ca.paa",
	"_this distance _target < 10",			
	"_caller distance _target < 10",	
{},
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

} forEach _MOBARS ;

_SUPPARS = nearestobjects [(position player),["B_CargoNet_01_ammo_F"],40000] ;
{

[ _x,
"<img size=2 color='#FFE258' image='Screens\FOBA\mg_ca.paa'/><t font='PuristaBold' color='#FFE258'>ARSENAL",
"Screens\FOBA\mg_ca.paa",
"Screens\FOBA\mg_ca.paa",
	"_this distance _target < 10",			
	"_caller distance _target < 10",	
{},
{},
{
	
	if (isClass (configfile >> "ace_arsenal_loadoutsDisplay") == true ) then {
		[player, player, true] call ace_arsenal_fnc_openBox;
	} else {
		["Open", true] spawn BIS_fnc_arsenal;
	};
},
{},
[],
1,
1,
false,
false
] remoteExec ["BIS_fnc_holdActionAdd",0,true];   

[ _x,
"<img size=2 color='#FFE258' image='Screens\FOBA\mg_ca.paa'/><t font='PuristaBold' color='#FFE258'>REARM Infantry",
"Screens\FOBA\mg_ca.paa",
"Screens\FOBA\mg_ca.paa",
	"_this distance _target < 10",			
	"_caller distance _target < 10",	
{},
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

} forEach _SUPPARS ;


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




