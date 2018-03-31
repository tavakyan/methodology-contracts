import "AdditionalityService.sol";

contract CommunityArea {
  bool isCarpoolMandated;
  bool alternativeTransportAvailable;
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
