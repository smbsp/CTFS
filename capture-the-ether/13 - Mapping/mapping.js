const { ethers } = require("ethers");
// ethers methods
const utils = ethers.utils;
const BigNumber = ethers.BigNumber;
const MaxUint256 = ethers.constants.MaxUint256;

const Web3 = require("web3");
const web3 = new Web3(
  "https://ropsten.infura.io/v3/e8d4e727c8bc4f97ae9cca6b5c6b6fd5" // Infura API
);

const main = async () => {
  const instance = "0x528d9a15FF77D2ACF5dE88B36a411be40ABaF265";
  const value0 = await web3.eth.getStorageAt(instance, 0);
  const value1 = await web3.eth.getStorageAt(instance, 1);
  const slot = 1;
  const hashedSlot = utils.keccak256(utils.hexZeroPad(slot, 32));
  const storageValue = BigNumber.from(hashedSlot);
  console.log(storageValue.toString());
  const value2 = await web3.eth.getStorageAt(instance, storageValue);
  const storageValue2 = BigNumber.from(hashedSlot).add(1).toHexString();
  const value3 = await web3.eth.getStorageAt(instance, storageValue2);
  console.log(`value0`, value0);
  console.log(`value1`, value1);
  console.log(`value2`, value2);
  console.log(`value3`, value3);
};

main();
