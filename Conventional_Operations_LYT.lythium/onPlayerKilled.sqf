	
	if (getConnectedUAV player != objNull) then {player connectTerminalToUAV objNull;};
	
player setVariable ["Respawn_Saved_Loadout",getUnitLoadout player];

BIS_DeathBlur ppEffectAdjust [0.0]; 
BIS_DeathBlur ppEffectCommit 0.0;

sleep 1;

(_this select 0) setPos [0,0,0] ;

ShowHUD [true, true, true, true, true, true, true, true, true, true];

BIS_DeathBlur ppEffectAdjust [0.0]; 
BIS_DeathBlur ppEffectCommit 0.0;



