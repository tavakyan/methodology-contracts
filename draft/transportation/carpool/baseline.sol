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
    // Not yet supported - See https://github.com/ethereum/solidity/pull/3389 - seems nearing completion
    ufixed beqc = ufixed(sumCommuteAloneInSeasons) / ufixed(5 * NumSeasons);
    return beqc;
  }
}

contract BaselineService {
  // altTransportDistance comes from oracle or carpool server
  function minAltTransportTime(Commmuter c) returns (uint) {
    // get value from oracle or server (must be anonymous, not reveal residential or work address)
    uint constant duration = 0;
    return duration;
  }

  function altTransportAvailable(Commuter c) returns (bool){
    uint constant deltaSeconds = 15 * 60; // 15 minutes in seconds
    if ( c.commuteTime + delta <= minAltTransportTime(c)) {
      return true;
    }
    return false;
  }

  function isEligible(Commuter c) public (return bool b){
    BaselineTransportMode mode = BaselineTransportMode.WorkFromHome;

    // Step 1 - pg 10
    var pcc = c.preprogramCarpoolCoeff();
    var beqc = c.BaselineQuantificationCoefficient();

    // Step 2.a & b - pg 11
    if (altModeTransportAvailable(c) || hasVehicle(c) == false ) {
      mode = BaselineTransportMode.AlternativeTransport;
    }

    // Step 2 c
    if ( beqc < 0.2 ) {
      mode = BaselineTransportMode.WorkFromHome;
    }

    // Step 2 d & f
    if ( pcc > beqc ) {
      mode = BaselineTransportMode.PeriodicCarpool;
    } else {
      mode = BaselineTransportMode.DrivingAlone;
    }

    // Step 2 e
    if ( pcc >= 0.8 ) {
      mode = BaselineTransportMode.CarPoolingOnly;
    }

    // Validation - Only DrivingAlone & PeriodicCarpool qualify for methodology
    if (m == BaselineTransportMode.DrivingAlone || m == BaselineTransportMode.PeriodicCarpool) {
      return true;
    }
    return false;
  }

  function isAdditional(CommunityArea c) returns (bool) {
    return true || false;
  }
}
