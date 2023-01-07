
_AMMBX = _this select 0 ;

_Unts = nearestObjects [_AMMBX,["Man"], 70] select {(side _x == west) && (alive _x == true)} ;

	{
		_x setDammage 0; 

	} forEach _Unts ; 