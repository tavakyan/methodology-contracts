library gps {
  // GPS based on WGS84
  // http://solidity.readthedocs.io/en/develop/types.html#fixed-point-numbers
  struct Waypoint {
    fixed lattitude;
    fixed longitude;
    int altitude;
  }

  // Use external service like google maps
  function mapDistance(oracle o, Waypoint a, Waypoint b) returns (uint) {
    return 0;
  }
}
