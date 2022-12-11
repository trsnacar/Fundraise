pragma solidity ^0.5.0;

contract Fundraise {
  address payable public beneficiary;
  uint public goal;
  uint public totalRaised;
  mapping(address => uint) public contributions;

  constructor(address payable _beneficiary, uint _goal) public { // add the "payable" keyword here
    beneficiary = _beneficiary;
    goal = _goal;
  }

  function contribute() public payable {
    require(msg.value > 0, "Must contribute a positive amount");
    contributions[msg.sender] += msg.value;
    totalRaised += msg.value;
  }

  function withdraw() public {
    require(msg.sender == beneficiary, "Only the beneficiary can withdraw funds");
    require(totalRaised >= goal, "Goal must be reached before withdrawing funds");
    beneficiary.transfer(totalRaised);
  }
}
