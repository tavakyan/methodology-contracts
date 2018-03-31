pragma solidity ^0.4.22;

import "cma.sol";
import "season.sol";


library BaselineUtility {
  enum BaselineTransportMode {
    DrivingAlone,
    PeriodicCarpool,
    CarPoolingOnly,
    AlternativeTransport,
    WorkFromHome
  };

  function preProgramCarpoolCoeff(uint[] daysPerWeekCarpooled)
    public seasonIndexedArrayIsValid(daysPerWeekCarpooled) returns (ufixed)
  {
    uint sumCarpoolsInSeasons;
    for(uint s = 0; s < NumSeasons; sId++) {
      sumCarpoolsInSeasons += daysPerWeekCarpooled[s].daysPerWeek;
    }
    // Not yet supported
    ufixed pcc = ufixed(sumCarpoolsInSeasons) / ufixed(5 * NumSeasons);
    return pcc;
  }

  function baselineEmissionQuantificationCoeff(uint[] daysPerWeekCommuteAlone)
    public seasonIndexedArrayIsValid(daysPerWeekCommuteAlone) returns (ufixed)
  {
    uint sumCommuteAloneInSeasons;
    for(uint s = 0; s < NumSeasons; sId++) {
      sumCommuteAloneInSeasons += daysPerWeekCommuteAlone[s].daysPerWeek;
    }
    // Not yet supported
    ufixed beqc = ufixed(sumCommuteAloneInSeasons) / ufixed(5 * NumSeasons);
    return beqc;
  }
}
