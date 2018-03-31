contract CarpoolProject {
  uint year;
  uint baseline;
}

contract CarpoolProjectFactory {
  modifier isEligible() public returns (bool) {
    // check stuff
    _;
  }

  function create() public isEligible() {
    // if is not eligible throw;
    return address(new CarpoolProject());
  }
}
