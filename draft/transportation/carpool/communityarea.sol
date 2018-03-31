contract CommunityArea {
  // Only Carpool & Vanpool applicable to methodology
  enum Modality {
      Carpool,
      Vanpool,
      Bus,
      Train
  }

  bool alternativeTransportAvailable public; 

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

  /* mapping (string => Waypoint) cityLocation; */

  // Herfindahl-Hirschman Index (HHI) -  indicator of the amount of competition among commuting modes  derived from the market share of each commuting mode


  function herfindahlHirschmanIndex(marketShare[] m) public (returns uint) {

  }
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
