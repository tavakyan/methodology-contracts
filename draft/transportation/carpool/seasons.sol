/*

Seasonal data is used in 3 contexts.

1. Pre-program Carpool Co-efficient
2. Baseline Emission Quantification Co-efficien
3. Baseline Scenario Inputs - p 10
  Assuming members have had their current work and residential addresses for the last 12 months,
  the days driving alone, commuting, using alt. transport and working from home must be collected
  with respect to each season.

Seasons must be defined according to local climate. For example, spring, summer, fall and winter months
(ie, March-May, June-Aug, Sept-Nov, Dec-Feb respectively) could be used as a demarcation of seasons for
projects located in the Northeastern United States.

*/
library seasons {
  function numberOfSeasons(Waypoint w) returns (uint) {
    return 0;
  }

}
// Calc. seasons based on lattitude
// http://www.polaris.iastate.edu/NorthStar/Unit5/unit5_sub1.htm
/* function numberOfSeasons() public (return uint8) { */
  /* Latitudes between 23.55 and 23.5 N are called the Tropics.
  Latitudes between 23.5 and 66.5 N or S are the Temperate Zones and between 66.5
  and 90 N or S are the Arctic (and Antarctic) zones. */

  /* if (lattitude > 23.5 or lattitude < -23.5)
} */

// do we need to determine season start date? or season interval?
