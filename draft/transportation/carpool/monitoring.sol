// Can also be called CarpoolServiceEndpoint / API - Basically Hytch's API
contract MonitoringServiceAgent {
  struct CarpoolAppAccount {
    byte32 mobileIdHash;
    byte32 residentialAddressHash;
    byte32 workAddressHash;
    bool homeAddressVerified;
    bool workAddressVerified;
    bytes32 baselineTripVehicleHash;
    uint32 baselineTripDistance;
    uint8 daysCarpoolsPerWeek;
    uint8 daysCommuteAlonePerWeek;
    uint8 preprogramCarpoolCoeff;
    uint8 baselineEmissionQuantificationCoeff;
  }
}

contract MonitoringService {

  // has cmas
  // has a carpool server

}


contract CarpoolMonitoringAppManager {

}
