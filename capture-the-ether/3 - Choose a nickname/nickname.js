const Web3 = require("web3");
const web3 = new Web3(
  "https://ropsten.infura.io/v3/e8d4e727c8bc4f97ae9cca6b5c6b6fd5" // Infura API
);

const main = async () => {
  const name = await web3.utils.padLeft(web3.utils.asciiToHex("Stan"), 64);
  console.log(`name`, name);
};

main();
