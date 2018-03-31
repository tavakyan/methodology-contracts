pragma solidity ^0.4.22;

library SeasonUtlity {
    enum Season {
      Spring,
      Summer,
      Fall,
      Winter
    }

    uint constant NumSeasons = 4;

    function getSeasonId(Season s) public pure returns (uint) {
      return uint(s);
    }

    modifier seasonIndexedArrayIsValid(uint[] seasonIndexedArray) {
      require(seasonIndexedArray.length == NumSeasons);
      _;
    }
}
