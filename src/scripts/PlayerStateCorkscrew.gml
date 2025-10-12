/// PlayerStateCorkscrew()
if (stateEntering) {
    exit;
}
if (stateExiting) {
    exit;
}

PlayerMoveX(xAcceleration, xFriction, xFriction * 1.7);
corkscrewObject = PlayerCollisionObjectMain(x, y, objCorkscrew);

if (abs(xSpeed) < 4 || corkscrewObject == noone) {
    StatesSet(PlayerStateAir);
    AnimationApply("LANDING");
}
else {
    var _relativePosition, _angleInCorkscrew;
    _relativePosition = x - corkscrewObject.x;
    _angleInCorkscrew = degtorad((_relativePosition)*360);

    //Set position acording to relative position to corkscrew
    y = lerp(y, corkscrewObject.y + 26 + (1+cos(_angleInCorkscrew/sprite_get_width(corkscrewObject.sprite_index)))*(55*0.5), 0.1 + abs(xSpeed)/15)


    if (animation == "CORKSCREW") {
        //Change animation frame depending on angle
        image_index = abs((radtodeg(degtorad((_relativePosition/sprite_get_width(corkscrewObject.sprite_index))*360))/360*10) mod 11);
    }
}

xDirection = esign(xSpeed, xDirection);
PlayerJump();
PlayerBoost(false);
