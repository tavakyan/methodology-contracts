pragma solidity ^0.4.22;

import "util.sol"
import {CarpoolMonitoringClient.CommuterAccount as CommuterAccount} from "../client.sol";

contract BaselineService {
  // altTransportDistance comes from oracle or carpool server
  function _minAltTransportTime(CommuterAccount c) private returns (uint) {
    // get value from oracle or server (must be anonymous, not reveal residential or work address)
    uint constant duration = 0;
    return duration;
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

    // Step 1 - pg 10
    var pcc = BaselineUtility.preprogramCarpoolCoeff();
    var beqc = BaselineUtility.baselineEmissionCoeff();

    // Step 2.a & b - pg 11
    if (altModeTransportAvailable(c) || hasVehicle(c) == false ) {
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

  function isAdditional(CommunityArea c) returns (bool) {
    return true || false;
  }
}
