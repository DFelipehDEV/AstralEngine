#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

active = false;
rotPrevious = image_angle;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Rotation

if (active) {
    image_angle += 6.4 * ownerID.xDirection;
    var _rot;
    with (ownerID) {
        animationAngle = other.image_angle;
        _rot = floorto(other.image_angle, 30); // Divide image_angle into 12 angles so its easier to it the intended direction
        x = (other.x - dcos(_rot)*14*xDirection) + dcos(_rot)*12*xDirection;
        y = (other.y + dsin(_rot)*14*xDirection) - dsin(_rot)*12*xDirection;

        // Create afterimage when changing the rotation
        if (other.rotPrevious != _rot) {
            AfterimageEffectCreate(x + dcos(_rot)*26*xDirection, y - dsin(_rot)*20*xDirection, animationSprite, animationFrame, 1, xDirection, 1, _rot, c_teal, c_blue);
        }

        // Jump
        if (keyActionPressed) {
            PlayerSetState(PlayerStateJump);
            xSpeed = dcos(_rot)*13*xDirection;
            ySpeed = -dsin(_rot)*10*xDirection;
            x += xSpeed;
            y += ySpeed;
            canMove = true;
            animationAngle = 0;
            interactDelay = 15;

            allowKeysTimer = 30;
            other.active = false;
            other.ownerID = noone;

            PlaySound("snd/PlayerSpin");
        }
    }
    rotPrevious = _rot; // Update previous rot to new rot
}
