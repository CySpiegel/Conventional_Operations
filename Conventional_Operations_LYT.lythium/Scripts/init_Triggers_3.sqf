////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_mrkrs = allMapMarkers select {markerColor _x == "Color6_FD_F"};
_mrkr = _mrkrs select 0;
_DANSCORE = parseNumber (markerText _mrkr) ;  

//////Resources/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_objectLocT = allMapMarkers select { markerType _x == "o_installation"};

{
_trg = createTrigger ["EmptyDetector", getMarkerpos _x, false];
_trg setTriggerArea [2000, 2000, 0, false, 100];
_trg setTriggerInterval 3;
_trg setTriggerTimeout [7, 7, 7, true];
_trg setTriggerActivation ["WEST", "PRESENT", false];
_trg setTriggerStatements [
"this","

[thisTrigger] execVM 'Scripts\Insurgents_Init.sqf';

_trgA = createTrigger ['EmptyDetector', (getPos thisTrigger), false];
_trgA setTriggerArea [1000, 1000, 0, false, 100];
_trgA setTriggerInterval 3;
_trgA setTriggerTimeout [13, 13, 13, true];
_trgA setTriggerActivation ['WEST', 'PRESENT', false];
_trgA setTriggerStatements [
""this"",""

[thisTrigger] execVM 'Scripts\City_CSAT.sqf';

"",""""];


_trgA = createTrigger ['EmptyDetector', (getPos thisTrigger) getPos [(500 + (random 2000)),(0 + (random 350))], false];
_trgA setTriggerArea [500, 500, 0, false, 60];
_trgA setTriggerInterval 3;
_trgA setTriggerTimeout [1, 1, 1, true];
_trgA setTriggerActivation ['WEST', 'PRESENT', false];
_trgA setTriggerStatements [
""this"",""

[thisTrigger] execVM 'Scripts\Recon_CSAT.sqf';

"",""""];

_trgA = createTrigger ['EmptyDetector', (getPos thisTrigger) getPos [(500 + (random 2000)),(0 + (random 350))], false];
_trgA setTriggerArea [500, 500, 0, false, 60];
_trgA setTriggerInterval 3;
_trgA setTriggerTimeout [1, 1, 1, true];
_trgA setTriggerActivation ['WEST', 'PRESENT', false];
_trgA setTriggerStatements [
""this"",""

[thisTrigger] execVM 'Scripts\HeliInsert_CSAT.sqf';

"",""""];

_trgA = createTrigger ['EmptyDetector', (getPos thisTrigger) getPos [(500 + (random 2000)),(0 + (random 350))], false];
_trgA setTriggerArea [500, 500, 0, false, 60];
_trgA setTriggerInterval 3;
_trgA setTriggerTimeout [1, 1, 1, true];
_trgA setTriggerActivation ['WEST', 'PRESENT', false];
_trgA setTriggerStatements [
""this"",""

[thisTrigger] execVM 'Scripts\VehiInsert_CSAT.sqf';

"",""""];

if ( count (nearestobjects [(getPos thisTrigger), ['LocationCity_F'], 100]) != 0) then {

_trgA = createTrigger ['EmptyDetector', (getPos thisTrigger), false];
_trgA setTriggerArea [1000, 1000, 0, false, 60];
_trgA setTriggerInterval 3;
_trgA setTriggerTimeout [7, 7, 7, true];
_trgA setTriggerActivation ['ANYPLAYER', 'PRESENT', false];
_trgA setTriggerStatements [
""this"",""

[thisTrigger] execVM 'Scripts\City_Civ.sqf';

"",""""];
};

", ""];


} forEach _objectLocT;

sleep 1;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_allLGs = allMapMarkers select { markerType _x == "b_installation" && markerColor _x == "ColorWEST"};

{if ( count (nearestobjects [getMarkerpos _x, ["LocationCity_F", "LocationCityCapital_F"], 100]) != 0) then {

_trgA = createTrigger ["EmptyDetector", getMarkerPos _x, false];
_trgA setTriggerArea [1000, 1000, 0, false, 60];
_trgA setTriggerTimeout [7, 7, 7, true];
_trgA setTriggerActivation ["ANYPLAYER", "PRESENT", false];
_trgA setTriggerStatements [
"this","

[thisTrigger] execVM 'Scripts\City_Civ.sqf';

", ""];


};} forEach _allLGs; 



["LOADING . . . "] remoteExec ["hint", 0];
sleep 1;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


_objectLocT = allMapMarkers select { markerType _x == "o_armor"};

{

_trgA = createTrigger ["EmptyDetector", getMarkerpos _x, false];
_trgA setTriggerArea [1500, 1500, 0, false, 100];
_trgA setTriggerTimeout [2, 2, 2, true];
_trgA setTriggerActivation ["WEST", "PRESENT", false];
_trgA setTriggerStatements [
"this","

[thisTrigger] execVM 'Scripts\Mission_Armor.sqf';

", ""];

sleep 0.2 ;

} forEach _objectLocT;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
sleep 1;

_objectLocT = allMapMarkers select { markerType _x == 'loc_Transmitter' };

{
_TERR = nearestTerrainObjects [(getMarkerpos _x), ["FOREST", "House", "TREE", "SMALL TREE", "BUSH", "ROCK", "ROCKS"], 15]; 
{[_x, true] remoteExec ["hideObjectGlobal", 2];} forEach _TERR ;
} forEach _objectLocT;

{
	if (markerColor _x != "colorBLUFOR") then {
_trgA = createTrigger ["EmptyDetector", getMarkerpos _x];
_trgA setTriggerArea [1000, 1000, 0, false, 100];
_trgA setTriggerTimeout [1, 1, 1, true];
_trgA setTriggerActivation ["WEST", "PRESENT", false];
_trgA setTriggerStatements [
"this","

[thisTrigger] execVM 'Scripts\RadioTower_CSAT.sqf';

", ""];
	};
	
if ( count (nearestObjects [(getMarkerpos _x), ["Land_TTowerBig_2_F", "Land_TTowerBig_1_F"], 100] ) == 0) then {
_P1 =  ["Land_TTowerBig_2_F", "Land_TTowerBig_1_F"]; 	
_TWR = createVehicle [ selectRandom _P1, (getMarkerpos _x), [], 5, "NONE"];
_TWR setVectorUp [0,0,1];
};

_TWR = nearestobjects [(getMarkerPos _x), ["Land_TTowerBig_2_F", "Land_TTowerBig_1_F"], 200] select 0;

[
	_TWR,											
	"Intercept Comms",										
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	
	"_this distance _target < 10 && count (allMapMarkers select { markerText _x == ""Radio""}) == 0 ",						
	"_caller distance _target < 10",						
	{
	playSound3D ["a3\missions_f_oldman\data\sound\intel_laptop\2sec\intel_laptop_2sec_03.wss", (_this select 0)]; 
	},												
	{},													
	{ 

[(_this select 0)] execVM "Scripts\Reveal.sqf";

	},				
	{},													
	[],												
	3,													
	0,												
	true,												
	false												
] remoteExec ["BIS_fnc_holdActionAdd", 0, _TWR];	

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


["LOADING . . . "] remoteExec ["hint", 0];
sleep 1;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

sleep 4;



TRG3LOCC = 1;
publicVariable "TRG3LOCC";
