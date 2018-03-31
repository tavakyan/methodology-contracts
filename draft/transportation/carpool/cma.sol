/*
Carpool monitoring app (CMA) is the client mobile app interface

Not all carpool members need to be specifically identified at the project start date. For example, a
project could be defined as “the first 10,000 members in the Boston metro area” or “employees of
Company X in the San Francisco Bay area, Atlanta metro area, and Boston metro area”.

Hytch's case = All verified members at season start.

*/
pragma solidity ^0.4.22;

import 'Seasons.sol';

contract CarpoolMonitoringApp { // is Ownable {

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
