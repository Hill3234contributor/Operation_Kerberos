#include "script_component.hpp"

ADDON = false;

PREP(end);
PREP(getAllMissionTargets);
PREP(handleRescuePoint);
PREP(spawn);
PREP(spawnSide);

PREPS(mainmission,__chooseLocation);
PREPS(mainmission,__getAmount);
PREPS(mainmission,__getRadius);
PREPS(mainmission,__spawn);
PREPS(mainmission,__spawnTargets);
PREPS(mainmission,_oneCounter_condition);
PREPS(mainmission,_oneCounter);
PREPS(mainmission,_rtb_condition);
PREPS(mainmission,_rtb);
PREPS(mainmission,_twoCounters_condition);
PREPS(mainmission,_twoCounters);
PREPS(mainmission,capture);
// PREPS(mainmission,clear_cond);
// PREPS(mainmission,clear);
PREPS(mainmission,device);
// PREPS(mainmission,dronecommando_cond);
// PREPS(mainmission,dronecommando);
PREPS(mainmission,emp);
PREPS(mainmission,hostage);
PREPS(mainmission,intel);
// PREPS(mainmission,prototype_cond);
// PREPS(mainmission,prototype);
PREPS(mainmission,radiotower);
PREPS(mainmission,scarab);
// PREPS(mainmission,specops_cond);
// PREPS(mainmission,specops);
PREPS(mainmission,weaponcache);

PREPS(sidemission,__spawn);
// PREPS(sidemission,clearArea);
PREPS(sidemission,radar);
// PREPS(sidemission,targetsAlive);

PREPS(taskmanager,__add);
PREPS(taskmanager,__cancelAll);
PREPS(taskmanager,__handle);
PREPS(taskmanager,__remove);
PREPS(taskmanager,__setState);
PREPS(taskmanager,add);
PREPS(taskmanager,addChild);
PREPS(taskmanager,handle);
PREPS(taskmanager,hasActiveMissions);
PREPS(taskmanager,init);
PREPS(taskmanager,remove);
PREPS(taskmanager,removeChild);
PREPS(taskmanager,setState);
PREPS(taskmanager,setStateChild);

PREPS(obj,callEvent);
// PREPS(obj,canCarry);
PREPS(obj,canDisable);
// PREPS(obj,canDownload);
// PREPS(obj,canDrop);
// PREPS(obj,createSandstorm);
PREPS(obj,disableDevice);
// PREPS(obj,disableSandstorm);
// PREPS(obj,doCarry);
PREPS(obj,doDisable);
// PREPS(obj,doDownload);
PREPS(obj,doDrop);
// PREPS(obj,doTriangulate);
PREPS(obj,effectEarthquake);
// PREPS(obj,effectSandstorm);
// PREPS(obj,handleCarry);
// PREPS(obj,initACEAction_case);
PREPS(obj,initACEAction_DataTerminal);
PREPS(obj,initACEAction_device);
PREPS(obj,initACEAction_secureIntel);
PREPS(obj,onCommanderCaptured);
PREPS(obj,onCommanderKilled);
PREPS(obj,onDeviceDestroyed);
PREPS(obj,onHostageKilled);
PREPS(obj,onHostageRescued);
PREPS(obj,onIntelFound);
PREPS(obj,onPrototypeKilled);
PREPS(obj,onPrototypeReturned);
PREPS(obj,onRadarDestroyed);
PREPS(obj,onRadiotowerDamaged);
PREPS(obj,onScarabDestroyed);
PREPS(obj,onScarabGunnerKilled);
PREPS(obj,onWeaponCacheDestroyed);
PREPS(obj,spawnEMP);
PREPS(obj,spawnNuke);
// PREPS(obj,triangulate);

ADDON = true;