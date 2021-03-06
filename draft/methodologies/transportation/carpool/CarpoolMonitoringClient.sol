/*
Carpool monitoring app (CMA) is the client mobile app interface

Not all carpool members need to be specifically identified at the project start date. For example, a
project could be defined as “the first 10,000 members in the Boston metro area” or “employees of
Company X in the San Francisco Bay area, Atlanta metro area, and Boston metro area”.

Hytch's case = All verified members at season start.

*/
pragma solidity ^0.4.22;

import 'Seasons.sol';

contract CarpoolMonitoringClient { // is Ownable {

  struct CommuterAccount {
    byte32 mobileIdHash;
    // p 15 says CMMS needs login token (like Facebook login) likely to correlate with identity
    // not sure if we need to verify the CMA and CMMS match the login token hash, but leaving this here just in case
    byte32 identifierTokenHash;

    uint[NumSeasons] daysPerWeekCarpooled;
    uint[NumSeasons] daysPerWeekCommuteAlone;

    // Can use zksnarks for verifying address from client and server.
    // (https://media.consensys.net/introduction-to-zksnarks-with-examples-3283b554fc3b)
    // Perhaps non-of-these are needed on-chain, but the CMMS server def. needs it.
    byte32 residentialAddressHash;
    byte32 workAddressHash;
    bool homeAddressVerified;
    bool workAddressVerified;
    bytes32 baselineTripVehicleHash;

    fixed baselineEmissionQuantificationCoeff;

    uint baselineDistanceWork;
    uint baselineDistanceHome;

    function baselineDistance() external returns (uint) {
      return this.baselineDistanceWork + this.baselineDistanceHome;
    }

    VehicleData vData; 
  }

  mapping (address => CommuterAccount) public commuterAccounts;

  event commuterInformationUpdated;
}
