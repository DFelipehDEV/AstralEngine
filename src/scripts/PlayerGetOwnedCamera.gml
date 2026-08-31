/// PlayerGetOwnedCamera()
// returns the player's cam if the cam exists AND is owned by the player
if (!instance_exists(cam)) return noone;
if (cam.target == id) return cam;
