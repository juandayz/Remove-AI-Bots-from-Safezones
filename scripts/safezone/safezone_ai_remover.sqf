

    //SAFEZONES UNITS AND VEHICLES REMOVER FROM SAFEZONES BY NOVA AND JUANDAYZ
     
    private ["_playerpos","_ai_to_be_removed","_Safezone_radio","_all_nearest_veh"];
     
     
    while {true} do {
     
    waitUntil {isInTraderCity};
     
    _playerpos = getPos (vehicle player);
    _player = player;
    _ai_to_be_removed = _playerpos nearEntities ["Man",350];
    _Safezone_radio = 350;
    _all_nearest_veh = _playerpos nearEntities [["LandVehicle","Helicopter","Plane","Ship"],_Safezone_radio];
     
    {
    if ((_x in allunits) and !(_x in serverTraders) and !(_x in playableunits))then{
     
    _x setdamage 1;
    deletevehicle _x;
    };
     
    } forEach _ai_to_be_removed;
     
    {
    if (vehicle _x getVariable ["aiveh",0] == 1) then {
    if (_player == driver _x) then {
    _x setVariable ["aiveh",0];
    }else{
    deletevehicle _x;
    _vehicleID = _x getVariable ["ObjectID", "0"];
    _vehicleUID = _x getVariable ["ObjectUID", "0"];
    [_vehicleID,_vehicleUID] call server_deleteObj;
    PVDZ_obj_Destroy = [_vehicleID,_vehicleUID,_x];
    publicVariableServer "PVDZ_obj_Destroy";
    };
    };
    } forEach _all_nearest_veh;
     
    uiSleep 5;
    };
