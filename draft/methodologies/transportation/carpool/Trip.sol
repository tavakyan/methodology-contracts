// We need a collection of these to represent carpool membership throughout parts of trip
contract SubTrip {
  /* address[] public commuters; // membership set */
  bytes32 public vehicleHash;
  uint year;

  uint distance;

  function projectEmission() {
    return emissionsFossilFuels + emissionsElectricityGenCharge;
  }
}

contract Trip {
  uint year;
  address[] public commuters;
  CarpoolMonitoringClient client;

  BaselineService baselineService;

  function Trip(uint _year, address[] _commuters, CarpoolMonitoringClient _client) public {
    year = _year;
    commuters = _commuters;
    client = _client;
  }

  function projectEmissinons() {

  }
  // Move to baseline service?
  function baselineEmissions() public returns () {
    uint totalBaselineEmissions = 0;
    for(var i=0; i<commuters.length; i++) {
      CommuterAccount commuterAccount = client.commuterAccounts[commuters[i]];
      if(baselineService.isEliglbe(commuterAccount)) {
        uint distance = commuterAccount.baselineDistance());

        totalBaselineEmissions += baselineService.emissionCalc(distance, commuterAccount.vehicleData)
      }
    }
    return totalBaselineEmissions;
  }
}
