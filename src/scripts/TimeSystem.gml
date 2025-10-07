/// TimeSystem(event)
switch (argument0) {
    case ev_create:
        global.roomTick = 0;
        global.gameTimeAllow = true;
        global.gameTime = 0;
        global.timeScale = 1;
        break;

    case ev_step:
        if (GameStateGet(GameStatePaused)) exit;
        global.roomTick += 1;

        if (global.gameTimeAllow) {
            global.gameTime += 1000 / 60 * global.timeScale;
        }
        break;

    case ev_room_start:
        global.roomTick = 0;
        global.gameTime = global.playerCheckTime;
        break;
}
