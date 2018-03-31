import "additionality.sol";

library CommunityUtility {
  // Only Carpool & Vanpool applicable to methodology
  enum TransporationModality {
      Carpool,
      Vanpool,
      Bus,
      Train
  }

  uint constant NumModalities = 4;

  function getTransportationModalityId(TransporationModality t) public pure returns (uint) {
    return uint(t);
  }

  modifier transpModIndexedArrayIsValid(uint[] tModalityIndexedArray) {
    require(tModalityIndexedArray.length == NumModalities);
    _;
  }
}

contract CommunityArea {
  bool isCarpoolMandated;
  bool alternativeTransportAvailable;



  // Maybe use a factory to create baseline service given modality of moniotring service provider?
  /* function TransportationMethodologyFactory(Modality m) public (returns CommuteMethodology) {
      if (m == Modality.Carpool || m == Modality.Vanpool) {
          return new CarpoolMethodology();
      }
      else if (m == Modality.Bus ) {
          return address(0);
      }
      else if (m == Modality.Train) {
          return address(0);
      }
  } */



}

// Should this data come from an oracle, be curated (see below) or be hard coded...
// Should this be a curated registry or https://github.com/skmgoldin/tcr/blob/master/contracts/Registry.sol
// List of large urban areas:
// https://en.wikipedia.org/wiki/Larger_urban_zone
contract CommunityAreaRegistry{
    CommunityArea[] communities;

    function addCommunity() {
      // Step 3-A. Demonstration of Dominant Commuting Modes within a Community Area  (modifier?)
      // step 3 b . Demonstration that Carpooling is Not a Dominant Commuting Mode within a
  // Community
    }
}
