/// EnemyCheckTurn()
if (turnDistance > 0) {
    if (image_xscale < 0 && x <= xstart - turnDistance) return true;
    if (image_xscale > 0 && x >= xstart + turnDistance) return true;
}

return false;
