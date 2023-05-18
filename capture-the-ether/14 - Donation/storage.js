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
  const instance = "0xC1CAd4F5Ea881BB32fD2737A4308c153f9B5c911";
  const value0 = await web3.eth.getStorageAt(instance, 0);
  const value1 = await web3.eth.getStorageAt(instance, 1);
  const slot = 0;
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
  // const value2 = await web3.eth.getStorageAt(instance, 2);
  // const value3 = await web3.eth.getStorageAt(instance, 3);
  // const value4 = await web3.eth.getStorageAt(instance, 4);
  // const value5 = await web3.eth.getStorageAt(instance, 5);
  // console.log(`value2`, value2);
  // console.log(`value3`, value3);
  // console.log(`value4`, value4);
  // console.log(`value5`, value5);
};

main();
