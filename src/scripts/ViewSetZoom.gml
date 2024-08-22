/// ViewSetZoom(value[0...1])

var _zoomMultiplier;
_zoomMultiplier = argument0;
view_wview[0] = round(ScreenWidth * _zoomMultiplier);
view_hview[0] = round(ScreenHeight * _zoomMultiplier);
