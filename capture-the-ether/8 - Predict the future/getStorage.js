const Web3 = require("web3");
const web3 = new Web3(
  "https://ropsten.infura.io/v3/e8d4e727c8bc4f97ae9cca6b5c6b6fd5" // Infura API
);

const main = async () => {
  const instance = "0x72a44C886F814D65C6E383F916Dd4dD4e008c8A8";
  const value0 = await web3.eth.getStorageAt(instance, 0);
  const value1 = await web3.eth.getStorageAt(instance, 1);
  const value2 = await web3.eth.getStorageAt(instance, 2);
  console.log(`value0`, value0);
  console.log(`value1`, value1);
  console.log(`value2`, value2);
};

main();