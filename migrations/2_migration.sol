// migrations/2_deploy.js
// SPDX-License-Identifier: MIT
const deployElection = artifacts.require("Election");

module.exports = function(deployer) {
  deployer.deploy(deployElection);
};
