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
  const instance = "0x9c1ee4575e5a7a7fcee4c5d97ff9b14e02af49a7";
  const value0 = await web3.eth.getStorageAt(instance, 0);
  const value1 = await web3.eth.getStorageAt(instance, 1);
  const value2 = await web3.eth.getStorageAt(instance, 2);
  const value5 = await web3.eth.getStorageAt(instance, 3);
  const value6 = await web3.eth.getStorageAt(instance, 4);
  const value7 = await web3.eth.getStorageAt(instance, 5);
  console.log(`value0`, value0);
  console.log(`value1`, value1);
  console.log(`value2`, value2);
  console.log(`value5`, value5);
  console.log(`value6`, value6);
  console.log(`value7`, value7);
  console.log("--------------Mapping Data----------------");
  const slot = 0;
  // const key = "0x71c46Ed333C35e4E6c62D32dc7C8F00D125b4fee";
  // const key = "0x910C5532b8Ff15e5303248bEc3F4Ba9006E4ee20";
  const key = "0xb77070bD599655570a2aE22d33c0Df76107A21AE";
  const paddedSlot = utils.hexZeroPad(slot, 32);
  const paddedKey = utils.hexZeroPad(key, 32);
  const itemSlot = utils.keccak256(paddedKey + paddedSlot.slice(2));
  const actualSlot = utils.hexZeroPad(itemSlot, 32);
  const storageLocation = await web3.eth.getStorageAt(instance, actualSlot);
  const storageValue = BigNumber.from(storageLocation);
  console.log("storageValue", storageValue.toString());
};

main();
