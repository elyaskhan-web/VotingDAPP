// migrations/2_deploy_contract.js

const Voting = artifacts.require("Voting");

module.exports = function (deployer) {
  deployer.deploy(Voting);
};
