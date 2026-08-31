/// PlayerUpdateReticle()
if (hasHomingAttack && canHome) {
    var _dir;
    _dir = PlayerGetInputDirection();

    if (!instance_exists(homingReticle)) {
        var _bestTarget, _bestDist, _candidate, _candDist, _index, _count, i;
        _bestTarget = noone;
        _bestDist = homingRange + 1;
        _count = ds_list_size(homingObjects);

        for (i = 0; i < _count; i += 1) {
            _index = ds_list_find_value(homingObjects, i);
            if (instance_exists(_index)) {
                _candidate = instance_nearest(x, y, _index);
                if (instance_exists(_candidate)) {
                    _candDist = distance_to_object(_candidate);
                    if (_candDist < _bestDist
                    && (sign(_candidate.x - x) == _dir || sign(_candidate.x - x) == 0)
                    && y < _candidate.y + homingYThreshold) {
                        _bestDist = _candDist;
                        _bestTarget = _candidate;
                    }
                }
            }
        }

        if (_bestTarget != noone) {
            if (!PlayerCheckRay(x, y, _bestTarget.x, _bestTarget.y)) {
                homingReticle = instance_create(_bestTarget.x, _bestTarget.y, objPlayerReticle);
                homingReticle.target = _bestTarget;
            }
        }
    } else {
        if (instance_exists(homingReticle.target)) {
            if (distance_to_object(homingReticle.target) > homingRange
            || sign(homingReticle.target.x - x) != _dir
            || y >= homingReticle.target.y + homingYThreshold
            || PlayerCheckRay(x, y, homingReticle.target.x, homingReticle.target.y)) {
                // Destroy reticle if the target is no longer valid and not in the homing attack state
                if (state != PlayerStateHomingAttack) {
                    instance_destroy_id(homingReticle);
                    homingReticle = noone;
                }
            }
        } else if (state != PlayerStateHomingAttack) {
            // Destroy the reticle if the target no longer exists
            instance_destroy_id(homingReticle);
            homingReticle = noone;
        }
    }
}
