// We need a collection of these to represent carpool membership throughout parts of trip
contract SubTrip is Trip {
  address[] public commuters; // membership set
  bytes32 public vehicleHash;
  uint year;
}

contract Trip {
  Subtrip[] subTrips;
  uint year;

  function getCommuters() public returns (address[]){
    // sum of all commuters åin subTrips
    address[] allCommuters;
    for(uint i=0; i < subTrips.length; i++) {
      for(uint j=0; j< subTrips[i].commuters.length; j++) {
        allCommuters.push(subTrips[i].commuters[j]);
      }
    }
    return allCommuters;
  }


}

// contract BaselineTrip is Subtrip {
