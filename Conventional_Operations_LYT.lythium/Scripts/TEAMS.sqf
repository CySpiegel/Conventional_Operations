GNR = nil;
DVR = nil;


titleText ["Control System Initializing . . .", "BLACK IN",9999];

openMap [true, true]; 
sleep 1;
titleText ["", "BLACK IN",1];
hint "Select Target Unit"; 
onMapSingleClick {
onMapSingleClick {}; 


_side = side player;
_radius = 3000;
_Unts = nearestObjects [_pos,["Man","Car","Tank", "Air", "Ship", "LandVehicle"], 3000] select {((side _x == west) || (side (driver  _x) == west)) && (alive _x == true)} ;
_Unt = _Unts select 0 ;


if ((_Unt isKindOf  "Man") && (isPlayer _Unt)) then {

openMap [true, false]; 
openMap [false, false]; 

			private _headlessClients = entities "HeadlessClient_F";
			private _humanPlayers = allPlayers - _headlessClients;
			hcRemoveAllGroups player;  
			 {player hcRemoveGroup _x ;} forEach (allGroups select {side _x == west}); 
			 _GRPs = (allGroups select {(side _x == (side player)) && !(((units _x) select 0) in switchableUnits)}); 
			if (count _humanPlayers == 1 ) then {
			{player hcSetGroup [_x];} forEach _GRPs;
			}else{
			{TheCommander hcSetGroup [_x];} forEach _GRPs;
			};

hint "YOU CANT SWITCH TO HUMAN PLAYERS";
};

if ((_Unt isKindOf  "Man") && (!isPlayer _Unt)) then {


if (!isNull (getAssignedCuratorLogic player)) then {
_PlayerWasZeus = 1 ;
}else{
_PlayerWasZeus = 0 ;
};	


	if (getConnectedUAV player != objNull) then {player connectTerminalToUAV objNull;};
 removeAllActions player ;
hcRemoveAllGroups player; 
_Group = createGroup West; 
{[_x] join _Group} forEach units (group player);

selectPlayer _Unt;
group player selectLeader player;

if (_PlayerWasZeus == 1) then {
unassignCurator ZEUS;
player assignCurator ZEUS;
};


for "_i" from count waypoints (group player) - 1 to 0 step -1 do
{deleteWaypoint [(group player), _i];};


private _headlessClients = entities "HeadlessClient_F";
private _humanPlayers = allPlayers - _headlessClients;
hcRemoveAllGroups player;  
 {player hcRemoveGroup _x ;} forEach (allGroups select {side _x == west}); 
 _GRPs = (allGroups select {(side _x == (side player)) && !(((units _x) select 0) in switchableUnits)}); 
if (count _humanPlayers == 1 ) then {
{player hcSetGroup [_x];} forEach _GRPs;
}else{
{TheCommander hcSetGroup [_x];} forEach _GRPs;
};

	
openMap [true, false]; 
openMap [false, false]; 

ShowHUD [true, true, true, true, true, true, true, true, true, true];
{_x enableAI "RADIOPROTOCOL"} foreach Units Group player;


if ((typeOf player == F_Assault_Eng)  || (typeOf player == "B_G_engineer_F")) then {
removeAllActions player;
[ player,
'Repair | Refuel | Rearm 10$',
'Screens\FOBA\iconRepairAt_ca.paa',
'Screens\FOBA\iconRepairAt_ca.paa',
'count nearestobjects [ (position player), ["Air", "Ship", "LandVehicle"], 10] > 0',       
'_caller distance _target < 10',  
{},
{},
{
_Cost = 10 ;
_mrkrs = allMapMarkers select {markerColor _x == 'Color2_FD_F'};
_mrkr = _mrkrs select 0;
_Money = parseNumber (markerText _mrkr) ;  
if (_Money >= _Cost) then {
_NewMoney = _Money - _Cost; 
_mrkr setMarkerText str _NewMoney;
[   
    _mrkr,   
    {   
        private _mrkr = _this;   
   
        // create marker data   
        private _markerData = [ALiVE_sys_marker,'addStandardMarker', [_mrkr,'west']] call ALiVE_fnc_marker;   
        [ALiVE_sys_marker,'addMarkerToStore', [_mrkr,_markerData]] call ALiVE_fnc_marker;   
    }   
] remoteExecCall ['call', 2];
_nearVeh = nearestObjects [Player,['Air','Ship','LandVehicle'],10] select 0; 
_nearVeh setDammage 0;
_nearVeh setFuel 1;
_nearVeh setVehicleAmmo 1;
}else{hint 'Not Enough Recources';};
},
{},
[],
11,
0,
false,
false
] call BIS_fnc_holdActionAdd;
};

if ((typeOf  player == F_Recon_Eod) || (typeOf  player == F_Recon_Med) || (typeOf  player == F_Recon_Eng) ||  (typeOf  player == F_Recon_Mg) || (typeOf  player == F_Recon_AT) || (typeOf  player == F_Recon_Mrk) || (typeOf  player == F_Recon_TL) || (typeOf player == "B_G_Soldier_TL_F")) then {
removeAllActions player;
[
	player,											
	'H.A.L.O',										
	'Screens\FOBA\iconParachute_ca.paa',	
	'Screens\FOBA\iconParachute_ca.paa',	
	' (getPosATL vehicle player) select 2 > 500 ',					
	'true',					
	{},												
	{},												
	{ 

{_x setPos ((getPos (vehicle player)) vectorAdd [(0 + (random 10)),(0 + (random 10)),(0 - (random 10))])} forEach units group player;
_Height = Position player select 2 ;
{[_x,_Height]  spawn BIS_fnc_halo} forEach units group player;
playMusic 'LeadTrack02_F_Mark';
[player] execVM "Scripts\HALO.sqf"; 
	},				
	{},													
	[],													
	3,													
	0,													
	false,												
	false												
] call BIS_fnc_holdActionAdd;	
};

if ((typeOf player == F_Assault_Uav) || (typeOf player == F_Assault_Med) || (typeOf player == F_Assault_AT) || (typeOf player == F_Assault_Amm) || (typeOf player == F_Assault_Mg) || (typeOf player == F_Assault_Eod) || (typeOf player == F_Assault_Mrk) || (typeOf player == F_Assault_SL) || (typeOf player == F_Assault_TL) || (typeOf player == "B_G_Soldier_SL_F")) then {
removeAllActions player;
[ player,   
 "<img size=2 color='#FFE496' image='Screens\FOBA\b_hq.paa'/><t font='PuristaBold' color='#FFE496'>Deploy Sandbags",   
'',   
'',   
'_target  == player',          
'_caller distance _target < 1',     
{player playMove "AinvPknlMstpSnonWnonDnon_medic_1" ; },   
{},   
{  
_pos =  player getRelPos [1, 0];  
_dir = getDirVisual player + 180;  
_veh = createVehicle ["Land_BagFence_Round_F", _pos, [], 0, "CAN_COLLIDE"];  
_veh setDir _dir;
_veh setVectorUp [0,0,1];
},   
{},   
[],   
6,   
5,   
false,   
false   
] call BIS_fnc_holdActionAdd;	


{_x linkItem 'NVGoggles_OPFOR'; } forEach Units LoadGroup;
_L linkItem 'B_UavTerminal';
_L addWeapon 'Rangefinder';
_L addWeapon 'launch_MRAWS_olive_F';
_L addSecondaryWeaponItem 'MRAWS_HEAT_F'; 
_L addItem 'optic_Hamr';

};

if ((typeOf player == F_Diver_Eod) || (typeOf player == F_Diver_Rfl) || (typeOf player == F_Diver_TL) || (typeOf player == "B_T_Diver_F")) then {
removeAllActions player;
[player] call EtV_Actions;
};


player addAction
	[
	"<t color='#7CC2FF'>" + localize "STR_KPPLM_ACTIONOPEN" + "</t>",
    {[] call KPPLM_fnc_openDialog;},
	nil,
    -803,
	true,		
	true,		
	"",			
	"true", 	
	5,			
	false,		
	"",			
	""			
];

{_x enableAI "RADIOPROTOCOL"} foreach Units Group player;

if ((isClass (configfile >> "CfgVehicles" >> "Box_cTab_items") == true) && !("ItemAndroid" in ((vestItems player + uniformitems player + backpackItems player))) ) then { player addItem "ItemAndroid"; };  
if ((isClass (configfile >> "CfgVehicles" >> "Box_cTab_items") == true) && !("ItemcTab" in ((vestItems player + uniformitems player + backpackItems player))) ) then { player addItem "ItemcTab"; }; 

hint "";
};

if (!(_Unt isKindOf  "Man") && (!isPlayer _Unt)) then {

	if (getConnectedUAV player != objNull) then {player connectTerminalToUAV objNull;};

[_Unt] execVM "Scripts\TEAMS_VEH.sqf" ;	
hint "";
};


};





































