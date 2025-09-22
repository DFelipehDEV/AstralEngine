/// HeavyStateChase()
if (stateEntering) {
    EnemySetAnimation(sprEnemyHeavyWalk, 0.15);
    exit;
}
if (stateExiting) {
    exit;
}

xSpeed = lerp(xSpeed, 3 * image_xscale, 0.1);
image_xscale = esign(target.x - x, image_xscale);

if (distance_to_object(target) > 160) {
    target = noone;
    StatesSet(HeavyStateNormal);
}

if (distance_to_object(target) < 30) {
    if (target.invincibility == InvincibilityNoone) {
        xSpeed = 0;
        PlaySound(sndWind, 1, random_range(0.5, 0.9));
        EnemySetAnimation(sprEnemyHeavyAttack, 0.17);
        StatesSet(HeavyStateAttack);
    }
}
