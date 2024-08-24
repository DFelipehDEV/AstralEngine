#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

DeactivateExceptionsAdd(id);
// Stop the game time from progressing
global.gameTimeAllow = false

// Play victory music
PlaySound("bgm/Victory", global.volumeMusic, 1, false);

// Stop music
if (instance_exists(objControllerMusic)) {
    objControllerMusic.fadeOut = true;
}

overlaysHeight = 0;                 //Overlays sprite height being drawn
resultsTimer = 0;                   //Overall timer for everything on this results code
characterX = ScreenWidth + 240;     //Character position
resultsBarScale = 0;                //Width scale of results/rank bar

scorebarX = -400;
scoreTextYOffset = 0;

// Set all score text X position
for (i = 0; i < 5; i += 1) {
    scoreTextX[i] = -200;
}


with (instance_create(x, y, objFadeIn)) {
    color = c_white;
}

// Score
scoreBonusTime = 0;                 //Amount of score that you got by your time
scoreBonusRing = 0;                 //Amount of score that you got by rings

// Score Values
scoreValueTime = max(0, 8000-floor(global.gameTime/50000)*4500);
scoreValueRing = max(0, global.playerRings*35);

scoreFinished = false;                 //Check if the score has reached its value

// Rank
rankIndex = -1;                     //Index of the rank you got dependent on your score
rankScale = 24;                     //Rank scale on screen when it shows up
rankTime = 0;                       //Used for rank animation when it pops up
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy

DeactivateExceptionsRemove(id);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Handle

resultsTimer += 1;

// Show overlays full image
if (resultsTimer > 50) {
    overlaysHeight = lerp(overlaysHeight, 33, 0.15)
}

// Character and score
if (resultsTimer > 80) {
    // Interpolate the player character to the right side of the screen
    characterX = lerp(characterX, ScreenWidth - 120, 0.08);

    // Increase the score/rank line width
    resultsBarScale = approach(resultsBarScale, ScreenWidth, 16)
}

// Score bars
if (resultsTimer > 110) {
    // Skip everything
    if (InputGet(InputAction, 0) && !scoreFinished) {
        sound_stop("bgm/Victory");

        // Skip everything
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
        sound_stop("snd/ResultsScoreCount")
    }

    // Show the score bar underlay on the screen
    scorebarX = lerp(scorebarX, 0, 0.1);

    // Scores animations
    if (resultsTimer > 130) {
        // Scores slowly appear on the screen each at the time
        scoreTextX[0] = lerp(scoreTextX[0], 8, 0.1);

        if (resultsTimer > 150) {
            scoreTextX[1] = lerp(scoreTextX[1], 8, 0.1);
        }

        if (resultsTimer > 170) {
            scoreTextX[2] = lerp(scoreTextX[2], 8, 0.1);
        }

        if (resultsTimer > 190) {
            scoreTextX[3] = lerp(scoreTextX[3], 8, 0.1);
        }

        if (resultsTimer > 210) {
            scoreTextX[4] = lerp(scoreTextX[4], 8, 0.1);
        }

        if (resultsTimer > 230) {
            // Scores
            scoreBonusTime = approach(scoreBonusTime, scoreValueTime, 100)
            scoreBonusRing = approach(scoreBonusRing, scoreValueRing, 100)

            scoreTextYOffset = -dsin(resultsTimer*2)*2


            // End results
            if (!scoreFinished && scoreBonusTime == scoreValueTime
            && scoreBonusRing == scoreValueRing) {
                scoreFinished = true;
                PlaySound("snd/ResultsScoreTotal");
                sound_stop("snd/ResultsScoreCount")
            }


            // Check if the score is still being written
            if (!scoreFinished) {
                if (!sound_isplaying("snd/ResultsScoreCount")) {
                    PlaySound("snd/ResultsScoreCount", global.volumeSounds, 1, true);
                }
            }

            if (resultsTimer > 370) {
                // Play the results music after victory music ended
                if (!sound_isplaying("bgm/Results")) {
                    PlaySound("bgm/Results", global.volumeMusic, 1, false);
                }
            }

            // Ranking
            if (resultsTimer > 300
            && scoreFinished) {
                // Check if the rank has not been given
                if (rankIndex == -1) {
                    // C Rank
                    if (scoreBonusTime + scoreBonusRing < global.stageRank[RankB]) {
                        rankIndex = RankC;
                    }

                    // B Rank
                    if (scoreBonusTime + scoreBonusRing >= global.stageRank[RankB] && scoreBonusTime + scoreBonusRing < global.stageRank[RankA]) {
                        rankIndex = RankB;
                    }

                    // A Rank
                    if (scoreBonusTime + scoreBonusRing >= global.stageRank[RankA] && scoreBonusTime + scoreBonusRing < global.stageRank[RankS]) {
                        rankIndex = RankA;
                    }

                    // S Rank
                    if (scoreBonusTime + scoreBonusRing >= global.stageRank[RankS]) {
                        rankIndex = RankS;
                    }
                }
                else {
                    // Rank show animation
                    rankTime = min(rankTime + 1, 60);
                    rankScale = abs(ease(rankTime, 24, -23, 60, "OutBounce"))

                    // Check if you got a S Rank and then spawn stars particles on the rank visual
                    if (rankIndex == RankS && resultsTimer mod 8 == 4 && rankScale < 5) {
                        DummyEffectCreate(view_xview[0] + 280 + random_range(-20, 20), view_yview[0] + 221 + random_range(-20, 20), sprVFXStar1, 0.2, 0, -999999991, bm_normal, 1, 1, 1, 0);
                    }

                    // Check if the rank animation is near ended
                    if (rankTime == 50) {
                        // Play different voicelines for each rank
                        switch (rankIndex) {
                            case RankS:
                                PlaySound("snd/ResultsRanked");
                                PlaySound(choose("snd/SonicVoice7", "snd/SonicVoice8"));
                                break;

                            case RankA:
                                PlaySound("snd/ResultsRanked");
                                PlaySound("snd/SonicVoice9");
                                break;

                            case RankB:
                                PlaySound("snd/ResultsRanked");
                                PlaySound("snd/SonicVoice10");
                                break;

                            case RankC:
                                PlaySound("snd/ResultsRanked");
                                PlaySound("snd/SonicVoice11");
                                break;
                        }
                    }


                    // End results screen
                    if (InputGet(InputAction, 0) && !instance_exists(objFadeNext)) {
                        // Fade to next room
                        with (instance_create(0, 0, objFadeNext)) {
                            color = c_white;
                            PlayerGlobalsReset();
                        }
                    }

                }


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
/// Draw interface

var _viewX, _viewY;
_viewX = view_xview[0];
_viewY = view_yview[0];

d3d_set_projection_ortho(_viewX, _viewY, ScreenWidth, ScreenHeight, 0) // Stop HUD from resizing
// Draw background
draw_sprite(sprResultsBG1, 0, _viewX, _viewY);

// Draw score underlay after a certain amount of time has passed
if (resultsTimer > 80) {
    // Draw score underlay
    draw_sprite(sprResultsScoresUnderlay, 0, _viewX + scorebarX, _viewY + 33);

    // Shadow from the character
    d3d_set_fog(1, c_white, 0, 0)
    draw_sprite_ext(sprTitleCardChar, 0, _viewX + characterX + 20, _viewY + 130, max(abs(-dsin(current_time/9)*1.3), 1), max(abs(-dsin(current_time/9)*1.3), 1), -dsin(current_time/11)*20, c_white, 1);
    d3d_set_fog(0, 0, 0, 0)

    // Draw main character
    draw_sprite_ext(sprTitleCardChar, 0, _viewX + characterX, _viewY + 130, 1, 1, -dsin(current_time/11)*20, c_white, 1)

    draw_sprite_ext(sprTitleCardZoneCard, 0, _viewX, _viewY + ScreenHeight - 80, resultsBarScale, 0.7, 0, c_white, 1)
}
// Draw top overlay
draw_sprite_part(sprResultsOverlays, 0, 0, 0, 512, overlaysHeight, _viewX, _viewY);

// Draw bottom overlay
draw_sprite_part_ext(sprResultsOverlays, 1, 0, 0, 512, overlaysHeight, _viewX, _viewY + ScreenHeight, 1, -1, c_white, 1);


// Draw score text after a certain amount of time has passed
if (resultsTimer > 130) {
    // Draw font and alignment for the score text
    draw_set_font(global.fontResults)
    draw_set_halign(fa_left)
    // Draw time text and the stage finish time
    draw_sprite(sprResultsTexts, 0, _viewX + scoreTextX[0], (_viewY + scoreTextYOffset) + 64);
    draw_text(_viewX + scoreTextX[0] + 94, (_viewY + scoreTextYOffset) + 64, string(string(floor(global.gameTime/60000))+":"+StringNumberFormat(floor(global.gameTime/1000) mod 60,2)+":"+StringNumberFormat(floor(global.gameTime/10) mod 100,2)))

    // Draw ring text and the amount of rings
    draw_sprite(sprResultsTexts, 1, _viewX + scoreTextX[1], (_viewY + scoreTextYOffset) + 96);
    draw_text(_viewX + scoreTextX[1] + 94, (_viewY + scoreTextYOffset) + 96, string(floor(global.playerRings)))

    // Draw time bonus text and score
    draw_sprite(sprResultsTexts, 2, _viewX + scoreTextX[2], (_viewY + scoreTextYOffset) + 132);
    draw_text(_viewX + scoreTextX[2] + 94, (_viewY + scoreTextYOffset) + 132, string(floor(scoreBonusTime)))

    // Draw ring bonus text and score
    draw_sprite(sprResultsTexts, 3, _viewX + scoreTextX[3], (_viewY + scoreTextYOffset) + 165);
    draw_text(_viewX + scoreTextX[3] + 94, (_viewY + scoreTextYOffset) + 165, string(floor(scoreBonusRing)))

    // Draw total score text and show the score total
    draw_sprite(sprResultsTexts, 4, _viewX + scoreTextX[4], (_viewY + scoreTextYOffset) + 218);
    draw_text(_viewX + scoreTextX[4] + 78, (_viewY + scoreTextYOffset) + 220, string(floor(scoreBonusTime + scoreBonusRing)))

}


// Ranks
if (resultsTimer > 300 && scoreFinished) {
    switch (rankIndex) {
        case RankS:
            draw_sprite_ext(sprResultsRanks, 0, _viewX + 280, _viewY + 221, rankScale, rankScale, 0, c_white, 1);
            break;

        case RankA:
            draw_sprite_ext(sprResultsRanks, 1, _viewX + 280, _viewY + 221, rankScale, rankScale, 0, c_white, 1);
            break;

        case RankB:
            draw_sprite_ext(sprResultsRanks, 2, _viewX + 280, _viewY + 221, rankScale, rankScale, 0, c_white, 1);
            break;

        case RankC:
            draw_sprite_ext(sprResultsRanks, 3, _viewX + 280, _viewY + 221, rankScale, rankScale, 0, c_white, 1);
            break;
    }
}
