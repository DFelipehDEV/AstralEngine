#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
// Destroy while in GMdebug mode
if (debug_mode) {
    instance_destroy();
    exit;
}

MarkAsActive();
World.gameTimeAllow = false;

stageName = string_upper(room_get_name(room));

stageName = string_delete(stageName, 1, 2); // Remove the initial 'rm' from the name
stageName = string_replace_all(stageName, "_", " "); // Replace all '_' by whitespaces

cardZoneScale = 1;

cardCenterX = ScreenWidthHalf;
cardCenterY = ScreenHeightHalf;

cardColor1 = ColorPrimary;
cardColor2 = ColorPrimaryLight;

cardBackAlpha = 1;
cardLineAlpha = 1;

cardTimer = 230; // Duration

cardCharX = 0;
cardCharSpeed = 1;
cardCharAlpha = 1;

cardDashX = 0; // "Arrows" sign position

// Bottom Shape
cardShape1X = cardCenterX;
cardShape1Y = cardCenterY;

// Top Shape
cardShape2X = cardCenterX;
cardShape2Y = cardCenterY;

cardReturnOffset = 0;
cardResultOffset = 0;

delay = 30;
shapeTimer = 0;

player = noone;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Disable player input
if (delay == 30) {
    if (player != noone) {
        with (player) {
            allowKeys = false;
            PlayerResetKeys();
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Position
delay = max(delay - 1, 0)

// Exit while waiting for delay
if (delay) exit;
cardCharX += cardCharSpeed;

// While far of the center of the screen, keep going fast
if (cardCharX < cardCenterX - 157) {
    cardCharSpeed = 5.5;
}
else {
    // Decelerate while getting near of the center
    if (cardCharSpeed > 0.1) {
        cardCharSpeed -= 0.1;
    }
}

if (cardTimer < 210) {
    // Dash sign position
    cardDashX += 6;

    // Back to the start if it has reached the screen limit
    if (cardDashX > (ScreenWidth) + sprite_get_width(sprTitleCardDash)) {
        cardDashX = -sprite_get_width(sprTitleCardDash);
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Timers

// Exit while waiting for delay
if (delay) exit;

cardTimer -= 1;

if (cardTimer < 30) {
    if (cardTimer < 5) {
        cardReturnOffset += 4;
        cardResultOffset = lerp(cardResultOffset, cardReturnOffset, 0.1);
        // Give player control
        if (player != noone) {
            player.allowKeys = true;
            World.gameTimeAllow = true;
        }
    }

    if (cardZoneScale > 0) {
        cardZoneScale -= 12;
    }


    // Destroy card
    if (cardTimer < -50) {
        instance_destroy();
    }
}

// Fade background
if (cardTimer < 40) {
    if (cardBackAlpha > 0) {
        cardBackAlpha -= 0.02;
    }
}

// Shapes
if (cardTimer < 230 && cardTimer > 120) {
    var _time;
    _time = 90;

    shapeTimer = min(shapeTimer + 1, _time);
    //Approach to the borders of the screen
    cardShape1X = ease(shapeTimer, cardCenterX, (ScreenWidth+25)-cardCenterX, _time, "OutExpo");

    cardShape2X = ease(shapeTimer, cardCenterX, cardCenterX - (ScreenWidth), _time, "OutExpo");


    cardZoneScale = min(cardZoneScale + 12, ScreenWidth);
}

if (cardTimer < 9) {
    cardCharAlpha -= 0.04;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw title card
BeginUI();

// Draw background left
draw_background_ext(bgTitleCard, -cardResultOffset*8, 0, 1, 1, 0, c_white, cardBackAlpha);

// Draw background right
draw_background_ext(bgTitleCard, (cardResultOffset*8) + 256, 0, 1, 1, 0, c_white, cardBackAlpha);

// Draw character
draw_sprite_ext(sprTitleCardChar, 0, cardCharX + cardResultOffset*9, (dsin(current_time/6)*8) + cardCenterY, 1 + cardResultOffset/12, 1 + cardResultOffset/12, 0, cardColor1, cardCharAlpha);

draw_set_alpha(cardLineAlpha);

// Draw zone card
DrawBar(0, cardCenterY, cardZoneScale, 39);

if (cardResultOffset == 0) {
    // Draw dash sign
    draw_sprite_ext(sprTitleCardDash, 0, cardDashX, cardCenterY, 1, 1, 0, cardColor2, cardLineAlpha);
}

// Draw text
draw_set_font(fontImpact24);
draw_set_halign(fa_center);
draw_text(cardCharX + cardResultOffset*7, cardCenterY, stageName);
draw_set_halign(-1);
draw_set_font(1);

// Draw bottom shape
draw_background_ext(bgTitleCardCorner, (cardResultOffset) + cardShape1X - 256, cardResultOffset, 1, 1, 0, c_white, cardLineAlpha);

// Draw top shape
draw_background_ext(bgTitleCardCorner, (-cardResultOffset) + cardShape2X + 256, (-cardResultOffset) + 288, -1, -1, 0, c_white, cardLineAlpha);

// Draw a line in the top
draw_rect(0, -cardResultOffset*2.5, ScreenWidth, 11, cardColor2, cardLineAlpha);

// Draw a line in the bottom
draw_rect(0, (ScreenHeight-11) + cardResultOffset*2.5, ScreenWidth, 11, cardColor2, cardLineAlpha);
draw_set_alpha(1);

EndUI();
