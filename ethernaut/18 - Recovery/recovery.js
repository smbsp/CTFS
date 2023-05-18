const { ethers } = require("ethers");
// const address = "0x0bfB5f31b476744307167a9F7eB1B9903211F1F2"; // Challenge Address
const address = "0xfffffffffffffffffffffffffffffffffffffff";

const main = async () => {
  const recomputedContractAddress = ethers.utils.getContractAddress({
    from: address,
    nonce: 1,
  });
  console.log(`recomputedContractAddress`, recomputedContractAddress);
};

main();

// Move to the '18 - Recovery' folder and run  'node recovery.js'
