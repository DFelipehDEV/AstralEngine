/// PlayerHandleFootstepSensors()
// Water terrain
if (PlayerCollisionObjectBottom(x, y, angle, maskBig, objWaterHorizon) || PlayerCollisionObjectMain(x, y, objFootstepSensorWater)) {
    terrainType = "WATER";
    terrainSound[TerSkid] = sndSkidWater;
    terrainSound[TerLand] = sndLandWater;
    terrainSound[TerFootstep1] = sndFootstepWater;
    terrainSound[TerFootstep2] = sndFootstepWater;
}

// Grass terrain
if (PlayerCollisionObjectMain(x, y, objFootstepSensorGrass)) {
    terrainType = "GRASS";
    terrainSound[TerSkid] = sndSkidGrass;
    terrainSound[TerLand] = sndLandGrass;
    terrainSound[TerFootstep1] = sndFootstepGrass;
    terrainSound[TerFootstep2] = sndFootstepGrass2;
}

// Dirt terrain
if (PlayerCollisionObjectMain(x, y, objFootstepSensorDirt)) {
    terrainType = "DIRT";
    terrainSound[TerSkid] = sndSkidDirt;
    terrainSound[TerLand] = sndLandDirt;
    terrainSound[TerFootstep1] = sndFootstepDirt;
    terrainSound[TerFootstep2] = sndFootstepDirt2;
}

// Stone terrain
if (PlayerCollisionObjectMain(x, y, objFootstepSensorStone)) {
    terrainType = "STONE";
    terrainSound[TerSkid] = sndSkidStone;
    terrainSound[TerLand] = sndLandStone;
    terrainSound[TerFootstep1] = sndFootstepStone;
    terrainSound[TerFootstep2] = sndFootstepStone2;
}

// Metal terrain
if (PlayerCollisionObjectMain(x, y, objFootstepSensorMetal)) {
    terrainType = "METAL";
    terrainSound[TerSkid] = sndSkidMetal;
    terrainSound[TerLand] = sndLandMetal;
    terrainSound[TerFootstep1] = sndFootstepMetal;
    terrainSound[TerFootstep2] = sndFootstepMetal2;
}

// Wood terrain
if (PlayerCollisionObjectMain(x, y, objFootstepSensorWood)) {
    terrainType = "WOOD";
    terrainSound[TerSkid] = sndSkidWood;
    terrainSound[TerLand] = sndLandWood;
    terrainSound[TerFootstep1] = sndFootstepWood;
    terrainSound[TerFootstep2] = sndFootstepWood2;
}
