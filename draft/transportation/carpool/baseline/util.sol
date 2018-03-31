pragma solidity ^0.4.22;

library BaselineUtility {
  uint constant WorkdaysInWeek = 5;

  enum TransportMode {
    DrivingAlone,
    PeriodicCarpool,
    CarPoolingOnly,
    AlternativeTransport,
    WorkFromHome
  };

  function preprogramCarpoolCoeff(uint[] daysPerWeekCarpooled)
    public seasonIndexedArrayIsValid(daysPerWeekCarpooled) returns (ufixed)
  {
    uint sumCarpoolsInSeasons;
    for(uint s = 0; s < NumSeasons; sId++) {
      sumCarpoolsInSeasons += daysPerWeekCarpooled[s].daysPerWeek;
    }
    // Not yet supported
    ufixed pcc = ufixed(sumCarpoolsInSeasons) / ufixed(WorkdaysInWeek * NumSeasons);
    return pcc;
  }

  function baselineEmissionCoeff(uint[] daysPerWeekCommuteAlone)
    public seasonIndexedArrayIsValid(daysPerWeekCommuteAlone) returns (ufixed)
  {
    uint sumCommuteAloneInSeasons;
    for(uint s = 0; s < NumSeasons; sId++) {
      sumCommuteAloneInSeasons += daysPerWeekCommuteAlone[s].daysPerWeek;
    }
    // Not yet supported - See https://github.com/ethereum/solidity/pull/3389 - seems nearing completion
    ufixed beqc = ufixed(sumCommuteAloneInSeasons) / ufixed(WorkdaysInWeek * NumSeasons);
    return beqc;
  }
}
