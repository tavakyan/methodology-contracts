pragma solidity ^0.4.22;

library AdditionalityUtility {

  // Only Carpool & Vanpool applicable to methodology
  enum TransporationModality {
      Carpool,
      Vanpool,
      Bus,
      Train
  }

  uint constant NumModalities = 4;
  uint public MinHHI = 2500;
  modifier transpModIndexedArrayIsValid(uint[] tModalityIndexedArray) {
    require(tModalityIndexedArray.length == NumModalities);
    _;
  }

  modifier indexInRange(uint[] arr, uint index) returns (bool) {
    require(index < arr.length);
    _;
  }

  function getTransportationModalityId(TransporationModality t) public pure returns (uint) {
    return uint(t);
  }

  function _herfindahlHirschmanIndex(uint[] m, uint excludeIndex) private returns (uint) {
    uint hhi = 0;
    for(uint i = 0; i < m.length; i++) {
      if ( i == excludeIndex ) {
        continue;
      }
      hhi = m[i]*m[i];
    }
    return hhi;
  }

  function _isLargestMarketShare(uint[] m, uint index) private returns (bool) {
    for(uint i=0; i<m.length; i++) {
      if (m[i] > m[index] ) {
        return false;
      }
    }
    return true;
  }

  //
  // If true then it does not meet additionality
  //
  function isDominantMarket(uint[] m, uint index) indexInRange(m, index) returns (bool) {
    if (_isLargerestMarketShare(m, index) || _herfindahlHirschmanIndex(m, index) < MinHHI) {
      return true;
    }
    return false;
  }
}
