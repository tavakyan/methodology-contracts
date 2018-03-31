pragma solidity ^0.4.22;

library AdditionalityUtility {
  uint public MinHHI = 2500;

  // Herfindahl-Hirschman Index (HHI) -
  // Indicator of the amount of competition among commuting modes
  // derived from the market share of each commuting mode.
  // NOTE: can likely use uint instead of ufixed since percentage is 0 - 100
  function herfindahlHirschmanIndex(uint[] m) public (returns uint) {
    uint hhi = 0;
    for(uint i = 0; i < m.length; i++) {
      hhi = m[i]*m[i];
    }
    return hhi;
  }

  function dominantCommutingExists(uint[] m) returns (bool) {
    if ( herfindahlHirschmanIndex(m) >= MinHHI ) {
      return true;
    }
    return false;
  }
}
