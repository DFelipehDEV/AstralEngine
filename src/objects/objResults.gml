#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
MarkAsActive();
audio_music_switch_ext(bgmVictory, 20, 20, 1, 0, 1, false);

// Initialize variables
time = 0;
rings = 0;
scoreValueTime = 0;
scoreValueRing = 0;
scoreBonusTime = 0;
scoreBonusRing = 0;
scoreFinished = false;
overlaysHeight = 0;
resultsTimer = 0;
characterX = ScreenWidth + 240;
resultsBarScale = 0;
scorebarX = -400;
scoreTextYOffset = 0;

// Initialize score text positions
for (i = 0; i < 5; i += 1) {
    scoreTextX[i] = -200;
}

// Rank variables
rankIndex = -1;
rankScale = 24;
rankTime = 0;

minimumScore[RankC] = 2500;
minimumScore[RankB] = 4000;
minimumScore[RankA] = 6000;
minimumScore[RankS] = 8500;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Handle
resultsTimer += 1;

if (resultsTimer > 50)
    overlaysHeight = lerp(overlaysHeight, 33, 0.15);

if (resultsTimer > 80) {
    characterX = lerp(characterX, ScreenWidth - 120, 0.08);
    resultsBarScale = approach(resultsBarScale, ScreenWidth, 16);
}

if (resultsTimer > 110) {
    if (sysinput_get("accept") && !scoreFinished) {
        audio_stop(bgmVictory);
        resultsTimer = 290;
        scorebarX = 0;
        scoreTextX[0] = 8;
        scoreTextX[1] = 8;
        scoreTextX[2] = 8;
        scoreTextX[3] = 8;
        scoreTextX[4] = 8;
        scoreBonusTime = scoreValueTime;
        scoreBonusRing = scoreValueRing;
        scoreFinished = true;
        audio_stop(sndResultsScoreCount);
    }

    scorebarX = lerp(scorebarX, 0, 0.1);
}

if (resultsTimer > 130) {
    scoreTextX[0] = lerp(scoreTextX[0], 8, 0.1);
    if (resultsTimer > 150) scoreTextX[1] = lerp(scoreTextX[1], 8, 0.1);
    if (resultsTimer > 170) scoreTextX[2] = lerp(scoreTextX[2], 8, 0.1);
    if (resultsTimer > 190) scoreTextX[3] = lerp(scoreTextX[3], 8, 0.1);
    if (resultsTimer > 210) scoreTextX[4] = lerp(scoreTextX[4], 8, 0.1);
}

if (resultsTimer > 230) {
    scoreBonusTime = approach(scoreBonusTime, scoreValueTime, 100);
    scoreBonusRing = approach(scoreBonusRing, scoreValueRing, 100);
    scoreTextYOffset = -dsin(resultsTimer * 2) * 2;

    if (!scoreFinished && scoreBonusTime == scoreValueTime && scoreBonusRing == scoreValueRing) {
        scoreFinished = true;
        PlaySound(sndResultsScoreTotal);
        audio_stop(sndResultsScoreCount);
    }

    if (!scoreFinished) {
        if (!audio_isplaying(sndResultsScoreCount))
            PlaySound(sndResultsScoreCount, 1, 1, true);
    }

    if (resultsTimer > 370) {
        if (!audio_isplaying(bgmResults))
            PlaySound(bgmResults, global.musicVolume);
    }

    if (resultsTimer > 300 && scoreFinished) {
        if (rankIndex == -1) {
            var _totalScore;
            _totalScore = scoreBonusTime + scoreBonusRing;
            if (_totalScore < minimumScore[RankB])
                rankIndex = RankC;
            else if (_totalScore < minimumScore[RankA])
                rankIndex = RankB;
            else if (_totalScore < minimumScore[RankS])
                rankIndex = RankA;
            else
                rankIndex = RankS;
        } else {
            rankTime = min(rankTime + 1, 60);
            rankScale = abs(ease(rankTime, 24, -23, 60, "OutBounce"));

            if (rankIndex == RankS && resultsTimer mod 8 == 4 && rankScale < 5) {
                CreateDummy(view_xview[0] + 280 + random_range(-20, 20), view_yview[0] + 221 + random_range(-20, 20),
                    sprStar, 0.2, 0, -999999991, bm_normal, 1, 1, 1, 0);
            }

            if (rankTime == 50) {
                PlaySound(sndResultsRanked);
                switch (rankIndex) {
                    case RankS: PlaySound(choose(sndSonicVoice7, sndSonicVoice8)); break;
                    case RankA: PlaySound(sndSonicVoice9); break;
                    case RankB: PlaySound(sndSonicVoice10); break;
                    case RankC: PlaySound(sndSonicVoice11); break;
                }
            }

            if (sysinput_get("accept")) {
                SaveSetValue("PreviousRoom", room_get_name(room));
                SaveSetRoomAsCompleted(room, time, rings);
                SaveGame();
                TransitionFadeNext(c_white);
                PlayerResetGlobalVariables();
            }
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw
BeginUI();

draw_sprite(sprResultsBG1, 0, 0, 0);

if (resultsTimer > 80) {
    draw_sprite(sprResultsScoresUnderlay, 0, scorebarX, 33);

    d3d_set_fog(1, c_white, 0, 0);
    draw_sprite_ext(sprTitleCardChar, 0, characterX + 20, 130, max(abs(-dsin(current_time/9)*1.3), 1),
        max(abs(-dsin(current_time/9)*1.3), 1), -dsin(current_time/11)*20, c_white, 1);
    d3d_set_fog(0, 0, 0, 0);

    draw_sprite_ext(sprTitleCardChar, 0, characterX, 130, 1, 1, -dsin(current_time/11)*20, c_white, 1);
    draw_sprite_ext(sprTitleCardZoneCard, 0, 0, ScreenHeight - 80, resultsBarScale, 0.7, 0, c_white, 1);
}

draw_sprite_part(sprResultsOverlays, 0, 0, 0, 512, overlaysHeight, 0, 0);
draw_sprite_part_ext(sprResultsOverlays, 1, 0, 0, 512, overlaysHeight, 0, ScreenHeight, 1, -1, c_white, 1);

if (resultsTimer > 130) {
    draw_set_font(global.fontResults);
    draw_set_halign(fa_left);

    var _scoreY, _timeStr;
    _scoreY = scoreTextYOffset;
    _timeStr = string(floor(time/60000)) + ":"
        + string_pad(floor(time/1000) mod 60, 2)
        + ":" + string_pad(floor(time/10) mod 100, 2);

    draw_sprite(sprResultsTexts, 0, scoreTextX[0], _scoreY + 64);
    draw_text(scoreTextX[0] + 94, _scoreY + 64, _timeStr);

    draw_sprite(sprResultsTexts, 1, scoreTextX[1], _scoreY + 96);
    draw_text(scoreTextX[1] + 94, _scoreY + 96, string(floor(rings)));

    draw_sprite(sprResultsTexts, 2, scoreTextX[2], _scoreY + 132);
    draw_text(scoreTextX[2] + 94, _scoreY + 132, string(floor(scoreBonusTime)));

    draw_sprite(sprResultsTexts, 3, scoreTextX[3], _scoreY + 165);
    draw_text(scoreTextX[3] + 94, _scoreY + 165, string(floor(scoreBonusRing)));

    draw_sprite(sprResultsTexts, 4, scoreTextX[4], _scoreY + 218);
    draw_text(scoreTextX[4] + 78, _scoreY + 220, string(floor(scoreBonusTime + scoreBonusRing)));
}

if (resultsTimer > 300 && scoreFinished) {
    draw_sprite_ext(sprResultsRanks, rankIndex, 280, 221, rankScale, rankScale, 0, c_white, 1);
}

EndUI();
