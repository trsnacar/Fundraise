const Web3 = require('web3');
const web3 = new Web3(/* insert web3 provider here */);

const Fundraise = /* insert compiled contract bytecode here */;

const contract = new web3.eth.Contract(Fundraise.abi);

// Set the beneficiary and goal
contract.methods.beneficiary = /* insert beneficiary address here */;
contract.methods.goal = /* insert goal amount here */;

// Contribute to the contract
contract.methods.contribute().send({ from: /* insert contributor address here */, value: /* insert contribution amount here */ })
  .then(/* handle success */)
  .catch(/* handle error */);

// Withdraw funds from the contract
contract.methods.withdraw().send({ from: /* insert beneficiary address here */ })
  .then(/* handle success */)
  .catch(/* handle error */);
