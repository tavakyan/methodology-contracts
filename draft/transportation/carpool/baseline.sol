contract BaselineService {
  enum BaselineTransportMode {
    DrivingAlone,
    PeriodicCarpool,
    CarPool,
    AlternativeTransport,
    WorkFromHome
  }

  // establishBaseline function given
  // days driving alone
  // days commuting
  // days public transit
  // days work from home

  // Pre-program Carpool Co-efficient (PCC) - number between 0 and 1 (0 to 10?) representing how often a carpooler commutes by carpooling in the baseline scen., assigned to member before joining the carpool program
  function preprogramCarpoolCoeff() public (returns uint) {

  }

  // Baseline Emission Quantification Co-efficient (BEQC) (0-1) (return 0 to 10 or 100 instead?)
  function baselineEmissionQuantificationCoeff() public (returns uint) {

  }

  function isEligible(Commuter c) public (return bool b){
    // Step 1 - pg 10
    var pcc = c.preprogramCarpoolCoeff();
    var beqc = c.BaselineQuantificationCoefficient();

    // Step 2 - pg 11
    var m = this._step2_determine_mode_of_commute_given_absence_of_project(pcc, beqc)

    // Validation - Only DrivingAlone & PeriodicCarpool qualify for methodology
    if (m == BaselineTransportMode.DrivingAlone || m == BaselineTransportMode.PeriodicCarpool) {
      return true;
    }
    return false;
  }

  // Clean up - likely unnecessary
  /* // Only Carpool & Vanpool supported
  enum Modality {
      Carpool,
      Vanpool,
      Bus,
      Train
  } */

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
