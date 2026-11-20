#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
image_speed = 0;
icon = MonitorRings10;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//override grid 32,32,0,0
//field icon: enum(MonitorRings10,MonitorRings5,MonitorRingsRandom,MonitorEnergy,MonitorShieldNormal,MonitorShieldElectro,MonitorInvincibility,MonitorCombine,MonitorHurt)
/*preview
    var _index;
    _index = MonitorRings10;

    if (FieldDefined("icon")) {
        _index = Field("icon");
        switch (_index) {
            case MonitorHurt:
            case "MonitorHurt": _index = MonitorHurt; break;
            case MonitorRings5:
            case "MonitorRings5": _index = MonitorRings5; break;
            case MonitorRings10:
            case "MonitorRings10": _index = MonitorRings10; break;
            case MonitorRingsRandom:
            case "MonitorRingsRandom": _index = MonitorRingsRandom; break;
            case MonitorEnergy:
            case "MonitorEnergy": _index = MonitorEnergy; break;
            case MonitorShieldNormal:
            case "MonitorShieldNormal": _index = MonitorShieldNormal; break;
            case MonitorShieldElectro:
            case "MonitorShieldElectro": _index = MonitorShieldElectro; break;
            case MonitorInvincibility:
            case "MonitorInvincibility": _index = MonitorInvincibility; break;
            case MonitorCombine:
            case "MonitorCombine": _index = MonitorCombine; break;
            default:
                if (is_real(_index)) _index = floor(_index);
                else if (string_digits(_index) != "") _index = real(string_digits(_index));
                break;
        }
    }

    draw_sprite(Sprite("sprMonitorIcons", _index), 0, x, y);
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw monitor and icon
draw_sprite(sprMonitorIcons, icon, x, y);
draw_sprite(sprMonitor, 0, x, y);
