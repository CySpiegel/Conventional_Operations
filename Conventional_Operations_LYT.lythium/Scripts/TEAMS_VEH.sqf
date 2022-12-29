
_Unt = _this select 0 ;

hcRemoveAllGroups player; 
_Group = createGroup West; 
{[_x] join _Group} forEach units (group player);

_VEH = vehicle _Unt;
GNR = gunner _VEH;
DVR = driver _VEH;

GNRT = "VEHICLE_GUNNER" ;
DVRT = "VEHICLE_DRIVER" ;

if (isNull GNR) then {GNRT = "" ;};


0 = [] spawn {

  _result = ["! Select Vehicle Role !", "", DVRT, GNRT,nil, false, false] call BIS_fnc_guiMessage;

  hint str _result;
if (_result) then {
					if (getConnectedUAV player != objNull) then {player connectTerminalToUAV objNull;};
			 removeAllActions player ;
			hcRemoveAllGroups player; 
			_Group = createGroup West; 
			{[_x] join _Group} forEach units (group player);

if (!isNull (getAssignedCuratorLogic player)) then {
_PlayerWasZeus = 1 ;
}else{
_PlayerWasZeus = 0 ;
};	

			selectPlayer DVR;

if (_PlayerWasZeus == 1) then {
unassignCurator ZEUS;
player assignCurator ZEUS;
};


			openMap [true, false]; 
			openMap [false, false]; 

			ShowHUD [true, true, true, true, true, true, true, true, true, true];
			{_x enableAI "RADIOPROTOCOL"} foreach Units Group player;
			hint "";

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
			
		if ((isClass (configfile >> "CfgVehicles" >> "Box_cTab_items") == true) && !("ItemAndroid" in ((vestItems player + uniformitems player + backpackItems player))) ) then { player addItem "ItemAndroid"; };  
		if ((isClass (configfile >> "CfgVehicles" >> "Box_cTab_items") == true) && !("ItemcTab" in ((vestItems player + uniformitems player + backpackItems player))) ) then { player addItem "ItemcTab"; }; 		
					 
			} ;

if (!_result) then {
						if (getConnectedUAV player != objNull) then {player connectTerminalToUAV objNull;};
			 removeAllActions player ;
			hcRemoveAllGroups player; 
			_Group = createGroup West; 
			{[_x] join _Group} forEach units (group player);

if (!isNull (getAssignedCuratorLogic player)) then {
_PlayerWasZeus = 1 ;
}else{
_PlayerWasZeus = 0 ;
};	

			selectPlayer GNR;

if (_PlayerWasZeus == 1) then {
unassignCurator ZEUS;
player assignCurator ZEUS;
};

			openMap [true, false]; 
			openMap [false, false]; 

			ShowHUD [true, true, true, true, true, true, true, true, true, true];
			{_x enableAI "RADIOPROTOCOL"} foreach Units Group player;
			hint "";

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
		if ((isClass (configfile >> "CfgVehicles" >> "Box_cTab_items") == true) && !("ItemAndroid" in ((vestItems player + uniformitems player + backpackItems player))) ) then { player addItem "ItemAndroid"; };  
		if ((isClass (configfile >> "CfgVehicles" >> "Box_cTab_items") == true) && !("ItemcTab" in ((vestItems player + uniformitems player + backpackItems player))) ) then { player addItem "ItemcTab"; }; 		
					 
			 };
};









