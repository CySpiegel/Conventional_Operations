

_UNTTypeClass = _this Select 0 ;
UNTTypeClass = _this Select 0 ;
publicVariable "UNTTypeClass";

player setVariable ["PLAYER_Saved_Loadout",getUnitLoadout player];
sleep 1 ;

///// Set Existing Loadout ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        titleText ["Loading Existing Loadout", "BLACK IN",9999];

player setUnitLoadout _UNTTypeClass;
sleep 1 ;

{ [] execVM "Scripts\LDTGetServer.sqf" ; } remoteExec ["call", 2];

sleep 2 ;


        titleText ["Loading Existing Loadout", "BLACK IN",1];
///// Open ARSENAL////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


["Open", [true]] call BIS_fnc_arsenal;
sleep 1 ;

waitUntil { isNull ( uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ] )  };

        titleText ["New Loadout Saved", "BLACK IN",9999];
		
_UNTTypeName = str _UNTTypeClass ;
_missionTag = missionName;
_missionTag = [_missionTag] call BIS_fnc_filterString;
private _LoadOutName = _missionTag + _UNTTypeName;

TheCommander setVariable ["_NEW_Saved_Loadout",getUnitLoadout TheCommander];

profileNamespace setVariable [_LoadOutName, (TheCommander getVariable ["_NEW_Saved_Loadout",[]])];

{ [] execVM "Scripts\LDTSetServer.sqf" ; } remoteExec ["call", 2];

sleep 2 ;


player setUnitLoadout (player getVariable ["PLAYER_Saved_Loadout",[]]) ;

sleep 1 ;

        titleText ["New Loadout Saved", "BLACK IN",1];

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


