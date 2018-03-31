/*
Carpool monitoring app (CMA) is the client mobile app interface

Not all carpool members need to be specifically identified at the project start date. For example, a
project could be defined as “the first 10,000 members in the Boston metro area” or “employees of
Company X in the San Francisco Bay area, Atlanta metro area, and Boston metro area”.

Hytch's case = All verified members at season start.

*/
pragma solidity ^0.4.22;

import 'Seasons.sol';


contract CarpoolManagementServer {

  // altTransportDistance comes from oracle or carpool server
  function minAltTransportTime(Commmuter c) returns (uint) {
    // get value from oracle or server (must be anonymous)
    uint constant duration = 0;
    return duration;
  }

  function altTransportAvailable(Commuter c) returns (bool){
    uint constant delta = 15 * 60 * 100; // 15 minutes
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
}

contract CarpoolMonitoringApp is Ownable {

  struct CarpoolAppAccount {
    uint[Seasons] daysPerWeekCarpooled;
    uint[Seasons] daysPerWeekCommuteAlone;

    byte32 mobileIdHash;

    // Can use zksnarks for verifying address from client and server.
    // (https://media.consensys.net/introduction-to-zksnarks-with-examples-3283b554fc3b)
    byte32 residentialAddressHash;
    byte32 workAddressHash;
    bool homeAddressVerified;
    bool workAddressVerified;
    bytes32 baselineTripVehicleHash;

    // Can trust server to send vehicle distance.
    uint baselineTripDistance;
  }

  uint8 baselineEmissionQuantificationCoeff;

  mapping (address => CarpoolAppAccount) commuterAccounts;

  event commuterInformationUpdated;
}
