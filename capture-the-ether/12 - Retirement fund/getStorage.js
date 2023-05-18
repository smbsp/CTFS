const Web3 = require("web3");
const web3 = new Web3(
  "https://ropsten.infura.io/v3/e8d4e727c8bc4f97ae9cca6b5c6b6fd5" // Infura API
);

const main = async () => {
  const instance = "0x3b2900ff9b061Fa5d1Ce5298B4C74088EBdAbCA5";
  const value0 = await web3.eth.getStorageAt(instance, 0);
  const value1 = await web3.eth.getStorageAt(instance, 1);
  const value2 = await web3.eth.getStorageAt(instance, 2);
  const value3 = await web3.eth.getStorageAt(instance, 3);
  console.log(`value0`, value0);
  console.log(`value1`, value1);
  console.log(`value2`, value2);
  console.log(`value2`, value3);
};

main();
