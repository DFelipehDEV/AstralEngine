/// PlayerSetTerrainType(type)
terrainType = argument0;
switch (terrainType) {
    case TerDirt:
        terrainSound[TerSkid] = sndSkidDirt;
        terrainSound[TerLand] = sndLandDirt;
        terrainSound[TerFootstep1] = sndFootstepDirt;
        terrainSound[TerFootstep2] = sndFootstepDirt2;
        break;
    case TerGrass:
        terrainSound[TerSkid] = sndSkidGrass;
        terrainSound[TerLand] = sndLandGrass;
        terrainSound[TerFootstep1] = sndFootstepGrass;
        terrainSound[TerFootstep2] = sndFootstepGrass2;
        break;
    case TerMetal:
        terrainSound[TerSkid] = sndSkidMetal;
        terrainSound[TerLand] = sndLandMetal;
        terrainSound[TerFootstep1] = sndFootstepMetal;
        terrainSound[TerFootstep2] = sndFootstepMetal2;
        break;
    case TerStone:
        terrainSound[TerSkid] = sndSkidStone;
        terrainSound[TerLand] = sndLandStone;
        terrainSound[TerFootstep1] = sndFootstepStone;
        terrainSound[TerFootstep2] = sndFootstepStone2;
        break;
    case TerWater:
        terrainSound[TerSkid] = sndSkidWater;
        terrainSound[TerLand] = sndLandWater;
        terrainSound[TerFootstep1] = sndFootstepWater;
        terrainSound[TerFootstep2] = sndFootstepWater;
        break;
    case TerWood:
        terrainSound[TerSkid] = sndSkidWood;
        terrainSound[TerLand] = sndLandWood;
        terrainSound[TerFootstep1] = sndFootstepWood;
        terrainSound[TerFootstep2] = sndFootstepWood2;
        break;
    default:
        Log("Error: Trying to set unexisting terrain type: " + string(terrainType));
        terrainType = TerStone;
}
