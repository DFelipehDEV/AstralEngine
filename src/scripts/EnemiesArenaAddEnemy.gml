/// EnemiesArenaAddEnemy(number, x, y, object, health, phase)

var _enemyNumber;
_enemyNumber = argument0;

enemy[_enemyNumber, 0] = argument1;
enemy[_enemyNumber, 1] = argument2;
enemy[_enemyNumber, 2] = argument3;
enemy[_enemyNumber, 3] = argument4;
enemy[_enemyNumber, 4] = argument5;

if (argument5 > phaseMax) {
    phaseMax = argument5;
}

enemyMax += 1;
