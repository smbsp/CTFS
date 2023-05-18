// 1 - const pass = await web3.eth.getStorageAt(instance, 5) - Chrome Console
// 2 - var key = pass.slice(0, 34); - Chrome Console
// 3 - await contract.unlock(key) - Chrome Console

// Must read:
// https://docs.soliditylang.org/en/v0.6.8/internals/layout_in_storage.html
// https://www.tutorialspoint.com/solidity/solidity_conversions.htm

// Nothing in the ethereum blockchain is private. The keyword private is merely an artificial
// construct of the Solidity language. Web3's getStorageAt(...) can be used to read anything from storage.
// It can be tricky to read what you want though, since several optimization rules and techniques are used
// to compact the storage as much as possible. It can't get much more complicated than what was exposed in this level.
// For more, check out this excellent article by "Darius":
// https://medium.com/@dariusdev/how-to-read-ethereum-contract-storage-44252c8af925

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract PrivacyAttacker {}
