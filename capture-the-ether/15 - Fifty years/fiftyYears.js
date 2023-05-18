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
  const instance = "0xde22d7B05f497330C892252f3c7614CEcA5087fa";
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
  console.log("--------------Dynamic Array Data----------------");
  const slot = 0;
  const hashedSlot = utils.keccak256(utils.hexZeroPad(slot, 32));
  const storageValue = BigNumber.from(hashedSlot);
  // console.log(storageValue.toString());
  const value3 = await web3.eth.getStorageAt(instance, storageValue);
  const storageValue2 = BigNumber.from(hashedSlot).add(1).toHexString();
  const value4 = await web3.eth.getStorageAt(instance, storageValue2);
  const storageValue3 = BigNumber.from(hashedSlot).add(2).toHexString();
  const storageValue4 = BigNumber.from(hashedSlot).add(3).toHexString();
  const storageValue5 = BigNumber.from(hashedSlot).add(4).toHexString();
  const storageValue6 = BigNumber.from(hashedSlot).add(5).toHexString();
  const value8 = await web3.eth.getStorageAt(instance, storageValue3);
  const value9 = await web3.eth.getStorageAt(instance, storageValue4);
  const value10 = await web3.eth.getStorageAt(instance, storageValue5);
  const value11 = await web3.eth.getStorageAt(instance, storageValue6);
  console.log(`value3`, value3);
  console.log(`value4`, value4);
  console.log(`value8`, value8);
  console.log(`value9`, value9);
  console.log(`value10`, value10);
  console.log(`value11`, value11);
};

main();
