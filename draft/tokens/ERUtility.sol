pragma solidity ^0.4.22;

// Utlity library for emissions reduction computation
library ERUtility {
  modifier isPositiveReduction(uint b, uint p, uint l) returns (bool) {
    require((b-p-l)>0);
    _;
  }

  function emissionsReduction(uint baseline, uint project, uint leakage)
    isPositiveReductionpublic(baseline, project, leakage) (returns uint) {
    return baseline - project - leakage;
  }
}
