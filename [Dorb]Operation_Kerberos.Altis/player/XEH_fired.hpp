#include "script_component.hpp"
class B_Soldier_base_F {
	class ADDON {
		scope = 2;
		fired = QUOTE(If (!hasinterface) exitwith {};If (!local (_this select 0)) exitwith {};_this call FUNC(XEH_fired));
	};
};