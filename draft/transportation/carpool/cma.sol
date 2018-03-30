// CMA is the set of carpool programs reporting per trip?
contract CarpoolMonitoringApp {

  address commuter;

  // We can use snarks (https://media.consensys.net/introduction-to-zksnarks-with-examples-3283b554fc3b) for home & work address
  // Verifier is us and prover is client & server? Should it be verified from both client wallet and server?
  // Might need a seperate set of contracts
  byte32 homeAddressHash;
  byte32 workAddressHash;

  // Maybe this comes from an oracle on the client & the server?
  uint32 distance;

  //mapping(uint8 => ()
  event commuteInformationUpdated;
  // residential Address/\
  // commuting Address
  // vehicle type VIN etc



  // Residential address, work address - both are for baseline single occlpency (can they be encrypted in calc? )
  // Single-Occupancy Baseline Trip Distance - The distance of the single-occupancy vehicular trip a member of a carpool would have taken in the baseline scenario.
  // Single-Occupancy Baseline Trip Vehicle - Original Vehicle in baseline scenario
  //
  // mapping (Season => )

  /* struct CarpoolPerSeason {

  } */

}
