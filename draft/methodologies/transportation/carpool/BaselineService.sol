pragma solidity ^0.4.22;

import "CarpoolMonitoringClient.sol";

contract BaselineService {
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
    // Not yet supported - See https://github.com/ethereum/solidity/pull/3389 - seems nearing completion
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

  function oracle_query(byte32 mobileId) {
    return 0;
  }

  // altTransportDistance comes from oracle (google maps) or carpool server
  // get value from oracle or server (must be anonymous, not reveal residential or work address)
  function _minAltTransportTime(CommuterAccount c) private returns (uint) {
    uint constant altTransportCommuteTime = oracle_query(c.mobileIdHash);
    return altTransportCommuteTime;
  }

  function _altTransportAvailable(CommuterAccount c) private returns (bool){
    uint constant deltaSeconds = 15 * 60; // 15 minutes in seconds
    if ( c.commuteTime + delta <= minAltTransportTime(c)) {
      return true;
    }
    return false;
  }

  function isEligible(CommuterAccount c) public (return bool b){
    TransportMode m = TransportMode.WorkFromHome;

    // Baseline eligibility checks Step 1 - 2
    // Step 1 - pg 10
    var pcc = BaselineUtility.preprogramCarpoolCoeff(c.daysPerWeekCarpooled);
    var beqc = BaselineUtility.baselineEmissionCoeff(c.daysPerWeekCommuteAlone);

    // Step 2.a & b - pg 11
    if (altModeTransportAvailable(c) || !hasVehicle(c) ) {
      m = TransportMode.AlternativeTransport;
    }

    // Step 2 c
    if ( beqc < 0.2 ) {
      m = TransportMode.WorkFromHome;
    }

    // Step 2 d & f
    if ( pcc > beqc ) {
      m = TransportMode.PeriodicCarpool;
    } else {
      m = TransportMode.DrivingAlone;
    }

    // Step 2 e
    if ( pcc >= 0.8 ) {
      m = TransportMode.CarPoolingOnly;
    }

    // Validation - Only DrivingAlone & PeriodicCarpool qualify for methodology
    if (m == TransportMode.DrivingAlone || m == TransportMode.PeriodicCarpool) {
      return true;
    }
    return false;
  }
}
