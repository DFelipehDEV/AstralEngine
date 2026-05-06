/// TimeSystem(event)
switch (argument0) {
    case ev_room_end:
    case ev_create:
        global.gameTimeAllow = true;
        global.gameTime = 0;
        global.timeScale = 1;
        break;

    case ev_step:
        if (GameStateGet(GameStatePaused)) exit;

        if (global.gameTimeAllow) {
            global.gameTime += 1000 / 60 * global.timeScale;
        }
        break;
}
