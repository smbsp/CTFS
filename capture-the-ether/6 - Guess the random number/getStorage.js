const Web3 = require("web3");
const web3 = new Web3(
  "https://ropsten.infura.io/v3/e8d4e727c8bc4f97ae9cca6b5c6b6fd5" // Infura API
);

const main = async () => {
  const instance = "0x4391824f1cB606E084e58a0F9fAb418d321Ede58";
  const value = await web3.eth.getStorageAt(instance, 0);
  console.log(`value`, value);
};

main();
