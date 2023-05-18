const { ethers } = require("ethers");
const { BigNumber } = require("@ethersproject/bignumber");
const Web3 = require("web3");
const web3 = new Web3(
  "https://eth-rinkeby.alchemyapi.io/v2/-Xnkevvty11aSDxKnDPfo2zHAqxeUg5N" // Alchemy API
);
const address = "0x1424605FBCa9a7d2e04775F08459cE08f8D8EAe7"; // Challenge Address

const main = async () => {
  const storage0 = await web3.eth.getStorageAt(address, 0);
  const storage1 = await web3.eth.getStorageAt(address, 1);
  console.log(`storage0`, storage0);
  console.log(`storage1`, storage1);
  const storageArray = await BigNumber.from(
    ethers.utils.keccak256(
      `0x0000000000000000000000000000000000000000000000000000000000000001`
    )
  );
  console.log(`storageArray`, storageArray);
};

main();

// Move to the '18 - Recovery' folder and run  'node recovery.js'
