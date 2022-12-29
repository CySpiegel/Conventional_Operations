
_thisCaptureTrigger = _this select 0;
_posit = getPos _thisCaptureTrigger ;

WestW = 0 ;
publicVariable "WestW";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
sleep 220 ;


if (triggerActivated _thisCaptureTrigger) then {
	

				_POWs = allUnits select {(alive _x) && ((side _x) == east) && (position _x inArea  _thisCaptureTrigger)}  ;
				_POWsShuffled = _POWs call BIS_fnc_arrayShuffle ;
				_POWsF = _POWsShuffled  select [0, 5] ;
				{
				_x disableAI 'PATH';
				_x disableAI 'ANIM'; 
				removeAllWeapons _x;
				removeBackpack _x;
				_x setCaptive true;
				_x switchMove 'AmovPercMstpSsurWnonDnon';

				_x addEventHandler ['Killed', { 
				[] execVM 'Scripts\DangerPlusSurr.sqf';
				removeAllActions (_this select 0) ;
				}];

				[
				  _x,
				'Arrest',
				'Screens\FOBA\holdAction_secure_ca.paa',
				'Screens\FOBA\holdAction_secure_ca.paa',
				'_this distance _target < 3',       
				'_caller distance _target < 3',  
				{},
				{},
				{
				(_this select 0) enableAI 'ANIM';
				(_this select 0) enableAI 'PATH';
				(_this select 0) switchMove '';
									[(_this select 0), ''] remoteExec ['playMove', (_this select 0)];		
				(_this select 0) setBehaviour 'AWARE';
				(_this select 0) setCaptive true ;			
				[(_this select 0)] joinSilent player;
				removeAllActions (_this select 0);
				},
				{},
				[],
				3,
				0,
				true,
				false
				] remoteExec ['BIS_fnc_holdActionAdd', 0, _x]; 

				[
				  _x,
				'Release',
				'\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa',
				'\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa',
				'_this distance _target < 3',       
				'_caller distance _target < 3',  
				{(_this select 0) setDir (position (_this select 0) getDir position player);},
				{},
				{
				(_this select 0) enableAI 'ANIM';
				(_this select 0) enableAI 'PATH';
				(_this select 0) switchMove '';
									[(_this select 0), ''] remoteExec ['playMove', (_this select 0)];		
				(_this select 0) setBehaviour 'AWARE';
				removeAllActions (_this select 0);
				_x removeAllEventHandlers 'Killed';
				( group (_this select 0)) addWaypoint [ player getPos [ (3000 + (random 1000)),(0 + (random 360))], 0];

				[] execVM 'Scripts\DangerMinusSurr.sqf';

				[(_this select 0),(_this select 2)] remoteExec ['bis_fnc_holdActionRemove',[0,-2] select isDedicated,true];

				},
				{},
				[],
				3,
				0,
				true,
				false
				] remoteExec ['BIS_fnc_holdActionAdd', 0, _x]; 

				} foreach _POWsF;

				_MMarks = allMapMarkers select { markerType _x == 'o_installation' or markerType _x == 'n_installation'};
				_M = [_MMarks,  _thisCaptureTrigger] call BIS_fnc_nearestPosition;

				if (markerType _M == 'o_installation') then {
				[100, 'CITY'] execVM 'Scripts\NOtification.sqf' ;
				[100] execVM 'Scripts\Reward.sqf';
				[] execVM 'Scripts\DangerPlus.sqf';
				[_thisCaptureTrigger, 1500] execVM 'Scripts\QuickRF.sqf';
				[] execVM 'Scripts\ReputationPlus.sqf';

				
				};
				
				if (markerType _M == 'n_installation') then {
				[200, 'CITY'] execVM 'Scripts\NOtification.sqf' ;
				[200] execVM 'Scripts\Reward.sqf';
				[] execVM 'Scripts\DangerPlus.sqf';
				[] execVM 'Scripts\DangerPlus.sqf';				
				[_thisCaptureTrigger, 3000] execVM 'Scripts\QuickRF.sqf';
				[] execVM 'Scripts\ReputationPlus.sqf';
				[] execVM 'Scripts\ReputationPlus.sqf';
				
				};

				deleteMarker _M ; 
				
				_markerName = 'AssaultMark' + (str (position player));  
				_mrkr = createMarker [_markerName, position player]; 
				_mrkr setMarkerType 'loc_Bunker';
				_mrkr setMarkerAlpha 0.003;

				_markerName = 'respawn_west' + (str (getPos _thisCaptureTrigger));  
				_mrkr = createMarker [_markerName, getPos _thisCaptureTrigger] ;
				_mrkr setMarkerType 'b_installation'; 
				_mrkr setMarkerColor 'ColorWEST';
				_mrkr setMarkerSize [1.3, 1.3]; 
				
				WestW = 1 ;
				publicVariable 'WestW';
				
				}else{
		[_thisCaptureTrigger] execVM 'Scripts\City_CSAT_CAPTURE_West.sqf';
};
				
				

sleep 5 ;

if (WestW == 1) then {

_posit = getPos _thisCaptureTrigger ;
	
_alltriggers = allMissionObjects "EmptyDetector";
_triggers = _alltriggers select {getPos _x distance _thisCaptureTrigger < 20};
{ deleteVehicle _x; } forEach _triggers ;


_trg = createTrigger ["EmptyDetector", _posit, false];  
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

				WestW = 0 ;
				publicVariable "WestW";
				
};