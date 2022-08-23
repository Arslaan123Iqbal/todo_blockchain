const Migrations = artifacts.require("TaskContract");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};
