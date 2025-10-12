/// PlayerStateHomingFlight()
if (stateEntering) {

    exit;
}
if (stateExiting) {
    exit;
}

if (stateTimer > 15) StatesSet(PlayerStateNormal);

xDirection = esign(xSpeed, xDirection);
