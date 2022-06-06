var Guarantee = artifacts.require("GuaranteeToken");

module.exports = (deployer, network, addresses) => {
  const Web3 = require('web3');
  const TruffleConfig = require('../truffle-config.js');

  const config = TruffleConfig.networks[network];

  if (process.env.ACCOUNT_PASSWORD) {
    var web3 = new Web3(new Web3.providers.HttpProvider('http://' + config.host + ':' + config.port));

    console.log('>> Unlocking account ' + config.from);
    web3.eth.personal.unlockAccount(config.from, process.env.ACCOUNT_PASSWORD, 36000);
  }
  
  deployer.deploy(Guarantee);
};
