# Remove-AI-Bots-from-Safezones

By nova and me!

This script is used to remove ai from missions like dzai, wai or whatever other mod that you are using with ai bots.

1-Open your init and find:
```ruby
if (DZE_R3F_WEIGHT) then {execVM "\z\addons\dayz_code\external\R3F_Realism\R3F_Realism_Init.sqf";};
```
below paste:
```ruby
// REMOVE AI FROM Safe Zones 
    [] execVM "scripts\safezone\safezone_ai_remover.sqf";
```

***2-How to Disallow DZAI AI into safezones.
open DZAI\init\dzai_functions.sqf  and find:

```ruby
 DZAI_protectObject = {
    private ["_objectMonitor","_object"];
    _object = _this;
    
    _objectMonitor = missionNamespace getVariable [DZAI_serverObjectMonitor,[]];
    _objectMonitor set [count _objectMonitor,_object];
    DZAI_monitoredObjects set [count DZAI_monitoredObjects,_object];
    _object setVariable ["ObjectID",""];
    _object setVariable ["ObjectUID",""];
    true
}; 
```
Above "true" paste:
```ruby
 _object setvariable ["aiveh",1,true]; 
 ```
 
 ***3-How to Disallow DZMS AI into safezones.
 Open DZMS\DZMSFunctions.sqf and find:
 
```ruby
DZMSProtectObj = {
private ["_object","_objectID"];
    _object = _this select 0;
    
    _objectID = str(round(random 999999));
    _object setVariable ["ObjectID", _objectID, true];
    _object setVariable ["ObjectUID", _objectID, true];
    _object setVectorUp surfaceNormal position _object;
```
Just below paste:
```ruby
_object setvariable ["aiveh",1,true];
```

***4-How to disaLLOW WAI AI into safezones
open wai\compile\vehicle_patrol.sqf find: 

```ruby
_vehicle = createVehicle [_veh_class, [(_startingpos select 0),(_startingpos select 1), 0], [], 0, "CAN_COLLIDE"];
_vehicle setFuel 1;
_vehicle engineOn true;
_vehicle setVehicleAmmo 1;
_vehicle addEventHandler ["GetOut",{(_this select 0) setFuel 0;(_this select 0) setDamage 1;}];
_vehicle allowCrewInImmobile true; 
_vehicle lock true;
     
dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_vehicle];
```
Just below paste:
```ruby
_vehicle setvariable ["aiveh",1,true]; 
```

***Examples in case you have anothers AI.

Example 1.
```ruby


_vehicle_11 = objNull;
if (true) then
{
  _this = createVehicle ["BAF_Offroad_W", [(_pos select 0) - 4.5, (_pos select 1) - 5,-0.012], [], 0, "CAN_COLLIDE"];
  _vehicle_11 = _this;
  dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_this];
  
  _this setvariable ["aiveh",1,true];//THIS IS THE VARIABLE TO REMOVE THE AI FROM SAFEZONES
};
```

Example 2.

```ruby


_carrier =  createVehicle [_plane_class, [(_positionp select 0) + 50, (_positionp select 1) + 50],[], 0, "FLY"];
_carrier         setVehicleVarName "heli";
_carrier         setFuel 1;
_carrier         engineOn true;

{_carrier removeWeapon _x} forEach weapons _carrier;
_carrier addweapon "M230";
_carrier addmagazine "1200Rnd_30x113mm_M789_HEDP";
//_carrier addweapon "M240_veh";
//_carrier addmagazine "1200Rnd_762x51_M240";
_carrier         setVehicleAmmo 1;
_carrier         flyInHeight 150;
_carrier        limitSpeed 60;
_carrier         setVehicleLock "LOCKED";
_carrier         addEventHandler ["GetOut",{(_this select 0) setFuel 0;(_this select 0) setDamage 1;}];
dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_carrier];

_carrier setvariable ["aiveh",1,true];///THIS IS THE VAR TO REMOVE AI FROM SAFEZONES
```



   
    
