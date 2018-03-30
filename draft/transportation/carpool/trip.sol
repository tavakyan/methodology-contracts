contract SubTrip {
  address[] commuters;
  uint8 kgsCO2Emitted;
  // ext func? or public field above?
}

contract Trip {
  Subtrip[] subTrips;
}

// contract BaselineTrip is Subtrip {
