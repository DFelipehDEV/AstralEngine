/// PlayerTerrainSndUpdate()
 // Updates the player terrain sound effect
// Water terrain
if (PlayerCollisionObjectBottom(x, y, angle, maskBig, objWaterHorizon) || PlayerCollisionObjectMain(x, y, objFootstepSensorWater)) {
    terrainType = "WATER";
    terrainSound[TerSkid] = "snd/PlayerSkidWater";
    terrainSound[TerLand] = "snd/PlayerLandWater";
    terrainSound[TerFootstep1] = "snd/PlayerFootstepWater";
    terrainSound[TerFootstep2] = "snd/PlayerFootstepWater";
}

// Grass terrain
if (PlayerCollisionObjectMain(x, y, objFootstepSensorGrass)) {
    terrainType = "GRASS";
    terrainSound[TerSkid] = "snd/PlayerSkidGrass";
    terrainSound[TerLand] = "snd/PlayerLandGrass";
    terrainSound[TerFootstep1] = "snd/PlayerFootstepGrass";
    terrainSound[TerFootstep2] = "snd/PlayerFootstepGrass2";
}

// Dirt terrain
if (PlayerCollisionObjectMain(x, y, objFootstepSensorDirt)) {
    terrainType = "DIRT";
    terrainSound[TerSkid] = "snd/PlayerSkidDirt";
    terrainSound[TerLand] = "snd/PlayerLandDirt";
    terrainSound[TerFootstep1] = "snd/PlayerFootstepDirt";
    terrainSound[TerFootstep2] = "snd/PlayerFootstepDirt2";
}

// Stone terrain
if (PlayerCollisionObjectMain(x, y, objFootstepSensorStone)) {
    terrainType = "STONE";
    terrainSound[TerSkid] = "snd/PlayerSkidStone";
    terrainSound[TerLand] = "snd/PlayerLand";
    terrainSound[TerFootstep1] = "snd/PlayerFootstepStone";
    terrainSound[TerFootstep2] = "snd/PlayerFootstepStone2";
}

// Metal terrain
if (PlayerCollisionObjectMain(x, y, objFootstepSensorMetal)) {
    terrainType = "METAL";
    terrainSound[TerSkid] = "snd/PlayerSkidMetal";
    terrainSound[TerLand] = "snd/PlayerLandMetal";
    terrainSound[TerFootstep1] = "snd/PlayerFootstepMetal";
    terrainSound[TerFootstep2] = "snd/PlayerFootstepMetal2";
}

// Wood terrain
if (PlayerCollisionObjectMain(x, y, objFootstepSensorWood)) {
    terrainType = "WOOD";
    terrainSound[TerSkid] = "snd/PlayerSkidWood";
    terrainSound[TerLand] = "snd/PlayerLandWood";
    terrainSound[TerFootstep1] = "snd/PlayerFootstepWood";
    terrainSound[TerFootstep2] = "snd/PlayerFootstepWood2";
}
