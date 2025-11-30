/// PlayerCollisionCache()
var _x, _y;
_x = floor(x);
_y = floor(y);

edgeCollision = PlayerCollisionLeftEdge(_x, _y, angle) && PlayerCollisionRightEdge(_x, _y, angle);
bottomCollision = PlayerCollisionBottom(_x, _y, angle, maskBig);
