
OLDGRP = group player ;

[player] join grpNull ;

player setUnitLoadout (player getVariable ["Respawn_Saved_Loadout",[]]);
deleteVehicle (_this select 1);

if (player == TheCommander) then {
unassignCurator ZEUS;
player assignCurator ZEUS;
};




if ((typeOf player == F_Assault_Eng)  || (typeOf player == "B_G_engineer_F")) then {
[ player,
'Repair | Refuel | Rearm 5$',
'Screens\FOBA\iconRepairAt_ca.paa',
'Screens\FOBA\iconRepairAt_ca.paa',
'count nearestobjects [ (position player), ["Air", "Ship", "LandVehicle"], 6] > 0',       
'_caller distance _target < 7',  
{},
{},
{
_Cost = 5 ;
_mrkrs = allMapMarkers select {markerColor _x == 'Color2_FD_F'};
_mrkr = _mrkrs select 0;
_Money = parseNumber (markerText _mrkr) ;  
if (_Money >= _Cost) then {
_NewMoney = _Money - _Cost; 
_mrkr setMarkerText str _NewMoney;

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
{[_x,_Height] spawn BIS_fnc_halo} forEach units group player;
	{ unassignvehicle _x;} forEach units group player;
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


};

if ((typeOf player == F_Diver_Eod) || (typeOf player == F_Diver_Rfl) || (typeOf player == F_Diver_TL) || (typeOf player == "B_T_Diver_F")) then {
[player] call EtV_Actions; 

};


sleep 1 ;

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

if (count ((units OLDGRP) select {alive _x == true}) > 0) then {
		GNRT = "YES" ;
		DVRT = "NO" ;
		0 = [] spawn {
			  _result = ["REJOIN YOUR TEAM ?", "", DVRT, GNRT,nil, false, false] call BIS_fnc_guiMessage;

						if (_result) then {
						} ;

						if (!_result) then {
						[player] join OLDGRP ;	
						group player selectLeader player;						
						  };
		};
};