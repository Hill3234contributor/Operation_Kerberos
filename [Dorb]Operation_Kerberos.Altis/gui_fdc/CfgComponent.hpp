/*
 *  Author: Dorbedo
 *
 *  Description:
 *      the config of the component
 *
 */
#define CBA_OFF
#include "script_component.hpp"

class DOUBLES(CfgComponent,ADDON) {
    class preinit {};
    class dependencies {
        CfgPatches[] = {"cba_common","ace_weather"};
        CfgComponents[] = {"common","gui","gui_echidna"};
    };
    class features {

    };
};
#include "config\arsenal.hpp"